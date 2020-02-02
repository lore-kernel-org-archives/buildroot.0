From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 11:11:03 +0100
Subject: [Buildroot] [git commit] Revert "package/weston: bump to version
 8.0.0"
Message-ID: <20200202100033.27D4488245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2da33e963994faae5f206a3556b9bd80323740f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 4f217669de10f61d77e9ff834d9efdcee4efdf04 which
should not have been pushed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ally-include-sys-mman.h-in-os-compatibili.patch |  38 -------
 ...add-missing-defines-for-pre-v3.17-kernels.patch |  42 --------
 package/weston/Config.in                           |  35 ------
 package/weston/weston.hash                         |  10 +-
 package/weston/weston.mk                           | 118 +++++++++------------
 5 files changed, 58 insertions(+), 185 deletions(-)

diff --git a/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch b/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
deleted file mode 100644
index 0c632fbf35..0000000000
--- a/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 888dd1ae6a0261230b2bc47079d7b20df8c05e68 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 1 Feb 2020 20:02:29 -0700
-Subject: [PATCH] unconditionally include sys/mman.h in os-compatibility.c
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-../shared/os-compatibility.c:273:25: error: ???PROT_READ??? undeclared (first use in this function); did you mean ???LOCK_READ????
-  map = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, file->fd, 0);
-                         ^~~~~~~~~
-                         LOCK_READ
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/wayland/weston/merge_requests/368]
----
- shared/os-compatibility.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/shared/os-compatibility.c b/shared/os-compatibility.c
-index 5e1ce479..ddc37807 100644
---- a/shared/os-compatibility.c
-+++ b/shared/os-compatibility.c
-@@ -35,9 +35,7 @@
- #include <stdlib.h>
- #include <libweston/zalloc.h>
- 
--#ifdef HAVE_MEMFD_CREATE
- #include <sys/mman.h>
--#endif
- 
- #include "os-compatibility.h"
- 
--- 
-2.20.1
-
diff --git a/package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch b/package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch
deleted file mode 100644
index 39360f4fd2..0000000000
--- a/package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f43c98b23e0d7731cd8d7a9b4510c359f3df7930 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 1 Feb 2020 23:32:29 -0700
-Subject: [PATCH] add missing defines for pre-v3.17 kernels
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/wayland/weston/merge_requests/369]
----
- shared/os-compatibility.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/shared/os-compatibility.c b/shared/os-compatibility.c
-index ddc37807..26c39e67 100644
---- a/shared/os-compatibility.c
-+++ b/shared/os-compatibility.c
-@@ -39,6 +39,22 @@
- 
- #include "os-compatibility.h"
- 
-+#ifndef F_GET_SEALS
-+#define F_GET_SEALS	(1034)
-+#endif
-+
-+#ifndef F_SEAL_SHRINK
-+#define F_SEAL_SHRINK	0x0002
-+#endif
-+
-+#ifndef F_SEAL_GROW
-+#define F_SEAL_GROW	0x0004
-+#endif
-+
-+#ifndef F_SEAL_WRITE
-+#define F_SEAL_WRITE	0x0008
-+#endif
-+
- #define READONLY_SEALS (F_SEAL_SHRINK | F_SEAL_GROW | F_SEAL_WRITE)
- 
- int
--- 
-2.20.1
-
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 6a80285c62..f874b0cc6a 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -33,26 +33,6 @@ config BR2_PACKAGE_WESTON
 
 if BR2_PACKAGE_WESTON
 
-choice
-	prompt "Backend default"
-	depends on BR2_PACKAGE_WESTON_FBDEV || \
-		BR2_PACKAGE_WESTON_DRM || \
-		BR2_PACKAGE_WESTON_X11
-
-config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_FBDEV
-	bool "fbdev"
-	depends on BR2_PACKAGE_WESTON_FBDEV
-
-config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_DRM
-	bool "drm"
-	depends on BR2_PACKAGE_WESTON_DRM
-
-config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_X11
-	bool "X11"
-	depends on BR2_PACKAGE_WESTON_X11
-
-endchoice
-
 # Helper to make sure at least one compositor is selected.
 config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	bool
@@ -120,22 +100,7 @@ comment "XWayland support needs libepoxy and X.org enabled"
 
 config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
-	depends on BR2_USE_MMU # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_USE_WCHAR # pango
-	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
-	select BR2_PACKAGE_PANGO
 	help
 	  This enables the installation of Weston's demo clients.
 
-comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGLES || \
-		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND
-
 endif
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 0be1855a86..c9b2d4b1ce 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-January/041147.html
-md5 53e4810d852df0601d01fd986a5b22b3  weston-8.0.0.tar.xz
-sha1 80200a9c677d34c2de52230be444bd03ecd84229  weston-8.0.0.tar.xz
-sha256 7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51161927afa4329c027848  weston-8.0.0.tar.xz
-sha512 74853b0c9cabbabe942a2d057b65e4e97b48dc5f4df6d7b9ffc10ec52bc787009b12b900be6b426551902b920b7308baa967b7489761641dc9c31cf90440950c  weston-8.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-June/040661.html
+md5 e7b10710ef1eac82258f97bfd41fe534  weston-6.0.1.tar.xz
+sha1 3b39e454b3dc8dc32598790cfcc65728b448378b  weston-6.0.1.tar.xz
+sha256 bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a513155b4  weston-6.0.1.tar.xz
+sha512 3da04ff9b884480ce0824950347185e55584e3938021fe62014423d3d51577eafdda8de650a5de6eb37a842130c9cb14c7a952a560f6be93ff973164363af3d9  weston-6.0.1.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index ad15591e87..154ae38b83 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,33 +4,37 @@
 #
 ################################################################################
 
-WESTON_VERSION = 8.0.0
+WESTON_VERSION = 6.0.1
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm
+	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm \
+	$(if $(BR2_PACKAGE_WEBP),webp)
 
 WESTON_CONF_OPTS = \
-	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
-	-Dremoting=false \
-	-Dbackend-headless=false \
-	-Dcolor-management-colord=false
-
-ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
-WESTON_CONF_OPTS += -Dlauncher-logind=true
-WESTON_DEPENDENCIES += dbus systemd
-else
-WESTON_CONF_OPTS += -Dlauncher-logind=false
+	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
+	--disable-headless-compositor \
+	--disable-colord \
+	--disable-devdocs \
+	--disable-setuid-install \
+	--enable-autotools
+
+WESTON_MAKE_OPTS = \
+	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
+
+# Uses VIDIOC_EXPBUF, only available from 3.8+
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
+WESTON_CONF_OPTS += --disable-simple-dmabuf-v4l-client
 endif
 
-ifeq ($(BR2_PACKAGE_WEBP),y)
-WESTON_CONF_OPTS += -Dimage-webp=true
-WESTON_DEPENDENCIES += webp
+ifeq ($(BR2_PACKAGE_DBUS),y)
+WESTON_CONF_OPTS += --enable-dbus
+WESTON_DEPENDENCIES += dbus
 else
-WESTON_CONF_OPTS += -Dimage-webp=false
+WESTON_CONF_OPTS += --disable-dbus
 endif
 
 # weston-launch must be u+s root in order to work properly
@@ -41,109 +45,93 @@ endef
 define WESTON_USERS
 	- - weston-launch -1 - - - - Weston launcher group
 endef
-WESTON_CONF_OPTS += -Dweston-launch=true
+WESTON_CONF_OPTS += --enable-weston-launch
 WESTON_DEPENDENCIES += linux-pam
 else
-WESTON_CONF_OPTS += -Dweston-launch=false
-endif
-
-# Uses VIDIOC_EXPBUF, only available from 3.8+
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
-WESTON_CONF_OPTS +=	-Dsimple-clients=dmabuf-v4l
-else
-WESTON_CONF_OPTS +=	-Dsimple-clients=
+WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
-WESTON_CONF_OPTS += -Drenderer-gl=true
+WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl libgles
 else
 WESTON_CONF_OPTS += \
-	-Drenderer-gl=false
+	--disable-egl \
+	--disable-simple-dmabuf-drm-client \
+	--disable-simple-egl-clients
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
 WESTON_DEPENDENCIES += freerdp
-WESTON_CONF_OPTS += -Dbackend-rdp=true
+WESTON_CONF_OPTS += --enable-rdp-compositor
 else
-WESTON_CONF_OPTS += -Dbackend-rdp=false
+WESTON_CONF_OPTS += --disable-rdp-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
-WESTON_CONF_OPTS += -Dbackend-fbdev=true
-ifeq ($(BR2_PACKAGE_WESTON_DEFAULT_BACKEND_FBDEV),y)
-WESTON_CONF_OPTS += -Dbackend-default=fbdev
-endif
+WESTON_CONF_OPTS += \
+	--enable-fbdev-compositor \
+	WESTON_NATIVE_BACKEND=fbdev-backend.so
 else
-WESTON_CONF_OPTS += -Dbackend-fbdev=false
+WESTON_CONF_OPTS += --disable-fbdev-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
-WESTON_CONF_OPTS += -Dbackend-drm=true
-ifeq ($(BR2_PACKAGE_WESTON_DEFAULT_BACKEND_DRM),y)
-WESTON_CONF_OPTS += -Dbackend-default=drm
-endif
+WESTON_CONF_OPTS += \
+	--enable-drm-compositor \
+	WESTON_NATIVE_BACKEND=drm-backend.so
 else
-WESTON_CONF_OPTS += -Dbackend-drm=false
+WESTON_CONF_OPTS += --disable-drm-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_X11),y)
-WESTON_CONF_OPTS += -Dbackend-x11=true
-ifeq ($(BR2_PACKAGE_WESTON_DEFAULT_BACKEND_X11),y)
-WESTON_CONF_OPTS += -Dbackend-default=x11
-endif
+WESTON_CONF_OPTS += \
+	--enable-x11-compositor \
+	WESTON_NATIVE_BACKEND=x11-backend.so
 WESTON_DEPENDENCIES += libxcb xlib_libX11
 else
-WESTON_CONF_OPTS += -Dbackend-x11=false
+WESTON_CONF_OPTS += --disable-x11-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
-WESTON_CONF_OPTS += -Dxwayland=true
+WESTON_CONF_OPTS += --enable-xwayland
 WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
 else
-WESTON_CONF_OPTS += -Dxwayland=false
+WESTON_CONF_OPTS += --disable-xwayland
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVA),y)
-WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=true
+WESTON_CONF_OPTS += --enable-vaapi-recorder
 WESTON_DEPENDENCIES += libva
 else
-WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=false
+WESTON_CONF_OPTS += --disable-vaapi-recorder
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-WESTON_CONF_OPTS += -Dcolor-management-lcms=true
+WESTON_CONF_OPTS += --enable-lcms
 WESTON_DEPENDENCIES += lcms2
 else
-WESTON_CONF_OPTS += -Dcolor-management-lcms=false
+WESTON_CONF_OPTS += --disable-lcms
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-WESTON_CONF_OPTS += -Dsystemd=true
+WESTON_CONF_OPTS += --enable-systemd-login --enable-systemd-notify
 WESTON_DEPENDENCIES += systemd
 else
-WESTON_CONF_OPTS += -Dsystemd=false
+WESTON_CONF_OPTS += --disable-systemd-login --disable-systemd-notify
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-WESTON_CONF_OPTS += -Dtest-junit-xml=true
+WESTON_CONF_OPTS += --enable-junit-xml
 WESTON_DEPENDENCIES += libxml2
 else
-WESTON_CONF_OPTS += -Dtest-junit-xml=false
-endif
-
-ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
-WESTON_CONF_OPTS += -Dpipewire=true
-WESTON_DEPENDENCIES += pipewire
-else
-WESTON_CONF_OPTS += -Dpipewire=false
+WESTON_CONF_OPTS += --disable-junit-xml
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
-WESTON_CONF_OPTS += -Ddemo-clients=true
-WESTON_DEPENDENCIES += pango
+WESTON_CONF_OPTS += --enable-demo-clients-install
 else
-WESTON_CONF_OPTS += -Ddemo-clients=false
+WESTON_CONF_OPTS += --disable-demo-clients-install
 endif
 
-$(eval $(meson-package))
+$(eval $(autotools-package))
