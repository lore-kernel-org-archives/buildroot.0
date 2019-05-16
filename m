From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 17 May 2019 01:08:35 +0300
Subject: [Buildroot] [RFC PATCH/next 1/2] package/wlroots: new package
In-Reply-To: <20190516220836.24543-1-aperez@igalia.com>
References: <20190516220836.24543-1-aperez@igalia.com>
Message-ID: <20190516220836.24543-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wlroots is a modular library which provides building blocks to
implement Wayland compositors. wlroots is a dependency of the
Cage Wayland compositor.

https://github.com/swaywm/wlroots/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/Config.in            |  1 +
 package/wlroots/Config.in    | 65 +++++++++++++++++++++++++++++
 package/wlroots/wlroots.hash |  5 +++
 package/wlroots/wlroots.mk   | 80 ++++++++++++++++++++++++++++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 package/wlroots/Config.in
 create mode 100644 package/wlroots/wlroots.hash
 create mode 100644 package/wlroots/wlroots.mk

diff --git a/package/Config.in b/package/Config.in
index f592e74a99..5b1f279b8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1341,6 +1341,7 @@ menu "Graphics"
 	source "package/waylandpp/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
+	source "package/wlroots/Config.in"
 	source "package/woff2/Config.in"
 	source "package/wpebackend-fdo/Config.in"
 	source "package/wpewebkit/Config.in"
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
new file mode 100644
index 0000000000..45db63f62c
--- /dev/null
+++ b/package/wlroots/Config.in
@@ -0,0 +1,65 @@
+config BR2_PACKAGE_WLROOTS
+	bool "wlroots"
+	depends on !BR2_STATIC_LIBS # mesa3d, wayland
+	depends on BR2_INSTALL_LIBSTDCPP # freedrp, mesa3d
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
+	depends on BR2_ENABLE_LOCALE # libinput
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  wlroots is a modular Wayland library for building compositors
+	  which implements many of their common features.
+
+	  https://github.com/swaywm/wlroots
+
+if BR2_PACKAGE_WLROOTS
+
+config BR2_PACKAGE_WLROOTS_RDP
+	bool "RDP backend support"
+	depends on BR2_PACKAGE_FREERDP
+	depends on BR2_USE_WCHAR # freerdp
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # freerdp
+	help
+	  Support Wayland sessions served using the RDP protocol
+
+comment "RDP backend support needs FreeRDP"
+	depends on !BR2_PACKAGE_FREERDP
+
+config BR2_PACKAGE_WLROOTS_X11
+	bool "X11 backend support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Support Wayland sessions nested inside a X11 window
+
+comment "X11 backend support needs X.org enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_WLROOTS_XWAYLAND
+	bool "XWayland support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	help
+	  Enable support for XWayland
+
+comment "XWayland support needs X.org enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_WLROOTS_ROOTSTON
+	bool "rootston"
+	help
+	  Build and install the rootston example compositor
+
+endif
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
new file mode 100644
index 0000000000..dbb387a865
--- /dev/null
+++ b/package/wlroots/wlroots.hash
@@ -0,0 +1,5 @@
+# Generated locally
+sha256 9cf3716f3683d800df8b150f256ff66dad65faf13a9d67c284f67a9444d28c70  0.6.0.tar.gz
+
+# Hashes for license files:
+sha256 ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
new file mode 100644
index 0000000000..9d3581fd6f
--- /dev/null
+++ b/package/wlroots/wlroots.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# wlroots
+#
+################################################################################
+
+WLROOTS_VERSION = 0.6.0
+WLROOTS_SITE = https://github.com/swaywm/wlroots/archive
+WLROOTS_SOURCE = $(WLROOTS_VERSION).tar.gz
+WLROOTS_LICENSE = MIT
+WLROOTS_INSTALL_STAGING = YES
+
+WLROOTS_DEPENDENCIES = host-pkgconf host-wayland libegl libinput \
+					   libxkbcommon mesa3d pixman udev \
+					   wayland wayland-protocols
+
+WLROOTS_CONF_OPTS = -Dexamples=false
+
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+WLROOTS_DEPENDENCIES += ffmpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+WLROOTS_CONF_OPTS += -Dlibcap=enabled
+WLROOTS_DEPENDENCIES += libcap
+else
+WLROOTS_CONF_OPTS += -Dlibcap=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+WLROOTS_DEPENDENCIES += libpng
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
+WLROOTS_CONF_OPTS += -Dlogind=enabled -Dlogind-provider=systemd
+WLROOTS_DEPENDENCIES += systemd
+else
+WLROOTS_CONF_OPTS += -Dlogind=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_WLROOTS_RDP),y)
+WLROOTS_CONF_OPTS += -Dfreerdp=enabled
+WLROOTS_DEPENDENCIES += freerdp
+else
+WLROOTS_CONF_OPTS += -Dfreerdp=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
+WLROOTS_CONF_OPTS += -Dx11-backend=enabled
+WLROOTS_DEPENDENCIES += xlib_libX11
+else
+WLROOTS_CONF_OPTS += -Dx11-backend=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_WLROOTS_XWAYLAND),y)
+WLROOTS_CONF_OPTS += -Dxwayland=enabled
+WLROOTS_DEPENDENCIES += libxcb
+ifeq ($(BR2_PACKAGE_XCB_UTIL),y)
+WLROOTS_CONF_OPTS += -Dxcb-errors=enabled
+WLROOTS_DEPENDENCIES += xcb-util
+else
+WLROOTS_CONF_OPTS += -Dxcb-errors=disabled
+endif
+ifeq ($(BR2_PACKAGE_XCB_UTIL_WM),y)
+WLROOTS_CONF_OPTS += -Dxcb-icccm=enabled
+WLROOTS_DEPENDENCIES += xcb-util-wm
+else
+WLROOTS_CONF_OPTS += -Dxcb-icccm=disabled
+endif
+else
+WLROOTS_CONF_OPTS += -Dxwayland=disabled -Dxcb-errors=disabled -Dxcb-icccm=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_WLROOTS_ROOTSTON),y)
+WLROOTS_CONF_OPTS += -Drootston=true
+else
+WLROOTS_CONF_OPTS += -Drootston=false
+endif
+
+$(eval $(meson-package))
-- 
2.21.0
