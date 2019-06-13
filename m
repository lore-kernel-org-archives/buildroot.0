From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 Jun 2019 03:08:35 +0300
Subject: [Buildroot] [PATCH v2 1/2] package/wlroots: new package
In-Reply-To: <20190613000836.41302-1-aperez@igalia.com>
References: <20190613000836.41302-1-aperez@igalia.com>
Message-ID: <20190613000836.41302-2-aperez@igalia.com>
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
Changes v1 -> v2:
  - Review dependencies (as per Thomas' comments)
  - Add patch to use wayland-scanner from host tools dir (pointed out by Fran?ois)

---
 package/Config.in                             |  1 +
 ...onfig-to-find-wayland-scanner-when-c.patch | 45 +++++++++++
 package/wlroots/Config.in                     | 62 ++++++++++++++
 package/wlroots/wlroots.hash                  |  5 ++
 package/wlroots/wlroots.mk                    | 80 +++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
 create mode 100644 package/wlroots/Config.in
 create mode 100644 package/wlroots/wlroots.hash
 create mode 100644 package/wlroots/wlroots.mk

diff --git a/package/Config.in b/package/Config.in
index a14736c599..a7d70b6b48 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1347,6 +1347,7 @@ menu "Graphics"
 	source "package/waylandpp/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
+	source "package/wlroots/Config.in"
 	source "package/woff2/Config.in"
 	source "package/wpebackend-fdo/Config.in"
 	source "package/wpewebkit/Config.in"
diff --git a/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch b/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
new file mode 100644
index 0000000000..898506a0dc
--- /dev/null
+++ b/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
@@ -0,0 +1,45 @@
+From 72138a67c8e6b0154aadc1b5fcb3d661033fbcd3 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Thu, 13 Jun 2019 02:13:47 +0300
+Subject: [PATCH] Do not use pkg-config to find wayland-scanner when cross
+ building
+
+When cross-compiling it is still needed to run a native wayland-scanner,
+but many tools for the task will still have pkg-config return the
+location of wayland-scanner for the target in some location which may
+be the same as for some native installation of wayland-scanner; but
+which is not the copy of the program that the compilation system wants
+packages to use (which are typically in a "host tools" directory
+elsewhere).
+
+This disables usage of pkg-config to find wayland-scanner when
+cross-compiling because most tools for the job will set $PATH in a way
+that the correct installation of the tool will be found first.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://github.com/swaywm/wlroots/pull/1722]
+
+---
+ protocol/meson.build | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/protocol/meson.build b/protocol/meson.build
+index 7cc10320..73c06b24 100644
+--- a/protocol/meson.build
++++ b/protocol/meson.build
+@@ -1,6 +1,11 @@
+ wl_protocol_dir = wayland_protos.get_pkgconfig_variable('pkgdatadir')
+ 
+-wayland_scanner_dep = dependency('wayland-scanner', required: false, native: true)
++if meson.is_cross_build()
++	wayland_scanner_dep = disabler()
++else
++	wayland_scanner_dep = dependency('wayland-scanner', required: false, native: true)
++endif
++
+ if wayland_scanner_dep.found()
+ 	wayland_scanner = find_program(
+ 		wayland_scanner_dep.get_pkgconfig_variable('wayland_scanner'),
+-- 
+2.22.0
+
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
new file mode 100644
index 0000000000..2852f74b0c
--- /dev/null
+++ b/package/wlroots/Config.in
@@ -0,0 +1,62 @@
+config BR2_PACKAGE_WLROOTS
+	bool "wlroots"
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
+	depends on BR2_ENABLE_LOCALE # libinput
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
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
+comment "wlroots requires udev, mesa3d w/ EGL and GLES support"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+	  !BR2_PACKAGE_MESA3D_OPENGL_ES || !BR2_PACKAGE_HAS_UDEV
+
+if BR2_PACKAGE_WLROOTS
+
+config BR2_PACKAGE_WLROOTS_RDP
+	bool "RDP backend support"
+	depends on BR2_PACKAGE_FREERDP
+	help
+	  Support Wayland sessions served using the RDP protocol
+
+comment "RDP backend support needs freerdp"
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
2.22.0
