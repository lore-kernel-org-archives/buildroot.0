From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:37 -0400
Subject: [Buildroot] [PATCH 10/13] wpa_supplicant: add libressl support patch
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-11-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/network/wpa_supplicant/patches/wpa_supplicant-libressl.patch
Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 .../wpa_supplicant/0001-fix-libressl-support.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/wpa_supplicant/0001-fix-libressl-support.patch

diff --git a/package/wpa_supplicant/0001-fix-libressl-support.patch b/package/wpa_supplicant/0001-fix-libressl-support.patch
new file mode 100644
index 0000000000..d6706ad48d
--- /dev/null
+++ b/package/wpa_supplicant/0001-fix-libressl-support.patch
@@ -0,0 +1,70 @@
+From fd08ab1edce039ebefd305f7d8241cef6e4a397c Mon Sep 17 00:00:00 2001
+From: Stephan Raue <stephan@openelec.tv>
+Date: Fri, 4 Aug 2017 12:51:58 -0400
+Subject: [PATCH] fix libressl support
+
+From: https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/network/wpa_supplicant/patches/wpa_supplicant-libressl.patch
+
+Original author: Stephan Raue <stephan@openelec.tv>
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ src/crypto/crypto_openssl.c | 4 ++--
+ src/crypto/tls_openssl.c    | 6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/crypto/crypto_openssl.c b/src/crypto/crypto_openssl.c
+index 19e0e2b..b3d1b07 100644
+--- a/src/crypto/crypto_openssl.c
++++ b/src/crypto/crypto_openssl.c
+@@ -611,7 +611,7 @@ void crypto_cipher_deinit(struct crypto_cipher *ctx)
+ 
+ void * dh5_init(struct wpabuf **priv, struct wpabuf **publ)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	DH *dh;
+ 	struct wpabuf *pubkey = NULL, *privkey = NULL;
+ 	size_t publen, privlen;
+@@ -712,7 +712,7 @@ err:
+ 
+ void * dh5_init_fixed(const struct wpabuf *priv, const struct wpabuf *publ)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	DH *dh;
+ 
+ 	dh = DH_new();
+diff --git a/src/crypto/tls_openssl.c b/src/crypto/tls_openssl.c
+index 23ac64b..8ddcb7e 100644
+--- a/src/crypto/tls_openssl.c
++++ b/src/crypto/tls_openssl.c
+@@ -919,7 +919,7 @@ void * tls_init(const struct tls_config *conf)
+ 		}
+ #endif /* OPENSSL_FIPS */
+ #endif /* CONFIG_FIPS */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 		SSL_load_error_strings();
+ 		SSL_library_init();
+ #ifndef OPENSSL_NO_SHA256
+@@ -1043,7 +1043,7 @@ void tls_deinit(void *ssl_ctx)
+ 
+ 	tls_openssl_ref_count--;
+ 	if (tls_openssl_ref_count == 0) {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #ifndef OPENSSL_NO_ENGINE
+ 		ENGINE_cleanup();
+ #endif /* OPENSSL_NO_ENGINE */
+@@ -3976,7 +3976,7 @@ int tls_connection_set_params(void *tls_ctx, struct tls_connection *conn,
+ 		engine_id = "pkcs11";
+ 
+ #if defined(EAP_FAST) || defined(EAP_FAST_DYNAMIC) || defined(EAP_SERVER_FAST)
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	if (params->flags & TLS_CONN_EAP_FAST) {
+ 		wpa_printf(MSG_DEBUG,
+ 			   "OpenSSL: Use TLSv1_method() for EAP-FAST");
+-- 
+2.13.3
+
-- 
2.13.6
