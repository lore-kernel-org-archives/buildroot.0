From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Sep 2018 14:11:42 +0200
Subject: [Buildroot] [PATCH v2,1/1] minizip: bump to version 2.5.3
Message-ID: <20180923121142.3204-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Move to cmake infrastructure
- Do not enforce zlib dependency
- Add optional bzip2 dependency
- Add mandatory host-pkgconf and libbsd dependency
- Remove miniunzip from Config.in, miniunzip (miniunz) has been merged
  with minizip:
  https://github.com/nmoinvaz/minizip/commit/a66cc31fac61e47a34bced08569ddec38b81bbef
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Baruch Siach):
 - Remove zlib select as it is now an optional dependency
 - Replace --enable-demos by -DBUILD_TEST=ON and remove miniunzip from
   Config .in 

 package/minizip/Config.in    | 13 ++++++++++---
 package/minizip/minizip.hash |  3 ++-
 package/minizip/minizip.mk   | 23 ++++++++++++++++++-----
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index 7205e0007e..68fa1d7118 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_MINIZIP
 	bool "minizip"
-	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
+	depends on BR2_USE_WCHAR # libbsd
+	select BR2_PACKAGE_LIBBSD
 	help
 	  Enables to extract files from a .zip archive file.
 	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
@@ -9,7 +12,11 @@ config BR2_PACKAGE_MINIZIP
 	  https://github.com/nmoinvaz/minizip
 
 config BR2_PACKAGE_MINIZIP_DEMOS
-	bool "miniunzip/minizip"
+	bool "minizip"
 	depends on BR2_PACKAGE_MINIZIP
 	help
-	  Enable miniunzip/minizip binary tools.
+	  Enable minizip binary tool.
+
+comment "minizip needs a toolchain w/ threads, wchar"
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 718026c1f6..f77d40a02c 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 5666b5ee3e85dfd2dd119970613c12e6267d31813f07d3ffa5d359fe272cb6d1  minizip-1.1.tar.gz
+sha256 0afe6528f530cc9c1440053a7bbff53087e86f849e145d233464052c730431e9  minizip-2.5.3.tar.gz
+sha256 87642305968765a4030fd202ff7006afa67274da7f9bde84506e51ae58ecc2b4  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index bcd6cc928f..5a596f7ccf 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,13 +4,26 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 1.1
+MINIZIP_VERSION = 2.5.3
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
-MINIZIP_DEPENDENCIES = zlib
-MINIZIP_AUTORECONF = YES
+MINIZIP_DEPENDENCIES = host-pkgconf libbsd
 MINIZIP_INSTALL_STAGING = YES
-MINIZIP_CONF_OPTS = $(if $(BR2_PACKAGE_MINIZIP_DEMOS),--enable-demos)
+MINIZIP_CONF_OPTS = $(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DBUILD_TEST=ON)
 MINIZIP_LICENSE = Zlib
 MINIZIP_LICENSE_FILES = LICENSE
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+MINIZIP_DEPENDENCIES += bzip2
+MINIZIP_CONF_OPTS += -DUSE_BZIP2=ON
+else
+MINIZIP_CONF_OPTS += -DUSE_BZIP2=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MINIZIP_DEPENDENCIES += zlib
+MINIZIP_CONF_OPTS += -DUSE_ZLIB=ON
+else
+MINIZIP_CONF_OPTS += -DUSE_ZLIB=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.17.1
