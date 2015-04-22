From: =?windows-1252?Q?Guillaume_GARDET_-_Olis=E9o?= <guillaume.gardet@oliseo.fr>
Date: Wed, 22 Apr 2015 10:35:22 +0200
Subject: [Buildroot] [PATCH V2] sdl2: new package
In-Reply-To: <1427721269-8267-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <20150330145914.1f65f24c@free-electrons.com>
 <1427721269-8267-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <55375D4A.7060100@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping.

Guillaume


Le 30/03/2015 15:14, Guillaume GARDET a ?crit :
> Changes in V2:
> * Fix SDL2 case: s/SDL2/sdl2/
> * Add dependency on toolchain with dynamic library
> * Remove unneeded 'SDL2' in sub-options names
> * Remove unneeded space after comma in if statement
> * Add explicit enable/disable options for tslib and alsa
> * Remove Mesa3D optional part
> * Move unconditionnal SDL2_CONF_OPTS upper
> * Remove host build
>
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> ---
>   package/Config.in      |  1 +
>   package/sdl2/Config.in | 26 +++++++++++++++++++++
>   package/sdl2/sdl2.mk   | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 89 insertions(+)
>   create mode 100644 package/sdl2/Config.in
>   create mode 100644 package/sdl2/sdl2.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 566a78a..cf4949a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -219,6 +219,7 @@ endif
>   	source "package/psplash/Config.in"
>   	source "package/sawman/Config.in"
>   	source "package/sdl/Config.in"
> +	source "package/sdl2/Config.in"
>   	source "package/sdl_gfx/Config.in"
>   	source "package/sdl_image/Config.in"
>   	source "package/sdl_mixer/Config.in"
> diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
> new file mode 100644
> index 0000000..18e4f75
> --- /dev/null
> +++ b/package/sdl2/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_SDL2
> +	depends on !BR2_STATIC_LIBS
> +	bool "sdl2"
> +	help
> +	  Simple DirectMedia Layer 2 - SDL2 is a library that allows
> +	  programs portable low level access to a video framebuffer,
> +	  audio output, mouse, and keyboard. It is not compatible with SDL1.
> +
> +	  http://www.libsdl.org/
> +
> +comment "sdl2 needs a toolchain w/ dynamic library"
> +        depends on BR2_STATIC_LIBS
> +
> +if BR2_PACKAGE_SDL2
> +
> +config BR2_PACKAGE_SDL2_DIRECTFB
> +	bool "DirectFB video driver"
> +	depends on BR2_PACKAGE_DIRECTFB
> +
> +config BR2_PACKAGE_SDL2_X11
> +	bool "X11 video driver"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +
> +endif
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> new file mode 100644
> index 0000000..6a3caaf
> --- /dev/null
> +++ b/package/sdl2/sdl2.mk
> @@ -0,0 +1,62 @@
> +################################################################################
> +#
> +# sdl2
> +#
> +################################################################################
> +
> +SDL2_VERSION = 2.0.3
> +SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
> +SDL2_SITE = http://www.libsdl.org/release
> +SDL2_LICENSE = zlib
> +SDL2_LICENSE_FILES = COPYING
> +SDL2_INSTALL_STAGING = YES
> +
> +SDL2_CONF_OPTS += \
> +	--enable-pulseaudio=no \
> +	--disable-arts \
> +	--disable-esd
> +
> +# We must enable static build to get compilation succesful.
> +SDL2_CONF_OPTS += --enable-static
> +
> +ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
> +SDL2_DEPENDENCIES += directfb
> +SDL2_CONF_OPTS += --enable-video-directfb=yes
> +SDL2_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
> +else
> +SDL2_CONF_OPTS += --enable-video-directfb=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL2_X11),y)
> +SDL2_CONF_OPTS += --enable-video-x11=yes
> +SDL2_DEPENDENCIES += \
> +	xlib_libX11 xlib_libXext \
> +	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender) \
> +	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr)
> +else
> +SDL2_CONF_OPTS += --enable-video-x11=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TSLIB),y)
> +SDL2_DEPENDENCIES += tslib
> +SDL2_CONF_OPTS += --enable-input-tslib
> +else
> +SDL2_CONF_OPTS += --disable-input-tslib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +SDL2_DEPENDENCIES += alsa-lib
> +SDL2_CONF_OPTS += --enable-alsa
> +else
> +SDL2_CONF_OPTS += --disable-alsa
> +endif
> +
> +# Remove the -Wl,-rpath option.
> +define SDL2_FIXUP_SDL2_CONFIG
> +	$(SED) 's%-Wl,-rpath,\$${libdir}%%' \
> +		$(STAGING_DIR)/usr/bin/sdl2-config
> +endef
> +
> +SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_FIXUP_SDL2_CONFIG
> +
> +$(eval $(autotools-package))
