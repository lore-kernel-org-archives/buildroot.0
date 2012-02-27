From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 27 Feb 2012 14:05:18 +0100
Subject: [Buildroot] [PATCH 1/2] vlc: new package
In-Reply-To: <1330256732-26483-1-git-send-email-ismael.luceno@gmail.com>
References: <1330256732-26483-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <4F4B7F8E.4060602@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for the patch.

On 26/02/2012 12:45, Ismael Luceno wrote:
> Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
> ---
>  package/multimedia/Config.in                  |    1 +
>  package/multimedia/vlc/Config.in              |   14 ++
>  package/multimedia/vlc/vlc-uclibc-fixes.patch |   20 +++
>  package/multimedia/vlc/vlc.mk                 |  204 +++++++++++++++++++++++++
>  4 files changed, 239 insertions(+), 0 deletions(-)
>  create mode 100644 package/multimedia/vlc/Config.in
>  create mode 100644 package/multimedia/vlc/vlc-uclibc-fixes.patch
>  create mode 100644 package/multimedia/vlc/vlc.mk
> 
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index a05d1d9..fc20d74 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -44,6 +44,7 @@ source "package/multimedia/speex/Config.in"
>  source "package/multimedia/tidsp-binaries/Config.in"
>  source "package/multimedia/taglib/Config.in"
>  source "package/multimedia/tremor/Config.in"
> +source "package/multimedia/vlc/Config.in"
>  source "package/multimedia/vorbis-tools/Config.in"
>  source "package/multimedia/wavpack/Config.in"
>  endmenu
> diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
> new file mode 100644
> index 0000000..ee8d942
> --- /dev/null
> +++ b/package/multimedia/vlc/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_VLC
> +	bool "vlc"
> +	help
> +	  VLC
> +
> +if BR2_PACKAGE_VLC
> +
> +config BR2_PACKAGE_VLC_VLC
> +	bool "Build and install vlc"
> +	default y
> +	help
> +	  This will install the video player.

This is confusing. Why would you have a first option to build vlc, and
then another version to build vlc ?

> +endif
> diff --git a/package/multimedia/vlc/vlc-uclibc-fixes.patch b/package/multimedia/vlc/vlc-uclibc-fixes.patch
> new file mode 100644
> index 0000000..3ce60b3
> --- /dev/null
> +++ b/package/multimedia/vlc/vlc-uclibc-fixes.patch
> @@ -0,0 +1,20 @@
> +diff -u a/src/posix/linux_specific.c b/src/posix/linux_specific.c
> +--- a/src/posix/linux_specific.c	2012-02-08 16:43:30.000000000 -0200
> ++++ b/src/posix/linux_specific.c	2012-02-09 03:51:20.925504594 -0200
> +@@ -74,14 +74,14 @@
> +     return (path != NULL) ? path : strdup (PKGLIBDIR);
> + }
> + 
> +-#ifdef __GLIBC__
> ++#if defined(__GLIBC__) && !defined(__UCLIBC__)
> + # include <gnu/libc-version.h>
> + # include <stdlib.h>
> + #endif
> + 
> + void system_Init (void)
> + {
> +-#ifdef __GLIBC__
> ++#if defined(__GLIBC__) && !defined(__UCLIBC__)
> +     const char *glcv = gnu_get_libc_version ();
> + 
> +     /* gettext in glibc 2.5-2.7 is not thread-safe. LibVLC keeps crashing,
> diff --git a/package/multimedia/vlc/vlc.mk b/package/multimedia/vlc/vlc.mk
> new file mode 100644
> index 0000000..413dfd4
> --- /dev/null
> +++ b/package/multimedia/vlc/vlc.mk
> @@ -0,0 +1,204 @@
> +#############################################################
> +#
> +# vlc
> +#
> +#############################################################
> +VLC_VERSION = 500c190
> +# VLC_SOURCE = vlc-$(VLC_VERSION).tar.bz2
> +# VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
> +VLC_SITE = git://git.videolan.org/vlc.git

Remove the commented lines. Also, why use git instead of tarballs ?

> +VLC_CFLAGS = $(TARGET_CFLAGS)
> +VLC_LDFLAGS = $(TARGET_LDFLAGS)

This seems redundant with the defaults.

> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +VLC_DEPENDENCIES += alsa-lib
> +VLC_CONF_OPTS    += --enable-alsa
> +else
> +VLC_CONF_OPTS    += --disable-alsa
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DIRECTFB),y)
> +VLC_CONF_OPTS += --enable-directfb
> +VLC_DEPENDENCIES += directfb
> +else
> +VLC_CONF_OPTS += --disable-directfb
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL),y)
> +VLC_CONF_OPTS += --enable-sdl
> +VLC_DEPENDENCIES += sdl
> +else
> +VLC_CONF_OPTS += --disable-sdl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL_IMAGE),y)
> +VLC_CONF_OPTS += --enable-sdl-image
> +VLC_DEPENDENCIES += sdl_image
> +else
> +VLC_CONF_OPTS += --disable-sdl-image
> +endif
> +
> +ifeq ($(BR2_PACKAGE_VLC_VLC),y)
> +VLC_CONF_OPTS += --enable-vlc
> +else
> +VLC_CONF_OPTS += --disable-vlc
> +endif

Ah, I see what you meant here now. I would do it the other way around.
Having BR2_PACKAGE_VLC and BR2_PACKAGE_VLC_LIBVLC_ONLY options, with a
default for the latter to no, and such building vlc by default.

> +ifeq ($(BR2_PACKAGE_LIBMAD),y)
> +VLC_CONF_OPTS += --enable-mad
> +VLC_DEPENDENCIES += libmad
> +else
> +VLC_CONF_OPTS += --disable-mad
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TREMOR),y)
> +VLC_DEPENDENCIES += tremor
> +VLC_CONF_OPTS += --enable-tremor
> +else
> +VLC_CONF_OPTS += --disable-tremor
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +VLC_DEPENDENCIES += libpng
> +VLC_CONF_OPTS += --enable-png
> +else
> +VLC_CONF_OPTS += --disable-png
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FFMPEG),y)
> +VLC_DEPENDENCIES += ffmpeg
> +VLC_CONF_OPTS += --enable-avcodec
> +else
> +VLC_CONF_OPTS += --disable-avcodec
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
> +VLC_CONF_OPTS += --enable-postproc
> +else
> +VLC_CONF_OPTS += --disable-postproc
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
> +VLC_CONF_OPTS += --enable-swscale
> +else
> +VLC_CONF_OPTS += --disable-swscale
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DBUS),y)
> +VLC_DEPENDENCIES += dbus
> +VLC_CONF_OPTS += --enable-dbus
> +else
> +VLC_CONF_OPTS += --disable-dbus
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +VLC_DEPENDENCIES += libgcrypt
> +VLC_CONF_OPTS += --enable-libgcrypt
> +else
> +VLC_CONF_OPTS += --disable-libgcrypt
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBV4L),y)
> +VLC_DEPENDENCIES += libv4l
> +VLC_CONF_OPTS += --enable-libv4l2
> +else
> +VLC_CONF_OPTS += --disable-libv4l2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LUA),y)
> +VLC_DEPENDENCIES += lua
> +VLC_CONF_OPTS += --enable-lua
> +else
> +VLC_CONF_OPTS += --disable-lua
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBXCB),y)
> +VLC_DEPENDENCIES += libxcb
> +VLC_CONF_OPTS += --enable-xcb
> +else
> +VLC_CONF_OPTS += --disable-xcb
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIVE555),y)
> +VLC_DEPENDENCIES += live555
> +VLC_CONF_OPTS += --enable-live555
> +else
> +VLC_CONF_OPTS += --disable-live555
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> +VLC_DEPENDENCIES += xlib_libX11
> +VLC_CONF_OPTS += --with-x
> +else
> +VLC_CONF_OPTS += --without-x
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT),y)
> +VLC_DEPENDENCIES += qt
> +VLC_CONF_OPTS += --enable-qt4
> +else
> +VLC_CONF_OPTS += --disable-qt4
> +endif
> +
> +VLC_DEPENDENCIES += \
> +	$(if $(BR2_PACKAGE_FREETYPE),freetype) \
> +	$(if $(BR2_PACKAGE_FLAC),flac) \
> +	$(if $(BR2_PACKAGE_SPEEX),speex) \
> +	$(if $(BR2_PACKAGE_LIBVORBIS),libvorbis) \
> +	$(if $(BR2_PACKAGE_LIBTHEORA),libtheora) \
> +	$(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11) \
> +	$(if $(BR2_PACKAGE_XLIB_LIBXV),xlib_libXv)

Maybe you could add Kconfig options as well for all of these ? This
would be easier for the user to find out which options are available and
what they should or should not build.

> +# ARM optimizations
> +ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv7-a)
> +VLC_CONF_OPTS += --enable-neon
> +else
> +VLC_CONF_OPTS += --disable-neon
> +endif
> +
> +# FIXME: features disabled due lack of packages
> +VLC_CONF_OPTS += --disable-a52

Maybe the comment here is unecessary.

> +ifeq ($(BR2_i386),y)
> +VLC_CFLAGS += -fomit-frame-pointer
> +endif
> +
> +define VLC_CONFIGURE_CMDS
> +	echo $(VLC_VERSION) > $(@D)/src/revision.txt
> +	(cd $(@D); rm -rf config.cache; \
> +		test -x configure || ./bootstrap; \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		./configure \
> +		--prefix=/usr \
> +		--sysconfdir=/etc \
> +		--build=$(GNU_HOST_NAME) \
> +		--host=$(GNU_TARGET_NAME) \
> +		--disable-rpath \
> +		$(VLC_CONF_OPTS) \
> +		CXXFLAGS="$(VLC_CFLAGS)"; \
> +	)
> +	$(SED) '1i#define HAVE_VASPRINTF 1' $(@D)/config.h
> +endef
> +
> +define VLC_BUILD_CMDS
> +	$(MAKE) -C $(@D)
> +endef
> +
> +define VLC_INSTALL_TARGET_CMDS
> +	find $(@D) -name '*.la' -exec $(SED) '/^relink_command=/d' '{}' +
> +	touch $(@D)/modules/access/zip/libzip_plugin.la \
> +		$(@D)/modules/misc/liblogger_plugin.la
> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef
> +
> +define VLC_UNINSTALL_TARGET_CMDS
> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
> +endef
> +
> +define VLC_CLEAN_CMDS
> +	$(MAKE) -C $(@D) clean
> +endef
> +
> +$(eval $(call GENTARGETS))

You might want to use the autotargets here as it uses the autotools.

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
