From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  5 Sep 2013 23:25:15 -0500
Subject: [Buildroot] [PATCH v2 1/7] libdrm: bump and add experimental ARM
	framebuffer support
In-Reply-To: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1378441521-10050-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libdrm/Config.in | 68 ++++++++++++++++++++++++++++++++++++++++--------
 package/libdrm/libdrm.mk | 53 ++++++++++++++++++++++++++++++-------
 2 files changed, 100 insertions(+), 21 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 8bf676b..533e985 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,22 +1,68 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
+	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_LARGEFILE
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
-	select BR2_PACKAGE_XPROTO_DRI2PROTO
-	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
-	# libatomic_ops is only available on a subset of the supported
-	# architectures, and we make the assumption that the intel
-	# driver can only be used on x86 and x86_64 machines.
-	select BR2_PACKAGE_LIBATOMIC_OPS if (BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL && (BR2_i386 || BR2_x86_64))
 	help
 	  Direct Rendering Manager
 
 	  http://dri.freedesktop.org/libdrm/
 
+if BR2_PACKAGE_LIBDRM
+
+menu "DRM Drivers"
+
+config BR2_PACKAGE_LIBDRM_INTEL
+	bool "intel"
+	select BR2_PACKAGE_LIBATOMIC_OPS
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  installs intel graphics driver
+
+config BR2_PACKAGE_LIBDRM_RADEON
+	bool "radeon"
+	select BR2_PACKAGE_LIBATOMIC_OPS
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  install AMD/ATI graphics driver
+
+config BR2_PACKAGE_LIBDRM_NOUVEAU
+	bool "nouveau"
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  install Nvidia graphics driver
+
+config BR2_PACKAGE_LIBDRM_VMWGFX
+	bool "vmwgfx"
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  installs Vmware graphics driver
+
+config BR2_PACKAGE_LIBDRM_OMAP
+	bool "omap (experimental)"
+	depends on BR2_arm
+	help
+	  install the TI OMAP driver using an experimental API.
+
+config BR2_PACKAGE_LIBDRM_EXYNOS
+	bool "exynos (experimental)"
+	depends on BR2_arm
+	help
+	  installs Samsung Exynos driver using an experimental API.
+
+config BR2_PACKAGE_LIBDRM_FREEDRENO
+	bool "freedreno (experimental)"
+	depends on BR2_arm
+	help
+	  install Qualcomm Snapdragon driver using an experimental API.
+
+endmenu
+
+endif
+
 comment "libdrm requires a toolchain with LARGEFILE support"
 	depends on BR2_PACKAGE_XORG7 && !BR2_LARGEFILE
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index d3d2b2d..697cd2f 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.38
+LIBDRM_VERSION = 2.4.46
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_LICENSE = MIT
@@ -12,26 +12,59 @@ LIBDRM_LICENSE = MIT
 LIBDRM_INSTALL_STAGING = YES
 
 LIBDRM_DEPENDENCIES = \
-	xproto_glproto \
-	xproto_xf86vidmodeproto \
-	xlib_libXxf86vm \
-	xlib_libXmu \
-	xlib_libpciaccess \
-	xproto_dri2proto \
 	xlib_libpthread-stubs \
 	host-pkgconf
 
-ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL),y)
+LIBDRM_CONF_OPT = \
+	--disable-cairo-tests \
+	--disable-manpages
+
+ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
 LIBDRM_CONF_OPT += --enable-intel
-LIBDRM_DEPENDENCIES += libatomic_ops
+LIBDRM_DEPENDENCIES += libatomic_ops xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-intel
 endif
 
-ifneq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI),y)
+ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
+LIBDRM_CONF_OPT += --enable-radeon
+LIBDRM_DEPENDENCIES += xlib_libpciaccess
+else
 LIBDRM_CONF_OPT += --disable-radeon
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
+LIBDRM_CONF_OPT += --enable-nouveau
+LIBDRM_DEPENDENCIES += xlib_libpciaccess
+else
+LIBDRM_CONF_OPT += --disable-nouveau
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
+LIBDRM_CONF_OPT += --enable-vmwgfx
+LIBDRM_DEPENDENCIES += xlib_libpciaccess
+else
+LIBDRM_CONF_OPT += --enable-vmwgfx
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
+LIBDRM_CONF_OPT += --enable-omap-experimental-api
+else
+LIBDRM_CONF_OPT += --disable-omap-experimental-api
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM_EXYNOS),y)
+LIBDRM_CONF_OPT += --enable-exynos-experimental-api
+else
+LIBDRM_CONF_OPT += --disable-exynos-experimental-api
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM_FREEDRENO),y)
+LIBDRM_CONF_OPT += --enable-freedreno-experimental-api
+else
+LIBDRM_CONF_OPT += --disable-freedreno-experimental-api
+endif
+
 ifeq ($(BR2_PACKAGE_UDEV),y)
 LIBDRM_CONF_OPT += --enable-udev
 LIBDRM_DEPENDENCIES += udev
-- 
1.8.1.2
