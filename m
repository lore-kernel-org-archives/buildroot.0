From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 23:38:39 +0200
Subject: [Buildroot] [git commit] package/wlroots: new package
Message-ID: <20200425212525.2DADE9039E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db5bccc04489672ded8a639f97b19a18e85ddd70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wlroots is a modular library which provides building blocks to
implement Wayland compositors. wlroots is a dependency of the
Cage Wayland compositor.

https://github.com/swaywm/wlroots/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...pkg-config-to-find-wayland-scanner-when-c.patch | 45 ++++++++++++
 package/wlroots/Config.in                          | 49 +++++++++++++
 package/wlroots/wlroots.hash                       |  5 ++
 package/wlroots/wlroots.mk                         | 82 ++++++++++++++++++++++
 6 files changed, 183 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c57bc1c5c9..d6557f1143 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -99,6 +99,7 @@ F:	package/cog/
 F:	package/libepoxy/
 F:	package/libwpe/
 F:	package/webkitgtk/
+F:	package/wlroots/
 F:	package/woff2/
 F:	package/wpebackend-fdo/
 F:	package/wpewebkit/
diff --git a/package/Config.in b/package/Config.in
index 9a6461277e..6c55c5bc42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1460,6 +1460,7 @@ menu "Graphics"
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
index 0000000000..37261d0ca6
--- /dev/null
+++ b/package/wlroots/Config.in
@@ -0,0 +1,49 @@
+comment "wlroots needs udev, mesa3d w/ EGL and GLES support"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
+		!BR2_PACKAGE_HAS_UDEV
+
+comment "wlroots needs a toolchain w/ threads, locale, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
+		BR2_STATIC_LIBS
+
+config BR2_PACKAGE_WLROOTS
+	bool "wlroots"
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
+	depends on BR2_ENABLE_LOCALE # libinput
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	# Technically wlroots should work with any OpenGL implementation
+	# which provides EGL, GLES2, and libgbm; but in practice only
+	# Mesa ships an usable libgbm.
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
+if BR2_PACKAGE_WLROOTS
+
+config BR2_PACKAGE_WLROOTS_RDP
+	bool "RDP backend"
+	depends on BR2_PACKAGE_FREERDP
+	help
+	  Support Wayland sessions served using the RDP protocol
+
+config BR2_PACKAGE_WLROOTS_X11
+	bool "X11 backend"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Support Wayland sessions nested inside a X11 window
+
+endif
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
new file mode 100644
index 0000000000..6056a81ba5
--- /dev/null
+++ b/package/wlroots/wlroots.hash
@@ -0,0 +1,5 @@
+# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.8.1/wlroots-0.8.1.tar.gz.sig
+sha256 202b86e0e21699b6660bbda56afc2e3358db7252f83ff69c89f01926b4900d98  wlroots-0.8.1.tar.gz
+
+# Hashes for license files:
+sha256 ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
new file mode 100644
index 0000000000..52bc4c30e8
--- /dev/null
+++ b/package/wlroots/wlroots.mk
@@ -0,0 +1,82 @@
+################################################################################
+#
+# wlroots
+#
+################################################################################
+
+WLROOTS_VERSION = 0.8.1
+WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
+WLROOTS_LICENSE = MIT
+WLROOTS_INSTALL_STAGING = YES
+
+WLROOTS_DEPENDENCIES = \
+	host-pkgconf \
+	host-wayland \
+	libinput \
+	libxkbcommon \
+	mesa3d \
+	pixman \
+	udev \
+	wayland \
+	wayland-protocols
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
+ifeq ($(BR2_PACKAGE_LIBXCB),y)
+WLROOTS_CONF_OPTS += -Dxwayland=enabled
+WLROOTS_DEPENDENCIES += libxcb
+else
+WLROOTS_CONF_OPTS += -Dxwayland=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XCB_UTIL),y)
+WLROOTS_CONF_OPTS += -Dxcb-errors=enabled
+WLROOTS_DEPENDENCIES += xcb-util
+else
+WLROOTS_CONF_OPTS += -Dxcb-errors=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XCB_UTIL_WM),y)
+WLROOTS_CONF_OPTS += -Dxcb-icccm=enabled
+WLROOTS_DEPENDENCIES += xcb-util-wm
+else
+WLROOTS_CONF_OPTS += -Dxcb-icccm=disabled
+endif
+
+$(eval $(meson-package))
