From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:22 +0200
Subject: [Buildroot] [PATCH v4 27/37] xdriver_xf86-video-intel: Bump version
	to 2.99.911
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-28-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add necessary dependencies
- add -D_GNU_SOURCE to avoid getline compilation error

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v6: reworked dependency
v5: rebased
v4: no changes
v3: add optional dependency BR2_PACKAGE_XPROTO_XF86DRIPROTO (Thomas)
v2: - depend on mesa3d only when the i965 DRI driver is selected (Thomas)
    - allow both kms and ums support (Thomas):
  Support for Kernel Mode Setting? yes
  Support for legacy User Mode Setting (for i810)? yes

 package/x11r7/xdriver_xf86-video-intel/Config.in   |   13 ++++----
 .../xdriver_xf86-video-intel.mk                    |   31 ++++++++++++++++----
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 8781e1c..b897261 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -2,15 +2,16 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
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
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  Intel video driver
 
 comment "xf86-video-intel needs mesa3d"
-	depends on BR2_PACKAGE_MESA3D
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 332de54..e9d3871 100644
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
@@ -23,6 +23,25 @@ XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
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
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += \
+	--enable-dri
+XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES += \
+	mesa3d \
+	xproto_xf86driproto
+else
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += \
+	--disable-dri
+endif
 
 $(eval $(autotools-package))
-- 
1.7.10.4
