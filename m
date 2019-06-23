From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 22 Jun 2019 18:23:01 -0600
Subject: [Buildroot] [PATCH 1/1] package/weston: replace autotools with meson
Message-ID: <20190623002301.89028-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autotools build system is in the process of being deprecated and
replaced with meson for weston.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/Config.in |  13 +++++
 package/weston/weston.mk | 100 ++++++++++++++++++++-------------------
 2 files changed, 64 insertions(+), 49 deletions(-)

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
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 152ffe1cf7..bf6f3c72a0 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -8,7 +8,6 @@ ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
 WESTON_VERSION = rel_imx_4.9.51_8mq_ga
 WESTON_SITE = https://source.codeaurora.org/external/imx/weston-imx
 WESTON_SITE_METHOD = git
-WESTON_AUTORECONF = YES
 else
 WESTON_VERSION = 6.0.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
@@ -18,30 +17,27 @@ WESTON_LICENSE = MIT
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
-	--disable-setuid-install \
-	--enable-autotools
-
-WESTON_MAKE_OPTS = \
-	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
-
-# Uses VIDIOC_EXPBUF, only available from 3.8+
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
-WESTON_CONF_OPTS += --disable-simple-dmabuf-v4l-client
-endif
+	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
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
@@ -52,10 +48,10 @@ endef
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
@@ -68,86 +64,92 @@ endif
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
2.20.1
