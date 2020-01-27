From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jan 2020 00:05:55 -0700
Subject: [Buildroot] [PATCH v7 3/3] package/weston: bump to version 8.0.0
In-Reply-To: <20200127070555.27400-1-james.hilliard1@gmail.com>
References: <20200127070555.27400-1-james.hilliard1@gmail.com>
Message-ID: <20200127070555.27400-3-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autotools build system is deprecated and replaced with meson for weston.

We need to enable pango when building demo clients since it is required
by meson.

The dbus option in autotools is replaced with launcher-logind in meson.

We need to explicitly set the image-webp option to avoid failures when
building without webp.

Replaced WESTON_NATIVE_BACKEND with backend-default in meson.

Added optional pipewire dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

---
Changes v6 -> v7:
  - bump weston from 7.0.0 to 8.0.0

Changes v5 -> v6:
  - add pipewire support

Changes v4 -> v5:
  - fix up demo clients dependencies

Changes v3 -> v4:
  - bump weston from 6.0.1 to 7.0.0

Changes v2 -> v3:
  - fix dmabuf-v4l headers check
  - add choice menu to select default weston backend

Changes v1 -> v2:
  - Require both systemd and dbus for launcher-logind
  - Move dmabuf-v4l out of egl/gl block
  - Update imx-gpu-g2d requirement block
---
 package/weston/Config.in   |  35 +++++++++++
 package/weston/weston.hash |  10 ++--
 package/weston/weston.mk   | 118 ++++++++++++++++++++-----------------
 3 files changed, 105 insertions(+), 58 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 5a5e288540..a707b64d00 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -35,6 +35,26 @@ config BR2_PACKAGE_WESTON
 
 if BR2_PACKAGE_WESTON
 
+choice
+	prompt "Backend default"
+	depends on BR2_PACKAGE_WESTON_FBDEV || \
+		BR2_PACKAGE_WESTON_DRM || \
+		BR2_PACKAGE_WESTON_X11
+
+config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_FBDEV
+	bool "fbdev"
+	depends on BR2_PACKAGE_WESTON_FBDEV
+
+config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_DRM
+	bool "drm"
+	depends on BR2_PACKAGE_WESTON_DRM
+
+config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_X11
+	bool "X11"
+	depends on BR2_PACKAGE_WESTON_X11
+
+endchoice
+
 # Helper to make sure at least one compositor is selected.
 config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	bool
@@ -102,7 +122,22 @@ comment "XWayland support needs libepoxy and X.org enabled"
 
 config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_USE_WCHAR # pango
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
+	depends on BR2_USE_MMU # pango
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+	select BR2_PACKAGE_PANGO
 	help
 	  This enables the installation of Weston's demo clients.
 
+comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGLES || \
+		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+
 endif
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index c9b2d4b1ce..0be1855a86 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-June/040661.html
-md5 e7b10710ef1eac82258f97bfd41fe534  weston-6.0.1.tar.xz
-sha1 3b39e454b3dc8dc32598790cfcc65728b448378b  weston-6.0.1.tar.xz
-sha256 bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a513155b4  weston-6.0.1.tar.xz
-sha512 3da04ff9b884480ce0824950347185e55584e3938021fe62014423d3d51577eafdda8de650a5de6eb37a842130c9cb14c7a952a560f6be93ff973164363af3d9  weston-6.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-January/041147.html
+md5 53e4810d852df0601d01fd986a5b22b3  weston-8.0.0.tar.xz
+sha1 80200a9c677d34c2de52230be444bd03ecd84229  weston-8.0.0.tar.xz
+sha256 7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51161927afa4329c027848  weston-8.0.0.tar.xz
+sha512 74853b0c9cabbabe942a2d057b65e4e97b48dc5f4df6d7b9ffc10ec52bc787009b12b900be6b426551902b920b7308baa967b7489761641dc9c31cf90440950c  weston-8.0.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 154ae38b83..ad15591e87 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,37 +4,33 @@
 #
 ################################################################################
 
-WESTON_VERSION = 6.0.1
+WESTON_VERSION = 8.0.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
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
+	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
+	-Dremoting=false \
+	-Dbackend-headless=false \
+	-Dcolor-management-colord=false
+
+ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
+WESTON_CONF_OPTS += -Dlauncher-logind=true
+WESTON_DEPENDENCIES += dbus systemd
+else
+WESTON_CONF_OPTS += -Dlauncher-logind=false
 endif
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
-WESTON_CONF_OPTS += --enable-dbus
-WESTON_DEPENDENCIES += dbus
+ifeq ($(BR2_PACKAGE_WEBP),y)
+WESTON_CONF_OPTS += -Dimage-webp=true
+WESTON_DEPENDENCIES += webp
 else
-WESTON_CONF_OPTS += --disable-dbus
+WESTON_CONF_OPTS += -Dimage-webp=false
 endif
 
 # weston-launch must be u+s root in order to work properly
@@ -45,93 +41,109 @@ endef
 define WESTON_USERS
 	- - weston-launch -1 - - - - Weston launcher group
 endef
-WESTON_CONF_OPTS += --enable-weston-launch
+WESTON_CONF_OPTS += -Dweston-launch=true
 WESTON_DEPENDENCIES += linux-pam
 else
-WESTON_CONF_OPTS += --disable-weston-launch
+WESTON_CONF_OPTS += -Dweston-launch=false
+endif
+
+# Uses VIDIOC_EXPBUF, only available from 3.8+
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
+WESTON_CONF_OPTS +=	-Dsimple-clients=dmabuf-v4l
+else
+WESTON_CONF_OPTS +=	-Dsimple-clients=
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
-WESTON_CONF_OPTS += --enable-egl
+WESTON_CONF_OPTS += -Drenderer-gl=true
 WESTON_DEPENDENCIES += libegl libgles
 else
 WESTON_CONF_OPTS += \
-	--disable-egl \
-	--disable-simple-dmabuf-drm-client \
-	--disable-simple-egl-clients
+	-Drenderer-gl=false
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
-WESTON_CONF_OPTS += \
-	--enable-fbdev-compositor \
-	WESTON_NATIVE_BACKEND=fbdev-backend.so
+WESTON_CONF_OPTS += -Dbackend-fbdev=true
+ifeq ($(BR2_PACKAGE_WESTON_DEFAULT_BACKEND_FBDEV),y)
+WESTON_CONF_OPTS += -Dbackend-default=fbdev
+endif
 else
-WESTON_CONF_OPTS += --disable-fbdev-compositor
+WESTON_CONF_OPTS += -Dbackend-fbdev=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
-WESTON_CONF_OPTS += \
-	--enable-drm-compositor \
-	WESTON_NATIVE_BACKEND=drm-backend.so
+WESTON_CONF_OPTS += -Dbackend-drm=true
+ifeq ($(BR2_PACKAGE_WESTON_DEFAULT_BACKEND_DRM),y)
+WESTON_CONF_OPTS += -Dbackend-default=drm
+endif
 else
-WESTON_CONF_OPTS += --disable-drm-compositor
+WESTON_CONF_OPTS += -Dbackend-drm=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_X11),y)
-WESTON_CONF_OPTS += \
-	--enable-x11-compositor \
-	WESTON_NATIVE_BACKEND=x11-backend.so
+WESTON_CONF_OPTS += -Dbackend-x11=true
+ifeq ($(BR2_PACKAGE_WESTON_DEFAULT_BACKEND_X11),y)
+WESTON_CONF_OPTS += -Dbackend-default=x11
+endif
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
+endif
+
+ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
+WESTON_CONF_OPTS += -Dpipewire=true
+WESTON_DEPENDENCIES += pipewire
+else
+WESTON_CONF_OPTS += -Dpipewire=false
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
