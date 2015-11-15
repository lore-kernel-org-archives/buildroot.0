From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Nov 2015 12:52:19 +0100
Subject: [Buildroot] [PATCH/next v2 3/4]
	package/x11r7/xdriver_xf86-video-ati: bump version to 7.6.1
In-Reply-To: <1447588340-8270-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447588340-8270-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1447588340-8270-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package now needs O_CLOEXEC, which is missing in uClibc's default
configuration. As suggested by Peter make this package only available in
non uClibc environments:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/131903

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in                   | 6 ++++--
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash | 4 ++--
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk   | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 191c20f..7876fc2 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
 	depends on BR2_PACKAGE_MESA3D
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # O_CLOEXEC not impl by default
 	select BR2_PACKAGE_LIBDRM        if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_LIBDRM_RADEON if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
@@ -15,5 +16,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	help
 	  ATI video driver
 
-comment "xf86-video-ati needs mesa3d"
-	depends on !BR2_PACKAGE_MESA3D
+comment "xf86-video-ati needs mesa3d and an (e)glibc or musl toolchain"
+	depends on !BR2_PACKAGE_MESA3D || \
+		BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index ccb8665..a9974c7 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2014-October/002486.html
-sha256	ec3e6f06b6cf9a40c72aafa3448aae8b034c80b37410ca9442d5cf6806e07936	xf86-video-ati-7.5.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-November/002658.html
+sha256	2516d9eeb8da8bcd3a01365ed1314919777910fa904ab268af342b5693e1d34c	xf86-video-ati-7.6.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index cba9e76..e00134e 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 7.5.0
+XDRIVER_XF86_VIDEO_ATI_VERSION = 7.6.1
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
-- 
2.6.2
