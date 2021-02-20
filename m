From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:59:00 +0100
Subject: [Buildroot] [PATCH/next 41/54] package/kodi-screensaver-rsxs: bump
 version
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-42-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0001, ImageMagick code was removed upstream:
https://github.com/xbmc/screensavers.rsxs/commit/e3793a1e5d120b0354d07d6bf9dc175af883e134#diff-f9e414fa2a69e3c79d590dd6e91236778d803a84669f93f0e550483f7be105e9L31

Removed various dependencies after upstream cleanup:
https://github.com/xbmc/screensavers.rsxs/commit/e3793a1e5d120b0354d07d6bf9dc175af883e134

Switched opengl dependency to render system used by Kodi.

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Disable-drempels.patch               | 40 -------------------
 package/kodi-screensaver-rsxs/Config.in       | 10 ++---
 .../kodi-screensaver-rsxs.hash                |  4 +-
 .../kodi-screensaver-rsxs.mk                  |  6 +--
 4 files changed, 8 insertions(+), 52 deletions(-)
 delete mode 100644 package/kodi-screensaver-rsxs/0001-Disable-drempels.patch

diff --git a/package/kodi-screensaver-rsxs/0001-Disable-drempels.patch b/package/kodi-screensaver-rsxs/0001-Disable-drempels.patch
deleted file mode 100644
index e76a9b9943..0000000000
--- a/package/kodi-screensaver-rsxs/0001-Disable-drempels.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 28c01686ba0d67d317e058776f01efba5e6471bd Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 13 Jul 2019 14:18:12 +0200
-Subject: [PATCH] Disable drempels
-
-Does not build with ImageMagick 7.x:
-
-src/drempels/TexMgr.cpp:31:10: fatal error: magick/api.h:
- No such file or directory
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a86ccd0..b5ca03f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -40,8 +40,7 @@ include_directories(${KODI_INCLUDE_DIR}/.. # Hack way with "/..", need bigger Ko
- if(ImageMagick_FOUND AND NOT ${OWN_IMAGE_MAGICK})
-   message(STATUS "ImageMagick found in the system and is used")
- else()
--  message(STATUS "ImageMagick not found or forced and add custom created")
--  add_subdirectory(lib/ImageMagick)
-+  message(STATUS "ImageMagick not found")
- endif()
- add_subdirectory(lib/kodi/gui/gl)
- add_subdirectory(lib/Implicit)
-@@ -70,7 +69,6 @@ include(src/biof/CMakeLists.txt)
- include(src/busyspheres/CMakeLists.txt)
- include(src/colorfire/CMakeLists.txt)
- include(src/cyclone/CMakeLists.txt)
--include(src/drempels/CMakeLists.txt)
- include(src/euphoria/CMakeLists.txt)
- include(src/feedback/CMakeLists.txt)
- include(src/fieldlines/CMakeLists.txt)
--- 
-2.20.1
-
diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
index 076c7effa0..e88df1fe49 100644
--- a/package/kodi-screensaver-rsxs/Config.in
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -1,17 +1,13 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
 	bool "kodi-screensaver-rsxs"
-	depends on BR2_PACKAGE_HAS_LIBGL # libglu
+	depends on BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_GLI
 	select BR2_PACKAGE_GLM
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_LIBTOOL
-	select BR2_PACKAGE_TIFF
 	help
 	  RSXS screensaver add-ons for Kodi
 
 	  https://github.com/xbmc/screensavers.rsxs
 
-comment "kodi-screensaver-rsxs needs an OpenGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBGL
+comment "kodi-screensaver-rsxs needs OpenGL as Kodi render system"
+	depends on !BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index f4987a44cd..ceb8d360f7 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  22ff3f0ca9679c59ce1a90b98d918dd10a8012b789729b2e44c04d4ce8c86ad8  kodi-screensaver-rsxs-7cb648507440d87948dec10d5bfdab3b722d37fe.tar.gz
-sha256  fa0ff8b6a6267b9477be7d505aa384056633b4be17e0b9d308df9bd70d1c99f6  debian/copyright
+sha256  343ecedbf6cfb75d43bb94e805aae807d61b0cd4f681a05c126f65839e3687a3  kodi-screensaver-rsxs-21c65de59546bde770225f023747a39b345baffd.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index aa881d0d59..9b839b3112 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 7cb648507440d87948dec10d5bfdab3b722d37fe
+KODI_SCREENSAVER_RSXS_VERSION = 21c65de59546bde770225f023747a39b345baffd
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_RSXS_LICENSE_FILES = debian/copyright
-KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 gli glm jpeg kodi libpng libtool tiff
+KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
+KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 gli glm kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
