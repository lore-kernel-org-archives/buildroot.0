From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue,  4 Jun 2019 16:36:33 +0200
Subject: [Buildroot] [PATCH v2] package/sfml: new package
Message-ID: <20190604143632.5018-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on raspberry_pi2 with X11 and opengl, the graphic and netword modules seems
to work correctly but the audio shown problems with libalsa at runtime. I?m assuming
that this is more likely to be imputed to an incomplete defconfig than the library
itself since all other modules are working as expected.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
Changes v1 --> v2:
 - Fix coding style
 - Add entry to DEVELOPERS
 - Remove unnecessary comments
 - Set modules to off by defautl
 - Fix dependencies
---
 DEVELOPERS             |  3 +++
 package/Config.in      |  1 +
 package/sfml/Config.in | 59 ++++++++++++++++++++++++++++++++++++++++++
 package/sfml/sfml.hash |  3 +++
 package/sfml/sfml.mk   | 52 +++++++++++++++++++++++++++++++++++++
 5 files changed, 118 insertions(+)
 create mode 100644 package/sfml/Config.in
 create mode 100644 package/sfml/sfml.hash
 create mode 100644 package/sfml/sfml.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7025ac69ef..295dee7414 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2254,6 +2254,9 @@ F:	package/llvm/
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
+N:	Victor Huesca <victor.huesca@bootlin.com>
+F:	package/sfml/
+
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
 F:	package/utp_com/
diff --git a/package/Config.in b/package/Config.in
index f61009410d..43927c3638 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -315,6 +315,7 @@ comment "Graphic libraries"
 	source "package/sdl2_mixer/Config.in"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
+	source "package/sfml/Config.in"
 	source "package/tk/Config.in"
 
 comment "Other GUIs"
diff --git a/package/sfml/Config.in b/package/sfml/Config.in
new file mode 100644
index 0000000000..8d8916fb04
--- /dev/null
+++ b/package/sfml/Config.in
@@ -0,0 +1,59 @@
+config BR2_PACKAGE_SFML
+	bool "SFML"
+	help
+	  Simple and Fast Multimedia Library 2 - SFML provides a simple
+	  interface to the various components of your PC, to ease the
+	  development of games and multimedia applications. It is
+	  composed of five modules: system, window, graphics, audio and
+	  network.
+
+	  https://www.sfml-dev.org/
+
+if BR2_PACKAGE_SFML
+
+config BR2_PACKAGE_SFML_EXAMPLES
+	bool "examples"
+	help
+	  This boolean option controls whether the SFML examples are
+	  built alongside the library or not.
+
+comment "Window and Graphics modules needs X11 and an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_SFML_WINDOW
+	bool "window"
+	depends on BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_XORG7 # for rendering
+	depends on BR2_PACKAGE_HAS_UDEV # SFML/Window/Unix/joystickImpl.hpp
+	help
+	  This boolean option controls whether the SFML window module is
+	  built or not.
+
+config BR2_PACKAGE_SFML_GRAPHICS
+	bool "graphics"
+	depends on BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_XORG7 # window
+	depends on BR2_PACKAGE_HAS_UDEV # window
+	select BR2_PACKAGE_SFML_WINDOW
+	help
+	  This boolean option controls whether the SFML graphics module
+	  is built or not. This module allow 2D drawing functionalities.
+
+config BR2_PACKAGE_SFML_AUDIO
+	bool "audio"
+	depends on BR2_USE_WCHAR # flac
+	depends on BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
+	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPENAL
+	help
+	  This boolean option controls whether the SFML audio module is
+	  built or not.
+
+config BR2_PACKAGE_SFML_NETWORK
+	bool "network"
+	help
+	  This boolean option controls whether the SFML network module
+	  is built or not.
+
+endif
diff --git a/package/sfml/sfml.hash b/package/sfml/sfml.hash
new file mode 100644
index 0000000000..689db5afea
--- /dev/null
+++ b/package/sfml/sfml.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	438c91a917cc8aa19e82c6f59f8714da353c488584a007d401efac8368e1c785	sfml-2.5.1.tar.gz
+sha256	8143f9ad51ddf0a5b0629beabf8e1432ac3e5a2f3b62b510f3b16712e4bb9143	license.md
diff --git a/package/sfml/sfml.mk b/package/sfml/sfml.mk
new file mode 100644
index 0000000000..d2b05e4de6
--- /dev/null
+++ b/package/sfml/sfml.mk
@@ -0,0 +1,52 @@
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
+
+SFML_CONF_OPTS += \
+	-DSFML_BUILD_DOC=OFF \
+	-DSFML_USE_SYSTEM_DEP=ON \
+	-DSFML_INSTALL_PKGCONFIG_FILES=ON
+
+ifeq ($(BR2_PACKAGE_SFML_EXAMPLES),y)
+SFML_CONF_OPTS += -DSFML_BUILD_EXAMPLES=ON
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_WINDOW),y)
+SFML_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER), xlib_libXrender) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR), xlib_libXrandr) \
+	libgl udev
+SFML_CONF_OPTS += -DSFML_BUILD_WINDOW=ON
+else
+SFML_CONF_OPTS += -DSFML_BUILD_WINDOW=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_GRAPHICS),y)
+SFML_DEPENDENCIES += jpeg freetype
+SFML_CONF_OPTS += -DSFML_BUILD_GRAPHICS=ON
+else
+SFML_CONF_OPTS += -DSFML_BUILD_GRAPHICS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_AUDIO),y)
+SFML_DEPENDENCIES += openal libogg libvorbis flac
+SFML_CONF_OPTS += -DSFML_BUILD_AUDIO=ON
+else
+SFML_CONF_OPTS += -DSFML_BUILD_AUDIO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SFML_NETWORK),y)
+SFML_CONF_OPTS += -DSFML_BUILD_NETWORK=ON
+else
+SFML_CONF_OPTS += -DSFML_BUILD_NETWORK=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.21.0
