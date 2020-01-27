From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jan 2020 00:05:53 -0700
Subject: [Buildroot] [PATCH v7 1/3] package/weston-imx: Split weston-imx off
 from weston
Message-ID: <20200127070555.27400-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in preparation for migration of weston to the meson build system.
Since weston-imx is based off of a much older version of weston it is
difficult to maintain as part of the weston package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                  |   1 +
 package/weston-imx/Config.in       | 108 ++++++++++++++++++++++
 package/weston-imx/weston-imx.hash |   2 +
 package/weston-imx/weston-imx.mk   | 144 +++++++++++++++++++++++++++++
 package/weston/Config.in           |   2 +
 package/weston/weston.hash         |   2 -
 package/weston/weston.mk           |  16 ----
 7 files changed, 257 insertions(+), 18 deletions(-)
 create mode 100644 package/weston-imx/Config.in
 create mode 100644 package/weston-imx/weston-imx.hash
 create mode 100644 package/weston-imx/weston-imx.mk

diff --git a/package/Config.in b/package/Config.in
index db35848fed..9b42055570 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -342,6 +342,7 @@ comment "QT libraries and helper libraries"
 endif
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
+	source "package/weston-imx/Config.in"
 	source "package/x11r7/Config.in"
 
 comment "X applications"
diff --git a/package/weston-imx/Config.in b/package/weston-imx/Config.in
new file mode 100644
index 0000000000..a82cb947a0
--- /dev/null
+++ b/package/weston-imx/Config.in
@@ -0,0 +1,108 @@
+comment "weston-imx needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 3.0"
+	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
+		!BR2_ENABLE_LOCALE
+
+config BR2_PACKAGE_WESTON_IMX
+	bool "weston-imx"
+	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
+	depends on BR2_ENABLE_LOCALE # libinput
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBDRM
+	# Runtime dependency
+	select BR2_PACKAGE_XKEYBOARD_CONFIG
+	# Make sure at least one compositor is selected.
+	select BR2_PACKAGE_WESTON_IMX_FBDEV if !BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
+	help
+	  Weston is the reference implementation of a Wayland
+	  compositor, and a useful compositor in its own right.
+	  Weston has various backends that lets it run on Linux kernel
+	  modesetting and evdev input as well as under X11.
+
+	  http://wayland.freedesktop.org/
+
+if BR2_PACKAGE_WESTON_IMX
+
+# Helper to make sure at least one compositor is selected.
+config BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
+	bool
+
+config BR2_PACKAGE_WESTON_IMX_DRM
+	bool "DRM compositor"
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	select BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
+
+# Uses libgbm from mesa3d
+comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+
+config BR2_PACKAGE_WESTON_IMX_FBDEV
+	bool "fbdev compositor"
+
+# FreeRDP needs threads and !static, already the case for weston
+config BR2_PACKAGE_WESTON_IMX_RDP
+	bool "RDP compositor"
+	depends on BR2_USE_MMU # freerdp, libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_WCHAR # freerdp
+	depends on BR2_INSTALL_LIBSTDCPP # freerdp
+	select BR2_PACKAGE_FREERDP
+	select BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
+	help
+	  This enables the RDP backend, which allows accessing weston
+	  through the network with any RDP-compliant client.
+
+	  Please note that one must pass those options to weston for RDP
+	  to be functional:
+	    --rdp-tls-cert=/path/to/server.crt
+	    --rdp-tls-key=/path/to/server.key
+
+	  By default, Buildroot installs such files in
+	  /etc/freerdp/server/ so you may want to change them in a
+	  post-build script or a rootfs overlay.
+
+comment "RDP compositor needs a toolchain w/ wchar, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_WESTON_IMX_X11
+	bool "X11 compositor"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_WESTON_IMX_HAS_COMPOSITOR
+
+comment "X11 compositor needs X.org enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_WESTON_IMX_XWAYLAND
+	bool "XWayland support"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+
+comment "XWayland support needs libepoxy and X.org enabled"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
+
+config BR2_PACKAGE_WESTON_IMX_DEMO_CLIENTS
+	bool "demo clients"
+	help
+	  This enables the installation of Weston's demo clients.
+
+endif
diff --git a/package/weston-imx/weston-imx.hash b/package/weston-imx/weston-imx.hash
new file mode 100644
index 0000000000..759a9b6554
--- /dev/null
+++ b/package/weston-imx/weston-imx.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 f39f7a24a01b023aa204ad47977a6476c17a307769f29d408621a05b5cbbcfc7  weston-imx-rel_imx_4.9.51_8mq_ga.tar.gz
diff --git a/package/weston-imx/weston-imx.mk b/package/weston-imx/weston-imx.mk
new file mode 100644
index 0000000000..9dd2088502
--- /dev/null
+++ b/package/weston-imx/weston-imx.mk
@@ -0,0 +1,144 @@
+################################################################################
+#
+# weston
+#
+################################################################################
+
+WESTON_IMX_VERSION = rel_imx_4.9.51_8mq_ga
+WESTON_IMX_SITE = https://source.codeaurora.org/external/imx/weston-imx
+WESTON_IMX_SITE_METHOD = git
+WESTON_IMX_AUTORECONF = YES
+WESTON_IMX_LICENSE = MIT
+WESTON_IMX_LICENSE_FILES = COPYING
+
+WESTON_IMX_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
+	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm \
+	$(if $(BR2_PACKAGE_WEBP),webp)
+
+WESTON_IMX_CONF_OPTS = \
+	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
+	--disable-headless-compositor \
+	--disable-colord \
+	--disable-devdocs \
+	--disable-setuid-install
+
+WESTON_IMX_MAKE_OPTS = \
+	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
+
+# Uses VIDIOC_EXPBUF, only available from 3.8+
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
+WESTON_IMX_CONF_OPTS += --disable-simple-dmabuf-v4l-client
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+WESTON_IMX_CONF_OPTS += --enable-dbus
+WESTON_IMX_DEPENDENCIES += dbus
+else
+WESTON_IMX_CONF_OPTS += --disable-dbus
+endif
+
+# weston-launch must be u+s root in order to work properly
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define WESTON_IMX_PERMISSIONS
+	/usr/bin/weston-launch f 4755 0 0 - - - - -
+endef
+define WESTON_IMX_USERS
+	- - weston-launch -1 - - - - Weston launcher group
+endef
+WESTON_IMX_CONF_OPTS += --enable-weston-launch
+WESTON_IMX_DEPENDENCIES += linux-pam
+else
+WESTON_IMX_CONF_OPTS += --disable-weston-launch
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_GPU_G2D),y)
+WESTON_IMX_DEPENDENCIES += imx-gpu-g2d
+# --enable-imxg2d actually disables it, so no CONF_OPTS
+else
+WESTON_IMX_CONF_OPTS += --disable-imxg2d
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+WESTON_IMX_CONF_OPTS += --enable-egl
+WESTON_IMX_DEPENDENCIES += libegl libgles
+else
+WESTON_IMX_CONF_OPTS += \
+	--disable-egl \
+	--disable-simple-dmabuf-drm-client \
+	--disable-simple-egl-clients
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_IMX_RDP),y)
+WESTON_IMX_DEPENDENCIES += freerdp
+WESTON_IMX_CONF_OPTS += --enable-rdp-compositor
+else
+WESTON_IMX_CONF_OPTS += --disable-rdp-compositor
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_IMX_FBDEV),y)
+WESTON_IMX_CONF_OPTS += \
+	--enable-fbdev-compositor \
+	WESTON_IMX_NATIVE_BACKEND=fbdev-backend.so
+else
+WESTON_IMX_CONF_OPTS += --disable-fbdev-compositor
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_IMX_DRM),y)
+WESTON_IMX_CONF_OPTS += \
+	--enable-drm-compositor \
+	WESTON_IMX_NATIVE_BACKEND=drm-backend.so
+else
+WESTON_IMX_CONF_OPTS += --disable-drm-compositor
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_IMX_X11),y)
+WESTON_IMX_CONF_OPTS += \
+	--enable-x11-compositor \
+	WESTON_IMX_NATIVE_BACKEND=x11-backend.so
+WESTON_IMX_DEPENDENCIES += libxcb xlib_libX11
+else
+WESTON_IMX_CONF_OPTS += --disable-x11-compositor
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_IMX_XWAYLAND),y)
+WESTON_IMX_CONF_OPTS += --enable-xwayland
+WESTON_IMX_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
+else
+WESTON_IMX_CONF_OPTS += --disable-xwayland
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+WESTON_IMX_CONF_OPTS += --enable-vaapi-recorder
+WESTON_IMX_DEPENDENCIES += libva
+else
+WESTON_IMX_CONF_OPTS += --disable-vaapi-recorder
+endif
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+WESTON_IMX_CONF_OPTS += --enable-lcms
+WESTON_IMX_DEPENDENCIES += lcms2
+else
+WESTON_IMX_CONF_OPTS += --disable-lcms
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+WESTON_IMX_CONF_OPTS += --enable-systemd-login --enable-systemd-notify
+WESTON_IMX_DEPENDENCIES += systemd
+else
+WESTON_IMX_CONF_OPTS += --disable-systemd-login --disable-systemd-notify
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+WESTON_IMX_CONF_OPTS += --enable-junit-xml
+WESTON_IMX_DEPENDENCIES += libxml2
+else
+WESTON_IMX_CONF_OPTS += --disable-junit-xml
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_IMX_DEMO_CLIENTS),y)
+WESTON_IMX_CONF_OPTS += --enable-demo-clients-install
+else
+WESTON_IMX_CONF_OPTS += --disable-demo-clients-install
+endif
+
+$(eval $(autotools-package))
diff --git a/package/weston/Config.in b/package/weston/Config.in
index f874b0cc6a..5a5e288540 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,10 +1,12 @@
 comment "weston needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 3.0"
+	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
 		!BR2_ENABLE_LOCALE
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
+	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_STATIC_LIBS # wayland
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index a2dddf7a5b..c9b2d4b1ce 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -3,5 +3,3 @@ md5 e7b10710ef1eac82258f97bfd41fe534  weston-6.0.1.tar.xz
 sha1 3b39e454b3dc8dc32598790cfcc65728b448378b  weston-6.0.1.tar.xz
 sha256 bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a513155b4  weston-6.0.1.tar.xz
 sha512 3da04ff9b884480ce0824950347185e55584e3938021fe62014423d3d51577eafdda8de650a5de6eb37a842130c9cb14c7a952a560f6be93ff973164363af3d9  weston-6.0.1.tar.xz
-# locally computed
-sha256 0f0de7b7b1f65870139c95dde7abc19ed305631ae7c5d37c386db40cde108632  weston-rel_imx_4.9.51_8mq_ga.tar.gz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index ee3d3be87e..154ae38b83 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,16 +4,9 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
-WESTON_VERSION = rel_imx_4.9.51_8mq_ga
-WESTON_SITE = https://source.codeaurora.org/external/imx/weston-imx
-WESTON_SITE_METHOD = git
-WESTON_AUTORECONF = YES
-else
 WESTON_VERSION = 6.0.1
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
-endif
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
@@ -58,15 +51,6 @@ else
 WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
-ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
-ifeq ($(BR2_PACKAGE_IMX_GPU_G2D),y)
-WESTON_DEPENDENCIES += imx-gpu-g2d
-# --enable-imxg2d actually disables it, so no CONF_OPTS
-else
-WESTON_CONF_OPTS += --disable-imxg2d
-endif
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
 WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl libgles
-- 
2.20.1
