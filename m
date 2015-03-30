From: =?windows-1252?Q?Guillaume_GARDET_-_Olis=E9o?= <guillaume.gardet@oliseo.fr>
Date: Mon, 30 Mar 2015 11:33:30 +0200
Subject: [Buildroot] [PATCH] sdl2: new package
In-Reply-To: <20150313171451.197d5822@free-electrons.com>
References: <1424944071-6473-1-git-send-email-guillaume.gardet@oliseo.fr>
 <20150313171451.197d5822@free-electrons.com>
Message-ID: <5519186A.20503@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 13/03/2015 17:14, Thomas Petazzoni a ?crit :
> Dear Guillaume GARDET,
>
> Sorry for not replying earlier. I had a look at your patch some time
> ago and had some comments, but apparently never replied.
>
> On Thu, 26 Feb 2015 10:47:51 +0100, Guillaume GARDET wrote:
>
>> diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
>> new file mode 100644
>> index 0000000..5d0fe01
>> --- /dev/null
>> +++ b/package/sdl2/Config.in
>> @@ -0,0 +1,22 @@
>> +config BR2_PACKAGE_SDL2
>> +	bool "SDL2"
> I know it's not the case for the existing SDL package, but we generally
> prefer to have package names in lower-case in menuconfig, for
> consistency. So s/SDL2/sdl2/ here.

ok

>
>> +	help
>> +	  Simple DirectMedia Layer 2 - SDL2 is a library that allows
>> +	  programs portable low level access to a video framebuffer,
>> +	  audio output, mouse, and keyboard. It is not compatible with SDL1.
>> +
>> +	  http://www.libsdl.org/
> Did you check with very basic toolchains that SDL2 builds fine? I'm
> surprised you have really zero dependency on toolchain features. Can
> you check for example with the following configurations:
>
>    http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config
>    http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config
>    http://autobuild.buildroot.org/toolchains/configs/bfin-linux-uclibc.config
>    http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config
>
> You may discover that sdl2 depends on certain toolchain options.

I used sdl (1) as a template which has no wuch deps, but I will test.

>
>> +config BR2_PACKAGE_SDL2_DIRECTFB
>> +	bool "SDL2 DirectFB video driver"
>> +	depends on BR2_PACKAGE_DIRECTFB
> No need to repeat "SDL2" here, since this option is indented below the
> "sdl2" main option.

ok

>
>> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
>> new file mode 100644
>> index 0000000..b9aa907
>> --- /dev/null
>> +++ b/package/sdl2/sdl2.mk
>> @@ -0,0 +1,67 @@
>> +################################################################################
>> +#
>> +# sdl2
>> +#
>> +################################################################################
>> +
>> +SDL2_VERSION = 2.0.3
>> +SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
>> +SDL2_SITE = http://www.libsdl.org/release
>> +SDL2_LICENSE = zlib
>> +SDL2_LICENSE_FILES = COPYING
>> +SDL2_INSTALL_STAGING = YES
>> +
>> +# We must enable static build to get compilation successful.
>> +SDL2_CONF_OPTS = --enable-static
> Hum, this is a bit annoying, but OK.
>
>> +
>> +ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
>> +SDL2_DEPENDENCIES += directfb
>> +SDL2_CONF_OPTS += --enable-video-directfb=yes
>> +SDL2_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
>> +else
>> +SDL2_CONF_OPTS += --enable-video-directfb=no
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_SDL2_X11),y)
>> +SDL2_CONF_OPTS += --enable-video-x11=yes
>> +SDL2_DEPENDENCIES += \
>> +	xlib_libX11 xlib_libXext \
>> +	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER), xlib_libXrender) \
>> +	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR), xlib_libXrandr)
> No space after the comma.

ok

>
>> +else
>> +SDL2_CONF_OPTS += --enable-video-x11=no
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_TSLIB),y)
>> +SDL2_DEPENDENCIES += tslib
>> +endif
> Please explicit the --enable-input-tslib / --disable-input-tslib.

ok

>
>> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
>> +SDL2_DEPENDENCIES += alsa-lib
>> +endif
> Same: --enable-alsa / --disable-alsa.

ok

>
>> +
>> +ifeq ($(BR2_PACKAGE_MESA3D),y)
>> +SDL_DEPENDENCIES += mesa3d
>> +endif
> What feature is this supposed to be enabling? mesa3d is an OpenGL
> implementation, but it's not the only one. So if it's OpenGL related,
> most likely this is not the right thing to do.

Here, I also used sdl (1) package as a template. So, sdl (1) should be fixed too.

>
>> +SDL2_CONF_OPTS += \
>> +	--enable-pulseaudio=no \
>> +	--disable-arts \
>> +	--disable-esd
> Please put this earlier, where the first non-conditional SDL2_CONF_OPTS
> definition is.

ok

>
>> +HOST_SDL2_CONF_OPTS += \
>> +	--enable-pulseaudio=no \
>> +	--enable-video-x11=no \
>> +	--disable-arts \
>> +	--disable-esd
> Not needed I believe.

ok. sdl1 has it too.

>
>> +
>> +# Remove the -Wl,-rpath option.
>> +define SDL2_FIXUP_SDL2_CONFIG
>> +	$(SED) 's%-Wl,-rpath,\$${libdir}%%' \
>> +		$(STAGING_DIR)/usr/bin/sdl2-config
>> +endef
>> +
>> +SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_FIXUP_SDL2_CONFIG
>> +
>> +$(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
> Why do you have a host package? There is nothing that depends on it.

Indeed. I used sdl1 has a template as said earlier. :(

>
> Could you look at those comments, and resubmit an updated version
> and/or comment on them as needed?

Will send a V2.


Guillaume
