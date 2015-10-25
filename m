From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 16:20:20 +0100
Subject: [Buildroot] [PATCH v5 18/36] package/efl/libefl: add sdl2
	support
In-Reply-To: <1445720476-21517-19-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-19-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025152020.GP11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> SDL support can't be used with OpenGLES.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v5: new patch added since sdl2 package is new available
> ---
>  package/efl/libefl/Config.in |  7 +++++++
>  package/efl/libefl/libefl.mk | 11 +++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index a3b6f0e..44860a2 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -42,6 +42,12 @@ comment "libecore video support"
>  config BR2_PACKAGE_LIBEFL_FB
>  	bool "libecore framebuffer support"
>  
> +config BR2_PACKAGE_LIBEFL_SDL2
> +	bool "libevas SDL2 support"

FB and X11 refere to libecore, but SDL2 refer to libevas. Is that an
oversight, or is that correct?

However, I would simply drop it, to have just:

    FB support
    SDL2 support
    X11 support

> +	# SDL support is not available with OpenGLES.
> +	depends on !BR2_PACKAGE_LIBEFL_X_XLIB_GLX_ES
> +	select BR2_PACKAGE_SDL2
> +
>  config BR2_PACKAGE_LIBEFL_X
>  	bool "libecore X support"
>  	depends on BR2_PACKAGE_XORG7
> @@ -89,6 +95,7 @@ choice
>  config BR2_PACKAGE_LIBEFL_X_XLIB_GLX_FULL
>  	bool "libevas OpenGL full support"
>  	depends on BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_LIBEFL_SDL2 # evas depends on libglu header in evas_engine.c

I have troubles understanding this set of options.

So, with the current code, one may select SDL2 and not X11. Is that a
viable situation?

If so, then OpenGL support will never be available, since OpenGL depends
on X11 being enabled. Is that OK? Don't you need to unhide the OpenGL
choice for SDL2 too?

Did I miss something?

>  comment "libevas OpenGLES support needs libgl"
>  	depends on !BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index c26c9c5..8ddca64 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -180,6 +180,17 @@ else
>  LIBEFL_CONF_OPTS += --enable-fb=no
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEFL_SDL2),y)
> +LIBEFL_CONF_OPTS += --enable-sdl=yes
> +LIBEFL_DEPENDENCIES += sdl2
> +else
> +LIBEFL_CONF_OPTS += --enable-sdl=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_EFL_X_XLIB_GLX_FULL)$(BR2_PACKAGE_EFL_SDL2),yy)
> +EFL_DEPENDENCIES += libglu
> +endif

Hmm.. It seems that SDL2 can be over X11, right?

So, how does SDL2 compare to FB and X11? Is it at the same "level" (i.e.
a rendering backend talking to the hardwware), or is it layered on-top
of X11?

Regards,
Yann E. MORIN.

>  # --enable-xinput22 is recommended
>  ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
>  LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
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
