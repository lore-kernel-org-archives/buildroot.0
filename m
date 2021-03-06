From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:49 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-asterwave: bump
 version to 3.3.0-Matrix
Message-ID: <20210308072138.DF53681132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ae0f23fcffc10a01561845188476c81aa98fe41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove dependency to libsoil:
https://github.com/xbmc/screensaver.asterwave/commit/8a778873754de09c93031408c71b3c40d198f3bc

Add dependency to glm and remove dependency to opengl and libglu,
opengles support was added upstream:
https://github.com/xbmc/screensaver.asterwave/commit/fb1d7ca8bf45b278afdb7a0dd2be4117c0fe3508

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-asterwave/Config.in                   |  7 +------
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash |  4 ++--
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk   | 10 +++++++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/Config.in b/package/kodi-screensaver-asterwave/Config.in
index b5e80cc535..ffb5caadd7 100644
--- a/package/kodi-screensaver-asterwave/Config.in
+++ b/package/kodi-screensaver-asterwave/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE
 	bool "kodi-screensaver-asterwave"
-	depends on BR2_PACKAGE_HAS_LIBGL # libglu, libsoil
-	select BR2_PACKAGE_LIBGLU
-	select BR2_PACKAGE_LIBSOIL
+	select BR2_PACKAGE_GLM
 	help
 	  AsterWave screensaver for Kodi
 
 	  https://github.com/xbmc/screensaver.asterwave
-
-comment "kodi-screensaver-asterwave needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index a7fc05789c..8b47070194 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d61bcdd8b74b50a26eab1597718b12ec260f6c6cdde0f143dbc1ce958ca86c69  kodi-screensaver-asterwave-3.0.5-Leia.tar.gz
-sha256  a0268e081014f3a555be39f7eb0fff759424963324915ad2ea56bf26668685e7  debian/copyright
+sha256  4645ea5923df5a2cae84887b743c3963940344439c37ca2e18896d082ac76b1d  kodi-screensaver-asterwave-3.3.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index b982395ead..9e768fce85 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,10 +4,14 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 3.0.5-Leia
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 3.3.0-Matrix
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = debian/copyright
-KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libglu libsoil
+KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
+KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = glm kodi
+
+KODI_SCREENSAVER_ASTERWAVE_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
 
 $(eval $(cmake-package))
