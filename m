From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 Jan 2019 20:48:39 +0100
Subject: [Buildroot] [PATCH 1/1] minizip: bump to version 2.8.2
Message-ID: <20190115194839.15832-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- libbsd is now an optional dependency as HAVE_ARC4RANDOM_BUF is not
  always defined since version 2.7.1 and:
  https://github.com/nmoinvaz/minizip/commit/c73ef6e69b320349604c620bc429c461de8659af
- openssl is an optional dependency since version 2.7.0 and:
  https://github.com/nmoinvaz/minizip/commit/e5a5617a7c765858c1ed6fb0d40b6a750ff10131
- libiconv is an optional dependency since version 2.7.1 and:
  https://github.com/nmoinvaz/minizip/commit/6209991d6be5b070fb92d2aca6ed668c3db0829f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/Config.in    |  8 --------
 package/minizip/minizip.hash |  2 +-
 package/minizip/minizip.mk   | 14 ++++++++++++--
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index 68fa1d7118..b531c45b91 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_MINIZIP
 	bool "minizip"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
-	depends on BR2_USE_WCHAR # libbsd
-	select BR2_PACKAGE_LIBBSD
 	help
 	  Enables to extract files from a .zip archive file.
 	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
@@ -16,7 +12,3 @@ config BR2_PACKAGE_MINIZIP_DEMOS
 	depends on BR2_PACKAGE_MINIZIP
 	help
 	  Enable minizip binary tool.
-
-comment "minizip needs a toolchain w/ threads, wchar"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index f77d40a02c..d9473581c1 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0afe6528f530cc9c1440053a7bbff53087e86f849e145d233464052c730431e9  minizip-2.5.3.tar.gz
+sha256 b01607d219ed40d817404947dd5339d64242a083df6372c37b0387b5501d84f5  minizip-2.8.2.tar.gz
 sha256 87642305968765a4030fd202ff7006afa67274da7f9bde84506e51ae58ecc2b4  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 5a596f7ccf..7f7a1d277d 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,9 +4,12 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 2.5.3
+MINIZIP_VERSION = 2.8.2
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
-MINIZIP_DEPENDENCIES = host-pkgconf libbsd
+MINIZIP_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBBSD),libbsd) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MINIZIP_INSTALL_STAGING = YES
 MINIZIP_CONF_OPTS = $(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DBUILD_TEST=ON)
 MINIZIP_LICENSE = Zlib
@@ -19,6 +22,13 @@ else
 MINIZIP_CONF_OPTS += -DUSE_BZIP2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MINIZIP_DEPENDENCIES += openssl
+MINIZIP_CONF_OPTS += -DUSE_OPENSSL=ON
+else
+MINIZIP_CONF_OPTS += -DUSE_OPENSSL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 MINIZIP_DEPENDENCIES += zlib
 MINIZIP_CONF_OPTS += -DUSE_ZLIB=ON
-- 
2.14.1
