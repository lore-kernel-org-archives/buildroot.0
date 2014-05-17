From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 22:55:00 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
In-Reply-To: <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517205500.GL3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

There are quite a few changes in that patch. A ciommit log explaining
what is being done would be good. ;-)

> ---
>  package/xbmc/Config.in |   24 ++++++++++++++++++++----
>  package/xbmc/xbmc.mk   |   40 ++++++++++++++++++++++++++++++++++------
>  2 files changed, 54 insertions(+), 10 deletions(-)
> 
> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
> index f001209..40a1f63 100644
> --- a/package/xbmc/Config.in
> +++ b/package/xbmc/Config.in
> @@ -2,9 +2,12 @@ comment "xbmc needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
>  	depends on BR2_arm || BR2_i386 || BR2_x86_64
>  	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>  
> -comment "xbmc requires an OpenGL ES and EGL backend"
> -	depends on BR2_arm || BR2_i386 || BR2_x86_64
> -	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
> +comment "xbmc needs an OpenGL backend"
> +	depends on (!BR2_arm && (BR2_i386 || BR2_x86_64)) && \
> +		!BR2_PACKAGE_HAS_LIBGL && !(BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)
> +
> +comment "xbmc needs EGL & GLES support"

Please keep the original comment. Besides, this change makes the two
comments incoherent:

    comment "xbmc needs an OpenGL backend"
    comment "xbmc needs EGL & GLES support"

Also, I doubt the GL dependency is tied to x86, or the EGL/GLES
dependency is tied to ARM. What if an ARM platform has a full openGL
implementation? Probably XBMC would be able to use that, no?

So, I'd suggest something along those lines:

    comment "XBMC needs an openGL backend, or an OpenGL ES and EGL backend"
        depends on BR2_arm || BR2_i386 || BR2_x86_64
        depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES

> +	depends on BR2_arm && !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGLES

In anycase, this dependency line is incorrect, it would show only when
both of libgles and libegl are not selected, while we would want it to
show when either or both are not selected.
 
> -	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_HAS_LIBGL || (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)

Parenthesis are unneeded: '&&' has precedence over '||' anyway.

> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 5a72dab..7fdaafc 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -61,6 +56,39 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
>  XBMC_DEPENDENCIES += dbus
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> +XBMC_DEPENDENCIES += \
> +	libglew \
> +	libglu \
> +	libgl \
> +	sdl_image \
> +	xlib_libX11 \
> +	xlib_libXext \
> +	xlib_libXmu \
> +	xlib_libXrandr \
> +	xlib_libXt
> +XBMC_CONF_OPT += \
> +	--enable-x11 \
> +	--enable-xrandr \
> +	--enable-gl \
> +	--enable-sdl
> +else
> +XBMC_CONF_OPT += \
> +	--disable-x11 \
> +	--disable-xrandr \
> +	--disable-gl \
> +	--disable-sdl
> +endif

Could you join dependencies so they fit on one or two lines, instead of
one pre line?

Ditto the configure options.

> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> +XBMC_DEPENDENCIES += libegl libgles
> +XBMC_CONF_OPT += --enable-gles
> +XBMC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
> +	CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"

He! This XBMC_CONF_ENV did not pre-exist, and did not seem to be needed.

Since this change is part of the EGL/GLES if-block, it has no impact on
the GL case, so is not due to adding GL support.

Why do you need to add it?

If it really is needed, then:
  - either it's due to the bump to Gotham, and should go in the bump
    patch, or
  - it should be a separate patch.

Regards,
Yann E. MORIN.

> +else
> +XBMC_CONF_OPT += --disable-gles
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
>  XBMC_DEPENDENCIES += libusb-compat
>  XBMC_CONF_OPT += --enable-libusb
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
