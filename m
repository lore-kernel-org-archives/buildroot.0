From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Thu, 26 Feb 2015 10:47:51 +0100
Subject: [Buildroot] [PATCH] sdl2: new package
Message-ID: <1424944071-6473-1-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/Config.in      |  1 +
 package/sdl2/Config.in | 22 +++++++++++++++++
 package/sdl2/sdl2.mk   | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 package/sdl2/Config.in
 create mode 100644 package/sdl2/sdl2.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..ad4d248 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -215,6 +215,7 @@ endif
 	source "package/psplash/Config.in"
 	source "package/sawman/Config.in"
 	source "package/sdl/Config.in"
+	source "package/sdl2/Config.in"
 	source "package/sdl_gfx/Config.in"
 	source "package/sdl_image/Config.in"
 	source "package/sdl_mixer/Config.in"
diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
new file mode 100644
index 0000000..5d0fe01
--- /dev/null
+++ b/package/sdl2/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_SDL2
+	bool "SDL2"
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
+	bool "SDL2 DirectFB video driver"
+	depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_SDL2_X11
+	bool "SDL2 X11 video driver"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+endif
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
new file mode 100644
index 0000000..b9aa907
--- /dev/null
+++ b/package/sdl2/sdl2.mk
@@ -0,0 +1,67 @@
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
+SDL2_LICENSE_FILES = COPYING
+SDL2_INSTALL_STAGING = YES
+
+# We must enable static build to get compilation successful.
+SDL2_CONF_OPTS = --enable-static
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
+SDL2_CONF_OPTS += --enable-video-x11=yes
+SDL2_DEPENDENCIES += \
+	xlib_libX11 xlib_libXext \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER), xlib_libXrender) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR), xlib_libXrandr)
+else
+SDL2_CONF_OPTS += --enable-video-x11=no
+endif
+
+ifeq ($(BR2_PACKAGE_TSLIB),y)
+SDL2_DEPENDENCIES += tslib
+endif
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+SDL2_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+SDL_DEPENDENCIES += mesa3d
+endif
+
+SDL2_CONF_OPTS += \
+	--enable-pulseaudio=no \
+	--disable-arts \
+	--disable-esd
+
+HOST_SDL2_CONF_OPTS += \
+	--enable-pulseaudio=no \
+	--enable-video-x11=no \
+	--disable-arts \
+	--disable-esd
+
+# Remove the -Wl,-rpath option.
+define SDL2_FIXUP_SDL2_CONFIG
+	$(SED) 's%-Wl,-rpath,\$${libdir}%%' \
+		$(STAGING_DIR)/usr/bin/sdl2-config
+endef
+
+SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_FIXUP_SDL2_CONFIG
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.4.5
