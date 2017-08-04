From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  4 Aug 2017 14:55:12 -0400
Subject: [Buildroot] [PATCH 01/10] libssl: new virtual package
In-Reply-To: <20170804185521.12320-1-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <20170804185521.12320-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To start the conversion process to a virtual package, libssl is added
with only support for OpenSSL.  This insures that packages relying on
OpenSSL won't break.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/Config.in          |  4 +---
 package/libssl/Config.in   | 26 ++++++++++++++++++++++++++
 package/libssl/libssl.mk   |  8 ++++++++
 package/openssl/Config.in  |  1 +
 package/openssl/openssl.mk |  1 +
 5 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 package/libssl/Config.in
 create mode 100644 package/libssl/libssl.mk

diff --git a/package/Config.in b/package/Config.in
index b5170b044..f8e9d2990 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -998,13 +998,11 @@ menu "Crypto"
 	source "package/libsodium/Config.in"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
+	source "package/libssl/Config.in"
 	source "package/libtomcrypt/Config.in"
 	source "package/libuecc/Config.in"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
-	# libressl is a openssl replacement
-	source "package/libressl/Config.in"
-	source "package/openssl/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/trousers/Config.in"
diff --git a/package/libssl/Config.in b/package/libssl/Config.in
new file mode 100644
index 000000000..5f3d2fc2a
--- /dev/null
+++ b/package/libssl/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIBSSL
+	bool "libssl support"
+	help
+	  Select the desired ssl library provider.
+
+if BR2_PACKAGE_LIBSSL
+
+choice
+	prompt "ssl variant"
+	default BR2_PACKAGE_OPENSSL
+	help
+	  Select OpenSSL or LibreSSL.
+
+	source "package/openssl/Config.in"
+
+endchoice
+
+config BR2_PACKAGE_HAS_LIBSSL
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBSSL
+	string
+	default "openssl"    if BR2_PACKAGE_OPENSSL
+	default "libressl" if BR2_PACKAGE_LIBRESSL
+
+endif
diff --git a/package/libssl/libssl.mk b/package/libssl/libssl.mk
new file mode 100644
index 000000000..d19c3a9da
--- /dev/null
+++ b/package/libssl/libssl.mk
@@ -0,0 +1,8 @@
+################################################################################
+#
+# libssl
+#
+################################################################################
+
+$(eval $(host-virtual-package))
+$(eval $(virtual-package))
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index e08b648ba..8281ef064 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSSL
 	bool "openssl"
+	select BR2_PACKAGE_HAS_LIBSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  A collaborative effort to develop a robust, commercial-grade, fully
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index ec8e6f204..eddf99b59 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -13,6 +13,7 @@ OPENSSL_DEPENDENCIES = zlib
 HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
+OPENSSL_PROVIDES = libssl
 OPENSSL_PATCH = \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
-- 
2.13.3
