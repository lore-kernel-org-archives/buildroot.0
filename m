From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Aug 2014 23:30:36 +0200
Subject: [Buildroot] [PATCH v16 1/3] xbmc: Add X.org/OpenGL support
In-Reply-To: <1406914359-31106-2-git-send-email-bernd.kuhls@t-online.de>
References: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
 <1406914359-31106-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140801213036.GE3778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-01 19:32 +0200, Bernd Kuhls spake thusly:
> - on ARM xbmc only supports EGL/GLES
>   https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L695
> - rsxs depends on OpenGL
>   https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L1469
>   so include a compile fix, courtesy of
>   https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/mediacenter/xbmc/package.mk#L109
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I however have one comment, see below...

> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index c3b0d71..c868b59 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
[--SNIP--]
> @@ -88,6 +83,32 @@ else
>  XBMC_CONF_OPT += --disable-libmp3lame
>  endif
>  
> +# quote from xbmc/configure.in: "GLES overwrites GL if both set to yes."
> +# we choose the opposite because opengl offers more features, like libva support
> +ifeq ($(BR2_PACKAGE_XBMC_GL),y)
> +XBMC_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 xlib_libXext \
> +	xlib_libXmu xlib_libXrandr xlib_libXt
> +XBMC_CONF_OPT += --enable-gl --enable-sdl --enable-x11 --enable-xrandr --disable-gles
> +# fix rsxs compile
> +# make sure target libpng-config is used, options taken from rsxs-0.9/acinclude.m4
> +XBMC_CONF_ENV += \
> +	jm_cv_func_gettimeofday_clobber=no \
> +	mac_cv_pkg_png=$(STAGING_DIR)/usr/bin/libpng-config \
> +	mac_cv_pkg_cppflags="`$(STAGING_DIR)/usr/bin/libpng-config --I_opts --cppflags`" \
> +	mac_cv_pkg_cxxflags="`$(STAGING_DIR)/usr/bin/libpng-config --ccopts`" \
> +	mac_cv_pkg_ldflags="`$(STAGING_DIR)/usr/bin/libpng-config --L_opts --R_opts`" \
> +	mac_cv_pkg_libs="`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
> +XBMC_CONF_OPT += --enable-rsxs
> +else
> +XBMC_CONF_OPT += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr

We currently do not disable rsxs, and XBMC builds just fine on the RPi.
However, we remove it from the rootfs as a post-install hook.

What's the problem with rsxs on EGL/GLES?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
