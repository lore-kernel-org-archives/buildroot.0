From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2015 21:46:49 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: add support for opengl
Message-ID: <20150622201344.00CA1806B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=962ffda68cd9b0c4ab6055c97c14e762a5439571
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 83e29f2656a237e2c300d523776868837d3bc646 "gst1-plugins-bad: bump
version" (from 1.2.4 to 1.4.1) removed the configuration option for the
eglglessink plugin as a consequence of its removal in 1.3.1. However,
that commit did not add support for glimagesink, the plugin element to
be used as a replacement, which broke support for the EGL/GLES video
sink feature in Buildroot.

This new commit adds support for the OpenGL library and the
corresponding gl plugin, including the glimagesink element among others.

The plugin needs the library, but the library can also be used
separately in order to link custom plugins or applications against it.

The library needs at least one OpenGL API, one OpenGL platform and one
compatible window system. The implementations of these requirements that
Buildroot can currently provide are:
 - APIs: OpenGL, OpenGL ES 2.X,
 - platforms: GLX, EGL,
 - window systems: X11, Wayland, Dispmanx.

The wayland configure feature switch is shared between the corresponding
OpenGL library window system and the waylandsink plugin.

This has been tested with videotestsrc/omxmpeg4videodec/omxh264dec and
glimagesink on the Raspberry Pi, using OpenGL ES 2.X, EGL and Dispmanx.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      |  135 ++++++++++++++++++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |   71 +++++++++-
 2 files changed, 199 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 44fcdfb..76a601a 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -9,6 +9,133 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD
 
 if BR2_PACKAGE_GST1_PLUGINS_BAD
 
+comment "libraries with external dependencies"
+
+menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL
+	bool "opengl"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
+if BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+	def_bool BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+
+comment "The opengl library needs an API, a platform and a window system"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+
+comment "APIs"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
+	bool "opengl"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
+
+comment "opengl needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2
+	bool "gles2"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
+
+comment "gles2 needs an OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
+comment "Platforms"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX
+	bool "glx"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
+	depends on !BR2_PACKAGE_RPI_USERLAND # x11
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
+	help
+	  OpenGL Extension to the X Window System
+
+comment "glx not supported with rpi-userland"
+	depends on BR2_PACKAGE_RPI_USERLAND
+
+comment "glx needs the opengl API and modular X.org"
+	depends on !BR2_PACKAGE_RPI_USERLAND && \
+			(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL || \
+			!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
+	bool "egl"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
+
+comment "egl needs an API and an EGL backend"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API || \
+			!BR2_PACKAGE_HAS_LIBEGL
+
+comment "Window systems"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11
+	bool "x11"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
+	depends on !BR2_PACKAGE_RPI_USERLAND
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+
+comment "x11 not supported with rpi-userland"
+	depends on BR2_PACKAGE_RPI_USERLAND
+
+comment "x11 needs a platform and X.org"
+	depends on !BR2_PACKAGE_RPI_USERLAND && \
+			(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM || \
+			!BR2_PACKAGE_XORG7)
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
+	bool "wayland"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
+	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+
+comment "wayland needs the egl platform and the wayland package"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL || \
+			!BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX
+	bool "dispmanx"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
+	depends on BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+	help
+	  Raspberry Pi's Dispmanx windowing system
+
+comment "dispmanx needs the egl platform and rpi-userland"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL || \
+			!BR2_PACKAGE_RPI_USERLAND
+
+endif
+
+comment "opengl needs an OpenGL or OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
 comment "dependency-less plugins"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP
@@ -469,6 +596,14 @@ comment "rsvg plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_ARCH_HAS_ATOMICS
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
+	bool "gl"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+
+comment "gl needs the gst1-plugins-bad opengl library"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 0e00ffd..db323b9 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -85,6 +85,64 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+# RPI has odd locations for several required headers.
+GST1_PLUGINS_BAD_CONF_ENV += \
+	CPPFLAGS="$(TARGET_CPPFLAGS) \
+	-I$(STAGING_DIR)/usr/include/IL \
+	-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-opengl
+GST1_PLUGINS_BAD_DEPENDENCIES += libgl libglu
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-opengl
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-gles2
+GST1_PLUGINS_BAD_DEPENDENCIES += libgles
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-gles2
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-glx
+GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libXrender
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-glx
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-egl
+GST1_PLUGINS_BAD_DEPENDENCIES += libegl
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-egl
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-x11
+GST1_PLUGINS_BAD_DEPENDENCIES += xlib_libX11 xlib_libXext
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-x11
+endif
+
+ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND)$(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-wayland
+GST1_PLUGINS_BAD_DEPENDENCIES += wayland
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-wayland
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dispmanx
+GST1_PLUGINS_BAD_DEPENDENCIES += rpi-userland
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dispmanx
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += orc
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-orc
@@ -578,13 +636,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-directfb
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-wayland
-GST1_PLUGINS_BAD_DEPENDENCIES += wayland
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-wayland
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FAAD),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-faad
 GST1_PLUGINS_BAD_DEPENDENCIES += faad2
@@ -656,6 +707,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-rsvg
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-gl
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-gl
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL),y)
 GST1_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdl
