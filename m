From: Julien Olivain <juju@cotds.org>
Date: Tue, 23 Apr 2019 21:29:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/glslsandbox-player: new package
Message-ID: <20190423192917.4081-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GLSL Sandbox standalone player allow one to run and render
(most of) nice shaders available online on the
http://glslsandbox.com/ website, but without the need of an
Internet connection, a web browser or any of its
dependencies. Instead, the only requirement of
glslsandbox-player is a working EGL and GLESv2 libraries.

This package is useful for stressing and testing GLES shader
compiler in GPU drivers.

https://github.com/jolivain/glslsandbox-player

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/glslsandbox-player/Config.in          | 111 ++++++++++++++++++
 .../glslsandbox-player/glslsandbox-player.mk  |  84 +++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 package/glslsandbox-player/Config.in
 create mode 100644 package/glslsandbox-player/glslsandbox-player.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e5b69c3ade..dbe0270724 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1259,6 +1259,7 @@ F:	package/paho-mqtt-c
 N:	Julien Olivain <juju@cotds.org>
 F:	board/technexion/imx8mpico/
 F:	configs/imx8mpico_defconfig
+F:	package/glslsandbox-player/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index 091b16d02d..43bad27693 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -271,6 +271,7 @@ comment "Graphic applications"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
+	source "package/glslsandbox-player/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
new file mode 100644
index 0000000000..eacd060fc7
--- /dev/null
+++ b/package/glslsandbox-player/Config.in
@@ -0,0 +1,111 @@
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER
+	bool "glslsandbox-player"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	help
+	  GLSL Sandbox standalone player allow one to run and render
+	  (most of) nice shaders available online on the
+	  http://glslsandbox.com/ website, but without the need of an
+	  Internet connection, a web browser or any of its
+	  dependencies. Instead, the only requirement of
+	  glslsandbox-player is a working EGL and GLESv2 libraries.
+
+	  This package is useful for stressing and testing GLES shader
+	  compiler in GPU drivers.
+
+	  https://github.com/jolivain/glslsandbox-player
+
+if BR2_PACKAGE_GLSLSANDBOX_PLAYER
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_DL_SHADERS
+	bool "Download shaders from http://glslsandbox.com/"
+	help
+	  Download some shaders from http://glslsandbox.com/ to be
+	  embedded in the binary
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_PNG
+	bool "Enable PNG support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Enable PNG texture loading support
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_TESTING
+	bool "Enable testing"
+	help
+	  Generate and install test suite on target
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
+	bool "Install scripts"
+	depends on BR2_USE_MMU # bash, python
+	depends on BR2_USE_WCHAR # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python
+	depends on !BR2_STATIC_LIBS # python
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_BASH
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_CURL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_BIN if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBRESSL_BIN if BR2_PACKAGE_LIBRESSL
+	select BR2_PACKAGE_MAKE
+	select BR2_PACKAGE_COREUTILS
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_IMAGEMAGICK
+	help
+	  Install additional helper scripts
+
+choice
+	prompt "Native windowing system"
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL    if BR2_PACKAGE_WAYLAND
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11   if BR2_PACKAGE_XORG7
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
+	help
+	  Select the native windowing system you wish to use.
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
+	bool "KMS/DRM/GBM"
+	select BR2_PACKAGE_LIBDRM
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_VIVFB
+	bool "Vivante Frame Buffer"
+	depends on BR2_PACKAGE_IMX_GPU_VIV
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI
+	bool "RaspberryPI Frame Buffer"
+	depends on BR2_PACKAGE_RPI_USERLAND
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX
+	bool "TI/SGX Frame Buffer"
+	depends on BR2_PACKAGE_TI_SGX_UM
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
+	bool "Allwinner ARM/Mali Frame Buffer"
+	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL
+	bool "Wayland"
+	depends on BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11
+	bool "X11"
+	depends on BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2
+	bool "SDL2"
+	depends on BR2_PACKAGE_SDL2_OPENGLES
+
+endchoice
+
+if BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_IVI
+	bool "Wayland IVI shell support"
+endif
+
+endif
+
+comment "glslsandbox-player needs an openGL ES and EGL driver"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
new file mode 100644
index 0000000000..a0b40979c4
--- /dev/null
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -0,0 +1,84 @@
+################################################################################
+#
+# glslsandbox-player
+#
+################################################################################
+
+GLSLSANDBOX_PLAYER_VERSION = 2298dbba6e32118b3e7686eb03ad91cb3017249a
+GLSLSANDBOX_PLAYER_SITE = https://github.com/jolivain/glslsandbox-player
+GLSLSANDBOX_PLAYER_SITE_METHOD = git
+GLSLSANDBOX_PLAYER_AUTORECONF = YES
+GLSLSANDBOX_PLAYER_DEPENDENCIES = libegl libgles host-pkgconf
+
+GLSLSANDBOX_PLAYER_LICENSE = BSD-2-Clause
+GLSLSANDBOX_PLAYER_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_DL_SHADERS),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += host-libcurl
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-shader-list=shader-local.list
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_PNG),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += libpng
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-libpng
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += --without-libpng
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_TESTING),y)
+GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-testing --enable-install-testsuite
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-testing
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS),y)
+GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-install-scripts
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-install-scripts
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
+# gbm dependency is not needed, as it is normally packaged with
+# libegl/libgles drivers.
+GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += rpi-userland
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=rpi
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += ti-sgx-um
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=tisgx
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += wayland
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=wl
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_IVI),y)
+GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-ivi
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-ivi
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += xlib_libX11
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=x11
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += sdl2
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=sdl2
+endif
+
+$(eval $(autotools-package))
-- 
2.20.1
