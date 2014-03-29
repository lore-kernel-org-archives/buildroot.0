From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:09 +0100
Subject: [Buildroot] [PATCH 05/91] xdriver_xf86-video-intel: Bump version to
	2.99.911
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP8827F2D0AD77A14A79591BD9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add necessary dependencies
- add -D_GNU_SOURCE to avoid getline compilation error

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xdriver_xf86-video-intel/Config.in     |   15 +++++++++------
 .../xdriver_xf86-video-intel.mk                      |   18 +++++++++++++++---
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 83b714a..bc9281c 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -1,13 +1,16 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	bool "xf86-video-intel"
+	depends on BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_INTEL
+	depends on BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_LIBDRM_INTEL
-	select BR2_PACKAGE_MESA3D
 	depends on (BR2_i386 || BR2_x86_64)
 	help
 	  Intel video driver
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 332de54..9776062 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.911
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
+
+# this fixes a getline-related compilation in src/sna/kgem.c
+XDRIVER_XF86_VIDEO_INTEL_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
 	--enable-dri \
@@ -23,6 +26,15 @@ XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
 	--disable-dga \
 	--disable-async-swap
 
-XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
+XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
+	libdrm \
+	mesa3d \
+	xlib_libXcomposite \
+	xlib_libXrandr \
+	xlib_libXtst \
+	xlib_libpciaccess \
+	xproto_fontsproto \
+	xproto_xproto \
+	xserver_xorg-server
 
 $(eval $(autotools-package))
-- 
1.7.10.4
