From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu,  7 May 2015 16:58:20 +0200
Subject: [Buildroot] [PATCH 2/2] gst1-plugins-bad: add support for opengl
In-Reply-To: <1431010700-3356-1-git-send-email-benoit@wsystem.com>
References: <1431010700-3356-1-git-send-email-benoit@wsystem.com>
Message-ID: <1431010700-3356-2-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      | 104 +++++++++++++++++++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  73 +++++++++++++--
 2 files changed, 170 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 44fcdfb..39d0817 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -9,6 +9,103 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD
 
 if BR2_PACKAGE_GST1_PLUGINS_BAD
 
+comment "libraries with external dependencies"
+
+menu "OpenGL"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+	def_bool BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+
+menu "APIs"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
+	bool "opengl"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2
+	bool "gles2"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
+
+endmenu
+
+menu "Platforms"
+depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX
+	bool "glx"
+	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
+	help
+	  OpenGL Extension to the X Window System
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
+	bool "egl"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
+
+endmenu
+
+comment "platforms need an API"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API
+
+menu "Window Systems"
+depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+	bool
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11
+	bool "x11"
+	depends on !BR2_PACKAGE_RPI_USERLAND
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+
+if BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
+	bool "wayland"
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX
+	bool "dispmanx"
+	depends on BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
+	help
+	  Raspberry Pi's Dispmanx windowing system
+
+endif
+
+endmenu
+
+comment "window systems need a platform"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
+
+comment "opengl needs an API, a platform and a window system"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+
+endmenu
+
 comment "dependency-less plugins"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP
@@ -469,6 +566,13 @@ comment "rsvg plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_ARCH_HAS_ATOMICS
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
+	bool "gl"
+	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+
+comment "gl needs the gst1-plugins-bad opengl library"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 0e00ffd..7708a07 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -85,6 +85,66 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 
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
+GST1_PLUGINS_BAD_DEPENDENCIES += libgl
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
+GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libX11 xlib_libXrender \
+					xlib_libXext libeet
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
+GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libX11 xlib_libXrender \
+					xlib_libXext libeet
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
@@ -578,13 +638,6 @@ else
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
@@ -656,6 +709,12 @@ else
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
-- 
2.1.0
