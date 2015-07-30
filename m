From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:44:08 +0200
Subject: [Buildroot] [git commit] package/kodi-screensaver-asteroids: new
	package
Message-ID: <20150730132259.30EC98007A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e3078dec42e8a8d42120d803e83e6d1572987e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.
   - add dependency on KODI_GL, since it includes <GL/gl.h>.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-asteroids/Config.in       |   10 ++++++++++
 .../kodi-screensaver-asteroids.mk                  |   13 +++++++++++++
 package/kodi/Config.in                             |    4 ++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/Config.in b/package/kodi-screensaver-asteroids/Config.in
new file mode 100644
index 0000000..d5d92c6
--- /dev/null
+++ b/package/kodi-screensaver-asteroids/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS
+	bool "kodi-screensaver-asteroids"
+	depends on BR2_PACKAGE_KODI_GL
+	help
+	  Asteroids screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.asteroids
+
+comment "kodi-screensaver-asteroids needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
new file mode 100644
index 0000000..dce8fb6
--- /dev/null
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-screensaver-asteroids
+#
+################################################################################
+
+KODI_SCREENSAVER_ASTEROIDS_VERSION = d4c2e3b499544ef55be364b34e5569d9c31c9615
+KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
+KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPLv2+
+KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
+KODI_SCREENSAVER_ASTEROIDS_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index af6aec7..ac6c6fc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -286,4 +286,8 @@ menu "PVR addons"
 	source "package/kodi-pvr-wmc/Config.in"
 endmenu
 
+menu "Screensavers"
+	source "package/kodi-screensaver-asteroids/Config.in"
+endmenu
+
 endif # BR2_PACKAGE_KODI
