From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 14 Jan 2018 19:33:41 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with boost 1.66
In-Reply-To: <20180114180304.17439-1-fontaine.fabrice@gmail.com>
References: <20180114180304.17439-1-fontaine.fabrice@gmail.com>
Message-ID: <1515954821.8426.10.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Sun, 2018-01-14 at 19:03 +0100, Fabrice Fontaine wrote:
> Boost asio changed its API:
>  - http://www.boost.org/doc/libs/1_66_0/doc/html/boost_asio/net_ts.html
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5f02c8fc84889748f283ee1cb76248bb0880215a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-compilation-with-boost-1.66.patch     | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/domoticz/0001-Fix-compilation-with-boost-1.66.patch
> 
> diff --git a/package/domoticz/0001-Fix-compilation-with-boost-1.66.patch b/package/domoticz/0001-Fix-compilation-with-boost-1.66.patch
> new file mode 100644
> index 0000000000..a3ec8cc549
> --- /dev/null
> +++ b/package/domoticz/0001-Fix-compilation-with-boost-1.66.patch
> @@ -0,0 +1,52 @@
> +From 36ca9cfa044fb6789fd24338f5d52614de7c0a19 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 14 Jan 2018 18:18:32 +0100
> +Subject: [PATCH] Fix compilation with boost 1.66
> +
> +Boost asio changed its API:
> + - http://www.boost.org/doc/libs/1_66_0/doc/html/boost_asio/net_ts.html
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + webserver/proxyclient.cpp | 2 +-
> + webserver/server.cpp      | 4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/webserver/proxyclient.cpp b/webserver/proxyclient.cpp
> +index 203ee619..efc9815a 100644
> +--- a/webserver/proxyclient.cpp
> ++++ b/webserver/proxyclient.cpp
> +@@ -639,7 +639,7 @@ namespace http {
> + 		void CProxyManager::StartThread()
> + 		{
> + 			try {
> +-				boost::asio::ssl::context ctx(io_service, boost::asio::ssl::context::sslv23);
> ++				boost::asio::ssl::context ctx(boost::asio::ssl::context::sslv23);
> + 				ctx.set_verify_mode(boost::asio::ssl::verify_none);
> + 
> + 				proxyclient.reset(new CProxyClient(io_service, ctx, m_pWebEm));
> +diff --git a/webserver/server.cpp b/webserver/server.cpp
> +index 5255aa34..0c1af08a 100644
> +--- a/webserver/server.cpp
> ++++ b/webserver/server.cpp
> +@@ -148,7 +148,7 @@ void server::handle_accept(const boost::system::error_code& e) {
> + ssl_server::ssl_server(const ssl_server_settings & ssl_settings, request_handler & user_request_handler) :
> + 		server_base(ssl_settings, user_request_handler),
> + 		settings_(ssl_settings),
> +-		context_(io_service_, ssl_settings.get_ssl_method())
> ++		context_(ssl_settings.get_ssl_method())
> + {
> + #ifdef DEBUG_WWW
> + 	_log.Log(LOG_STATUS, "[web:%s] create ssl_server using ssl_server_settings : %s", ssl_settings.listening_port.c_str(), ssl_settings.to_string().c_str());
> +@@ -161,7 +161,7 @@ ssl_server::ssl_server(const ssl_server_settings & ssl_settings, request_handler
> + ssl_server::ssl_server(const server_settings & settings, request_handler & user_request_handler) :
> + 		server_base(settings, user_request_handler),
> + 		settings_(dynamic_cast<ssl_server_settings const &>(settings)),
> +-		context_(io_service_, dynamic_cast<ssl_server_settings const &>(settings).get_ssl_method()) {
> ++		context_(dynamic_cast<ssl_server_settings const &>(settings).get_ssl_method()) {
> + #ifdef DEBUG_WWW
> + 	_log.Log(LOG_STATUS, "[web:%s] create ssl_server using server_settings : %s", settings.listening_port.c_str(), settings.to_string().c_str());
> + #endif
> +-- 
> +2.14.1
> +

Thanks for the patch? Can you add a note about upstream status and
where you fetched the patch from, please?

Best regards,
J?rg Krause
