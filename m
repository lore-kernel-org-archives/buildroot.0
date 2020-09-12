From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:25:14 +0200
Subject: [Buildroot] [git commit] package/weston-imx: remove deprecated
 package
Message-ID: <20200912121656.4955886E55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ef7160b926da5b24e234e022302656c590572f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- the package couldn't be selected with vivante backend anyway since
  the split
- the package couldn't be updated to newer versions as it would imply
  forking libdrm and wayland-protocols for it to build
- drawback of not using NXP weston is the lack of G2D support, let's
  have it as a known issue for Buildroot but use standard weston
  package

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                   |   6 ++
 package/Config.in                  |   1 -
 package/weston-imx/Config.in       | 114 -----------------------------
 package/weston-imx/weston-imx.hash |   3 -
 package/weston-imx/weston-imx.mk   | 144 -------------------------------------
 5 files changed, 6 insertions(+), 262 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d4f2dcfdea..8d948d2bb7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_WESTON_IMX
+	bool "weston-imx package was removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed, use weston instead.
+
 config BR2_KERNEL_HEADERS_5_7
 	bool "kernel headers version 5.7.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 17d2bd4f92..41c11d876d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -347,7 +347,6 @@ comment "QT libraries and helper libraries"
 endif
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
-	source "package/weston-imx/Config.in"
 	source "package/x11r7/Config.in"
 
 comment "X applications"
diff --git a/package/weston-imx/Config.in b/package/weston-imx/Config.in
deleted file mode 100644
index 36ff7ae5ab..0000000000
--- a/package/weston-imx/Config.in
+++ /dev/null
@@ -1,114 +0,0 @@
-comment "weston-imx needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 3.0"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
-		!BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
-	depends on !BR2_PACKAGE_WESTON
-
-comment "weston-imx needs imx-gpu-viv with wyalnd output"
-	depends on (BR2_arm && BR2_ARM_EABIHF) || BR2_aarch64 # imx-gpu-viv
-	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
-	depends on !BR2_PACKAGE_WESTON
-
-config BR2_PACKAGE_WESTON_IMX
-	bool "weston-imx"
-	depends on !BR2_STATIC_LIBS # wayland
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
-	depends on !BR2_PACKAGE_WESTON
-	select BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS
-	select BR2_PACKAGE_LIBXKBCOMMON
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_CAIRO_PNG
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBINPUT
-	select BR2_PACKAGE_LIBDRM
-	# Runtime dependency
-	select BR2_PACKAGE_XKEYBOARD_CONFIG
-	# Make sure at least one compositor is selected.
-	select BR2_PACKAGE_WESTON_IMX_FBDEV if !BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
-	help
-	  Weston is the reference implementation of a Wayland
-	  compositor, and a useful compositor in its own right.
-	  Weston has various backends that lets it run on Linux kernel
-	  modesetting and evdev input as well as under X11.
-
-	  http://wayland.freedesktop.org/
-
-if BR2_PACKAGE_WESTON_IMX
-
-# Helper to make sure at least one compositor is selected.
-config BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
-	bool
-
-config BR2_PACKAGE_WESTON_IMX_DRM
-	bool "DRM compositor"
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
-	select BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
-
-# Uses libgbm from mesa3d
-comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
-
-config BR2_PACKAGE_WESTON_IMX_FBDEV
-	bool "fbdev compositor"
-
-# FreeRDP needs threads and !static, already the case for weston
-config BR2_PACKAGE_WESTON_IMX_RDP
-	bool "RDP compositor"
-	depends on BR2_USE_MMU # freerdp, libglib2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_USE_WCHAR # freerdp
-	depends on BR2_INSTALL_LIBSTDCPP # freerdp
-	select BR2_PACKAGE_FREERDP
-	select BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
-	help
-	  This enables the RDP backend, which allows accessing weston
-	  through the network with any RDP-compliant client.
-
-	  Please note that one must pass those options to weston for RDP
-	  to be functional:
-	    --rdp-tls-cert=/path/to/server.crt
-	    --rdp-tls-key=/path/to/server.key
-
-	  By default, Buildroot installs such files in
-	  /etc/freerdp/server/ so you may want to change them in a
-	  post-build script or a rootfs overlay.
-
-comment "RDP compositor needs a toolchain w/ wchar, C++"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-
-config BR2_PACKAGE_WESTON_IMX_X11
-	bool "X11 compositor"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
-
-comment "X11 compositor needs X.org enabled"
-	depends on !BR2_PACKAGE_XORG7
-
-config BR2_PACKAGE_WESTON_IMX_XWAYLAND
-	bool "XWayland support"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_LIBEPOXY
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXCURSOR
-
-comment "XWayland support needs libepoxy and X.org enabled"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
-
-config BR2_PACKAGE_WESTON_IMX_DEMO_CLIENTS
-	bool "demo clients"
-	help
-	  This enables the installation of Weston's demo clients.
-
-endif
diff --git a/package/weston-imx/weston-imx.hash b/package/weston-imx/weston-imx.hash
deleted file mode 100644
index 56885d71ac..0000000000
--- a/package/weston-imx/weston-imx.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  f39f7a24a01b023aa204ad47977a6476c17a307769f29d408621a05b5cbbcfc7  weston-imx-rel_imx_4.9.51_8mq_ga.tar.gz
-sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston-imx/weston-imx.mk b/package/weston-imx/weston-imx.mk
deleted file mode 100644
index e803fa3ee2..0000000000
--- a/package/weston-imx/weston-imx.mk
+++ /dev/null
@@ -1,144 +0,0 @@
-################################################################################
-#
-# weston-imx
-#
-################################################################################
-
-WESTON_IMX_VERSION = rel_imx_4.9.51_8mq_ga
-WESTON_IMX_SITE = https://source.codeaurora.org/external/imx/weston-imx
-WESTON_IMX_SITE_METHOD = git
-WESTON_IMX_AUTORECONF = YES
-WESTON_IMX_LICENSE = MIT
-WESTON_IMX_LICENSE_FILES = COPYING
-
-WESTON_IMX_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm \
-	$(if $(BR2_PACKAGE_WEBP),webp)
-
-WESTON_IMX_CONF_OPTS = \
-	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-	--disable-headless-compositor \
-	--disable-colord \
-	--disable-devdocs \
-	--disable-setuid-install
-
-WESTON_IMX_MAKE_OPTS = \
-	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
-
-# Uses VIDIOC_EXPBUF, only available from 3.8+
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
-WESTON_IMX_CONF_OPTS += --disable-simple-dmabuf-v4l-client
-endif
-
-ifeq ($(BR2_PACKAGE_DBUS),y)
-WESTON_IMX_CONF_OPTS += --enable-dbus
-WESTON_IMX_DEPENDENCIES += dbus
-else
-WESTON_IMX_CONF_OPTS += --disable-dbus
-endif
-
-# weston-launch must be u+s root in order to work properly
-ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-define WESTON_IMX_PERMISSIONS
-	/usr/bin/weston-launch f 4755 0 0 - - - - -
-endef
-define WESTON_IMX_USERS
-	- - weston-launch -1 - - - - Weston launcher group
-endef
-WESTON_IMX_CONF_OPTS += --enable-weston-launch
-WESTON_IMX_DEPENDENCIES += linux-pam
-else
-WESTON_IMX_CONF_OPTS += --disable-weston-launch
-endif
-
-ifeq ($(BR2_PACKAGE_IMX_GPU_G2D),y)
-WESTON_IMX_DEPENDENCIES += imx-gpu-g2d
-# --enable-imxg2d actually disables it, so no CONF_OPTS
-else
-WESTON_IMX_CONF_OPTS += --disable-imxg2d
-endif
-
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
-WESTON_IMX_CONF_OPTS += --enable-egl
-WESTON_IMX_DEPENDENCIES += libegl libgles
-else
-WESTON_IMX_CONF_OPTS += \
-	--disable-egl \
-	--disable-simple-dmabuf-drm-client \
-	--disable-simple-egl-clients
-endif
-
-ifeq ($(BR2_PACKAGE_WESTON_IMX_RDP),y)
-WESTON_IMX_DEPENDENCIES += freerdp
-WESTON_IMX_CONF_OPTS += --enable-rdp-compositor
-else
-WESTON_IMX_CONF_OPTS += --disable-rdp-compositor
-endif
-
-ifeq ($(BR2_PACKAGE_WESTON_IMX_FBDEV),y)
-WESTON_IMX_CONF_OPTS += \
-	--enable-fbdev-compositor \
-	WESTON_IMX_NATIVE_BACKEND=fbdev-backend.so
-else
-WESTON_IMX_CONF_OPTS += --disable-fbdev-compositor
-endif
-
-ifeq ($(BR2_PACKAGE_WESTON_IMX_DRM),y)
-WESTON_IMX_CONF_OPTS += \
-	--enable-drm-compositor \
-	WESTON_IMX_NATIVE_BACKEND=drm-backend.so
-else
-WESTON_IMX_CONF_OPTS += --disable-drm-compositor
-endif
-
-ifeq ($(BR2_PACKAGE_WESTON_IMX_X11),y)
-WESTON_IMX_CONF_OPTS += \
-	--enable-x11-compositor \
-	WESTON_IMX_NATIVE_BACKEND=x11-backend.so
-WESTON_IMX_DEPENDENCIES += libxcb xlib_libX11
-else
-WESTON_IMX_CONF_OPTS += --disable-x11-compositor
-endif
-
-ifeq ($(BR2_PACKAGE_WESTON_IMX_XWAYLAND),y)
-WESTON_IMX_CONF_OPTS += --enable-xwayland
-WESTON_IMX_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
-else
-WESTON_IMX_CONF_OPTS += --disable-xwayland
-endif
-
-ifeq ($(BR2_PACKAGE_LIBVA),y)
-WESTON_IMX_CONF_OPTS += --enable-vaapi-recorder
-WESTON_IMX_DEPENDENCIES += libva
-else
-WESTON_IMX_CONF_OPTS += --disable-vaapi-recorder
-endif
-
-ifeq ($(BR2_PACKAGE_LCMS2),y)
-WESTON_IMX_CONF_OPTS += --enable-lcms
-WESTON_IMX_DEPENDENCIES += lcms2
-else
-WESTON_IMX_CONF_OPTS += --disable-lcms
-endif
-
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-WESTON_IMX_CONF_OPTS += --enable-systemd-login --enable-systemd-notify
-WESTON_IMX_DEPENDENCIES += systemd
-else
-WESTON_IMX_CONF_OPTS += --disable-systemd-login --disable-systemd-notify
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXML2),y)
-WESTON_IMX_CONF_OPTS += --enable-junit-xml
-WESTON_IMX_DEPENDENCIES += libxml2
-else
-WESTON_IMX_CONF_OPTS += --disable-junit-xml
-endif
-
-ifeq ($(BR2_PACKAGE_WESTON_IMX_DEMO_CLIENTS),y)
-WESTON_IMX_CONF_OPTS += --enable-demo-clients-install
-else
-WESTON_IMX_CONF_OPTS += --disable-demo-clients-install
-endif
-
-$(eval $(autotools-package))
