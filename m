From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  1 May 2018 08:43:13 -0400
Subject: [Buildroot] [PATCH v2 1/1] libcurl: fix building against libressl
Message-ID: <20180501124313.31033-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LibreSSL 2.7.x breaks libcurl 7.59.0 with the error:
error: static declaration of ?OpenSSL_version_num? follows non-static
declaration

This failure has since been fixed upstream with commit:
https://github.com/curl/curl/commit/7c90c93c0b061da81f69fabdd57125b2783c15fb

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Formatted patch with git cherry-pick -x (Thomas and Arnout)

 .../0001-openssl-fix-build-with-LibreSSL-2.7.patch | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 package/libcurl/0001-openssl-fix-build-with-LibreSSL-2.7.patch

diff --git a/package/libcurl/0001-openssl-fix-build-with-LibreSSL-2.7.patch b/package/libcurl/0001-openssl-fix-build-with-LibreSSL-2.7.patch
new file mode 100644
index 0000000000..45ae4e2950
--- /dev/null
+++ b/package/libcurl/0001-openssl-fix-build-with-LibreSSL-2.7.patch
@@ -0,0 +1,75 @@
+From de115e14079d12e8826eabaa396677dc40beb5d1 Mon Sep 17 00:00:00 2001
+From: Bernard Spil <brnrd@FreeBSD.org>
+Date: Mon, 2 Apr 2018 19:04:06 +0200
+Subject: [PATCH] openssl: fix build with LibreSSL 2.7
+
+ - LibreSSL 2.7 implements (most of) OpenSSL 1.1 API
+
+Fixes #2319
+Closes #2447
+Closes #2448
+
+Signed-off-by: Bernard Spil <brnrd@FreeBSD.org>
+(cherry picked from commit 7c90c93c0b061da81f69fabdd57125b2783c15fb)
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ lib/vtls/openssl.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 2a6b3cfac..bbb8ec766 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -104,7 +104,8 @@
+ #endif
+ 
+ #if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && /* OpenSSL 1.1.0+ */ \
+-  !defined(LIBRESSL_VERSION_NUMBER)
++    !(defined(LIBRESSL_VERSION_NUMBER) && \
++      LIBRESSL_VERSION_NUMBER < 0x20700000L)
+ #define SSLEAY_VERSION_NUMBER OPENSSL_VERSION_NUMBER
+ #define HAVE_X509_GET0_EXTENSIONS 1 /* added in 1.1.0 -pre1 */
+ #define HAVE_OPAQUE_EVP_PKEY 1 /* since 1.1.0 -pre3 */
+@@ -128,7 +129,8 @@ static unsigned long OpenSSL_version_num(void)
+ #endif
+ 
+ #if (OPENSSL_VERSION_NUMBER >= 0x1000200fL) && /* 1.0.2 or later */ \
+-  !defined(LIBRESSL_VERSION_NUMBER)
++    !(defined(LIBRESSL_VERSION_NUMBER) && \
++      LIBRESSL_VERSION_NUMBER < 0x20700000L)
+ #define HAVE_X509_GET0_SIGNATURE 1
+ #endif
+ 
+@@ -147,7 +149,7 @@ static unsigned long OpenSSL_version_num(void)
+  * Whether SSL_CTX_set_keylog_callback is available.
+  * OpenSSL: supported since 1.1.1 https://github.com/openssl/openssl/pull/2287
+  * BoringSSL: supported since d28f59c27bac (committed 2015-11-19)
+- * LibreSSL: unsupported in at least 2.5.1 (explicitly check for it since it
++ * LibreSSL: unsupported in@least 2.7.2 (explicitly check for it since it
+  *           lies and pretends to be OpenSSL 2.0.0).
+  */
+ #if (OPENSSL_VERSION_NUMBER >= 0x10101000L && \
+@@ -259,7 +261,9 @@ static void tap_ssl_key(const SSL *ssl, ssl_tap_state_t *state)
+   if(!session || !keylog_file_fp)
+     return;
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L && \
++    !(defined(LIBRESSL_VERSION_NUMBER) && \
++      LIBRESSL_VERSION_NUMBER < 0x20700000L)
+   /* ssl->s3 is not checked in openssl 1.1.0-pre6, but let's assume that
+    * we have a valid SSL context if we have a non-NULL session. */
+   SSL_get_client_random(ssl, client_random, SSL3_RANDOM_SIZE);
+@@ -2082,8 +2086,7 @@ static CURLcode ossl_connect_step1(struct connectdata *conn, int sockindex)
+   case CURL_SSLVERSION_TLSv1_2:
+   case CURL_SSLVERSION_TLSv1_3:
+     /* it will be handled later with the context options */
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && \
+-    !defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L)
+     req_method = TLS_client_method();
+ #else
+     req_method = SSLv23_client_method();
+-- 
+2.14.3
+
-- 
2.14.3
