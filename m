From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Jul 2014 23:34:16 +0200
Subject: [Buildroot] [PATCH 2/2] xdriver_xf86-video-intel: Bump version to
	2.99.914
In-Reply-To: <1406669656-15300-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406669656-15300-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406669656-15300-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- enable sna module by default
- optionally enable uxa module if DRI2 support is enabled
- add support for DRI3
- dependencies for DRI1/2/3 modules are provided by xserver_xorg-server,
  therefore remove mesa3d dependency
- clean-up ums/kms options, configure picks sane defaults
- replace dependencies xproto_randrproto & xproto_renderproto with xlib_libXrandr

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    8 +----
 .../xdriver_xf86-video-intel.mk                    |   33 +++++++++++++++-----
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 69a9e78..0c04756 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -1,17 +1,11 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	bool "xf86-video-intel"
 	depends on (BR2_i386 || BR2_x86_64)
-	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 	help
 	  Intel video driver
-
-comment "xf86-video-intel needs mesa3d"
-	depends on (BR2_i386 || BR2_x86_64)
-	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 332de54..035a09a 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,25 +4,44 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.914
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
 
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
-	--enable-dri \
-	--enable-kms-only \
 	--disable-xvmc \
-	--disable-ums-only \
 	--enable-sna \
-	--disable-uxa \
 	--disable-glamor \
 	--disable-xaa \
 	--disable-dga \
 	--disable-async-swap
 
-XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
+XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
+	libdrm \
+	xlib_libXrandr \
+	xlib_libpciaccess \
+	xproto_fontsproto \
+	xproto_xproto \
+	xserver_xorg-server
+
+# X.org server support for DRI depends on a Mesa3D DRI driver
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --enable-dri --enable-dri1
+# quote from configure.ac: "UXA doesn't build without DRI2 headers"
+ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --enable-dri2 --enable-uxa
+else
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --disable-dri2 --disable-uxa
+endif
+ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --enable-dri3
+else
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --disable-dri3
+endif
+else
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --disable-dri
+endif
 
 $(eval $(autotools-package))
-- 
1.7.10.4
