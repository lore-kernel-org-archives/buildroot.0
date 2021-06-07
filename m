From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:34 -0000
Subject: [Buildroot] [git commit] package/libopenssl: add option to enable
 some features
Message-ID: <20210607144651.E47427FDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a83d41867c8d69a77d5cd0a665aa216af5340359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openssl implements lot of algorithms that are not required in some
emdedded devices and cyphers known as weak. Secure embedded systems
shall disable unused algorithms (and weak algo) in order to be
certified.

This patch allows to select weak algorithms and mecanims to enable
such as md5.

To ensure backward compatibility, all items are selected by default.

Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>
[yann.morin.1998 at free.fr:
  - drop help texts that just repeat the prompts
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenssl/Config.in     | 99 ++++++++++++++++++++++++++++++++++++++++
 package/libopenssl/libopenssl.mk | 24 ++++++++++
 2 files changed, 123 insertions(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 723fd282a4..7ed799075f 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -40,4 +40,103 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
 	help
 	  Install additional encryption engine libraries.
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
+	bool "enable CHACHA"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
+	bool "enable RC5"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2
+	bool "enable RC2"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4
+	bool "enable RC4"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2
+	bool "enable MD2"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
+	bool "enable MD4"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD5
+	bool "enable MD5"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2
+	bool "enable MDC2"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2
+	bool "enable BLAKE2"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA
+	bool "enable IDEA"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED
+	bool "enable SEED"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
+	bool "enable DES"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
+	bool "enable RMD160"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL
+	bool "enable WHIRLPOOL"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
+	bool "enable BLOWFISH"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL
+	bool "enable SSL"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2
+	bool "enable SSL2"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3
+	bool "enable SSL3"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL
+	bool "enable WEAK_SSL"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK
+	bool "enable mode PSK"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST
+	bool "enable mode CAST"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_UNSECURE
+	bool "enable unit test, debug, backtrace"
+	default y
+	help
+	  Enable unit-test crypto-mdebug-backtrace
+	  crypto-mdebug autoerrinit mode.
+
+config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
+	bool "enable dynamic engine"
+	default y
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
+	bool "enable compression"
+	default y
+
 endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 487fe554c1..c7f8ae714e 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -84,6 +84,30 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-tests \
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5),,no-rc5) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2),,no-md2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4),,no-md4) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD5),,no-md5) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2),,no-mdc2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2),,no-blake2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA),,no-idea) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED),,no-seed) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_DES),,no-des) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160),,no-rmd160) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL),,no-whirlpool) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH),,no-bf) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL),,no-ssl) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2),,no-ssl2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3),,no-ssl3) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL),,no-weak-ssl-ciphers) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK),,no-psk) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST),,no-cast) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug-backtrace no-crypto-mdebug no-autoerrinit) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 			$(if $(BR2_STATIC_LIBS),no-dso) \
 	)
