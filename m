From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 23:26:58 +0200
Subject: [Buildroot] [git commit] sdl2: new package
Message-ID: <20151021212809.44F7981EE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5c6ba4eec6989a2d4bccefe109dbb7ecf28df8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Romain:
  - Wrap Config.in help text at 72 columns.
  - Move sdl2 package after sdl modules in Config.in. (Arnout)
  - Explicitly disable dbus and wayland.
  - Remove double underscore (SDL2__*).
  - Unify autotools options to use --enable/--disable.
  - Use x-includes and x-libraries to avoid path poisoning.
  - Remove xlib_libXrender, xproto_inputproto and xproto_scrnsaverproto
    dependencies since the build system doesn't depend on them.
  - Add Xlib_libXi, xlib_libScrnSaver and xlib_libXxf86vm dependencies.
  - Handle autotools options (--enable/--disable) for each X11
    dependencies.]

[Thomas:
  - Minor tweaks to Config.in
  - Addition of hash file.
  - Addition of SDL2_CONFIG_SCRIPTS, as suggested by Vincent Stehl??.]

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Yann E. Morin <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/sdl2/Config.in |   33 ++++++++++++++
 package/sdl2/sdl2.hash |    2 +
 package/sdl2/sdl2.mk   |  116 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 152 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7392363..9994bcd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -254,6 +254,7 @@ endif
 	source "package/sdl_net/Config.in"
 	source "package/sdl_sound/Config.in"
 	source "package/sdl_ttf/Config.in"
+	source "package/sdl2/Config.in"
 
 comment "Other GUIs"
 	source "package/efl/Config.in"
diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
new file mode 100644
index 0000000..b73611d
--- /dev/null
+++ b/package/sdl2/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_SDL2
+	bool "sdl2"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Simple DirectMedia Layer 2 - SDL2 is a library that allows
+	  programs portable low level access to a video framebuffer,
+	  audio output, mouse, and keyboard. It is not compatible with
+	  SDL1.
+
+	  http://www.libsdl.org/
+
+if BR2_PACKAGE_SDL2
+
+config BR2_PACKAGE_SDL2_DIRECTFB
+	bool "DirectFB video driver"
+	depends on BR2_PACKAGE_DIRECTFB
+
+comment "DirectFB video driver needs directfb"
+	depends on !BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_SDL2_X11
+	bool "X11 video driver"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+comment "X11 video driver needs X.org"
+	depends on !BR2_PACKAGE_XORG7
+
+endif
+
+comment "sdl2 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
new file mode 100644
index 0000000..6e8533f
--- /dev/null
+++ b/package/sdl2/sdl2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.3.tar.gz.sig
+sha256 a5a69a6abf80bcce713fa873607735fe712f44276a7f048d60a61bb2f6b3c90c SDL2-2.0.3.tar.gz
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
new file mode 100644
index 0000000..814cc19
--- /dev/null
+++ b/package/sdl2/sdl2.mk
@@ -0,0 +1,116 @@
+################################################################################
+#
+# sdl2
+#
+################################################################################
+
+SDL2_VERSION = 2.0.3
+SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
+SDL2_SITE = http://www.libsdl.org/release
+SDL2_LICENSE = zlib
+SDL2_LICENSE_FILES = COPYING.txt
+SDL2_INSTALL_STAGING = YES
+SDL2_CONFIG_SCRIPTS = sdl2-config
+
+SDL2_CONF_OPTS += \
+	--disable-rpath \
+	--disable-arts \
+	--disable-esd \
+	--disable-dbus \
+	--disable-pulseaudio \
+	--disable-video-opengl \
+	--disable-video-opengles \
+	--disable-video-wayland
+
+# We must enable static build to get compilation successful.
+SDL2_CONF_OPTS += --enable-static
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+SDL2_DEPENDENCIES += udev
+SDL2_CONF_OPTS += --enable-libudev
+else
+SDL2_CONF_OPTS += --disable-libudev
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
+SDL2_DEPENDENCIES += directfb
+SDL2_CONF_OPTS += --enable-video-directfb
+SDL2_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
+else
+SDL2_CONF_OPTS += --disable-video-directfb
+endif
+
+# x-includes and x-libraries must be set for cross-compiling
+# By default x_includes and x_libraries contains unsafe paths.
+# (/usr/X11R6/include and /usr/X11R6/lib)
+ifeq ($(BR2_PACKAGE_SDL2_X11),y)
+SDL2_DEPENDENCIES += xlib_libX11 xlib_libXext
+
+# X11/extensions/shape.h is provided by libXext.
+SDL2_CONF_OPTS += --enable-video-x11 \
+	--with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib  \
+	--enable-video-x11-xshape
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+SDL2_DEPENDENCIES += xlib_libXcursor
+SDL2_CONF_OPTS += --enable-video-x11-xcursor
+else
+SDL2_CONF_OPTS += --disable-video-x11-xcursor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+SDL2_DEPENDENCIES += xlib_libXinerama
+SDL2_CONF_OPTS += --enable-video-x11-xinerama
+else
+SDL2_CONF_OPTS += --disable-video-x11-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
+SDL2_DEPENDENCIES += xlib_libXi
+SDL2_CONF_OPTS += --enable-video-x11-xinput
+else
+SDL2_CONF_OPTS += --disable-video-x11-xinput
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+SDL2_DEPENDENCIES += xlib_libXrandr
+SDL2_CONF_OPTS += --enable-video-x11-xrandr
+else
+SDL2_CONF_OPTS += --disable-video-x11-xrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
+SDL2_DEPENDENCIES += xlib_libXScrnSaver
+SDL2_CONF_OPTS += --enable-video-x11-scrnsaver
+else
+SDL2_CONF_OPTS += --disable-video-x11-scrnsaver
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
+SDL2_DEPENDENCIES += xlib_libXxf86vm
+SDL2_CONF_OPTS += --enable-video-x11-vm
+else
+SDL2_CONF_OPTS += --disable-video-x11-vm
+endif
+
+else
+SDL2_CONF_OPTS += --disable-video-x11 --without-x
+endif
+
+ifeq ($(BR2_PACKAGE_TSLIB),y)
+SDL2_DEPENDENCIES += tslib
+SDL2_CONF_OPTS += --enable-input-tslib
+else
+SDL2_CONF_OPTS += --disable-input-tslib
+endif
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+SDL2_DEPENDENCIES += alsa-lib
+SDL2_CONF_OPTS += --enable-alsa
+else
+SDL2_CONF_OPTS += --disable-alsa
+endif
+
+$(eval $(autotools-package))
