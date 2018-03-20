From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 20 Mar 2018 10:48:55 -0400
Subject: [Buildroot] [PATCH 2/8] gst-plugins-{base, good, bad,
 ugly}: bump to 1.14
In-Reply-To: <20180320144901.9032-1-aduskett@gmail.com>
References: <20180320144901.9032-1-aduskett@gmail.com>
Message-ID: <20180320144901.9032-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are grouped together because several plugins have been re-arranged and
there is no way to individually update each plugin package.

Changes:

Add the following to gst1-plugins-base and remove them from plugins-bad:
 - opengl
 - gles2
 - glx
 - egl
 - x11
 - wayland
 - dispmanx
 - audiomixer

Add the following to plugins-good and remove them from plugins-ugly:
 - lame
 - mpg123

Also add hashes for the license files.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      | 125 +--------------------
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |   5 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  47 +-------
 package/gstreamer1/gst1-plugins-base/Config.in     | 125 +++++++++++++++++++++
 .../gst1-plugins-base/gst1-plugins-base.hash       |   5 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |  63 ++++++++++-
 package/gstreamer1/gst1-plugins-good/Config.in     |  12 ++
 .../gst1-plugins-good/gst1-plugins-good.hash       |   5 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |  17 ++-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |   5 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  16 +--
 11 files changed, 230 insertions(+), 195 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 7e166e43a1..716e506309 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -11,102 +11,6 @@ if BR2_PACKAGE_GST1_PLUGINS_BAD
 
 comment "libraries with external dependencies"
 
-menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL
-	bool "opengl"
-	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
-
-if BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
-	def_bool BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
-
-comment "The opengl library needs an API, a platform and a window system"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
-
-comment "APIs"
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
-	bool
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
-	bool "opengl"
-	default y
-	depends on BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_LIBGLU
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
-
-comment "opengl needs an OpenGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBGL
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2
-	bool "gles2"
-	default y
-	depends on BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
-
-comment "gles2 needs an OpenGL ES backend"
-	depends on !BR2_PACKAGE_HAS_LIBGLES
-
-comment "Platforms"
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
-	bool
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX
-	bool "glx"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	depends on !BR2_PACKAGE_RPI_USERLAND # x11
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
-	help
-	  OpenGL Extension to the X Window System
-
-comment "glx not supported with rpi-userland"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
-comment "glx needs the opengl API and modular X.org"
-	depends on !BR2_PACKAGE_RPI_USERLAND && \
-		(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL || \
-		!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
-	bool "egl"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
-
-comment "egl needs an API and an EGL backend"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API || \
-		!BR2_PACKAGE_HAS_LIBEGL
-
-comment "Window systems"
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
-	bool
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11
-	bool "x11"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
-	depends on !BR2_PACKAGE_RPI_USERLAND
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
-
-comment "x11 not supported with rpi-userland"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
-comment "x11 needs a platform and X.org"
-	depends on !BR2_PACKAGE_RPI_USERLAND && \
-		(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM || \
-		!BR2_PACKAGE_XORG7)
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
 	bool "wayland"
 	default y
@@ -119,24 +23,6 @@ comment "wayland needs the egl platform and the wayland package"
 	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL || \
 		!BR2_PACKAGE_WAYLAND
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX
-	bool "dispmanx"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
-	depends on BR2_PACKAGE_RPI_USERLAND
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
-	help
-	  Raspberry Pi's Dispmanx windowing system
-
-comment "dispmanx needs the egl platform and rpi-userland"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL || \
-		!BR2_PACKAGE_RPI_USERLAND
-
-endif
-
-comment "opengl needs an OpenGL or OpenGL ES backend"
-	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
-
 comment "dependency-less plugins"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP
@@ -174,11 +60,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD
 	help
 	  Audio filters plugin
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER
-	bool "audiomixer"
-	help
-	  Audio mixer plugin
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX
 	bool "audiomixmatrix"
 	help
@@ -513,10 +394,10 @@ comment "fdk-aac needs a toolchain w/ C++"
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 	bool "gl"
 	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
 
-comment "gl needs the gst1-plugins-bad opengl library"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+comment "gl needs the gst1-plugins-base opengl library"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 	bool "hls"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 752d50a56d..420b780903 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.4.tar.xz.sha256sum
-sha256 0c7857be16686d5c1ba6e34bd338664d3d4599d32714a8eca5c8a41a101e2d08 gst-plugins-bad-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.0.tar.xz.sha256sum
+sha256 ed5e2badb6f2858f60017b93334d91fe58a0e3f85ed2f37f2e931416fafb4f9f gst-plugins-bad-1.14.0.tar.xz
+sha256 0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223 COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 83cb94be81..acbd1f04fb 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.12.4
+GST1_PLUGINS_BAD_VERSION = 1.14.0
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -72,44 +72,6 @@ GST1_PLUGINS_BAD_CONF_ENV += \
 	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-opengl
-GST1_PLUGINS_BAD_DEPENDENCIES += libgl libglu
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-opengl
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-gles2
-GST1_PLUGINS_BAD_DEPENDENCIES += libgles
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-gles2
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-glx
-GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libXrender
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-glx
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-egl
-GST1_PLUGINS_BAD_DEPENDENCIES += libegl
-GST1_PLUGINS_BAD_CONF_ENV += \
-	CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
-	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs egl`"
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-egl
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-x11
-GST1_PLUGINS_BAD_DEPENDENCIES += xlib_libX11 xlib_libXext
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-x11
-endif
-
 ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND)$(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-wayland
 GST1_PLUGINS_BAD_DEPENDENCIES += wayland wayland-protocols
@@ -117,13 +79,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-wayland
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dispmanx
-GST1_PLUGINS_BAD_DEPENDENCIES += rpi-userland
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dispmanx
-endif
-
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += orc
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-orc
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 6b08b68cf2..93e2c16069 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -111,6 +111,131 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 
 comment "plugins with external dependencies"
 
+menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+	bool "opengl"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
+if BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+	def_bool BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+
+comment "The opengl library needs an API, a platform and a window system"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+
+comment "APIs"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
+	bool "opengl"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
+
+comment "opengl needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2
+	bool "gles2"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
+
+comment "gles2 needs an OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
+comment "Platforms"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX
+	bool "glx"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
+	depends on !BR2_PACKAGE_RPI_USERLAND # x11
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
+	help
+	  OpenGL Extension to the X Window System
+
+comment "glx not supported with rpi-userland"
+	depends on BR2_PACKAGE_RPI_USERLAND
+
+comment "glx needs the opengl API and modular X.org"
+	depends on !BR2_PACKAGE_RPI_USERLAND && \
+		(!BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL || \
+		!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+	bool "egl"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
+
+comment "egl needs an API and an EGL backend"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API || \
+		!BR2_PACKAGE_HAS_LIBEGL
+
+comment "Window systems"
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
+	bool "x11"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
+	depends on !BR2_PACKAGE_RPI_USERLAND
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+
+comment "x11 not supported with rpi-userland"
+	depends on BR2_PACKAGE_RPI_USERLAND
+
+comment "x11 needs a platform and X.org"
+	depends on !BR2_PACKAGE_RPI_USERLAND && \
+		(!BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM || \
+		!BR2_PACKAGE_XORG7)
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND
+	bool "wayland"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+
+comment "wayland needs the egl platform and the wayland package"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL || \
+		!BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX
+	bool "dispmanx"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+	depends on BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
+	help
+	  Raspberry Pi's Dispmanx windowing system
+
+comment "dispmanx needs the egl platform and rpi-userland"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL || \
+		!BR2_PACKAGE_RPI_USERLAND
+endif
+
+comment "opengl needs an OpenGL or OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	bool "alsa (mandatory for audio playback)"
 	select BR2_PACKAGE_ALSA_LIB
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index b935f2f6dc..bfa61780fb 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.4.tar.xz.sha256sum
-sha256 4c306b03df0212f1b8903784e29bb3493319ba19ebebf13b0c56a17870292282 gst-plugins-base-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.0.tar.xz.sha256sum
+sha256 7e904660ff56e02b036cf7fdfb77a50a540828ca9d2614d69ba931772e5b6940 gst-plugins-base-1.14.0.tar.xz
+sha256 78fb5977f177ab71cba77a4a127d29b93cb1ca5c25962204b31f183a20cf5c7a COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 10361ee3c6..71ea964e09 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.12.4
+GST1_PLUGINS_BASE_VERSION = 1.14.0
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -24,13 +24,64 @@ GST1_PLUGINS_BASE_CONF_OPTS += \
 
 GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1
 
-# These plugins are liste in the order from ./configure --help
-
+# These plugins are listed in the order from ./configure --help
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += orc
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-orc
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-opengl
+GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-opengl
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-gles2
+GST1_PLUGINS_BASE_DEPENDENCIES += libgles
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-gles2
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-glx
+GST1_PLUGINS_BASE_DEPENDENCIES += xproto_glproto xlib_libXrender
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-glx
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-egl
+GST1_PLUGINS_BASE_DEPENDENCIES += libegl
+GST1_PLUGINS_BASE_CONF_ENV += \
+	CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs egl`"
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-egl
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-x11
+GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-x11
+endif
+
+ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND)$(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_WAYLAND),)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-wayland
+GST1_PLUGINS_BASE_DEPENDENCIES += wayland wayland-protocols
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-wayland
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-dispmanx
+GST1_PLUGINS_BASE_DEPENDENCIES += rpi-userland
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-dispmanx
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER),y)
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-adder
 else
@@ -49,6 +100,12 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += --disable-audioconvert
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOMIXER),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiomixer
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiomixer
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE),y)
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiorate
 else
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 097f32d779..447738fd14 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -261,6 +261,18 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
 
 comment "plugins with external dependencies"
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
+	bool "lame (*.mp3 audio encoder)"
+	select BR2_PACKAGE_LAME
+	help
+	  Encode MP3s with LAME
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MPG123
+	bool "mpg123 (*.mp3 audio)"
+	select BR2_PACKAGE_MPG123
+	help
+	  mp3 decoding based on the mpg123 library
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS
 	bool "ossaudio (OSS audio)"
 	help
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index c6f6138154..999e2883cd 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.4.tar.xz.sha256sum
-sha256 649f49bec60892d47ee6731b92266974c723554da1c6649f21296097715eb957 gst-plugins-good-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.0.tar.xz.sha256sum
+sha256 6afa35747d528d3ab4ed8f5eac13f7235d7d28100d6a24dd78f81ec7c0d04688 gst-plugins-good-1.14.0.tar.xz
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 53e2341586..91a0a67af7 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.12.4
+GST1_PLUGINS_GOOD_VERSION = 1.14.0
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -175,6 +175,21 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += --disable-isomp4
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-lame
+GST1_PLUGINS_GOOD_DEPENDENCIES += lame
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-lame
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MPG123),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-mpg123
+GST1_PLUGINS_GOOD_DEPENDENCIES += mpg123
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-mpg123
+endif
+
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAW),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --enable-law
 else
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index d0581531d4..f942653af1 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.4.tar.xz.sha256sum
-sha256 1c165b8d888ed350acd8e6ac9f6fe06508e6fcc0a3afc6ccc9fbeb30df9be522 gst-plugins-ugly-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.0.tar.xz.sha256sum
+sha256 3fb9ea5fc8a2de4b3eaec4128d71c6a2d81dd19befe1cd87cb833b98bcb542d1 gst-plugins-ugly-1.14.0.tar.xz
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index af02a560a8..ca50a790a6 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.12.4
+GST1_PLUGINS_UGLY_VERSION = 1.14.0
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -70,20 +70,6 @@ else
 GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdread
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-lame
-GST1_PLUGINS_UGLY_DEPENDENCIES += lame
-else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-lame
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpg123
-GST1_PLUGINS_UGLY_DEPENDENCIES += mpg123
-else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpg123
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
 GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
 GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
-- 
2.14.3
