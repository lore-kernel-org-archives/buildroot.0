From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 16:01:16 +0100
Subject: [Buildroot] [PATCH v5 14/36] package/efl/libefl: add X11 support
In-Reply-To: <1445720476-21517-15-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-15-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025150116.GL11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> Add an option to enable X11 support in libecore without graphic
> acceleration. libecore can use xlib or xcb support but the latter
> in not recommended by efl developpers.
> 
> Also, set x-includes and x-libraries configure option for cross-compiling.
> Previous efl versions had cross-compilation issue (poisoned paths)
> if these options are not passed to configure script.
> 
> In order to remove the dependency on libXp wich is no longer bundled in
> recent X11 release [1], backport an upstream patch [2] to remove xprint
> usage.
> 
> [1] http://www.x.org/wiki/Releases/ModuleVersions
> [2] https://git.enlightenment.org/core/efl.git/commit/?h=efl-1.15&id=434572355c7e929b84210b2f795634d38f13c913
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
[--SNIP--]
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index 53adea2..8356fa1 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -42,6 +42,47 @@ comment "libecore video support"
>  config BR2_PACKAGE_LIBEFL_FB
>  	bool "libecore framebuffer support"
>  
> +config BR2_PACKAGE_LIBEFL_X
> +	bool "libecore X support"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +
> +if BR2_PACKAGE_LIBEFL_X
> +
> +choice
> +	prompt "select libecore XLIB/XCB support"
> +
> +config BR2_PACKAGE_LIBEFL_X_XLIB
> +	bool "libecore XLIB support"
> +	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
> +	select BR2_PACKAGE_XLIB_LIBXCURSOR
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE
> +	select BR2_PACKAGE_XLIB_LIBXINERAMA
> +	select BR2_PACKAGE_XLIB_LIBXP
> +	select BR2_PACKAGE_XLIB_LIBXRANDR
> +	select BR2_PACKAGE_XLIB_LIBXRENDER
> +	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
> +	select BR2_PACKAGE_XLIB_LIBXTST
> +	select BR2_PACKAGE_XPROTO_GLPROTO
> +
> +config BR2_PACKAGE_LIBEFL_X_XCB
> +	bool "libecore XCB support"
> +	depends on !BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
> +	select BR2_PACKAGE_LIBXCB
> +	select BR2_PACKAGE_XCB_UTIL_IMAGE # xcb-image.pc
> +	select BR2_PACKAGE_XCB_UTIL_KEYSYMS # xcb-keysyms.pc
> +	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL # xcb-renderutil.pc
> +	select BR2_PACKAGE_XCB_UTIL_WM # xcb-icccm.pc
> +	select BR2_PACKAGE_XLIB_LIBX11
> +
> +comment "for libecore XCB support disable recommended configurations"
> +	depends on BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
> +
> +endchoice
> +
> +endif # BR2_PACKAGE_LIBEFL_X

Make that a single choice:

    choice
        bool "X11 support"

    config BR2_PACKAGE_LIBEFL_X_NONE
        bool "none"

    config BR2_PACKAGE_LIBEFL_X_XLIB
        bool "xlib"

    config BR2_PACKAGE_LIBEFL_X_XCB
        bool "xcb"

    endchoice # X11 support

Of course, with the appropriate depends/selects and comment.

>  comment "libevas loaders"
>  
>  config BR2_PACKAGE_LIBEFL_PNG
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index e53470d..6a1a8ae 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -18,6 +18,7 @@ LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg libcurl lua \
>  
>  # regenerate the configure script:
>  # https://phab.enlightenment.org/T2718
> +# configure.ac patched by 0002-ecore_x-Remove-XPrint-usage.patch

This comment might become misleading in the future, in case it we no
longer patch configure.ac. What about:

    # Regenerate the autotools:
    #  - to fix an issue in eldbus-codegen: https://phab.enlightenment.org/T2718
    #  - to remove dependency on libXp: https://phab.enlightenment.org/D3150 

>  LIBEFL_AUTORECONF = YES
>  LIBEFL_GETTEXTIZE = YES
>  
> @@ -30,7 +31,7 @@ LIBEFL_CONF_OPTS = \
>  	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
>  	--disable-cxx-bindings \
>  	--enable-lua-old \
> -	--with-x11=none
> +	--enable-lua-old

Now we've got --enable-lua-old twice. ;-)

>  # Disable untested configuration warning.
>  ifeq ($(BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG),)
> @@ -172,6 +173,65 @@ else
>  LIBEFL_CONF_OPTS += --enable-fb=no
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
> +LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
> +	--x-includes=$(STAGING_DIR)/usr/include \
> +	--x-libraries=$(STAGING_DIR)/usr/lib \
> +	--with-opengl=none
> +
> +LIBEFL_DEPENDENCIES += \
> +	xlib_libX11 \
> +	xlib_libXext
> +else
> +LIBEFL_CONF_OPTS += --with-x=no \
> +	--with-x11=none
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
> +LIBEFL_DEPENDENCIES += \
> +	xlib_libX11 \

xlib_libx11 already a dependency, above.

> +	xlib_libXcomposite \
> +	xlib_libXcursor \
> +	xlib_libXdamage \
> +	xlib_libXext \

Ditto.

> +	xlib_libXinerama \
> +	xlib_libXrandr \
> +	xlib_libXrender \
> +	xlib_libXScrnSaver \
> +	xlib_libXtst
> +LIBEFL_CONF_OPTS += --with-x11=xlib
> +endif
> +
> +# xcb-util-image to provide xcb-image.pc
> +# xcb-util-renderutil to provide xcb-renderutil.pc
> +# xcb-util-wm to provide xcb-icccm.pc
> +# xcb-util-keysyms to provide xcb-keysyms.pc
> +ifeq ($(BR2_PACKAGE_LIBEFL_X_XCB),y)
> +LIBEFL_DEPENDENCIES += libxcb \
> +	xcb-util-image \
> +	xcb-util-keysyms \
> +	xcb-util-renderutil \
> +	xcb-util-wm
> +# You have chosen to use XCB instead of Xlib. It is a myth that XCB
> +# is amazingly faster than Xlib (when used sensibly). It can be
> +# faster in a few corner cases on startup of an app, but it comes
> +# with many downsides. One of those is more complex code inside
> +# ecore_x, which is far less tested in XCB mode than Xlib. Also
> +# the big catch is that OpenGL support basically requires Xlib anyway
> +# so if you want OpenGL in X11, you need Xlib regardless and so you
> +# gain nothing really in terms of speed and no savings in memory
> +# because Xlib is still linked, loaded and used, BUT instead you
> +# have OpenGL drivers working with an hybrid XCB/Xlib (mostly XCB)
> +# toolkit and this is basically never tested by anyone working on
> +# the OpenGL drivers, so you will have bugs. Do not enable XCB
> +# and use OpenGL. XCB is only useful if you wish to shave a few Kb
> +# off the memory footprint of a whole system and live with less
> +# tested code, and possibly unimplemented features in ecore_x. To
> +# remove the XCB setup, remove the --with-x11=xcb option to
> +# configure.

Why this big comment? At best, it belongs to the help text of
BR2_PACKAGE_LIBEFL_X_XCB in the Config.in.

Also, I guess you're only quoting the EFL developers here, so you should
state so and add a pointer to that message upstream:

    https://git.enlightenment.org/core/efl.git/tree/configure.ac#n5002

But if it were purely on me, I would just drop it.

Regards,
Yann E. MORIN.

> +LIBEFL_CONF_OPTS += --with-x11=xcb
> +endif
> +
>  # image loader: handle only loaders that requires dependencies.
>  # All other loaders are builded by default statically.
>  ifeq ($(BR2_PACKAGE_LIBEFL_PNG),y)
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
