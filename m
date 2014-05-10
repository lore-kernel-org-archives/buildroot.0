From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 May 2014 12:02:28 +0200
Subject: [Buildroot] [PATCH v6 16/32] xdriver_xf86-video-intel: Bump version
	to 2.99.911
In-Reply-To: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399716164-6452-17-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add necessary dependencies
- add -D_GNU_SOURCE to avoid getline compilation error

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-intel/Config.in   |   11 ++++----
 .../xdriver_xf86-video-intel.mk                    |   27 +++++++++++++++-----
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 69a9e78..e2708c0 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -2,13 +2,14 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	bool "xf86-video-intel"
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  Intel video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 332de54..52b493f 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,18 +4,18 @@
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
-	--enable-dri \
-	--enable-kms-only \
 	--disable-xvmc \
-	--disable-ums-only \
 	--enable-sna \
 	--disable-uxa \
 	--disable-glamor \
@@ -23,6 +23,21 @@ XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
 	--disable-dga \
 	--disable-async-swap
 
-XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
+XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
+	libdrm \
+	xlib_libXcomposite \
+	xlib_libXrandr \
+	xlib_libXtst \
+	xlib_libpciaccess \
+	xproto_fontsproto \
+	xproto_xproto \
+	xserver_xorg-server
+
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965),y)
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --enable-dri
+XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES += mesa3d xproto_xf86driproto
+else
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --disable-dri
+endif
 
 $(eval $(autotools-package))
-- 
1.7.10.4
