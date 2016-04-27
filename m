From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2016 10:12:02 -0300
Subject: [Buildroot] [PATCH v2] mpv: new package
Message-ID: <1461762722-10026-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Changes for v2:
 * As pointed by Arnout add missing inherited nios2 exclusion (ffmpeg)

 package/Config.in                                  |   1 +
 ...ript-don-t-check-for-fork-on-POSIX-checks.patch |  31 +++
 package/mpv/Config.in                              |  17 ++
 package/mpv/mpv.hash                               |   3 +
 package/mpv/mpv.mk                                 | 255 +++++++++++++++++++++
 5 files changed, 307 insertions(+)
 create mode 100644 package/mpv/0001-wscript-don-t-check-for-fork-on-POSIX-checks.patch
 create mode 100644 package/mpv/Config.in
 create mode 100644 package/mpv/mpv.hash
 create mode 100644 package/mpv/mpv.mk

diff --git a/package/Config.in b/package/Config.in
index 1a5b267..c49f219 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -29,6 +29,7 @@ menu "Audio and video applications"
 	source "package/mpd-mpc/Config.in"
 	source "package/mpg123/Config.in"
 	source "package/mplayer/Config.in"
+	source "package/mpv/Config.in"
 	source "package/multicat/Config.in"
 	source "package/musepack/Config.in"
 	source "package/ncmpc/Config.in"
diff --git a/package/mpv/0001-wscript-don-t-check-for-fork-on-POSIX-checks.patch b/package/mpv/0001-wscript-don-t-check-for-fork-on-POSIX-checks.patch
new file mode 100644
index 0000000..544c03c
--- /dev/null
+++ b/package/mpv/0001-wscript-don-t-check-for-fork-on-POSIX-checks.patch
@@ -0,0 +1,31 @@
+From 61aea32efe675e584121295452fc7ab2a652d021 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 20 Apr 2016 09:39:30 -0300
+Subject: [PATCH] wscript: don't check for fork() on POSIX checks
+
+It's not being used, and in fact prevents mpv from being built in nommu
+architectures (cortex M, blackfin, ...)
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: pull request https://github.com/mpv-player/mpv/pull/3068
+
+ wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index a4ffce6..40328e4 100644
+--- a/wscript
++++ b/wscript
+@@ -127,7 +127,7 @@ main_dependencies = [
+         'desc': 'POSIX environment',
+         # This should be good enough.
+         'func': check_statement(['poll.h', 'unistd.h', 'sys/mman.h'],
+-            'struct pollfd pfd; poll(&pfd, 1, 0); fork(); int f[2]; pipe(f); munmap(f,0)'),
++            'struct pollfd pfd; poll(&pfd, 1, 0); int f[2]; pipe(f); munmap(f,0)'),
+     }, {
+         'name': 'posix-or-mingw',
+         'desc': 'development environment',
+-- 
+2.7.3
+
diff --git a/package/mpv/Config.in b/package/mpv/Config.in
new file mode 100644
index 0000000..0f5aa97
--- /dev/null
+++ b/package/mpv/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_MPV
+	bool "mpv"
+	depends on !BR2_nios2 # ffmpeg
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	select BR2_PACKAGE_ZLIB
+	help
+	  mpv is a fork of mplayer2 and MPlayer. It shares some features
+	  with the former projects while introducing many more.
+
+	  https://mpv.io/
+
+comment "mpv needs a toolchain w/ threads"
+	depends on !BR2_nios2
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
new file mode 100644
index 0000000..da51f3a
--- /dev/null
+++ b/package/mpv/mpv.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	602cd2b0f5fc7e43473234fbb96e3f7bbb6418f15eb8fa720d9433cce31eba6e	v0.17.0.tar.gz
+sha256	01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b	waf-1.8.12
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
new file mode 100644
index 0000000..0032eb5
--- /dev/null
+++ b/package/mpv/mpv.mk
@@ -0,0 +1,255 @@
+################################################################################
+#
+# mpv
+#
+################################################################################
+
+MPV_VERSION = 0.17.0
+MPV_WAF_VERSION = 1.8.12
+MPV_SITE = https://github.com/mpv-player/mpv/archive
+MPV_SOURCE = v$(MPV_VERSION).tar.gz
+MPV_EXTRA_DOWNLOADS = https://waf.io/waf-$(MPV_WAF_VERSION)
+MPV_DEPENDENCIES = \
+	host-pkgconf ffmpeg zlib \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+MPV_LICENSE = GPLv2+
+MPV_LICENSE_FILES = LICENSE
+
+# Some of these options need testing and/or tweaks
+MPV_CONF_OPTS = \
+	--prefix=/usr \
+	--disable-android \
+	--disable-caca \
+	--disable-cdda \
+	--disable-cocoa \
+	--disable-coreaudio \
+	--disable-gpl3 \
+	--disable-libguess \
+	--disable-libv4l2 \
+	--disable-opensles \
+	--disable-rpi \
+	--disable-rsound \
+	--disable-rubberband \
+	--disable-uchardet \
+	--disable-vapoursynth \
+	--disable-vapoursynth-lazy \
+	--disable-vdpau
+
+# ALSA support requires pcm+mixer
+ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
+MPV_CONF_OPTS += --enable-alsa
+MPV_DEPENDENCIES += alsa-lib
+else
+MPV_CONF_OPTS += --disable-alsa
+endif
+
+# GBM support is provided by mesa3d when EGL=y
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+MPV_CONF_OPTS += --enable-gbm
+MPV_DEPENDENIES += mesa3d
+else
+MPV_CONF_OPTS += --disable-gbm
+endif
+
+# jack support
+ifeq ($(BR2_PACKAGE_JACK2),y)
+MPV_CONF_OPTS += --enable-jack
+MPV_DEPENDENCIES += jack2
+else
+MPV_CONF_OPTS += --disable-jack
+endif
+
+# jpeg support
+ifeq ($(BR2_PACKAGE_JPEG),y)
+MPV_CONF_OPTS += --enable-jpeg
+MPV_DEPENDENCIES += jpeg
+else
+MPV_CONF_OPTS += --disable-jpeg
+endif
+
+# lcms2 support
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+MPV_CONF_OPTS += --enable-lcms2
+MPV_DEPENDENCIES += lcms2
+else
+MPV_CONF_OPTS += --disable-lcms2
+endif
+
+# libarchive support
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+MPV_CONF_OPTS += --enable-libarchive
+MPV_DEPENDENCIES += libarchive
+else
+MPV_CONF_OPTS += --disable-libarchive
+endif
+
+# libass subtitle support
+ifeq ($(BR2_PACKAGE_LIBASS),y)
+MPV_CONF_OPTS += --enable-libass
+MPV_DEPENDENCIES += libass
+else
+MPV_CONF_OPTS += --disable-libass
+endif
+
+# bluray support
+ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
+MPV_CONF_OPTS += --enable-libbluray
+MPV_DEPENDENCIES += libbluray
+else
+MPV_CONF_OPTS += --disable-libbluray
+endif
+
+# libdvdnav
+ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
+MPV_CONF_OPTS += --enable-dvdnav
+MPV_DEPENDENCIES += libdvdnav
+else
+MPV_CONF_OPTS += --disable-dvdnav
+endif
+
+# libdvdread
+ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
+MPV_CONF_OPTS += --enable-dvdread
+MPV_DEPENDENCIES += libdvdread
+else
+MPV_CONF_OPTS += --disable-dvdread
+endif
+
+# libdrm
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+MPV_CONF_OPTS += --enable-drm
+MPV_DEPENDENCIES += libdrm
+else
+MPV_CONF_OPTS += --disable-drm
+endif
+
+# libenca support
+ifeq ($(BR2_PACKAGE_LIBENCA),y)
+MPV_CONF_OPTS += --enable-enca
+MPV_DEPENDENCIES += libenca
+else
+MPV_CONF_OPTS += --disable-enca
+endif
+
+# LUA support, only for lua51/lua52/luajit
+# This enables the controller (OSD) together with libass
+ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUAJIT),y)
+MPV_CONF_OPTS += --enable-lua
+MPV_DEPENDENCIES += luainterpreter
+else
+MPV_CONF_OPTS += --disable-lua
+endif
+
+# OpenGL support
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+MPV_CONF_OPTS += --enable-gl --enable-standard-gl
+MPV_DEPENDENCIES += libgl
+else
+MPV_CONF_OPTS += --disable-gl --disable-standard-gl
+endif
+
+# pulseaudio support
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+MPV_CONF_OPTS += --enable-pulse
+MPV_DEPENDENCIES += pulseaudio
+else
+MPV_CONF_OPTS += --disable-pulse
+endif
+
+# samba support
+ifeq ($(BR2_PACKAGE_SAMBA4),y)
+MPV_CONF_OPTS += --enable-libsmbclient
+MPV_DEPENDENCIES += samba4
+else
+MPV_CONF_OPTS += --disable-libsmbclient
+endif
+
+# SDL support
+# Both can't be used at the same time, prefer newer API
+ifeq ($(BR2_PACKAGE_SDL2),y)
+MPV_CONF_OPTS += --enable-sdl2 --disable-sdl1
+MPV_DEPENDENCIES += sdl2
+else ifeq ($(BR2_PACKAGE_SDL),y)
+MPV_CONF_OPTS += --enable-sdl1 --disable-sdl2
+MPV_DEPENDENCIES += sdl
+else
+MPV_CONF_OPTS += --disable-sdl1 --disable-sdl2
+endif
+
+# va-api support
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+MPV_CONF_OPTS += --enable-vaapi
+MPV_DEPENDENCIES += libva
+else
+MPV_CONF_OPTS += --disable-vaapi
+endif
+
+# wayland support
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+MPV_CONF_OPTS += --enable-wayland
+MPV_DEPENDENCIES += wayland
+else
+MPV_CONF_OPTS += --disable-wayland
+endif
+
+# Base X11 support
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+MPV_CONF_OPTS += --enable-x11 --disable-xss
+MPV_DEPENDENCIES += xlib_libX11
+# xext
+ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
+MPV_CONF_OPTS += --enable-xext
+MPV_DEPENDENCIES += xlib_libXext
+else
+MPV_CONF_OPTS += --disable-xext
+endif
+# xinerama
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+MPV_CONF_OPTS += --enable-xinerama
+MPV_DEPENDENCIES += xlib_libXinerama
+else
+MPV_CONF_OPTS += --disable-xinerama
+endif
+# xrandr
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+MPV_CONF_OPTS += --enable-xrandr
+MPV_DEPENDENCIES += xlib_libXrandr
+else
+MPV_CONF_OPTS += --disable-xrandr
+endif
+# XVideo
+ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
+MPV_CONF_OPTS += --enable-xv
+MPV_DEPENDENCIES += xlib_libXv
+else
+MPV_CONF_OPTS += --disable-xv
+endif
+else
+MPV_CONF_OPTS += --disable-x11
+endif
+
+define MPV_COPY_WAF
+	$(INSTALL) -m 0755 $(DL_DIR)/waf-$(MPV_WAF_VERSION) $(@D)/waf
+endef
+MPV_POST_EXTRACT_HOOKS += MPV_COPY_WAF
+
+define MPV_CONFIGURE_CMDS
+	cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		./waf configure $(MPV_CONF_OPTS)
+endef
+
+define MPV_BUILD_CMDS
+	cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		./waf build
+endef
+
+define MPV_INSTALL_TARGET_CMDS
+	cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		DESTDIR=$(TARGET_DIR) \
+		./waf install
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
