From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Thu,  2 Jul 2015 10:16:21 +0200
Subject: [Buildroot]  [PATCH V4] sdl2: new package
In-Reply-To: <20150629222241.GF3669@free.fr>
References: <20150629222241.GF3669@free.fr>
Message-ID: <1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Yann E. Morin <yann.morin.1998@free.fr>

---

Changes in V4:
* Fix comments places in Config.in

Changes in V3:
* Add dependenies comments for DirectFB and X11 options
* Fix license filename
* Add explicit enable/disable options for libudev
* Fix typo: s/succesful/successful/
* Add more X11 dependencies: x11-xcursor, x11-xinerama, x11-xinput, x11-scrnsaver
* Disbale opengl/opengles video diver explicitly
* Use --disable-rpath option option instead of manual fix

Changes in V2:
* Fix SDL2 case: s/SDL2/sdl2/
* Add dependency on toolchain with dynamic library
* Remove unneeded 'SDL2' in sub-options names
* Remove unneeded space after comma in if statement
* Add explicit enable/disable options for tslib and alsa
* Remove Mesa3D optional part
* Move unconditionnal SDL2_CONF_OPTS upper
* Remove host build


 package/Config.in      |  1 +
 package/sdl2/Config.in | 32 ++++++++++++++++++++++++
 package/sdl2/sdl2.mk   | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 package/sdl2/Config.in
 create mode 100644 package/sdl2/sdl2.mk

diff --git a/package/Config.in b/package/Config.in
index 13a7e74..3a1b5c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -246,6 +246,7 @@ endif
 	source "package/psplash/Config.in"
 	source "package/sawman/Config.in"
 	source "package/sdl/Config.in"
+	source "package/sdl2/Config.in"
 	source "package/sdl_gfx/Config.in"
 	source "package/sdl_image/Config.in"
 	source "package/sdl_mixer/Config.in"
diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
new file mode 100644
index 0000000..fe30650
--- /dev/null
+++ b/package/sdl2/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_SDL2
+	depends on !BR2_STATIC_LIBS
+	bool "sdl2"
+	help
+	  Simple DirectMedia Layer 2 - SDL2 is a library that allows
+	  programs portable low level access to a video framebuffer,
+	  audio output, mouse, and keyboard. It is not compatible with SDL1.
+
+	  http://www.libsdl.org/
+
+if BR2_PACKAGE_SDL2
+
+config BR2_PACKAGE_SDL2_DIRECTFB
+	bool "DirectFB video driver"
+	depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_SDL2_X11
+	bool "X11 video driver"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+comment "DirectFB video driver needs directfb"
+	depends on !BR2_PACKAGE_DIRECTFB
+
+comment "X11 video driver needs X.org"
+	depends on !BR2_PACKAGE_XORG7
+
+endif
+
+comment "sdl2 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
new file mode 100644
index 0000000..424cfcb
--- /dev/null
+++ b/package/sdl2/sdl2.mk
@@ -0,0 +1,68 @@
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
+
+SDL2_CONF_OPTS += \
+	--disable-rpath \
+	--disable-arts \
+	--disable-esd \
+	--disable-pulseaudio \
+	--disable-video-opengl \
+	--disable-video-opengles
+
+# We must enable static build to get compilation successful.
+SDL2_CONF_OPTS += --enable-static
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+SDL2__DEPENDENCIES += udev
+SDL2__CONF_OPTS += --enable-libudev
+else
+SDL2_CONF_OPTS += --disable-libudev
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
+SDL2_DEPENDENCIES += directfb
+SDL2_CONF_OPTS += --enable-video-directfb=yes
+SDL2_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
+else
+SDL2_CONF_OPTS += --enable-video-directfb=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_X11),y)
+SDL2_CONF_OPTS += --enable-video-x11=yes --with-x
+SDL2_DEPENDENCIES += \
+	xlib_libX11 xlib_libXext \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXCURSOR,xlib_libXcursor) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA,xlib_libXinerama) \
+	$(if $(BR2_PACKAGE_XPROTO_INPUTPROTO,xproto_inputproto) \
+	$(if $(BR2_PACKAGE_XPROTO_SCRNSAVERPROTO,xproto_scrnsaverproto)
+else
+SDL2_CONF_OPTS += --enable-video-x11=no --without-x
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
-- 
1.8.4.5
