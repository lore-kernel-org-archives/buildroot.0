From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 5 Jul 2015 20:21:33 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <20150629222241.GF3669@free.fr>
 <1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <559975AD.9030004@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

Le 02/07/2015 10:16, Guillaume GARDET a ?crit :
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Yann E. Morin <yann.morin.1998@free.fr>
> 
> ---
> 
> Changes in V4:
> * Fix comments places in Config.in
> 
> Changes in V3:
> * Add dependenies comments for DirectFB and X11 options
> * Fix license filename
> * Add explicit enable/disable options for libudev
> * Fix typo: s/succesful/successful/
> * Add more X11 dependencies: x11-xcursor, x11-xinerama, x11-xinput, x11-scrnsaver
> * Disbale opengl/opengles video diver explicitly
> * Use --disable-rpath option option instead of manual fix
> 
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
> 
>  package/Config.in      |  1 +
>  package/sdl2/Config.in | 32 ++++++++++++++++++++++++
>  package/sdl2/sdl2.mk   | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 101 insertions(+)
>  create mode 100644 package/sdl2/Config.in
>  create mode 100644 package/sdl2/sdl2.mk
> 

[snip]

> +SDL2_DEPENDENCIES += \
> +	xlib_libX11 xlib_libXext \
> +	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender) \
> +	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr) \
> +	$(if $(BR2_PACKAGE_XLIB_LIBXCURSOR,xlib_libXcursor) \
> +	$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA,xlib_libXinerama) \
> +	$(if $(BR2_PACKAGE_XPROTO_INPUTPROTO,xproto_inputproto) \
> +	$(if $(BR2_PACKAGE_XPROTO_SCRNSAVERPROTO,xproto_scrnsaverproto)

There are missing ',' and ')' here.

This part should look like:

SDL2_DEPENDENCIES += \
	xlib_libX11 xlib_libXext \
	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender,) \
	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr,) \
	$(if $(BR2_PACKAGE_XLIB_LIBXCURSOR),xlib_libXcursor,) \
	$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama,) \
	$(if $(BR2_PACKAGE_XPROTO_INPUTPROTO),xproto_inputproto,) \
	$(if $(BR2_PACKAGE_XPROTO_SCRNSAVERPROTO),xproto_scrnsaverproto,)

sdl2 is seems complicated package, I think it would be easier to review if you
add it progressively by using a patch series:

PATCH1: sdl2 new package (all mandatory dependencies enabled)
PATCH2: sdl2 add X11 support
PATCH3: sdl2 add directfb support
...

I'll review your patch latter new week end.

Best regards,
Romain
