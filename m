From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:31 +0100
Subject: [Buildroot] [PATCH v2 36/54] package/kodi-screensaver-cpblobs: bump
 version to 3.4.0-Matrix
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-37-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove dependency to libsoil:
https://github.com/xbmc/screensaver.cpblobs/commit/c505105f277b7e4bae0797e1c3cf89a0515ff3a5

Add dependency to glm and remove dependency to opengl, opengles support
was added upstream:
https://github.com/xbmc/screensaver.cpblobs/commit/cab48fbc8a7b288b758eb10c1c27caa99cc33f06

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-cpblobs/Config.in             |  6 +-----
 .../kodi-screensaver-cpblobs.hash                      |  4 ++--
 .../kodi-screensaver-cpblobs.mk                        | 10 +++++++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/kodi-screensaver-cpblobs/Config.in b/package/kodi-screensaver-cpblobs/Config.in
index 4e0003bddc..7f9a591418 100644
--- a/package/kodi-screensaver-cpblobs/Config.in
+++ b/package/kodi-screensaver-cpblobs/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS
 	bool "kodi-screensaver-cpblobs"
-	depends on BR2_PACKAGE_HAS_LIBGL # libsoil
-	select BR2_PACKAGE_LIBSOIL
+	select BR2_PACKAGE_GLM
 	help
 	  CpBlobs screensaver for Kodi
 
 	  https://github.com/xbmc/screensaver.cpblobs
-
-comment "kodi-screensaver-cpblobs needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index 4ff614a995..bc77c36248 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  afab934a2c93f73334943775f45f5a1d065e74714528bc700459d110e88e43a4  kodi-screensaver-cpblobs-3.0.5-Leia.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  eda36572da291d870dacbf3ad596e4ff3daed96350d9585583c279b55cfdc34a  kodi-screensaver-cpblobs-3.4.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 01f6bdf3d3..628f254a42 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,10 +4,14 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 3.0.5-Leia
+KODI_SCREENSAVER_CPBLOBS_VERSION = 3.4.0-Matrix
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
-KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
-KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = kodi libsoil
+KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
+KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = glm kodi
+
+KODI_SCREENSAVER_CPBLOBS_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
 
 $(eval $(cmake-package))
-- 
2.29.2
