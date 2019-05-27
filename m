From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 27 May 2019 17:39:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/sfml: new package
Message-ID: <20190527153906.24339-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 package/Config.in      |   1 +
 package/sfml/Config.in | 116 +++++++++++++++++++++++++++++++++++++++++
 package/sfml/sfml.hash |   3 ++
 package/sfml/sfml.mk   |  79 ++++++++++++++++++++++++++++
 4 files changed, 199 insertions(+)
 create mode 100644 package/sfml/Config.in
 create mode 100644 package/sfml/sfml.hash
 create mode 100644 package/sfml/sfml.mk

diff --git a/package/Config.in b/package/Config.in
index f592e74a99..149bda9c6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Graphic libraries"
 	source "package/sdl2_mixer/Config.in"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
+	source "package/sfml/Config.in"
 	source "package/tk/Config.in"
 
 comment "Other GUIs"
diff --git a/package/sfml/Config.in b/package/sfml/Config.in
new file mode 100644
index 0000000000..76cf95df36
--- /dev/null
+++ b/package/sfml/Config.in
@@ -0,0 +1,116 @@
+config BR2_PACKAGE_SFML
+	bool "sfml"
+	# depends on BR2_PACKAGE_HAS_UDEV
+
+	help
+	  Simple and Fast Multimedia Library 2 - SFML provides a simple 
+	  interface to the various components of your PC, to ease the 
+	  development of games and multimedia applications. It is composed 
+	  of five modules: system, window, graphics, audio and network. 
+
+	  https://www.sfml-dev.org/
+
+
+if BR2_PACKAGE_SFML
+
+# X11 and OpenGL related stuff
+
+config BR2_PACKAGE_SFML_X11
+	bool "X11 video driver"
+	depends on BR2_PACKAGE_XORG7
+	# select BR2_PACKAGE_XLIB_LIBX11
+
+comment "X11 video driver needs X.org"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_SFML_OPENGL
+	bool "OpenGL (GLX)"
+	depends on BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_SFML_X11
+
+comment "OpenGL support needs X11 and an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_SFML_X11
+
+
+
+
+# Exemples
+config BR2_PACKAGE_SFML_EXAMPLES
+	bool "examples"
+	help
+	  This boolean option controls whether the SFML examples are 
+	  built alongside the library or not.
+
+
+
+# Allow to select only Audio, Window, Graphics or Network
+config BR2_PACKAGE_SFML_CUSTOM_MODULES
+	bool "custom modules"
+	help
+	  Allow to select only a subset of modules.
+
+if BR2_PACKAGE_SFML_CUSTOM_MODULES
+
+config BR2_PACKAGE_SFML_AUDIO
+	bool "audio"
+	default y
+	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPENAL
+	help
+	  This boolean option controls whether the SFML audio module 
+	  is built or not.
+
+config BR2_PACKAGE_SFML_GRAPHICS
+	bool "graphics"
+	default y
+	select BR2_PACKAGE_SFML_WINDOW
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_JPEG
+	help
+	  This boolean option controls whether the SFML graphics module 
+	  is built or not.
+
+config BR2_PACKAGE_SFML_WINDOW
+	bool "window"
+	default y
+	depends on BR2_PACKAGE_SFML_X11
+	help
+	  This boolean option controls whether the SFML window module 
+	  is built or not.
+
+config BR2_PACKAGE_SFML_NETWORK
+	bool "network"
+	default y
+	help
+	  This boolean option controls whether the SFML network module 
+	  is built or not. 
+
+endif # BR2_PACKAGE_SFML_CUSTOM_MODULES
+
+
+# TODO: Check if it can build w/ the internals libraries 
+# Use buildroot libs by default
+config BR2_PACKAGE_SFML_EXTLIB
+	bool "extlibs"
+	default y
+	help
+	  This boolean option controls whether the dependencies from 
+	  the extlibs directory are used or whether the system 
+	  dependencies are used. The stb_image_* header in the extlibs 
+	  directory are used regardless of this option. 
+
+
+config BR2_PACKAGE_SFML_PKGCONF
+	bool "install pkg-config file"
+	depends on BR2_PACKAGE_PKGCONF
+	default y
+	help
+	  This boolean option controls whether CMake will install the 
+	  pkg-config files on your system or not. 
+
+
+endif
+
+comment "SFML needs a toolchain w/ thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sfml/sfml.hash b/package/sfml/sfml.hash
new file mode 100644
index 0000000000..c3d96836e2
--- /dev/null
+++ b/package/sfml/sfml.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	438c91a917cc8aa19e82c6f59f8714da353c488584a007d401efac8368e1c785	sfml-2.5.1.tar.gz
+sha256	8143f9ad51ddf0a5b0629beabf8e1432ac3e5a2f3b62b510f3b16712e4bb9143	license.md
\ No newline at end of file
diff --git a/package/sfml/sfml.mk b/package/sfml/sfml.mk
new file mode 100644
index 0000000000..5db4c1b29e
--- /dev/null
+++ b/package/sfml/sfml.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# sfml
+#
+################################################################################
+
+SFML_VERSION = 2.5.1
+SFML_SITE = $(call github,SFML,SFML,$(SFML_VERSION))
+SFML_LICENSE = Zlib
+SFML_LICENSE_FILES = license.md
+SFML_INSTALL_STAGING = YES 
+SFML_DEPENDENCIES = udev #pthread
+
+
+# x-includes and x-libraries must be set for cross-compiling
+# By default x_includes and x_libraries contains unsafe paths.
+# (/usr/X11R6/include and /usr/X11R6/lib)
+ifeq ($(BR2_PACKAGE_SFML_X11),y)
+SFML_DEPENDENCIES += xlib_libX11 xlib_libXext
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_OPENGL),y)
+SFML_DEPENDENCIES += libgl
+endif
+
+
+# Make sure to disable documentation
+SFML_CONF_OPTS += -DSFML_BUILD_DOC=OFF
+
+
+# Build type
+ifeq ($(BR2_ENABLE_DEBUG),y)
+SFML_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
+else
+SFML_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+endif
+
+
+# Exemples
+ifeq ($(BR2_PACKAGE_SFML_EXAMPLES),y)
+SFML_CONF_OPTS += -DSFML_BUILD_EXAMPLES=ON
+else
+SFML_CONF_OPTS += -DSFML_BUILD_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_AUDIO),y)
+SFML_DEPENDENCIES += openal libogg libvorbis flac
+SFML_CONF_OPTS += -DSFML_BUILD_AUDIO=ON
+else
+SFML_CONF_OPTS += -DSFML_BUILD_AUDIO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_GRAPHICS),y)
+SFML_DEPENDENCIES += jpeg freetype
+SFML_CONF_OPTS += -DSFML_BUILD_GRAPHICS=ON
+else
+SFML_CONF_OPTS += -DSFML_BUILD_GRAPHICS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_WINDOW),y)
+SFML_CONF_OPTS += -DSFML_BUILD_WINDOW=ON
+else
+SFML_CONF_OPTS += -DSFML_BUILD_WINDOW=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_NETWORK),y)
+SFML_CONF_OPTS += -DSFML_BUILD_NETWORK=ON
+endif
+
+# Do not used provided external libs
+ifneq ($(BR2_PACKAGE_SFML_EXTLIB),y)
+SFML_CONF_OPTS += -DSFML_USE_SYSTEM_DEP=ON
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_PKGCONF),y)
+SFML_CONF_OPTS += -DSFML_INSTALL_PKGCONFIG_FILES=ON
+endif
+
+$(eval $(cmake-package))
\ No newline at end of file
-- 
2.21.0
