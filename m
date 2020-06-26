From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 26 Jun 2020 12:58:59 +0300
Subject: [Buildroot] [PATCH] package/libcurl: fix build with mbedtls,
 no proxy
Message-ID: <08a9738f883fd1df067847ffb38ddf2e35222828.1593165539.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch fixing build with BR2_PACKAGE_LIBCURL_PROXY_SUPPORT disabled
and mbedtls enabled.

Fixes:
http://autobuild.buildroot.net/results/f32b6ab927560839cacaa1b9e6b64ced92b9ffe3/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ix-build-with-disabled-proxy-support.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/libcurl/0001-mbedtls-fix-build-with-disabled-proxy-support.patch

diff --git a/package/libcurl/0001-mbedtls-fix-build-with-disabled-proxy-support.patch b/package/libcurl/0001-mbedtls-fix-build-with-disabled-proxy-support.patch
new file mode 100644
index 000000000000..7ae23e852061
--- /dev/null
+++ b/package/libcurl/0001-mbedtls-fix-build-with-disabled-proxy-support.patch
@@ -0,0 +1,57 @@
+From ee6e38c7f42c7e1f0f8a610ff5ae8e2a66eca435 Mon Sep 17 00:00:00 2001
+Message-Id: <ee6e38c7f42c7e1f0f8a610ff5ae8e2a66eca435.1593164704.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 26 Jun 2020 12:40:43 +0300
+Subject: [PATCH] mbedtls: fix build with disabled proxy support
+
+Don't reference fields that do not exist. Fixes build failure:
+
+vtls/mbedtls.c: In function 'mbed_connect_step1':
+vtls/mbedtls.c:249:54: error: 'struct connectdata' has no member named 'http_proxy'
+   const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
+                                                      ^~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/curl/curl/pull/5615
+
+ lib/vtls/mbedtls.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index ba31b8e78845..545f824c62c2 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -246,9 +246,14 @@ mbed_connect_step1(struct connectdata *conn,
+   const char * const ssl_capath = SSL_CONN_CONFIG(CApath);
+   char * const ssl_cert = SSL_SET_OPTION(cert);
+   const char * const ssl_crlfile = SSL_SET_OPTION(CRLfile);
++#ifndef CURL_DISABLE_PROXY
+   const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
+     conn->host.name;
+   const long int port = SSL_IS_PROXY() ? conn->port : conn->remote_port;
++#else
++  const char * const hostname = conn->host.name;
++  const long int port = conn->remote_port;
++#endif
+   int ret = -1;
+   char errorbuf[128];
+   errorbuf[0] = 0;
+@@ -538,9 +543,14 @@ mbed_connect_step2(struct connectdata *conn,
+   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
+   struct ssl_backend_data *backend = connssl->backend;
+   const mbedtls_x509_crt *peercert;
++#ifndef CURL_DISABLE_PROXY
+   const char * const pinnedpubkey = SSL_IS_PROXY() ?
+     data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :
+     data->set.str[STRING_SSL_PINNEDPUBLICKEY_ORIG];
++#else
++  const char * const pinnedpubkey =
++    data->set.str[STRING_SSL_PINNEDPUBLICKEY_ORIG];
++#endif
+ 
+   conn->recv[sockindex] = mbed_recv;
+   conn->send[sockindex] = mbed_send;
+-- 
+2.27.0
+
-- 
2.27.0
