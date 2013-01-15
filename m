From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 21:23:28 +0100
Subject: [Buildroot] [git commit] openvpn: bump to version 2.3.0
Message-ID: <20130115204907.032569A1C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=763ad50bd72dead80d2a50c637291f06da8caaaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Toolchain IPv6 support isn't optional any more.
New PolarSSL backend besides the usual OpenSSL one.
New small binary option, reduces binary file size ~100 KiB depending on
target architecture.
Removed no crypto option - it still requires some SSL library headers
and it's pointless anyway, after all we're talking about a VPN solution
here.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openvpn/Config.in                          |   39 +++++++++--
 package/openvpn/openvpn-allow-polarssl-1.2.patch   |   72 ++++++++++++++++++++
 .../openvpn-fix-build-with-disable-crypto.patch    |   30 --------
 package/openvpn/openvpn.mk                         |   32 ++++++---
 4 files changed, 126 insertions(+), 47 deletions(-)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 9f9057d..a96ed4e 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,5 +1,10 @@
+comment "openvpn requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
+
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
+	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
  	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
@@ -8,20 +13,42 @@ config BR2_PACKAGE_OPENVPN
 	  remote access solutions with load balancing, failover, and
 	  fine-grained access-controls.
 
-	  http://openvpn.sourceforge.net/
+	  http://openvpn.net/
+
+if BR2_PACKAGE_OPENVPN
 
 config BR2_PACKAGE_OPENVPN_LZO
 	bool "LZO compression"
 	default y
-	depends on BR2_PACKAGE_OPENVPN
 	select BR2_PACKAGE_LZO
 	help
 	  Enable LZO compression.
 
-config BR2_PACKAGE_OPENVPN_OPENSSL
-	bool "OpenSSL support"
-	default y
-	depends on BR2_PACKAGE_OPENVPN
+config BR2_PACKAGE_OPENVPN_SMALL
+	bool "Optimize for small size"
+	help
+	  Make OpenVPN as small as possible.
+	  You loose eurephia, debugging info, help messages and more.
+	  It saves around 100 KiB in binary file size.
+
+choice
+	prompt "Crypto backend"
+	default BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL
+	help
+	  Select the cryptographic library to use.
+
+	config BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL
+	bool "OpenSSL"
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable TLS-based key exchange and OpenSSL crypto support.
+
+	config BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL
+	bool "PolarSSL"
+	select BR2_PACKAGE_POLARSSL
+	help
+	  Enable TLS-based key exchange and PolarSSL crypto support.
+
+endchoice
+
+endif
diff --git a/package/openvpn/openvpn-allow-polarssl-1.2.patch b/package/openvpn/openvpn-allow-polarssl-1.2.patch
new file mode 100644
index 0000000..0aeb2f2
--- /dev/null
+++ b/package/openvpn/openvpn-allow-polarssl-1.2.patch
@@ -0,0 +1,72 @@
+Allow OpenVPN to use newer (1.2+) PolarSSL versions.
+https://community.openvpn.net/openvpn/ticket/250
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/src/openvpn/crypto_polarssl.h.ori	2013-01-10 21:38:23.213885934 +0100
++++ a/src/openvpn/crypto_polarssl.h	2013-01-10 21:40:20.597883460 +0100
+@@ -60,7 +60,11 @@
+ #define OPENVPN_MODE_OFB 	POLARSSL_MODE_OFB
+ 
+ /** Cipher is in CFB mode */
++#if POLARSSL_VERSION_NUMBER < 0x01020000
+ #define OPENVPN_MODE_CFB 	POLARSSL_MODE_CFB128
++#else
++#define OPENVPN_MODE_CFB 	POLARSSL_MODE_CFB
++#endif
+ 
+ /** Cipher should encrypt */
+ #define OPENVPN_OP_ENCRYPT 	POLARSSL_ENCRYPT
+--- a/src/openvpn/ssl_polarssl.c.ori	2013-01-10 21:50:16.041870946 +0100
++++ a/src/openvpn/ssl_polarssl.c	2013-01-10 21:54:35.261865496 +0100
+@@ -67,6 +67,20 @@
+ 
+ static int default_ciphersuites[] =
+ {
++#if POLARSSL_VERSION_NUMBER >= 0x0102000
++    TLS_DHE_RSA_WITH_AES_256_CBC_SHA,
++    TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA,
++    TLS_DHE_RSA_WITH_AES_128_CBC_SHA,
++    TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA,
++    TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
++    TLS_RSA_WITH_AES_256_CBC_SHA,
++    TLS_RSA_WITH_CAMELLIA_256_CBC_SHA,
++    TLS_RSA_WITH_AES_128_CBC_SHA,
++    TLS_RSA_WITH_CAMELLIA_128_CBC_SHA,
++    TLS_RSA_WITH_3DES_EDE_CBC_SHA,
++    TLS_RSA_WITH_RC4_128_SHA,
++    TLS_RSA_WITH_RC4_128_MD5,
++#else
+     SSL_EDH_RSA_AES_256_SHA,
+     SSL_EDH_RSA_CAMELLIA_256_SHA,
+     SSL_EDH_RSA_AES_128_SHA,
+@@ -79,6 +93,7 @@
+     SSL_RSA_DES_168_SHA,
+     SSL_RSA_RC4_128_SHA,
+     SSL_RSA_RC4_128_MD5,
++#endif
+     0
+ };
+ 
+@@ -515,7 +530,9 @@
+       ssl_set_rng (ks_ssl->ctx, ctr_drbg_random, rand_ctx_get());
+ 
+       ALLOC_OBJ_CLEAR (ks_ssl->ssn, ssl_session);
++#if  POLARSSL_VERSION_NUMBER < 0x01020000
+       ssl_set_session (ks_ssl->ctx, 0, 0, ks_ssl->ssn );
++#endif
+       if (ssl_ctx->allowed_ciphers)
+ 	ssl_set_ciphersuites (ks_ssl->ctx, ssl_ctx->allowed_ciphers);
+       else
+@@ -828,7 +845,11 @@
+ 		    ssl_get_version (ks_ssl->ctx),
+ 		    ssl_get_ciphersuite(ks_ssl->ctx));
+ 
++#if POLARSSL_VERSION_NUMBER >= 0x01020000
++  cert = ks_ssl->ssn->peer_cert;
++#else
+   cert = ks_ssl->ctx->peer_cert;
++#endif
+   if (cert != NULL)
+     {
+       openvpn_snprintf (s2, sizeof (s2), ", " counter_format " bit RSA", (counter_type) cert->rsa.len * 8);
diff --git a/package/openvpn/openvpn-fix-build-with-disable-crypto.patch b/package/openvpn/openvpn-fix-build-with-disable-crypto.patch
deleted file mode 100644
index 5466558..0000000
--- a/package/openvpn/openvpn-fix-build-with-disable-crypto.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-[PATCH] fix build with --disable-crypto
-
-options.c is missing the definition for struct context when built with
---disable-crypto, as it then doesn't get pulled in through push.h,
-leading to build errors like:
-
-options.c: In function ???parse_http_proxy_fallback???:
-options.c:1474: error: dereferencing pointer to incomplete type
-options.c:1477: error: dereferencing pointer to incomplete type
-options.c:1478: error: dereferencing pointer to incomplete type
-
-Fix it by including forward.h
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- options.c |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: openvpn-2.1.3/options.c
-===================================================================
---- openvpn-2.1.3.orig/options.c
-+++ openvpn-2.1.3/options.c
-@@ -29,6 +29,7 @@
- 
- #include "syshead.h"
- 
-+#include "forward.h"
- #include "buffer.h"
- #include "error.h"
- #include "common.h"
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 1c6e6ec..2658d76 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,17 +4,23 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.2.2
+OPENVPN_VERSION = 2.3.0
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
-OPENVPN_CONF_OPT = --enable-small --disable-plugins \
-			--with-ifconfig-path=/sbin/ifconfig \
-			--with-route-path=/sbin/route \
-			--with-netstat-path=/bin/netstat
+OPENVPN_DEPENDENCIES = host-pkgconf
+OPENVPN_CONF_OPT = --disable-plugin-auth-pam --enable-iproute2
+OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
+	NETSTAT=/bin/netstat \
+	ROUTE=/sbin/route
+
+ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
+OPENVPN_CONF_OPT += --enable-small --disable-plugins \
+	--disable-debug --disable-eurephia
+endif
 
 ifeq ($(BR2_PACKAGE_IPROUTE2),y)
-OPENVPN_CONF_OPT += --with-iproute-path=/sbin/ip
+OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
 else
-OPENVPN_CONF_OPT += --with-iproute-path=/bin/ip
+OPENVPN_CONF_ENV += IPROUTE=/bin/ip
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
@@ -23,14 +29,18 @@ else
 	OPENVPN_CONF_OPT += --disable-lzo
 endif
 
-ifeq ($(BR2_PACKAGE_OPENVPN_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL),y)
+	OPENVPN_CONF_OPT += --with-crypto-library=openssl
 	OPENVPN_DEPENDENCIES += openssl
-else
-	OPENVPN_CONF_OPT += --disable-crypto --disable-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL),y)
+	OPENVPN_CONF_OPT += --with-crypto-library=polarssl
+	OPENVPN_DEPENDENCIES += polarssl
 endif
 
 define OPENVPN_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 $(@D)/openvpn \
+	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
 		$(TARGET_DIR)/usr/sbin/openvpn
 	if [ ! -f $(TARGET_DIR)/etc/init.d/openvpn ]; then \
 		$(INSTALL) -m 755 -D package/openvpn/openvpn.init \
