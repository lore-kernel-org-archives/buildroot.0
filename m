From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 18 May 2018 06:00:36 +0300
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.60.0
Message-ID: <c80a6fad0f71e02beda054135fc6e2e2f4ed2a0f.1526612436.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

This release fixes the security issues listed below.

CVE-2018-1000300: curl might overflow a heap based memory buffer when
closing down an FTP connection with very long server command replies.

  https://curl.haxx.se/docs/adv_2018-82c2.html

CVE-2018-1000301: curl can be tricked into reading data beyond the end
of a heap based buffer used to store downloaded content.

  https://curl.haxx.se/docs/adv_2018-b138.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-openssl-fix-build-with-LibreSSL-2.7.patch | 75 -------------------
 package/libcurl/libcurl.hash                  |  4 +-
 package/libcurl/libcurl.mk                    |  2 +-
 3 files changed, 3 insertions(+), 78 deletions(-)
 delete mode 100644 package/libcurl/0001-openssl-fix-build-with-LibreSSL-2.7.patch

diff --git a/package/libcurl/0001-openssl-fix-build-with-LibreSSL-2.7.patch b/package/libcurl/0001-openssl-fix-build-with-LibreSSL-2.7.patch
deleted file mode 100644
index 45ae4e295057..000000000000
--- a/package/libcurl/0001-openssl-fix-build-with-LibreSSL-2.7.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From de115e14079d12e8826eabaa396677dc40beb5d1 Mon Sep 17 00:00:00 2001
-From: Bernard Spil <brnrd@FreeBSD.org>
-Date: Mon, 2 Apr 2018 19:04:06 +0200
-Subject: [PATCH] openssl: fix build with LibreSSL 2.7
-
- - LibreSSL 2.7 implements (most of) OpenSSL 1.1 API
-
-Fixes #2319
-Closes #2447
-Closes #2448
-
-Signed-off-by: Bernard Spil <brnrd@FreeBSD.org>
-(cherry picked from commit 7c90c93c0b061da81f69fabdd57125b2783c15fb)
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- lib/vtls/openssl.c | 15 +++++++++------
- 1 file changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
-index 2a6b3cfac..bbb8ec766 100644
---- a/lib/vtls/openssl.c
-+++ b/lib/vtls/openssl.c
-@@ -104,7 +104,8 @@
- #endif
- 
- #if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && /* OpenSSL 1.1.0+ */ \
--  !defined(LIBRESSL_VERSION_NUMBER)
-+    !(defined(LIBRESSL_VERSION_NUMBER) && \
-+      LIBRESSL_VERSION_NUMBER < 0x20700000L)
- #define SSLEAY_VERSION_NUMBER OPENSSL_VERSION_NUMBER
- #define HAVE_X509_GET0_EXTENSIONS 1 /* added in 1.1.0 -pre1 */
- #define HAVE_OPAQUE_EVP_PKEY 1 /* since 1.1.0 -pre3 */
-@@ -128,7 +129,8 @@ static unsigned long OpenSSL_version_num(void)
- #endif
- 
- #if (OPENSSL_VERSION_NUMBER >= 0x1000200fL) && /* 1.0.2 or later */ \
--  !defined(LIBRESSL_VERSION_NUMBER)
-+    !(defined(LIBRESSL_VERSION_NUMBER) && \
-+      LIBRESSL_VERSION_NUMBER < 0x20700000L)
- #define HAVE_X509_GET0_SIGNATURE 1
- #endif
- 
-@@ -147,7 +149,7 @@ static unsigned long OpenSSL_version_num(void)
-  * Whether SSL_CTX_set_keylog_callback is available.
-  * OpenSSL: supported since 1.1.1 https://github.com/openssl/openssl/pull/2287
-  * BoringSSL: supported since d28f59c27bac (committed 2015-11-19)
-- * LibreSSL: unsupported in at least 2.5.1 (explicitly check for it since it
-+ * LibreSSL: unsupported in@least 2.7.2 (explicitly check for it since it
-  *           lies and pretends to be OpenSSL 2.0.0).
-  */
- #if (OPENSSL_VERSION_NUMBER >= 0x10101000L && \
-@@ -259,7 +261,9 @@ static void tap_ssl_key(const SSL *ssl, ssl_tap_state_t *state)
-   if(!session || !keylog_file_fp)
-     return;
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && \
-+    !(defined(LIBRESSL_VERSION_NUMBER) && \
-+      LIBRESSL_VERSION_NUMBER < 0x20700000L)
-   /* ssl->s3 is not checked in openssl 1.1.0-pre6, but let's assume that
-    * we have a valid SSL context if we have a non-NULL session. */
-   SSL_get_client_random(ssl, client_random, SSL3_RANDOM_SIZE);
-@@ -2082,8 +2086,7 @@ static CURLcode ossl_connect_step1(struct connectdata *conn, int sockindex)
-   case CURL_SSLVERSION_TLSv1_2:
-   case CURL_SSLVERSION_TLSv1_3:
-     /* it will be handled later with the context options */
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && \
--    !defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L)
-     req_method = TLS_client_method();
- #else
-     req_method = SSLv23_client_method();
--- 
-2.14.3
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index aec61e3f8317..cb1e6e72f204 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.59.0.tar.xz.asc
-sha256 e44eaabdf916407585bf5c7939ff1161e6242b6b015d3f2f5b758b2a330461fc  curl-7.59.0.tar.xz
+# https://curl.haxx.se/download/curl-7.60.0.tar.xz.asc
+sha256 8736ff8ded89ddf7e926eec7b16f82597d029fc1469f3a551f1fafaac164e6a0  curl-7.60.0.tar.xz
 sha256 5f3849ec38ddb927e79f514bf948890c41b8d1407286a49609b8fb1585931095  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a3e66d094cf3..fbaeaa8975fc 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.59.0
+LIBCURL_VERSION = 7.60.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.17.0
