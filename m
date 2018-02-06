From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  6 Feb 2018 13:03:46 -0500
Subject: [Buildroot] [NEXT 1/1] sngrep: bump to 1.4.5
Message-ID: <20180206180346.12338-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add 0001-Fix-building-against-LibreSSL.patch to fix compiling against
LibreSSL.

This patch has been submitted and accepted upstream.
https://github.com/irontec/sngrep/commit/0ee014d497986c40de264f6392b01fdf4e337fd5

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0001-Fix-building-against-LibreSSL.patch       | 78 ++++++++++++++++++++++
 package/sngrep/sngrep.hash                         |  6 +-
 package/sngrep/sngrep.mk                           |  2 +-
 3 files changed, 82 insertions(+), 4 deletions(-)
 create mode 100644 package/sngrep/0001-Fix-building-against-LibreSSL.patch

diff --git a/package/sngrep/0001-Fix-building-against-LibreSSL.patch b/package/sngrep/0001-Fix-building-against-LibreSSL.patch
new file mode 100644
index 0000000000..311f0b3d52
--- /dev/null
+++ b/package/sngrep/0001-Fix-building-against-LibreSSL.patch
@@ -0,0 +1,78 @@
+From 05d110ef57e9647b84c9656e746f72a76ea8c758 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Tue, 6 Feb 2018 12:47:43 -0500
+Subject: [PATCH] Fix building against LibreSSL
+
+LibreSSL declares OPENSSL_VERSION_NUMBER == 2.0 but does not include most
+changes from OpenSSL >= 1.1.
+
+To work around this:
+
+- Check to see if LIBRESSL_VERSION_NUMBER is defined.
+- If so, define MODSSL_USE_OPENSSL_PRE_1_1_API.
+- Change all checks for OPENSSL_VERSION_NUMBER < 0x10100000L to
+  '#if MODSSL_USE_OPENSSL_PRE_1_1_API'
+
+Upstream-Status: Committed
+https://github.com/irontec/sngrep/commit/0ee014d497986c40de264f6392b01fdf4e337fd5
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ src/capture_openssl.c | 6 +++---
+ src/capture_openssl.h | 9 +++++++++
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/src/capture_openssl.c b/src/capture_openssl.c
+index 0a052c3..a4e1de0 100644
+--- a/src/capture_openssl.c
++++ b/src/capture_openssl.c
+@@ -94,7 +94,7 @@ P_hash(const char *digest, unsigned char *dest, int dlen, unsigned char *secret,
+ 
+     // Calculate enough data to fill destination
+     while (pending > 0) {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if MODSSL_USE_OPENSSL_PRE_1_1_API
+         HMAC_CTX hm;
+         HMAC_Init(&hm, secret, sslen, md);
+         HMAC_Update(&hm, tmpseed, tmpslen);
+@@ -495,7 +495,7 @@ tls_process_record(struct SSLConnection *conn, const uint8_t *payload,
+                 break;
+             case change_cipher_spec:
+                 // From now on, this connection will be encrypted using MasterSecret
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if MODSSL_USE_OPENSSL_PRE_1_1_API
+                 if (conn->client_cipher_ctx->cipher && conn->server_cipher_ctx->cipher)
+                     conn->encrypted = 1;
+ #else
+@@ -588,7 +588,7 @@ tls_process_record_handshake(struct SSLConnection *conn, const opaque *fragment,
+                 // Decrypt PreMasterKey
+                 clientkeyex = (struct ClientKeyExchange *) body;
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if MODSSL_USE_OPENSSL_PRE_1_1_API
+                 RSA_private_decrypt(UINT16_INT(clientkeyex->length),
+                                     (const unsigned char *) &clientkeyex->exchange_keys,
+                                     (unsigned char *) &conn->pre_master_secret,
+diff --git a/src/capture_openssl.h b/src/capture_openssl.h
+index 31f48ce..b3e88fe 100644
+--- a/src/capture_openssl.h
++++ b/src/capture_openssl.h
+@@ -65,6 +65,15 @@
+ #define OLD_OPENSSL_VERSION 1
+ #endif
+ 
++/* LibreSSL declares OPENSSL_VERSION_NUMBER == 2.0 but does not include most
++ * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...)
++ */
++#if defined(LIBRESSL_VERSION_NUMBER)
++#define MODSSL_USE_OPENSSL_PRE_1_1_API (1)
++#else
++#define MODSSL_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
++#endif
++
+ //! Three bytes unsigned integer
+ typedef struct uint16 {
+     unsigned char x[2];
+-- 
+2.14.3
+
diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index cd2dff5536..16552cf5cd 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1,6 +1,6 @@
-# From https://github.com/irontec/sngrep/releases/download/v1.4.4/sngrep-1.4.4.tar.gz.md5sum
-md5 8e2286c2e23f4b29667025e5809dc303  sngrep-1.4.4.tar.gz
+# From https://github.com/irontec/sngrep/releases/download/v1.4.5/sngrep-1.4.5.tar.gz.md5sum
+md5 11f1cdb8e8f3a3c9ef02ecd12268322e  sngrep-1.4.5.tar.gz
 
 # Locally computed
-sha256 2379b8b3e9498d426a0bc03b90d74170a80f98f167f89c126d53dcc66bc5f60b sngrep-v1.4.4.tar.gz
+sha256 16f1566f4507ba560c7461cc7ff1c1653beb14b8baf7846269bbb4880564e57f sngrep-v1.4.5.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 7442cef529..4c9958d497 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNGREP_VERSION = v1.4.4
+SNGREP_VERSION = v1.4.5
 SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
-- 
2.14.3
