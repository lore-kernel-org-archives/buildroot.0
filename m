From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Aug 2015 12:49:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-ati: Fix
	DRI-related build
Message-ID: <1440931793-2679-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is not available on arm:
https://packages.gentoo.org/package/x11-drivers/xf86-video-ati
https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-drivers/xf86-video-ati/ChangeLog?r1=1.74&r2=1.75

Select the radeon driver from libdrm to fix the compile errors noticed
by autobuilders.

This package also depends on DRI support in xserver_xorg-server. To have
working DRI support there at least one mesa3d DRI driver has to be
selected, we select swrast because it is available on all supported
platforms.

Fixes
http://autobuild.buildroot.net/results/441/441b30b6899cca67b2c70fd3195f4be2c8a037b4/
http://autobuild.buildroot.net/results/d88/d88d2f99bc538ce5a518d83e4807faa908889188/
http://autobuild.buildroot.net/results/6c4/6c4fda4cafa587d5fffb44cd9bd38a32cb2616f3/
http://autobuild.buildroot.net/results/0d2/0d2b131ec425a62f18015cf38914eabd08aa4158/
http://autobuild.buildroot.net/results/a6e/a6e7e7e8abec135885dc482eb49cdae7bb45ebf6/
http://autobuild.buildroot.net/results/42f/42ffff241f58913aa32c1561e04f681bbc9c44fc/
http://autobuild.buildroot.net/results/b0c/b0cdabd7d840698837f1f6816499ff0102624e9b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 191c20f..5dd84b1 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
+	depends on !BR2_arm && !BR2_armeb
 	depends on BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_LIBDRM        if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
-	select BR2_PACKAGE_LIBDRM_RADEON if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
@@ -16,4 +18,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	  ATI video driver
 
 comment "xf86-video-ati needs mesa3d"
+	depends on !BR2_arm && !BR2_armeb
 	depends on !BR2_PACKAGE_MESA3D
-- 
2.1.4
