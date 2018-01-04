From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  4 Jan 2018 20:39:26 +0200
Subject: [Buildroot] [PATCH] libzip: bump to version 1.4.0
Message-ID: <53d342efdcd8e2dded87c63be938921a8ad94f18.1515091166.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream switched to cmake.

Add upstream patch that removes run of target binary on the host.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...0001-Use-cmake-E-tar-to-extract-test-data.patch | 40 ++++++++++++++++++++++
 package/libzip/libzip.hash                         |  2 +-
 package/libzip/libzip.mk                           |  7 ++--
 3 files changed, 44 insertions(+), 5 deletions(-)
 create mode 100644 package/libzip/0001-Use-cmake-E-tar-to-extract-test-data.patch

diff --git a/package/libzip/0001-Use-cmake-E-tar-to-extract-test-data.patch b/package/libzip/0001-Use-cmake-E-tar-to-extract-test-data.patch
new file mode 100644
index 000000000000..7d40111b1b78
--- /dev/null
+++ b/package/libzip/0001-Use-cmake-E-tar-to-extract-test-data.patch
@@ -0,0 +1,40 @@
+From e9244b207c0fc883ff84c1fc46602feb1e2b0347 Mon Sep 17 00:00:00 2001
+From: Thomas Klausner <tk@giga.or.at>
+Date: Wed, 3 Jan 2018 11:41:57 +0100
+Subject: [PATCH] Use 'cmake -E tar' to extract test data.
+
+For easier cross-compilation (Github issue #21).
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit e9244b207c0
+
+ regress/CMakeLists.txt | 12 +++---------
+ 1 file changed, 3 insertions(+), 9 deletions(-)
+
+diff --git a/regress/CMakeLists.txt b/regress/CMakeLists.txt
+index e2ce232c774a..3a0d4f77dcf6 100644
+--- a/regress/CMakeLists.txt
++++ b/regress/CMakeLists.txt
+@@ -51,15 +51,9 @@ ADD_CUSTOM_TARGET(cleanup
+ ADD_CUSTOM_TARGET(testinput
+   ALL
+   VERBATIM
+-  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 0 > manyfiles.zip
+-  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 1 > manyfiles-133000.zip
+-  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 2 > manyfiles-65536.zip
+-  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 3 > manyfiles-zip64-modulo.zip
+-  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 4 > manyfiles-zip64.zip
+-  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 5 > manyfiles-fewer.zip
+-  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 6 > manyfiles-more.zip
+-  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/bigzero-zip.zip cat 0 > bigzero.zip
+-  DEPENDS ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip ${CMAKE_CURRENT_SOURCE_DIR}/bigzero-zip.zip
++  COMMAND cmake -E tar x ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip
++  COMMAND cmake -E tar x ${CMAKE_CURRENT_SOURCE_DIR}/bigzero-zip.zip
++  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip ${CMAKE_CURRENT_SOURCE_DIR}/bigzero-zip.zip
+ )
+ 
+ SET_PROPERTY(DIRECTORY PROPERTY ADDITIONAL_MAKE_CLEAN_FILES
+-- 
+2.15.1
+
diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index d100982bc6b2..abfd20fc5bee 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	aa936efe34911be7acac2ab07fb5c8efa53ed9bb4d44ad1fe8bff19630e0d373  libzip-1.3.0.tar.xz
+sha256	e508aba025f5f94b267d5120fc33761bcd98440ebe49dbfe2ed3df3afeacc7b1  libzip-1.4.0.tar.xz
 sha256  d159ae325ca0b8236c44dfd980ca99810dbcfc057b077c50dbbda1131cbd263a  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 5ffa1cac00f0..537aa1deeb68 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.3.0
+LIBZIP_VERSION = 1.4.0
 LIBZIP_SITE = http://www.nih.at/libzip
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
@@ -13,10 +13,9 @@ LIBZIP_INSTALL_STAGING = YES
 LIBZIP_DEPENDENCIES = zlib
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-LIBZIP_CONF_OPTS += --with-bzip2
 LIBZIP_DEPENDENCIES += bzip2
 else
-LIBZIP_CONF_OPTS += --without-bzip2
+LIBZIP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_BZIP2=TRUE
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.15.1
