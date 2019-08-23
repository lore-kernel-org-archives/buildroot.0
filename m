From: Julien Olivain <juju@cotds.org>
Date: Fri, 23 Aug 2019 22:57:11 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/glslsandbox-player: new package
In-Reply-To: <20190704212523.11818-1-juju@cotds.org>
References: <20190704212523.11818-1-juju@cotds.org>
Message-ID: <20190823205711.23894-1-juju@cotds.org>
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
Changes v2 -> v3:
Included all Thomas' comments:
  - Config.in:
    - Remove shader download option, to not defeat buildroot download infra
    - Update scripts to Pytnon 3, and update dependencies
    - Mark all runtime dependencies with "# runtime"
    - Sort dependencies and options alphabetically
    - Replicate libdrm dependencies
    - Add missing dependency on xlib_libX11
  - .mk:
    - Update package to v2019.08.23
    - Use $(call github, ...) for _SITE
    - Sort blocks alphabetically
    - Use ifeq() ... else ifeq() for exclusive choices of backend
  - Add .hash file

Changes v1 -> v2:
  - add missing VIVFB windowing system
  - use a tag instead of commit id for version

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/glslsandbox-player/Config.in          | 108 ++++++++++++++++++
 .../glslsandbox-player.hash                   |   3 +
 .../glslsandbox-player/glslsandbox-player.mk  |  72 ++++++++++++
 5 files changed, 185 insertions(+)
 create mode 100644 package/glslsandbox-player/Config.in
 create mode 100644 package/glslsandbox-player/glslsandbox-player.hash
 create mode 100644 package/glslsandbox-player/glslsandbox-player.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e50ac78ae7..2bf0b612f9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1296,6 +1296,7 @@ F:	board/technexion/imx8mmpico/
 F:	board/technexion/imx8mpico/
 F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
+F:	package/glslsandbox-player/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index 710ed12be0..fe4f575922 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -275,6 +275,7 @@ comment "Graphic applications"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
+	source "package/glslsandbox-player/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
new file mode 100644
index 0000000000..973b8f6c98
--- /dev/null
+++ b/package/glslsandbox-player/Config.in
@@ -0,0 +1,108 @@
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
+	depends on !BR2_PACKAGE_PYTHON # python3
+	depends on !BR2_STATIC_LIBS # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on BR2_USE_MMU # bash, python3
+	depends on BR2_USE_WCHAR # python3
+	select BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_COREUTILS # runtime (timeout)
+	select BR2_PACKAGE_CURL # runtime
+	select BR2_PACKAGE_IMAGEMAGICK # runtime
+	select BR2_PACKAGE_JPEG # runtime
+	select BR2_PACKAGE_LIBCURL # runtime
+	select BR2_PACKAGE_LIBOPENSSL_BIN if BR2_PACKAGE_LIBOPENSSL # runtime
+	select BR2_PACKAGE_LIBRESSL_BIN if BR2_PACKAGE_LIBRESSL # runtime
+	select BR2_PACKAGE_MAKE # runtime
+	select BR2_PACKAGE_OPENSSL # runtime
+	select BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Install additional helper scripts
+
+choice
+	prompt "Native windowing system"
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL    if BR2_PACKAGE_WAYLAND
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11   if BR2_PACKAGE_XORG7
+	help
+	  Select the native windowing system you wish to use.
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
+	bool "KMS/DRM/GBM"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	select BR2_PACKAGE_LIBDRM
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
+	bool "Allwinner ARM/Mali Frame Buffer"
+	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI
+	bool "RaspberryPI Frame Buffer"
+	depends on BR2_PACKAGE_RPI_USERLAND
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2
+	bool "SDL2"
+	depends on BR2_PACKAGE_SDL2_OPENGLES
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX
+	bool "TI/SGX Frame Buffer"
+	depends on BR2_PACKAGE_TI_SGX_UM
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_VIVFB
+	bool "Vivante Frame Buffer"
+	depends on BR2_PACKAGE_IMX_GPU_VIV
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL
+	bool "Wayland"
+	depends on BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11
+	bool "X11"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
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
diff --git a/package/glslsandbox-player/glslsandbox-player.hash b/package/glslsandbox-player/glslsandbox-player.hash
new file mode 100644
index 0000000000..2d25b4bb40
--- /dev/null
+++ b/package/glslsandbox-player/glslsandbox-player.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3458294a50c3d2fd54f806e46dd7bfba5f1e6aedadd6c396c76d70793419432b  glslsandbox-player-v2019.08.23.tar.gz
+sha256  06a79395e8f3a4cc7ad068c6b59dfbe12c0efa4d27791e532345ceb1f41aea8a  LICENSE
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
new file mode 100644
index 0000000000..d6dfb8fc91
--- /dev/null
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# glslsandbox-player
+#
+################################################################################
+
+GLSLSANDBOX_PLAYER_VERSION = v2019.08.23
+GLSLSANDBOX_PLAYER_SITE = $(call github,jolivain,glslsandbox-player,$(GLSLSANDBOX_PLAYER_VERSION))
+GLSLSANDBOX_PLAYER_AUTORECONF = YES
+GLSLSANDBOX_PLAYER_DEPENDENCIES = libegl libgles host-pkgconf
+
+GLSLSANDBOX_PLAYER_LICENSE = BSD-2-Clause
+GLSLSANDBOX_PLAYER_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_PNG),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += libpng
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-libpng
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += --without-libpng
+endif
+
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_TESTING),y)
+GLSLSANDBOX_PLAYER_CONF_OPTS += \
+	--with-shader-list=shader-tests.list \
+	--enable-testing \
+	--enable-install-testsuite
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += \
+	--with-shader-list=shader-local.list \
+	--disable-testing
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
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += rpi-userland
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=rpi
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += sdl2
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=sdl2
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += ti-sgx-um
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=tisgx
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_VIVFB),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += imx-gpu-viv
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=vivfb
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += wayland
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=wl
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_IVI),y)
+GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-ivi
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-ivi
+endif
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += xlib_libX11
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=x11
+endif
+
+$(eval $(autotools-package))
-- 
2.21.0
