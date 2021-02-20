From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:57 +0100
Subject: [Buildroot] [PATCH/next 38/54]
 package/kodi-screensaver-matrixtrails: bump version to 2.6.0-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-39-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove dependency to libsoil:
https://github.com/xbmc/screensaver.matrixtrails/commit/92a0d44e9151cfce3be74e81a3e39f0688d69b7a

Remove dependency to opengl, opengles support was fixed upstream:
https://github.com/xbmc/screensaver.matrixtrails/commit/ea6408ee391c75ae7ee4cb9f948df2ff8c0c87c5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-matrixtrails/Config.in        |  5 -----
 .../kodi-screensaver-matrixtrails.hash                 |  4 ++--
 .../kodi-screensaver-matrixtrails.mk                   | 10 +++++++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/kodi-screensaver-matrixtrails/Config.in b/package/kodi-screensaver-matrixtrails/Config.in
index 270a51c9f4..9f031ba10d 100644
--- a/package/kodi-screensaver-matrixtrails/Config.in
+++ b/package/kodi-screensaver-matrixtrails/Config.in
@@ -1,11 +1,6 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS
 	bool "kodi-screensaver-matrixtrails"
-	depends on BR2_PACKAGE_HAS_LIBGL # libsoil
-	select BR2_PACKAGE_LIBSOIL
 	help
 	  Matrix trails screensaver for Kodi
 
 	  https://github.com/xbmc/screensaver.matrixtrails
-
-comment "kodi-screensaver-matrixtrails needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 26b95cbc77..1f35f11b7d 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a2f5bca0c197eea87f06376941c6d0ddbc81cf144d8c3854ac148fdec3400ec  kodi-screensaver-matrixtrails-2.2.3-Leia.tar.gz
-sha256  385a17599b44aaea10537374c1991c21a5e06153878917b12f96fc1cf8bbc118  debian/copyright
+sha256  49986b82e7319e25ef2b3ec84b3892bbf1cb0b5253bd541da730c5cf5dd1940b  kodi-screensaver-matrixtrails-2.6.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index 10d3d45e08..a89ea72d5d 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,10 +4,14 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.2.3-Leia
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.6.0-Matrix
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = debian/copyright
-KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
+KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
+KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi
+
+KODI_SCREENSAVER_MATRIXTRAILS_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
 
 $(eval $(cmake-package))
-- 
2.29.2
