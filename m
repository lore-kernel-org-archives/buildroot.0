From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Jun 2021 11:09:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: enable optional vaapi support
 also for OpenGLES
Message-ID: <20210620090900.205406-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream commit
https://github.com/xbmc/xbmc/commit/c638987dd8181765f975763cb643d6869a3f661b

removed the dependency to x11 support in libva keeping only libdrm as
dependency. This commit will enable the usage of libva with Kodi's
OpenGLES render system.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy       |  8 ++++++++
 package/kodi/Config.in | 18 ------------------
 package/kodi/kodi.mk   |  5 ++---
 3 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a0c1a6898f..c10f9c5223 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_KODI_LIBVA
+	bool "kodi option to add libva support removed"
+	select BR2_LEGACY
+	help
+	  Kodi still has support for libva if the package is enabled but
+	  the kodi-specific dependencies limiting libva support to non-
+	  OPENGLES platforms were removed including this option.
+
 config BR2_PACKAGE_UDISKS_LVM2
 	bool "udisks lvm2 support removed"
 	select BR2_LEGACY
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f4cfc6380c..f702ae841a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -238,24 +238,6 @@ config BR2_PACKAGE_KODI_LIBUSB
 	help
 	  Enable libusb support.
 
-config BR2_PACKAGE_KODI_LIBVA
-	bool "va"
-	depends on \
-		BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM || \
-		BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND || \
-		(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 && \
-			BR2_PACKAGE_KODI_RENDER_SYSTEM_GL)
-	select BR2_PACKAGE_LIBVA
-	help
-	  Enable libva support.
-
-comment "libva support needs platform 'gbm', 'Wayland' or 'X11/OpenGL'"
-	depends on \
-		!BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM && \
-		!BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND && \
-		(!BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 || \
-			!BR2_PACKAGE_KODI_RENDER_SYSTEM_GL)
-
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
 	depends on BR2_PACKAGE_KODI_PLATFORM_X11 && \
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index a5c9db1d7e..6f020b58b8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -315,9 +315,8 @@ ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 KODI_DEPENDENCIES += lirc-tools
 endif
 
-# kodi needs libva & libva-glx
-ifeq ($(BR2_PACKAGE_KODI_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
-KODI_DEPENDENCIES += mesa3d libva
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+KODI_DEPENDENCIES += libva
 KODI_CONF_OPTS += -DENABLE_VAAPI=ON
 else
 KODI_CONF_OPTS += -DENABLE_VAAPI=OFF
-- 
2.30.2
