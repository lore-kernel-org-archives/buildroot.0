From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:05:10 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/libcurl: security
 bump to 7.72.0
Message-ID: <20200828170226.7AD298377C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a884044e27598d9ace72b9a3647b3d5d91648e2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

This new version fixes, amongst many other things, CVE-2020-8231
(https://curl.haxx.se/docs/CVE-2020-8231.html). See the full changelog
on https://curl.haxx.se/changes.html#7_72_0 .

Also drop the 4 patches, that have all been released upstream.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4a55c2743b7abbc2c384c78716560679ae35af21)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ssl-fix-build-with-disabled-proxy-support.patch |  50 -------
 ...nss-fix-build-with-disabled-proxy-support.patch | 159 ---------------------
 ...003-gnutls-Fetch-backend-when-using-proxy.patch |  29 ----
 ...-repair-the-build-with-CURL_DISABLE_PROXY.patch | 125 ----------------
 package/libcurl/libcurl.hash                       |   4 +-
 package/libcurl/libcurl.mk                         |   2 +-
 6 files changed, 3 insertions(+), 366 deletions(-)

diff --git a/package/libcurl/0001-bearssl-fix-build-with-disabled-proxy-support.patch b/package/libcurl/0001-bearssl-fix-build-with-disabled-proxy-support.patch
deleted file mode 100644
index b6d89859b9..0000000000
--- a/package/libcurl/0001-bearssl-fix-build-with-disabled-proxy-support.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3a46be47cad5a3498b5f6d6007b7d1fe5b8dff78 Mon Sep 17 00:00:00 2001
-Message-Id: <3a46be47cad5a3498b5f6d6007b7d1fe5b8dff78.1594274321.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 9 Jul 2020 08:14:49 +0300
-Subject: [PATCH] bearssl: fix build with disabled proxy support
-
-Avoid reference to fields that do not exist when CURL_DISABLE_PROXY is
-defined.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/curl/curl/pull/5666
-
- lib/vtls/bearssl.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
-index 628e16a124a9..44e7406e8e39 100644
---- a/lib/vtls/bearssl.c
-+++ b/lib/vtls/bearssl.c
-@@ -300,8 +300,12 @@ static CURLcode bearssl_connect_step1(struct connectdata *conn, int sockindex)
-   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
-   struct ssl_backend_data *backend = connssl->backend;
-   const char * const ssl_cafile = SSL_CONN_CONFIG(CAfile);
-+#ifndef CURL_DISABLE_PROXY
-   const char *hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
-     conn->host.name;
-+#else
-+  const char *hostname = conn->host.name;
-+#endif
-   const bool verifypeer = SSL_CONN_CONFIG(verifypeer);
-   const bool verifyhost = SSL_CONN_CONFIG(verifyhost);
-   CURLcode ret;
-@@ -386,8 +390,11 @@ static CURLcode bearssl_connect_step1(struct connectdata *conn, int sockindex)
-      */
- 
- #ifdef USE_NGHTTP2
--    if(data->set.httpversion >= CURL_HTTP_VERSION_2 &&
--       (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)) {
-+    if(data->set.httpversion >= CURL_HTTP_VERSION_2
-+#ifndef CURL_DISABLE_PROXY
-+      && (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)
-+#endif
-+      ) {
-       backend->protocols[cur++] = NGHTTP2_PROTO_VERSION_ID;
-       infof(data, "ALPN, offering %s\n", NGHTTP2_PROTO_VERSION_ID);
-     }
--- 
-2.27.0
-
diff --git a/package/libcurl/0002-nss-fix-build-with-disabled-proxy-support.patch b/package/libcurl/0002-nss-fix-build-with-disabled-proxy-support.patch
deleted file mode 100644
index 0d1286338e..0000000000
--- a/package/libcurl/0002-nss-fix-build-with-disabled-proxy-support.patch
+++ /dev/null
@@ -1,159 +0,0 @@
-From d040da28f57d0b3fcd6f63809a8c85a600f87a62 Mon Sep 17 00:00:00 2001
-Message-Id: <d040da28f57d0b3fcd6f63809a8c85a600f87a62.1594274337.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 9 Jul 2020 08:14:49 +0300
-Subject: [PATCH] nss: fix build with disabled proxy support
-
-Avoid reference to fields that do not exist when CURL_DISABLE_PROXY is
-defined.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/curl/curl/pull/5667
-
- lib/vtls/nss.c | 44 +++++++++++++++++++++++++++++++++++---------
- 1 file changed, 35 insertions(+), 9 deletions(-)
-
-diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
-index fca292613815..0f0d1ee6c80f 100644
---- a/lib/vtls/nss.c
-+++ b/lib/vtls/nss.c
-@@ -1027,9 +1027,11 @@ static SECStatus BadCertHandler(void *arg, PRFileDesc *sock)
-   CERTCertificate *cert;
- 
-   /* remember the cert verification result */
-+#ifndef CURL_DISABLE_PROXY
-   if(SSL_IS_PROXY())
-     data->set.proxy_ssl.certverifyresult = err;
-   else
-+#endif
-     data->set.ssl.certverifyresult = err;
- 
-   if(err == SSL_ERROR_BAD_CERT_DOMAIN && !SSL_CONN_CONFIG(verifyhost))
-@@ -1553,24 +1555,32 @@ static void nss_close(struct ssl_connect_data *connssl)
- static void Curl_nss_close(struct connectdata *conn, int sockindex)
- {
-   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
-+#ifndef CURL_DISABLE_PROXY
-   struct ssl_connect_data *connssl_proxy = &conn->proxy_ssl[sockindex];
-+#endif
-   struct ssl_backend_data *backend = connssl->backend;
- 
--  if(backend->handle || connssl_proxy->backend->handle) {
-+  if(backend->handle
-+#ifndef CURL_DISABLE_PROXY
-+    || connssl_proxy->backend->handle
-+#endif
-+    ) {
-     /* NSS closes the socket we previously handed to it, so we must mark it
-        as closed to avoid double close */
-     fake_sclose(conn->sock[sockindex]);
-     conn->sock[sockindex] = CURL_SOCKET_BAD;
-   }
- 
-+#ifndef CURL_DISABLE_PROXY
-   if(backend->handle)
-     /* nss_close(connssl) will transitively close also
-        connssl_proxy->backend->handle if both are used. Clear it to avoid
-        a double close leading to crash. */
-     connssl_proxy->backend->handle = NULL;
- 
--  nss_close(connssl);
-   nss_close(connssl_proxy);
-+#endif
-+  nss_close(connssl);
- }
- 
- /* return true if NSS can provide error code (and possibly msg) for the
-@@ -1828,6 +1838,12 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
-   CURLcode result;
-   bool second_layer = FALSE;
-   SSLVersionRange sslver_supported;
-+#ifndef CURL_DISABLE_PROXY
-+  const char *hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
-+    conn->host.name;
-+#else
-+  const char *hostname = conn->host.name;
-+#endif
- 
-   SSLVersionRange sslver = {
-     SSL_LIBRARY_VERSION_TLS_1_0,  /* min */
-@@ -1932,9 +1948,11 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
-     goto error;
- 
-   /* not checked yet */
-+#ifndef CURL_DISABLE_PROXY
-   if(SSL_IS_PROXY())
-     data->set.proxy_ssl.certverifyresult = 0;
-   else
-+#endif
-     data->set.ssl.certverifyresult = 0;
- 
-   if(SSL_BadCertHook(model, BadCertHandler, conn) != SECSuccess)
-@@ -1991,12 +2009,14 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
-     goto error;
-   }
- 
-+#ifndef CURL_DISABLE_PROXY
-   if(conn->proxy_ssl[sockindex].use) {
-     DEBUGASSERT(ssl_connection_complete == conn->proxy_ssl[sockindex].state);
-     DEBUGASSERT(conn->proxy_ssl[sockindex].backend->handle != NULL);
-     nspr_io = conn->proxy_ssl[sockindex].backend->handle;
-     second_layer = TRUE;
-   }
-+#endif
-   else {
-     /* wrap OS file descriptor by NSPR's file descriptor abstraction */
-     nspr_io = PR_ImportTCPSocket(sockfd);
-@@ -2077,8 +2097,11 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
-     unsigned char protocols[128];
- 
- #ifdef USE_NGHTTP2
--    if(data->set.httpversion >= CURL_HTTP_VERSION_2 &&
--       (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)) {
-+    if(data->set.httpversion >= CURL_HTTP_VERSION_2
-+#ifndef CURL_DISABLE_PROXY
-+      && (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)
-+#endif
-+      ) {
-       protocols[cur++] = NGHTTP2_PROTO_VERSION_ID_LEN;
-       memcpy(&protocols[cur], NGHTTP2_PROTO_VERSION_ID,
-           NGHTTP2_PROTO_VERSION_ID_LEN);
-@@ -2101,14 +2124,11 @@ static CURLcode nss_setup_connect(struct connectdata *conn, int sockindex)
-     goto error;
- 
-   /* propagate hostname to the TLS layer */
--  if(SSL_SetURL(backend->handle, SSL_IS_PROXY() ? conn->http_proxy.host.name :
--                conn->host.name) != SECSuccess)
-+  if(SSL_SetURL(backend->handle, hostname) != SECSuccess)
-     goto error;
- 
-   /* prevent NSS from re-using the session for a different hostname */
--  if(SSL_SetSockPeerID(backend->handle, SSL_IS_PROXY() ?
--                       conn->http_proxy.host.name : conn->host.name)
--     != SECSuccess)
-+  if(SSL_SetSockPeerID(backend->handle, hostname) != SECSuccess)
-     goto error;
- 
-   return CURLE_OK;
-@@ -2127,11 +2147,17 @@ static CURLcode nss_do_connect(struct connectdata *conn, int sockindex)
-   struct Curl_easy *data = conn->data;
-   CURLcode result = CURLE_SSL_CONNECT_ERROR;
-   PRUint32 timeout;
-+#ifndef CURL_DISABLE_PROXY
-   long * const certverifyresult = SSL_IS_PROXY() ?
-     &data->set.proxy_ssl.certverifyresult : &data->set.ssl.certverifyresult;
-   const char * const pinnedpubkey = SSL_IS_PROXY() ?
-               data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :
-               data->set.str[STRING_SSL_PINNEDPUBLICKEY_ORIG];
-+#else
-+  long * const certverifyresult = &data->set.ssl.certverifyresult;
-+  const char * const pinnedpubkey =
-+              data->set.str[STRING_SSL_PINNEDPUBLICKEY_ORIG];
-+#endif
- 
- 
-   /* check timeout situation */
--- 
-2.27.0
-
diff --git a/package/libcurl/0003-gnutls-Fetch-backend-when-using-proxy.patch b/package/libcurl/0003-gnutls-Fetch-backend-when-using-proxy.patch
deleted file mode 100644
index 4e5ad25365..0000000000
--- a/package/libcurl/0003-gnutls-Fetch-backend-when-using-proxy.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 691df98d51955f7f24b34332ad867b6d69093ae0 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Fri, 26 Jun 2020 08:59:24 +0000
-Subject: [PATCH] gnutls: Fetch backend when using proxy
-
-Fixes: 89865c149 ("gnutls: remove the BACKEND define kludge")
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 691df98d51955f7f24b34332ad867b6d69093ae0
-
- lib/vtls/gtls.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
-index 9b4c3659acc5..02d0825e5ac7 100644
---- a/lib/vtls/gtls.c
-+++ b/lib/vtls/gtls.c
-@@ -1382,6 +1382,7 @@ static bool Curl_gtls_data_pending(const struct connectdata *conn,
-     res = TRUE;
- 
-   connssl = &conn->proxy_ssl[connindex];
-+  backend = connssl->backend;
-   if(backend->session &&
-      0 != gnutls_record_check_pending(backend->session))
-     res = TRUE;
--- 
-2.27.0
-
diff --git a/package/libcurl/0004-gnutls-repair-the-build-with-CURL_DISABLE_PROXY.patch b/package/libcurl/0004-gnutls-repair-the-build-with-CURL_DISABLE_PROXY.patch
deleted file mode 100644
index 4f8a72c6ea..0000000000
--- a/package/libcurl/0004-gnutls-repair-the-build-with-CURL_DISABLE_PROXY.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 0fda8db95c98f1e08a830ec5dbccb24e0994a9e3 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Fri, 26 Jun 2020 09:08:32 +0000
-Subject: [PATCH] gnutls: repair the build with `CURL_DISABLE_PROXY`
-
-`http_proxy`/`proxy_ssl`/`tunnel_proxy` will not be available in `conn`
-if `CURL_DISABLE_PROXY` is enabled.  Repair the build with that
-configuration.
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Closes #5645
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 0fda8db95c98f1e08a830ec5dbccb24e0994a9e3
-
- lib/vtls/gtls.c | 30 +++++++++++++++++++++++++++---
- 1 file changed, 27 insertions(+), 3 deletions(-)
-
-diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
-index 02d0825e5ac7..75331388cc13 100644
---- a/lib/vtls/gtls.c
-+++ b/lib/vtls/gtls.c
-@@ -399,10 +399,15 @@ gtls_connect_step1(struct connectdata *conn,
- #endif
-   const char *prioritylist;
-   const char *err = NULL;
-+#ifndef CURL_DISABLE_PROXY
-   const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
-     conn->host.name;
-   long * const certverifyresult = SSL_IS_PROXY() ?
-     &data->set.proxy_ssl.certverifyresult : &data->set.ssl.certverifyresult;
-+#else
-+  const char * const hostname = conn->host.name;
-+  long * const certverifyresult = &data->set.ssl.certverifyresult;
-+#endif
- 
-   if(connssl->state == ssl_connection_complete)
-     /* to make us tolerant against being called more than once for the
-@@ -620,8 +625,11 @@ gtls_connect_step1(struct connectdata *conn,
-     gnutls_datum_t protocols[2];
- 
- #ifdef USE_NGHTTP2
--    if(data->set.httpversion >= CURL_HTTP_VERSION_2 &&
--       (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)) {
-+    if(data->set.httpversion >= CURL_HTTP_VERSION_2
-+#ifndef CURL_DISABLE_PROXY
-+       && (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)
-+#endif
-+       ) {
-       protocols[cur].data = (unsigned char *)NGHTTP2_PROTO_VERSION_ID;
-       protocols[cur].size = NGHTTP2_PROTO_VERSION_ID_LEN;
-       cur++;
-@@ -694,12 +702,15 @@ gtls_connect_step1(struct connectdata *conn,
-     }
-   }
- 
-+#ifndef CURL_DISABLE_PROXY
-   if(conn->proxy_ssl[sockindex].use) {
-     transport_ptr = conn->proxy_ssl[sockindex].backend->session;
-     gnutls_transport_push = Curl_gtls_push_ssl;
-     gnutls_transport_pull = Curl_gtls_pull_ssl;
-   }
--  else {
-+  else
-+#endif
-+  {
-     /* file descriptor for the socket */
-     transport_ptr = &conn->sock[sockindex];
-     gnutls_transport_push = Curl_gtls_push;
-@@ -828,10 +839,15 @@ gtls_connect_step3(struct connectdata *conn,
-   unsigned int bits;
-   gnutls_protocol_t version = gnutls_protocol_get_version(session);
- #endif
-+#ifndef CURL_DISABLE_PROXY
-   const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
-     conn->host.name;
-   long * const certverifyresult = SSL_IS_PROXY() ?
-     &data->set.proxy_ssl.certverifyresult : &data->set.ssl.certverifyresult;
-+#else
-+  const char * const hostname = conn->host.name;
-+  long * const certverifyresult = &data->set.ssl.certverifyresult;
-+#endif
- 
-   /* the name of the cipher suite used, e.g. ECDHE_RSA_AES_256_GCM_SHA384. */
-   ptr = gnutls_cipher_suite_get_name(gnutls_kx_get(session),
-@@ -1112,8 +1128,12 @@ gtls_connect_step3(struct connectdata *conn,
-   }
- #endif
-   if(!rc) {
-+#ifndef CURL_DISABLE_PROXY
-     const char * const dispname = SSL_IS_PROXY() ?
-       conn->http_proxy.host.dispname : conn->host.dispname;
-+#else
-+    const char * const dispname = conn->host.dispname;
-+#endif
- 
-     if(SSL_CONN_CONFIG(verifyhost)) {
-       failf(data, "SSL: certificate subject name (%s) does not match "
-@@ -1381,11 +1401,13 @@ static bool Curl_gtls_data_pending(const struct connectdata *conn,
-      0 != gnutls_record_check_pending(backend->session))
-     res = TRUE;
- 
-+#ifndef CURL_DISABLE_PROXY
-   connssl = &conn->proxy_ssl[connindex];
-   backend = connssl->backend;
-   if(backend->session &&
-      0 != gnutls_record_check_pending(backend->session))
-     res = TRUE;
-+#endif
- 
-   return res;
- }
-@@ -1434,7 +1456,9 @@ static void close_one(struct ssl_connect_data *connssl)
- static void Curl_gtls_close(struct connectdata *conn, int sockindex)
- {
-   close_one(&conn->ssl[sockindex]);
-+#ifndef CURL_DISABLE_PROXY
-   close_one(&conn->proxy_ssl[sockindex]);
-+#endif
- }
- 
- /*
--- 
-2.27.0
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 46f72c1eaf..2bd1890caf 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.71.1.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.72.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  40f83eda27cdbeb25cd4da48cefb639af1b9395d6026d2da1825bf059239658c  curl-7.71.1.tar.xz
+sha256  0ded0808c4d85f2ee0db86980ae610cc9d165e9ca9da466196cc73c346513713  curl-7.72.0.tar.xz
 sha256  db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6f053f00a8..ea7e06e27e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.71.1
+LIBCURL_VERSION = 7.72.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
