From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 23:03:11 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-ati: fix dependencies
Message-ID: <20151228220332.3AC9C819ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fc8e2242ca55c10b8e3db619e8f4e7afe7b5316
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package depends on the radeon driver from libdrm and depends on
DRI support in xserver_xorg-server, to achieve this we select the
Radeon mesa3d DRI driver.

Fixes:
http://autobuild.buildroot.net/results/9da/9da4ffdf1c4ec78ae37322e253cb769340116035

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 191c20f..55be603 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
 	depends on BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_LIBDRM        if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
-	select BR2_PACKAGE_LIBDRM_RADEON if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm -> libpthread-stubs
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
