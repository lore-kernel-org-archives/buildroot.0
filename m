From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:56:08 +0200
Subject: [Buildroot] [PATCH v7 08/31] package/kodi: bump to version
 17.1-Krypton
In-Reply-To: <20170429083751.19625-9-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-9-bernd.kuhls@t-online.de>
Message-ID: <20170429115608.0b9bf581@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied, after doing a number of minor tweaks. Also, there are a
few things that don't look completely good, and that I believe should be
addressed as follow-up patches.

On Sat, 29 Apr 2017 10:37:28 +0200, Bernd Kuhls wrote:

> +config BR2_PACKAGE_KODI_RTMPDUMP
> +	bool "kodi rtmp"

This prompt was quite useless, so I've changed it to "kodi rtmp support
removed".

> -comment "kodi needs an OpenGL or an openGL ES and EGL backend"
> -	depends on BR2_i386 || BR2_x86_64
> -	depends on !BR2_PACKAGE_KODI_GL && !BR2_PACKAGE_KODI_EGL_GLES
> +	depends on !BR2_PACKAGE_RPI_USERLAND # rpi depends on gles

I don't understand why you have this !BR2_PACKAGE_RPI_USERLAND
dependency here. Can you explain?

>  config BR2_PACKAGE_KODI_LIBVA
>  	bool "va"
> +	depends on !BR2_PACKAGE_KODI_EGL_GLES

What about using

	depends on BR2_PACKAGE_KODI_EGL_GL

here ?

> +	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBVA
>  	help
>  	  Enable libva support.
>  
> +comment "libva support needs X.org with an openGL backend"
> +	depends on !BR2_PACKAGE_XORG7 || BR2_PACKAGE_KODI_EGL_GLES

And ... || !BR2_PACKAGE_KODI_EGL_GL here ?

>  config BR2_PACKAGE_KODI_LIBVDPAU
>  	bool "vdpau"
> +	depends on !BR2_PACKAGE_KODI_EGL_GLES

Same suggestion.

> +KODI_SUBDIR = project/cmake
> +
> +KODI_LIBDVDCSS_VERSION = 2f12236
> +KODI_LIBDVDNAV_VERSION = 981488f
> +KODI_LIBDVDREAD_VERSION = 17d99db
> +
> +KODI_EXTRA_DOWNLOADS = \
> +	https://github.com/xbmc/libdvdcss/archive/$(KODI_LIBDVDCSS_VERSION).tar.gz \
> +	https://github.com/xbmc/libdvdnav/archive/$(KODI_LIBDVDNAV_VERSION).tar.gz \
> +	https://github.com/xbmc/libdvdread/archive/$(KODI_LIBDVDREAD_VERSION).tar.gz

Can I say again how much I hate this stuff?

> +KODI_CONF_OPTS += \
> +	-DLIBDVDCSS_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
> +	-DLIBDVDNAV_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
> +	-DLIBDVDREAD_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz

I've moved these below, with the other unconditional CONF_OPTS.

> +ifeq ($(BR2_X86_CPU_HAS_SSE),y)
> +KODI_CONF_OPTS += -D_SSE_OK=ON -D_SSE_TRUE=ON

This looks a bit fishy. Why each option has a _OK option and a _TRUE
option? Is setting both really needed?

>  ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
>  KODI_DEPENDENCIES += rpi-userland
> -KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
> -KODI_INCLUDES += \
> -	-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
> -	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux
> -KODI_LIBS = -lvcos -lvchostif
> -endif
> -
> -ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> -KODI_DEPENDENCIES += udev
> -KODI_CONF_OPTS += --enable-udev
>  else
> -KODI_CONF_OPTS += --disable-udev
> +# these options only exist on non-rbpi systems

This looks very very weird. Why is LDGOLD related to RPi ?

> +KODI_CONF_OPTS += -DENABLE_LDGOLD=OFF
> +ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)

Why should these options be under a "else" of the RPi stuff ?

> -ifeq ($(BR2_PACKAGE_KODI_GL),y)
> -KODI_DEPENDENCIES += libglew libglu libgl xlib_libX11 xlib_libXext \
> -	xlib_libXmu xlib_libXrandr xlib_libXt libdrm
> -KODI_CONF_OPTS += --enable-gl --enable-x11 --disable-gles
> +ifeq ($(BR2_PACKAGE_KODI_GL_EGL),y)
> +KODI_DEPENDENCIES += libegl libglu libgl xlib_libX11 xlib_libXext \
> +	xlib_libXrandr libdrm
> +KODI_CONF_OPTS += -DENABLE_OPENGL=ON -DENABLE_X11=ON -DENABLE_OPENGLES=OFF
>  else
> -KODI_CONF_OPTS += --disable-gl --disable-x11
> +KODI_CONF_OPTS += -DENABLE_OPENGL=OFF -DENABLE_X11=OFF
>  ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)

No reason for this being in the "else" of the ifeq
($(BR2_PACKAGE_KODI_GL_EGL), so I've re-organized this way:

ifeq ( ... opengl + egl ...)
 enable Opengl stuff
else
 disable Opengl stuff
endif

ifeq ( ... opengles + egl ...)
 enable OpenglES stuff
else
 disable OpenglES stuff
endif

> +KODI_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`"
> +KODI_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`"
> +KODI_CONF_OPTS += -DENABLE_OPENGLES=ON

Reorganized as one assignment to KODI_CONF_OPTS, i.e:

KODI_CONF_OPTS += \
	... \
	... \
	...

> +	$(HOST_DIR)/usr/bin/xml ed -L \
> +		-d "/addons/addon[text()='service.xbmc.versioncheck']" \
> +		$(KODI_ADDON_MANIFEST)

So this thing is the only reason why we need xmlstarlet built for the
host system?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
