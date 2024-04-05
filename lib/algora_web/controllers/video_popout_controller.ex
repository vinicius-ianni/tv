defmodule AlgoraWeb.VideoPopoutController do
  use AlgoraWeb, :controller

  alias Algora.{Accounts, Library}

  def get(conn, %{"channel_handle" => channel_handle}) do
    user = Accounts.get_user_by!(handle: channel_handle)

    case Library.get_latest_video(user) do
      nil ->
        redirect(conn, to: ~p"/#{user.handle}")

      video ->
        redirect(conn, to: ~p"/#{user.handle}/#{video.id}")
    end
  end
end
