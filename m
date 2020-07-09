From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  9 Jul 2020 09:06:50 +0300
Subject: [Buildroot] [PATCH] package/libcurl: fix no-proxy build with
 bearssl and nss
Message-ID: <c4509d9911d8202601895685017a1295768a1871.1594274810.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two patches fixing build against BearSSL and NSS TLS implementations
when BR2_PACKAGE_LIBCURL_PROXY_SUPPORT is disabled.

Fixes:
http://autobuild.buildroot.net/results/4d37d9163bfece536974f15f16b2ebfc5fabc539/
http://autobuild.buildroot.net/results/387e8baa13d0f07ed4dfd5b6ee3b933d4843c0e8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ix-build-with-disabled-proxy-support.patch |  50 ++++++
 ...ix-build-with-disabled-proxy-support.patch | 159 ++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 package/libcurl/0001-bearssl-fix-build-with-disabled-proxy-support.patch
 create mode 100644 package/libcurl/0002-nss-fix-build-with-disabled-proxy-support.patch

diff --git a/package/libcurl/0001-bearssl-fix-build-with-disabled-proxy-support.patch b/package/libcurl/0001-bearssl-fix-build-with-disabled-proxy-support.patch
new file mode 100644
index 000000000000..b6d89859b93c
--- /dev/null
+++ b/package/libcurl/0001-bearssl-fix-build-with-disabled-proxy-support.patch
@@ -0,0 +1,50 @@
+From 3a46be47cad5a3498b5f6d6007b7d1fe5b8dff78 Mon Sep 17 00:00:00 2001
+Message-Id: <3a46be47cad5a3498b5f6d6007b7d1fe5b8dff78.1594274321.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 9 Jul 2020 08:14:49 +0300
+Subject: [PATCH] bearssl: fix build with disabled proxy support
+
+Avoid reference to fields that do not exist when CURL_DISABLE_PROXY is
+defined.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/curl/curl/pull/5666
+
+ lib/vtls/bearssl.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
+index 628e16a124a9..44e7406e8e39 100644
+--- a/lib/vtls/bearssl.c
++++ b/lib/vtls/bearssl.c
+@@ -300,8 +300,12 @@ static CURLcode bearssl_connect_step1(struct connectdata *conn, int sockindex)
+   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
+   struct ssl_backend_data *backend = connssl->backend;
+   const char * const ssl_cafile = SSL_CONN_CONFIG(CAfile);
++#ifndef CURL_DISABLE_PROXY
+   const char *hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
+     conn->host.name;
++#else
++  const char *hostname = conn->host.name;
++#endif
+   const bool verifypeer = SSL_CONN_CONFIG(verifypeer);
+   const bool verifyhost = SSL_CONN_CONFIG(verifyhost);
+   CURLcode ret;
+@@ -386,8 +390,11 @@ static CURLcode bearssl_connect_step1(struct connectdata *conn, int sockindex)
+      */
+ 
+ #ifdef USE_NGHTTP2
+-    if(data->set.httpversion >= CURL_HTTP_VERSION_2 &&
+-       (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)) {
++    if(data->set.httpversion >= CURL_HTTP_VERSION_2
++#ifndef CURL_DISABLE_PROXY
++      && (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)
++#endif
++      ) {
+       backend->protocols[cur++] = NGHTTP2_PROTO_VERSION_ID;
+       infof(data, "ALPN, offering %s\n", NGHTTP2_PROTO_VERSION_ID);
+     }
+-- 
+2.27.0
+
diff --git a/package/libcurl/0002-nss-fix-build-with-disabled-proxy-support.patch b/package/libcurl/0002-nss-fix-build-with-disabled-proxy-support.patch
new file mode 100644
index 000000000000..0d1286338e41
--- /dev/null
+++ b/package/libcurl/0002-nss-fix-build-with-disabled-proxy-support.patch
@@ -0,0 +1,159 @@
+From d040da28f57d0b3fcd6f63809a8c85a600f87a62 Mon Sep 17 00:00:00 2001
+Message-Id: <d040da28f57d0b3fcd6f63809a8c85a600f87a62.1594274337.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 9 Jul 2020 08:14:49 +0300
+Subject: [PATCH] nss: fix build with disabled proxy support
+
+Avoid reference to fields that do not exist when CURL_DISABLE_PROXY is
+defined.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/curl/curl/pull/5667
+
+ lib/vtls/nss.c | 44 +++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 35 insertions(+), 9 deletions(-)
+
+diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
+index fca292613815..0f0d1ee6c80f 100644
+--- a/lib/vtls/nss.c
++++ b/lib/vtls/nss.c
+@@ -1027,9 +1027,11 @@ static SECStatus BadCertHandler(void *arg, PRFileDesc *sock)
+   CERTCertificate *cert;
+ 
+   /* remember the cert verification result */
++#ifndef CURL_DISABLE_PROXY
+   if(SSL_IS_PROXY())
+     data->set.proxy_ssl.certverifyresult = err;
+   else
++#endif
+     data->set.ssl.certverifyresult = err;
+ 
+   if(err == SSL_ERROR_BAD_CERT_DOMAIN && !SSL_CONN_CONFIG(verifyhost))
+@@ -1553,24 +1555,32 @@ static void nss_close(struct ssl_connect_data *connssl)
+ static void Curl_nss_close(struct connectdata *conn, int sockindex)
+ {
+   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
++#ifndef CURL_DISABLE_PROXY
+   struct ssl_connect_data *connssl_proxy = &conn->proxy_ssl[sockindex];
++#endif
+   struct ssl_backend_data *backend = connssl->backend;
+ 
+-  if(backend->handle || connssl_proxy->backend->handle) {
++  if(backend->handle
++#ifndef CURL_DISABLE_PROXY
++    || connssl_proxy->backend->handle
++#endif
++    ) {
+     /* NSS closes the socket we previously handed to it, so we must mark it
+        as closed to avoid double close */
+     fake_sclose(conn->sock[sockindex]);
+     conn->sock[sockindex] = CURL_SOCKET_BAD;
+   }
+ 
++#ifndef CURL_DISABLE_PROXY
+   if(backend->handle)
+     /* nss_close(connssl) will transitively close also
+        connssl_proxy->backend->handle if both are used. Clear it to avoid
+        a double close leading to crash. */
+     connssl_proxy->backend->handle = NULL;
+ 
+-  nss_close(connssl);
+   nss_close(connssl_proxy);
++#endif
++  nss_close(connssl);
+ }
+ 
+ /* return true if NSS can provide error code (and possibly msg) for the
+@@ -1828,6 +1838,12 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
+   CURLcode result;
+   bool second_layer = FALSE;
+   SSLVersionRange sslver_supported;
++#ifndef CURL_DISABLE_PROXY
++  const char *hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
++    conn->host.name;
++#else
++  const char *hostname = conn->host.name;
++#endif
+ 
+   SSLVersionRange sslver = {
+     SSL_LIBRARY_VERSION_TLS_1_0,  /* min */
+@@ -1932,9 +1948,11 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
+     goto error;
+ 
+   /* not checked yet */
++#ifndef CURL_DISABLE_PROXY
+   if(SSL_IS_PROXY())
+     data->set.proxy_ssl.certverifyresult = 0;
+   else
++#endif
+     data->set.ssl.certverifyresult = 0;
+ 
+   if(SSL_BadCertHook(model, BadCertHandler, conn) != SECSuccess)
+@@ -1991,12 +2009,14 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
+     goto error;
+   }
+ 
++#ifndef CURL_DISABLE_PROXY
+   if(conn->proxy_ssl[sockindex].use) {
+     DEBUGASSERT(ssl_connection_complete == conn->proxy_ssl[sockindex].state);
+     DEBUGASSERT(conn->proxy_ssl[sockindex].backend->handle != NULL);
+     nspr_io = conn->proxy_ssl[sockindex].backend->handle;
+     second_layer = TRUE;
+   }
++#endif
+   else {
+     /* wrap OS file descriptor by NSPR's file descriptor abstraction */
+     nspr_io = PR_ImportTCPSocket(sockfd);
+@@ -2077,8 +2097,11 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
+     unsigned char protocols[128];
+ 
+ #ifdef USE_NGHTTP2
+-    if(data->set.httpversion >= CURL_HTTP_VERSION_2 &&
+-       (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)) {
++    if(data->set.httpversion >= CURL_HTTP_VERSION_2
++#ifndef CURL_DISABLE_PROXY
++      && (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)
++#endif
++      ) {
+       protocols[cur++] = NGHTTP2_PROTO_VERSION_ID_LEN;
+       memcpy(&protocols[cur], NGHTTP2_PROTO_VERSION_ID,
+           NGHTTP2_PROTO_VERSION_ID_LEN);
+@@ -2101,14 +2124,11 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
+     goto error;
+ 
+   /* propagate hostname to the TLS layer */
+-  if(SSL_SetURL(backend->handle, SSL_IS_PROXY() ? conn->http_proxy.host.name :
+-                conn->host.name) != SECSuccess)
++  if(SSL_SetURL(backend->handle, hostname) != SECSuccess)
+     goto error;
+ 
+   /* prevent NSS from re-using the session for a different hostname */
+-  if(SSL_SetSockPeerID(backend->handle, SSL_IS_PROXY() ?
+-                       conn->http_proxy.host.name : conn->host.name)
+-     != SECSuccess)
++  if(SSL_SetSockPeerID(backend->handle, hostname) != SECSuccess)
+     goto error;
+ 
+   return CURLE_OK;
+@@ -2127,11 +2147,17 @@ static CURLcode nss_do_connect(struct connectdata *conn, int sockindex)
+   struct Curl_easy *data = conn->data;
+   CURLcode result = CURLE_SSL_CONNECT_ERROR;
+   PRUint32 timeout;
++#ifndef CURL_DISABLE_PROXY
+   long * const certverifyresult = SSL_IS_PROXY() ?
+     &data->set.proxy_ssl.certverifyresult : &data->set.ssl.certverifyresult;
+   const char * const pinnedpubkey = SSL_IS_PROXY() ?
+               data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :
+               data->set.str[STRING_SSL_PINNEDPUBLICKEY_ORIG];
++#else
++  long * const certverifyresult = &data->set.ssl.certverifyresult;
++  const char * const pinnedpubkey =
++              data->set.str[STRING_SSL_PINNEDPUBLICKEY_ORIG];
++#endif
+ 
+ 
+   /* check timeout situation */
+-- 
+2.27.0
+
-- 
2.27.0
