From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 11:28:44 +0100
Subject: [Buildroot] [PATCH v7 12/33] package/efl/libefl: add X11 support
In-Reply-To: <1449523775-6582-13-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-13-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151208102844.GB4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> Add an option to enable X11 support in libecore without graphic
> acceleration. libecore can use xlib or xcb support but the latter
> in not recommended by efl developpers [1]. Thereby the xcb support
> has been dropped with the bump to efl 1.15.
> 
> Also, set x-includes and x-libraries configure option for cross-compiling.
> Previous efl versions had cross-compilation issue (poisoned paths)
> if these options are not passed to configure script.
> 
> In order to remove the dependency on libXp wich is no longer bundled in
> recent X11 release [2], backport an upstream patch [3] to remove xprint
> usage.
> 
> [1] https://git.enlightenment.org/core/efl.git/tree/configure.ac#n5002
> [2] http://www.x.org/wiki/Releases/ModuleVersions
> [3] https://git.enlightenment.org/core/efl.git/commit/?h=efl-1.15&id=434572355c7e929b84210b2f795634d38f13c913
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
[--SNIP--]
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index 38fade1..4ebc20f 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
[--SNIP--]
> @@ -146,6 +146,27 @@ else
>  LIBEFL_CONF_OPTS += --disable-fb
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
> +LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
> +	--with-x11=xlib \
> +	--x-includes=$(STAGING_DIR)/usr/include \
> +	--x-libraries=$(STAGING_DIR)/usr/lib

Nit-picking, but it would have been nicer to write:

    LIBEFL_CONF_OPTS += \
        --with-x11=xlib \
        --with-x=$(STAGING_DIR) \
        --x-includes=$(STAGING_DIR)/usr/include \
        --x-libraries=$(STAGING_DIR)/usr/lib

I.e. all the path options together, after the feature option, with no
option on the first line. But that's just really personal preference...

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +LIBEFL_DEPENDENCIES += \
> +	xlib_libX11 \
> +	xlib_libXcomposite \
> +	xlib_libXcursor \
> +	xlib_libXdamage \
> +	xlib_libXext \
> +	xlib_libXinerama \
> +	xlib_libXrandr \
> +	xlib_libXrender \
> +	xlib_libXScrnSaver \
> +	xlib_libXtst
> +else
> +LIBEFL_CONF_OPTS += --with-x11=none
> +endif
> +
>  # Loaders that need external dependencies needs to be --enable-XXX=yes
>  # otherwise the default is '=static'.
>  # All other loaders are statically built-in
> -- 
> 2.4.3
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
