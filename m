From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Apr 2013 22:39:40 +0200
Subject: [Buildroot] [git commit] openvpn: bump to version 2.3.1
Message-ID: <20130403204840.2B6F39B467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e99d21b5e59413885083be2de93c9b8e42f4568d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openvpn/openvpn-allow-polarssl-1.2.patch |   72 ----------------------
 package/openvpn/openvpn.mk                       |    2 +-
 2 files changed, 1 insertions(+), 73 deletions(-)

diff --git a/package/openvpn/openvpn-allow-polarssl-1.2.patch b/package/openvpn/openvpn-allow-polarssl-1.2.patch
deleted file mode 100644
index 0aeb2f2..0000000
--- a/package/openvpn/openvpn-allow-polarssl-1.2.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Allow OpenVPN to use newer (1.2+) PolarSSL versions.
-https://community.openvpn.net/openvpn/ticket/250
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/src/openvpn/crypto_polarssl.h.ori	2013-01-10 21:38:23.213885934 +0100
-+++ a/src/openvpn/crypto_polarssl.h	2013-01-10 21:40:20.597883460 +0100
-@@ -60,7 +60,11 @@
- #define OPENVPN_MODE_OFB 	POLARSSL_MODE_OFB
- 
- /** Cipher is in CFB mode */
-+#if POLARSSL_VERSION_NUMBER < 0x01020000
- #define OPENVPN_MODE_CFB 	POLARSSL_MODE_CFB128
-+#else
-+#define OPENVPN_MODE_CFB 	POLARSSL_MODE_CFB
-+#endif
- 
- /** Cipher should encrypt */
- #define OPENVPN_OP_ENCRYPT 	POLARSSL_ENCRYPT
---- a/src/openvpn/ssl_polarssl.c.ori	2013-01-10 21:50:16.041870946 +0100
-+++ a/src/openvpn/ssl_polarssl.c	2013-01-10 21:54:35.261865496 +0100
-@@ -67,6 +67,20 @@
- 
- static int default_ciphersuites[] =
- {
-+#if POLARSSL_VERSION_NUMBER >= 0x0102000
-+    TLS_DHE_RSA_WITH_AES_256_CBC_SHA,
-+    TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA,
-+    TLS_DHE_RSA_WITH_AES_128_CBC_SHA,
-+    TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA,
-+    TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
-+    TLS_RSA_WITH_AES_256_CBC_SHA,
-+    TLS_RSA_WITH_CAMELLIA_256_CBC_SHA,
-+    TLS_RSA_WITH_AES_128_CBC_SHA,
-+    TLS_RSA_WITH_CAMELLIA_128_CBC_SHA,
-+    TLS_RSA_WITH_3DES_EDE_CBC_SHA,
-+    TLS_RSA_WITH_RC4_128_SHA,
-+    TLS_RSA_WITH_RC4_128_MD5,
-+#else
-     SSL_EDH_RSA_AES_256_SHA,
-     SSL_EDH_RSA_CAMELLIA_256_SHA,
-     SSL_EDH_RSA_AES_128_SHA,
-@@ -79,6 +93,7 @@
-     SSL_RSA_DES_168_SHA,
-     SSL_RSA_RC4_128_SHA,
-     SSL_RSA_RC4_128_MD5,
-+#endif
-     0
- };
- 
-@@ -515,7 +530,9 @@
-       ssl_set_rng (ks_ssl->ctx, ctr_drbg_random, rand_ctx_get());
- 
-       ALLOC_OBJ_CLEAR (ks_ssl->ssn, ssl_session);
-+#if  POLARSSL_VERSION_NUMBER < 0x01020000
-       ssl_set_session (ks_ssl->ctx, 0, 0, ks_ssl->ssn );
-+#endif
-       if (ssl_ctx->allowed_ciphers)
- 	ssl_set_ciphersuites (ks_ssl->ctx, ssl_ctx->allowed_ciphers);
-       else
-@@ -828,7 +845,11 @@
- 		    ssl_get_version (ks_ssl->ctx),
- 		    ssl_get_ciphersuite(ks_ssl->ctx));
- 
-+#if POLARSSL_VERSION_NUMBER >= 0x01020000
-+  cert = ks_ssl->ssn->peer_cert;
-+#else
-   cert = ks_ssl->ctx->peer_cert;
-+#endif
-   if (cert != NULL)
-     {
-       openvpn_snprintf (s2, sizeof (s2), ", " counter_format " bit RSA", (counter_type) cert->rsa.len * 8);
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index a49daca..c911465 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.3.0
+OPENVPN_VERSION = 2.3.1
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_CONF_OPT = --disable-plugin-auth-pam --enable-iproute2
