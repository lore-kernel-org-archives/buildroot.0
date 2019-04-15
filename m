From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 15 Apr 2019 16:01:14 -0600
Subject: [Buildroot] [PATCH 1/1] package/weston: bump to version 6.0.0
Message-ID: <20190415220114.90418-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autotools build system is in the process of being deprecated and
replaced with meson for weston.

We need to add a patch to deal with pkg-config not finding the correct
wayland-scanner.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...uild-search-path-for-wayland-scanner.patch |  27 +++++
 package/weston/Config.in                      |  13 +++
 package/weston/weston.hash                    |  10 +-
 package/weston/weston.mk                      | 100 +++++++++---------
 4 files changed, 96 insertions(+), 54 deletions(-)
 create mode 100644 package/weston/0002-protocol-meson.build-search-path-for-wayland-scanner.patch

diff --git a/package/weston/0002-protocol-meson.build-search-path-for-wayland-scanner.patch b/package/weston/0002-protocol-meson.build-search-path-for-wayland-scanner.patch
new file mode 100644
index 0000000000..9849c066ac
--- /dev/null
+++ b/package/weston/0002-protocol-meson.build-search-path-for-wayland-scanner.patch
@@ -0,0 +1,27 @@
+From 1bb5044ded35c1f79d2f0dded67ea401277d1ad8 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 15 Apr 2019 13:45:53 -0600
+Subject: [PATCH] protocol/meson.build: search path for wayland-scanner if not
+ found using pkg-config
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream-status:
+https://gitlab.freedesktop.org/wayland/weston/merge_requests/157]
+---
+ protocol/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/protocol/meson.build b/protocol/meson.build
+index 34026ff9..3bd4b9a1 100644
+--- a/protocol/meson.build
++++ b/protocol/meson.build
+@@ -1,5 +1,5 @@
+ dep_scanner = dependency('wayland-scanner', native: true)
+-prog_scanner = find_program(dep_scanner.get_pkgconfig_variable('wayland_scanner'))
++prog_scanner = find_program(dep_scanner.get_pkgconfig_variable('wayland_scanner'), 'wayland-scanner', native: true)
+ 
+ # XXX: For minor version 2 of zwp_linux_explicit_synchronization_v1, we
+ # actually need a development version after 1.17, but there is no way to
+-- 
+2.19.1
+
diff --git a/package/weston/Config.in b/package/weston/Config.in
index f874b0cc6a..243da7b6f3 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -100,7 +100,20 @@ comment "XWayland support needs libepoxy and X.org enabled"
 
 config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_USE_WCHAR # pango
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
+	depends on BR2_USE_MMU # pango
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+	select BR2_PACKAGE_PANGO
 	help
 	  This enables the installation of Weston's demo clients.
 
+comment "demo clients needs OpenGL EGL and a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_MESA3D_OPENGL_EGL
+
 endif
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 799d371dc0..d761600961 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2018-August/039359.html
-md5 752a04ce3c65af4884cfac4e57231bdb  weston-5.0.0.tar.xz
-sha1 56b42b1fbea9e120a8127736328e4c71ac781a57  weston-5.0.0.tar.xz
-sha256 15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf  weston-5.0.0.tar.xz
-sha512 b6f97eca014ea47f3de0c5ddd89712f896cd66423d0eb499e1d88d35aab616cef1e735ebb8e0cefd8b60085314b6ec3d56b39d7c4776188bb56d58efc84a52cf  weston-5.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-March/040356.html
+md5 7c634e262f8a464a076c97fd50ad36b3  weston-6.0.0.tar.xz
+sha1 feac9d9a77037580f39c0085a08a3c17a62dced0  weston-6.0.0.tar.xz
+sha256 546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612  weston-6.0.0.tar.xz
+sha512 127ab64b689f202acca4d9461e4decfd42357e4bbb63493af257b3b20b693a8ab4207b3c6b97663cefeed200505aad5f32b6a064db2e53fa1e201877613b394f  weston-6.0.0.tar.xz
 # locally computed
 sha256 0f0de7b7b1f65870139c95dde7abc19ed305631ae7c5d37c386db40cde108632  weston-rel_imx_4.9.51_8mq_ga.tar.gz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7fbe39b98e..2950987c22 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -8,9 +8,8 @@ ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
 WESTON_VERSION = rel_imx_4.9.51_8mq_ga
 WESTON_SITE = https://source.codeaurora.org/external/imx/weston-imx
 WESTON_SITE_METHOD = git
-WESTON_AUTORECONF = YES
 else
-WESTON_VERSION = 5.0.0
+WESTON_VERSION = 6.0.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 endif
@@ -18,29 +17,26 @@ WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm \
-	$(if $(BR2_PACKAGE_WEBP),webp)
+	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm
 
 WESTON_CONF_OPTS = \
-	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-	--disable-headless-compositor \
-	--disable-colord \
-	--disable-devdocs \
-	--disable-setuid-install
-
-WESTON_MAKE_OPTS = \
-	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
-
-# Uses VIDIOC_EXPBUF, only available from 3.8+
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
-WESTON_CONF_OPTS += --disable-simple-dmabuf-v4l-client
-endif
+	-Dremoting=false \
+	-Dbackend-headless=false \
+	-Dcolor-management-colord=false \
+	-Dsimple-dmabuf-drm=auto
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-WESTON_CONF_OPTS += --enable-dbus
+WESTON_CONF_OPTS += -Dlauncher-logind=true
 WESTON_DEPENDENCIES += dbus
 else
-WESTON_CONF_OPTS += --disable-dbus
+WESTON_CONF_OPTS += -Dlauncher-logind=false
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP),y)
+WESTON_CONF_OPTS += -Dimage-webp=true
+WESTON_DEPENDENCIES += webp
+else
+WESTON_CONF_OPTS += -Dimage-webp=false
 endif
 
 # weston-launch must be u+s root in order to work properly
@@ -51,10 +47,10 @@ endef
 define WESTON_USERS
 	- - weston-launch -1 - - - - Weston launcher group
 endef
-WESTON_CONF_OPTS += --enable-weston-launch
+WESTON_CONF_OPTS += -Dweston-launch=true
 WESTON_DEPENDENCIES += linux-pam
 else
-WESTON_CONF_OPTS += --disable-weston-launch
+WESTON_CONF_OPTS += -Dweston-launch=false
 endif
 
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
@@ -67,86 +63,92 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
-WESTON_CONF_OPTS += --enable-egl
+WESTON_CONF_OPTS += -Drenderer-gl=true
 WESTON_DEPENDENCIES += libegl libgles
+# Uses VIDIOC_EXPBUF, only available from 3.8+
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
+WESTON_CONF_OPTS +=	-Dsimple-clients=dmabuf-v4l
+else
+WESTON_CONF_OPTS +=	-Dsimple-clients=
+endif
 else
 WESTON_CONF_OPTS += \
-	--disable-egl \
-	--disable-simple-dmabuf-drm-client \
-	--disable-simple-egl-clients
+	-Drenderer-gl=false \
+	-Dsimple-clients=
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
 WESTON_DEPENDENCIES += freerdp
-WESTON_CONF_OPTS += --enable-rdp-compositor
+WESTON_CONF_OPTS += -Dbackend-rdp=true
 else
-WESTON_CONF_OPTS += --disable-rdp-compositor
+WESTON_CONF_OPTS += -Dbackend-rdp=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
 WESTON_CONF_OPTS += \
-	--enable-fbdev-compositor \
-	WESTON_NATIVE_BACKEND=fbdev-backend.so
+	-Dbackend-fbdev=true \
+	-Dbackend-default=fbdev
 else
-WESTON_CONF_OPTS += --disable-fbdev-compositor
+WESTON_CONF_OPTS += -Dbackend-fbdev=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
 WESTON_CONF_OPTS += \
-	--enable-drm-compositor \
-	WESTON_NATIVE_BACKEND=drm-backend.so
+	-Dbackend-drm=true \
+	-Dbackend-default=drm
 else
-WESTON_CONF_OPTS += --disable-drm-compositor
+WESTON_CONF_OPTS += -Dbackend-drm=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_X11),y)
 WESTON_CONF_OPTS += \
-	--enable-x11-compositor \
-	WESTON_NATIVE_BACKEND=x11-backend.so
+	-Dbackend-x11=true \
+	-Dbackend-default=x11
 WESTON_DEPENDENCIES += libxcb xlib_libX11
 else
-WESTON_CONF_OPTS += --disable-x11-compositor
+WESTON_CONF_OPTS += -Dbackend-x11=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
-WESTON_CONF_OPTS += --enable-xwayland
+WESTON_CONF_OPTS += -Dxwayland=true
 WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
 else
-WESTON_CONF_OPTS += --disable-xwayland
+WESTON_CONF_OPTS += -Dxwayland=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVA),y)
-WESTON_CONF_OPTS += --enable-vaapi-recorder
+WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=true
 WESTON_DEPENDENCIES += libva
 else
-WESTON_CONF_OPTS += --disable-vaapi-recorder
+WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=false
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-WESTON_CONF_OPTS += --enable-lcms
+WESTON_CONF_OPTS += -Dcolor-management-lcms=true
 WESTON_DEPENDENCIES += lcms2
 else
-WESTON_CONF_OPTS += --disable-lcms
+WESTON_CONF_OPTS += -Dcolor-management-lcms=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-WESTON_CONF_OPTS += --enable-systemd-login --enable-systemd-notify
+WESTON_CONF_OPTS += -Dsystemd=true
 WESTON_DEPENDENCIES += systemd
 else
-WESTON_CONF_OPTS += --disable-systemd-login --disable-systemd-notify
+WESTON_CONF_OPTS += -Dsystemd=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-WESTON_CONF_OPTS += --enable-junit-xml
+WESTON_CONF_OPTS += -Dtest-junit-xml=true
 WESTON_DEPENDENCIES += libxml2
 else
-WESTON_CONF_OPTS += --disable-junit-xml
+WESTON_CONF_OPTS += -Dtest-junit-xml=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
-WESTON_CONF_OPTS += --enable-demo-clients-install
+WESTON_CONF_OPTS += -Ddemo-clients=true
+WESTON_DEPENDENCIES += pango
 else
-WESTON_CONF_OPTS += --disable-demo-clients-install
+WESTON_CONF_OPTS += -Ddemo-clients=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.19.1
