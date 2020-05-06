From: Erwan GAUTRON <erwan.gautron@bertin.fr>
Date: Wed,  6 May 2020 07:59:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add option to disable
 unwanted features
Message-ID: <20200506055919.4219-1-erwan.gautron@bertin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>

Openssl implements lot of algorithms that are not required in
some emdedded devices and cyphers known as weak.
Secure embedded systems shall disable unused algorithms (and weak algo)
in order to be certified.
This patch allows to select algorithms and mecanims to disable
such as md5

Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>
---
 package/libopenssl/Config.in     | 130 +++++++++++++++++++++++++++++++
 package/libopenssl/libopenssl.mk |  26 +++++++
 2 files changed, 156 insertions(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 881518d1cb..e0b5df4f32 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -44,4 +44,134 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
 	help
 	  Install additional encryption engine libraries.
 
+config BR2_PACKAGE_LIBOPENSSL_NO_CHACHA
+	bool "openssl no cipher CHACHA"
+	help
+	  Remove CHACHA cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_RC5
+	bool "openssl no cipher RC5"
+	help
+	  Remove RC5 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_RC2
+	bool "openssl no cipher RC2"
+	help
+	  Remove RC2 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_RC4
+	bool "openssl no cipher RC4"
+	help
+	  Remove RC4 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_MD2
+	bool "openssl no cipher MD2"
+	help
+	  Remove MD2 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_MD4
+	bool "openssl no cipher MD4"
+	help
+	  Remove MD4 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_MD5
+	bool "openssl no cipher MD5"
+	help
+	  Remove MD5 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_MDC2
+	bool "openssl no cipher MDC2"
+	help
+	  Remove MDC2 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_BLAKE2
+	bool "openssl no cipher BLAKE2"
+	help
+	  Remove BLAKE2 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_IDEA
+	bool "openssl no cipher IDEA"
+	help
+	  Remove IDEA cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_SEED
+	bool "openssl no cipher SEED"
+	help
+	  Remove SEED cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_DES
+	bool "openssl no cipher DES"
+	help
+	  Remove DES cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_RMD160
+	bool "openssl no cipher RMD160"
+	help
+	  Remove RMD160 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_WHIRLPOOL
+	bool "openssl no cipher WHIRLPOOL"
+	help
+	  Remove WHIRLPOOL cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_BLOWFISH
+	bool "openssl no cipher BLOWFISH"
+	help
+	  Remove BLOWFISH cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_SSL
+	bool "openssl no mode SSL"
+	help
+	  Remove SSL mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_SSL2
+	bool "openssl no mode SSL2"
+	help
+	  Remove SSL2 mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_SSL3
+	bool "openssl no mode SSL3"
+	help
+	  Remove SSL3 mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_WEAK_SSL
+	bool "openssl no mode WEAK_SSL"
+	help
+	  Remove WEAK_SSL mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_PSK
+	bool "openssl no mode PSK"
+	help
+	  Remove PSK mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_CAST
+	bool "openssl no mode CAST"
+	help
+	  Remove CAST mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_SECURE
+	bool "openssl secure Bertin-It"
+	help
+	  Remove no-unit-test no-crypto-mdebug-backtrace no-crypto-mdebug no-autoerrinit mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
+	bool "openssl no dynamic engine"
+	help
+	  Remove dynamic engine in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_IPV6
+	bool "openssl no IPV6"
+	help
+	  Remove IPV6 in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_COMP
+	bool "openssl no compression"
+	help
+	  Remove compression in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_NO_ZLIB
+	bool "zlib no compression"
+	help
+	  Remove zlib in libopenssl.
+
 endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index a300458f85..91f5340abd 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -86,6 +86,32 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-tests \
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_CHACHA),no-chacha) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_RC5),no-rc5) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_RC2),no-rc2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_RC4),no-rc4) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_MD2),no-md2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_MD4),no-md4) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_MD5),no-md5) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_MDC2),no-mdc2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_BLAKE2),no-blake2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_IDEA),no-idea) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_SEED),no-seed) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_DES),no-des) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_RMD160),no-rmd160) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_WHIRLPOOL),no-whirlpool) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_BLOWFISH),no-bf) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_SSL),no-ssl) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_SSL2),no-ssl2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_SSL3),no-ssl3) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_WEAK_SSL),no-weak-ssl-ciphers) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_PSK),no-psk) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_CAST),no-cast) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_SECURE),no-unit-test no-crypto-mdebug-backtrace no-crypto-mdebug no-autoerrinit) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),no-dynamic-engine ) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_IPV6),-DOPENSSL_USE_IPV6=0) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_COMP),no-comp) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_NO_ZLIB),no-zlib) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 	)
 	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-- 
2.25.1
