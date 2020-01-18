From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Jan 2020 21:06:15 +0100
Subject: [Buildroot] [PATCH v8 15/20] package/kodi-screensaver-rsxs: bump
 version
In-Reply-To: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
Message-ID: <20200118200620.3967240-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated dependencies after upstream commit
https://github.com/xbmc/screensavers.rsxs/commit/dbb88536964dc0ca4144016eb12f7307b60cb1fa
Also removed patch 0002 because this package has no direct dependency
for X libraries anymore.

Removed patch 0001 which was applied upstream
https://github.com/xbmc/screensavers.rsxs/commit/b9dda499db62944d9a95f4690d67101eca539ca7

Added patch to disable building the drempels screensaver which depends
on imagemagick6.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Disable-drempels.patch               | 40 +++++++++++++++++++
 .../0001-cross-compile.patch                  | 37 -----------------
 .../0002-fix-default-include-dir.patch        | 28 -------------
 package/kodi-screensaver-rsxs/Config.in       | 14 ++++---
 .../kodi-screensaver-rsxs.hash                |  2 +-
 .../kodi-screensaver-rsxs.mk                  |  7 ++--
 6 files changed, 53 insertions(+), 75 deletions(-)
 create mode 100644 package/kodi-screensaver-rsxs/0001-Disable-drempels.patch
 delete mode 100644 package/kodi-screensaver-rsxs/0001-cross-compile.patch
 delete mode 100644 package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch

diff --git a/package/kodi-screensaver-rsxs/0001-Disable-drempels.patch b/package/kodi-screensaver-rsxs/0001-Disable-drempels.patch
new file mode 100644
index 0000000000..e76a9b9943
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/0001-Disable-drempels.patch
@@ -0,0 +1,40 @@
+From 28c01686ba0d67d317e058776f01efba5e6471bd Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 13 Jul 2019 14:18:12 +0200
+Subject: [PATCH] Disable drempels
+
+Does not build with ImageMagick 7.x:
+
+src/drempels/TexMgr.cpp:31:10: fatal error: magick/api.h:
+ No such file or directory
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a86ccd0..b5ca03f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -40,8 +40,7 @@ include_directories(${KODI_INCLUDE_DIR}/.. # Hack way with "/..", need bigger Ko
+ if(ImageMagick_FOUND AND NOT ${OWN_IMAGE_MAGICK})
+   message(STATUS "ImageMagick found in the system and is used")
+ else()
+-  message(STATUS "ImageMagick not found or forced and add custom created")
+-  add_subdirectory(lib/ImageMagick)
++  message(STATUS "ImageMagick not found")
+ endif()
+ add_subdirectory(lib/kodi/gui/gl)
+ add_subdirectory(lib/Implicit)
+@@ -70,7 +69,6 @@ include(src/biof/CMakeLists.txt)
+ include(src/busyspheres/CMakeLists.txt)
+ include(src/colorfire/CMakeLists.txt)
+ include(src/cyclone/CMakeLists.txt)
+-include(src/drempels/CMakeLists.txt)
+ include(src/euphoria/CMakeLists.txt)
+ include(src/feedback/CMakeLists.txt)
+ include(src/fieldlines/CMakeLists.txt)
+-- 
+2.20.1
+
diff --git a/package/kodi-screensaver-rsxs/0001-cross-compile.patch b/package/kodi-screensaver-rsxs/0001-cross-compile.patch
deleted file mode 100644
index a7b2053d76..0000000000
--- a/package/kodi-screensaver-rsxs/0001-cross-compile.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Fix cross-compilation
-
-Use the cross-compiler and not the host version.
-
-Patch sent upstream:
-https://github.com/notspiff/screensavers.rsxs/pull/5
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr screensavers.rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259.org/CMakeLists.txt screensavers.rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259/CMakeLists.txt
---- screensavers.rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259.org/CMakeLists.txt	2015-03-19 12:20:23.000000000 +0100
-+++ screensavers.rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259/CMakeLists.txt	2015-07-19 20:26:16.660481032 +0200
-@@ -33,6 +33,11 @@
-                     ${PROJECT_SOURCE_DIR}/${rsxs_dir}/src/skyrocket
-                     ${PROJECT_SOURCE_DIR}/${rsxs_dir}/src/solarwinds)
-                         
-+
-+get_filename_component( COMPILER_FILENAME "${CMAKE_C_COMPILER}" NAME )
-+string( REGEX REPLACE "-[^-]+$" ""
-+        TOOLCHAIN_NAME "${COMPILER_FILENAME}" )
-+
- include(ExternalProject)
- set(update_command "")
- if(BOOTSTRAP_IN_TREE OR NOT DEFINED BOOTSTRAP_IN_TREE)
-@@ -46,8 +51,11 @@
-   endif()
- endif()
- externalproject_add(rsxs SOURCE_DIR ${PROJECT_SOURCE_DIR}/${rsxs_dir}
--                    CONFIGURE_COMMAND ${configure_start}
-+                    CONFIGURE_COMMAND gl_cv_func_gettimeofday_clobber=no ac_cv_type__Bool=yes
-+                                      ac_cv_func_malloc_0_nonnull=yes
-+                                      ${configure_start}
-                                       --prefix=<INSTALL_DIR>
-+                                      --host=${TOOLCHAIN_NAME}
-                                       --without-xscreensaver
-                                       --disable-cyclone
-                                       --disable-euphoria
diff --git a/package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch b/package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch
deleted file mode 100644
index a7e7c74b0f..0000000000
--- a/package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix X include path to prevent error during configure
-
-Downloaded from
-https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/mediacenter/kodi-binary-addons/screensavers.rsxs/patches/screensavers.rsxs-0002-fix-default-include-dir.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -Naur screensavers.rsxs-3241d29.orig/CMakeLists.txt screensavers.rsxs-3241d29/CMakeLists.txt
---- screensavers.rsxs-3241d29.orig/CMakeLists.txt	2015-10-22 23:59:38.187280475 -0700
-+++ screensavers.rsxs-3241d29/CMakeLists.txt	2015-10-23 00:00:27.228113829 -0700
-@@ -17,7 +17,7 @@
- include_directories(${OpenGL_INCLUDE_DIR}
-                     ${PNG_INCLUDE_DIR}
-                     ${KODI_INCLUDE_DIR}
--                    ${X_INCLUDE_DIRS}
-+                    ${X_INCLUDE_DIR}
-                     ${CMAKE_BINARY_DIR}/rsxs-prefix/src/rsxs-build
-                     ${PROJECT_SOURCE_DIR}/${rsxs_dir}/src
-                     ${PROJECT_SOURCE_DIR}/${rsxs_dir}/lib
-@@ -67,7 +67,7 @@
-                                       --disable-skyrocket
-                                       --disable-solarwinds
-                                       --disable-sound
--                                      --x-includes=${X_INCLUDE_DIRS}
-+                                      --x-includes=${X_INCLUDE_DIR}
-                                       --x-libraries=${X_LIBRARIES}
-                                       ${PNG_PATH}
-                                       ${EXTRA_FLAGS}
diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
index c523ce5a1c..076c7effa0 100644
--- a/package/kodi-screensaver-rsxs/Config.in
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -1,13 +1,17 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
 	bool "kodi-screensaver-rsxs"
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
-	depends on BR2_PACKAGE_XORG7 # xlib_libXmu
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_GLI
+	select BR2_PACKAGE_GLM
+	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_TIFF
 	help
 	  RSXS screensaver add-ons for Kodi
 
-	  https://github.com/notspiff/screensavers.rsxs
+	  https://github.com/xbmc/screensavers.rsxs
 
-comment "kodi-screensaver-rsxs depends on X.org and needs OpenGL"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
+comment "kodi-screensaver-rsxs needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index e80c972ebb..b2d9e33a57 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8436c29d2f42bc65ff6f1abc2f1d05a613cc2ebb16d793e02b1f2bee296952a6  kodi-screensaver-rsxs-1.3.0.tar.gz
+sha256 22ff3f0ca9679c59ce1a90b98d918dd10a8012b789729b2e44c04d4ce8c86ad8  kodi-screensaver-rsxs-7cb648507440d87948dec10d5bfdab3b722d37fe.tar.gz
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index 64ffb4fba6..e208698797 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 1.3.0
-KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,v$(KODI_SCREENSAVER_RSXS_VERSION))
+KODI_SCREENSAVER_RSXS_VERSION = 7cb648507440d87948dec10d5bfdab3b722d37fe
+KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-3.0
-KODI_SCREENSAVER_RSXS_LICENSE_FILES = lib/rsxs-1.0/COPYING
-KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi libpng xlib_libXmu
+KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 gli glm jpeg kodi libpng libtool tiff
 
 $(eval $(cmake-package))
-- 
2.20.1
