require 'sinatra'
require 'json'

# GET /show
# (HTTPのGETメソッドで /show というパスにリクエストを送る）

get '/show' do
    # Rubyのハッシュを作成、diaryという名前を付ける
    #diary = {
    #    id: 1,
    #    title: "7/13's diary",
    #    content: "ねこです"
    #}

    # diaryをJSONテキストに変換して返す
    # （Rubyでは、最終行はメソッドの返り値(return)）
    #diary.to_json
    params.to_json
end

# POST /edit
# (HTTPのPOSTメソッドで /edit というパスにリクエストを送る）
# 要・リクエストボディ（パラメータを渡す必要がある）

post '/edit' do
  # リクエストボディを読み込む
    body = request.body.read.force_encoding("utf-8")

  if body == ''
    # HTTPのステータスコード「400」（Bad Request）を返す
    # （400は「クライアント側のリクエストが間違っている」という意味）
    status 400
  else
    # 送られてきたbodyを、そのままJSONテキストとして返す
    body.to_json
  end
end
