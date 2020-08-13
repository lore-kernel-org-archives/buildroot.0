From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:42:11 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libcurl: fix
 build against gnutls with proxy disabled
Message-ID: <20200813183631.DFA9683A90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ea0d106c97a0d862b3ad5cc92233bd44adfbbf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Add upstream patch (#4) fixing build with gnutls when
BR2_PACKAGE_LIBCURL_PROXY_SUPPORT is disabled.

Patch #4 depends on #3 to apply so add this one as well.

Fixes:
http://autobuild.buildroot.net/results/31d7204869ff71319ea055688c919a646bfb200b/
http://autobuild.buildroot.net/results/f8d2fb919475cdff4a36ad93071048ee09193b98/
http://autobuild.buildroot.net/results/2f07a0ac1240a6040a3509d2ebf06906a31fd172/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 30a73893f5b533d1857796e85359f412a5567ed2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...003-gnutls-Fetch-backend-when-using-proxy.patch |  29 +++++
 ...-repair-the-build-with-CURL_DISABLE_PROXY.patch | 125 +++++++++++++++++++++
 2 files changed, 154 insertions(+)

diff --git a/package/libcurl/0003-gnutls-Fetch-backend-when-using-proxy.patch b/package/libcurl/0003-gnutls-Fetch-backend-when-using-proxy.patch
new file mode 100644
index 0000000000..4e5ad25365
--- /dev/null
+++ b/package/libcurl/0003-gnutls-Fetch-backend-when-using-proxy.patch
@@ -0,0 +1,29 @@
+From 691df98d51955f7f24b34332ad867b6d69093ae0 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 26 Jun 2020 08:59:24 +0000
+Subject: [PATCH] gnutls: Fetch backend when using proxy
+
+Fixes: 89865c149 ("gnutls: remove the BACKEND define kludge")
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 691df98d51955f7f24b34332ad867b6d69093ae0
+
+ lib/vtls/gtls.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 9b4c3659acc5..02d0825e5ac7 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -1382,6 +1382,7 @@ static bool Curl_gtls_data_pending(const struct connectdata *conn,
+     res = TRUE;
+ 
+   connssl = &conn->proxy_ssl[connindex];
++  backend = connssl->backend;
+   if(backend->session &&
+      0 != gnutls_record_check_pending(backend->session))
+     res = TRUE;
+-- 
+2.27.0
+
diff --git a/package/libcurl/0004-gnutls-repair-the-build-with-CURL_DISABLE_PROXY.patch b/package/libcurl/0004-gnutls-repair-the-build-with-CURL_DISABLE_PROXY.patch
new file mode 100644
index 0000000000..4f8a72c6ea
--- /dev/null
+++ b/package/libcurl/0004-gnutls-repair-the-build-with-CURL_DISABLE_PROXY.patch
@@ -0,0 +1,125 @@
+From 0fda8db95c98f1e08a830ec5dbccb24e0994a9e3 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 26 Jun 2020 09:08:32 +0000
+Subject: [PATCH] gnutls: repair the build with `CURL_DISABLE_PROXY`
+
+`http_proxy`/`proxy_ssl`/`tunnel_proxy` will not be available in `conn`
+if `CURL_DISABLE_PROXY` is enabled.  Repair the build with that
+configuration.
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Closes #5645
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 0fda8db95c98f1e08a830ec5dbccb24e0994a9e3
+
+ lib/vtls/gtls.c | 30 +++++++++++++++++++++++++++---
+ 1 file changed, 27 insertions(+), 3 deletions(-)
+
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 02d0825e5ac7..75331388cc13 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -399,10 +399,15 @@ gtls_connect_step1(struct connectdata *conn,
+ #endif
+   const char *prioritylist;
+   const char *err = NULL;
++#ifndef CURL_DISABLE_PROXY
+   const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
+     conn->host.name;
+   long * const certverifyresult = SSL_IS_PROXY() ?
+     &data->set.proxy_ssl.certverifyresult : &data->set.ssl.certverifyresult;
++#else
++  const char * const hostname = conn->host.name;
++  long * const certverifyresult = &data->set.ssl.certverifyresult;
++#endif
+ 
+   if(connssl->state == ssl_connection_complete)
+     /* to make us tolerant against being called more than once for the
+@@ -620,8 +625,11 @@ gtls_connect_step1(struct connectdata *conn,
+     gnutls_datum_t protocols[2];
+ 
+ #ifdef USE_NGHTTP2
+-    if(data->set.httpversion >= CURL_HTTP_VERSION_2 &&
+-       (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)) {
++    if(data->set.httpversion >= CURL_HTTP_VERSION_2
++#ifndef CURL_DISABLE_PROXY
++       && (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)
++#endif
++       ) {
+       protocols[cur].data = (unsigned char *)NGHTTP2_PROTO_VERSION_ID;
+       protocols[cur].size = NGHTTP2_PROTO_VERSION_ID_LEN;
+       cur++;
+@@ -694,12 +702,15 @@ gtls_connect_step1(struct connectdata *conn,
+     }
+   }
+ 
++#ifndef CURL_DISABLE_PROXY
+   if(conn->proxy_ssl[sockindex].use) {
+     transport_ptr = conn->proxy_ssl[sockindex].backend->session;
+     gnutls_transport_push = Curl_gtls_push_ssl;
+     gnutls_transport_pull = Curl_gtls_pull_ssl;
+   }
+-  else {
++  else
++#endif
++  {
+     /* file descriptor for the socket */
+     transport_ptr = &conn->sock[sockindex];
+     gnutls_transport_push = Curl_gtls_push;
+@@ -828,10 +839,15 @@ gtls_connect_step3(struct connectdata *conn,
+   unsigned int bits;
+   gnutls_protocol_t version = gnutls_protocol_get_version(session);
+ #endif
++#ifndef CURL_DISABLE_PROXY
+   const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
+     conn->host.name;
+   long * const certverifyresult = SSL_IS_PROXY() ?
+     &data->set.proxy_ssl.certverifyresult : &data->set.ssl.certverifyresult;
++#else
++  const char * const hostname = conn->host.name;
++  long * const certverifyresult = &data->set.ssl.certverifyresult;
++#endif
+ 
+   /* the name of the cipher suite used, e.g. ECDHE_RSA_AES_256_GCM_SHA384. */
+   ptr = gnutls_cipher_suite_get_name(gnutls_kx_get(session),
+@@ -1112,8 +1128,12 @@ gtls_connect_step3(struct connectdata *conn,
+   }
+ #endif
+   if(!rc) {
++#ifndef CURL_DISABLE_PROXY
+     const char * const dispname = SSL_IS_PROXY() ?
+       conn->http_proxy.host.dispname : conn->host.dispname;
++#else
++    const char * const dispname = conn->host.dispname;
++#endif
+ 
+     if(SSL_CONN_CONFIG(verifyhost)) {
+       failf(data, "SSL: certificate subject name (%s) does not match "
+@@ -1381,11 +1401,13 @@ static bool Curl_gtls_data_pending(const struct connectdata *conn,
+      0 != gnutls_record_check_pending(backend->session))
+     res = TRUE;
+ 
++#ifndef CURL_DISABLE_PROXY
+   connssl = &conn->proxy_ssl[connindex];
+   backend = connssl->backend;
+   if(backend->session &&
+      0 != gnutls_record_check_pending(backend->session))
+     res = TRUE;
++#endif
+ 
+   return res;
+ }
+@@ -1434,7 +1456,9 @@ static void close_one(struct ssl_connect_data *connssl)
+ static void Curl_gtls_close(struct connectdata *conn, int sockindex)
+ {
+   close_one(&conn->ssl[sockindex]);
++#ifndef CURL_DISABLE_PROXY
+   close_one(&conn->proxy_ssl[sockindex]);
++#endif
+ }
+ 
+ /*
+-- 
+2.27.0
+
