From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 19:14:57 +0200
Subject: [Buildroot] [PATCH 1/6] package/x11r7/xdriver_xf86-video-mach64:
	disable DRI support when not available
Message-ID: <1460308502-14157-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-mach64/Config.in                    | 5 -----
 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index 42535e4..82de826 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	bool "xf86-video-mach64"
-	depends on BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
@@ -9,6 +7,3 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  mach64 video driver
-
-comment "xf86-video-mach64 needs mesa3d"
-	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 9b438cb..5990360 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -12,4 +12,8 @@ XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS = --disable-dri
+endif
+
 $(eval $(autotools-package))
-- 
2.8.0.rc3
