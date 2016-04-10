From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 19:14:58 +0200
Subject: [Buildroot] [PATCH 2/6] package/x11r7/xdriver_xf86-video-r128:
	disable DRI support when not available
In-Reply-To: <1460308502-14157-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460308502-14157-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460308502-14157-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/2e5/2e58f95dcdfe7f139d39712ac3026be76a9f3296/
http://autobuild.buildroot.net/results/2bf/2bfe7775a9e011b8ad8e196b635492240ca4c494/
http://autobuild.buildroot.net/results/1ad/1ada5fe37fc0d04d2b3ed9a01827d1974c32cf6c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-r128/Config.in                  | 4 ----
 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
index 647156f..22ba493 100644
--- a/package/x11r7/xdriver_xf86-video-r128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-r128/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	bool "xf86-video-r128"
-	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
@@ -8,6 +7,3 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  R128 video driver
-
-comment "xf86-video-r128 needs mesa3d"
-	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index f9fcfdb..4e88d87 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -12,4 +12,8 @@ XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+XDRIVER_XF86_VIDEO_R128_CONF_OPTS = --disable-dri
+endif
+
 $(eval $(autotools-package))
-- 
2.8.0.rc3
