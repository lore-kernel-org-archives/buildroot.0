From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 11:35:22 +0100
Subject: [Buildroot] [PATCH v7 13/33] package/efl/libefl: add
 OpenGL/OpenGLES support
In-Reply-To: <1449523775-6582-14-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-14-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151208103522.GC4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> Allow to enable graphic acceleration using OpenGL or
> OpenGLES with efl libraries.
> 
> The full opengl option depend on X11, because full openGL means GLX,
> which means X11.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v6: Rename OpenGL options (Yann E.Morin)
>     Only full OpenGL support depends on X11.
> v4: rename libefl
>     improve commit log
> ---
>  package/efl/libefl/Config.in | 28 ++++++++++++++++++++++++++++
>  package/efl/libefl/libefl.mk | 17 +++++++++++++++--
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index 560a7b3..b0cb675 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -105,6 +105,34 @@ config BR2_PACKAGE_LIBEFL_X_XLIB
>  	select BR2_PACKAGE_XLIB_LIBXTST
>  	select BR2_PACKAGE_XPROTO_GLPROTO
>  
> +choice
> +	bool "OpenGL support"
> +	default BR2_PACKAGE_LIBEFL_OPENGL   if BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_XORG7
> +	default BR2_PACKAGE_LIBEFL_OPENGLES if BR2_PACKAGE_HAS_LIBGLES
> +	help
> +	  libevas can be configured to use HW acceleration with OpenGL or
> +	  OpenGLES.
> +
> +config BR2_PACKAGE_LIBEFL_OPENGL_NONE
> +	bool "none"
> +
> +config BR2_PACKAGE_LIBEFL_OPENGL
> +	bool "opengl"
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_XORG7
> +
> +comment "opengl support needs X11 and an opengl provider"
> +	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
> +
> +config BR2_PACKAGE_LIBEFL_OPENGLES
> +	bool "opengles"
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +
> +comment "opengles support needs an opengles provider"
> +	depends on !BR2_PACKAGE_HAS_LIBGLES
> +
> +endchoice # OpenGL support
> +
>  comment "libevas loaders"
>  
>  config BR2_PACKAGE_LIBEFL_PNG
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index 4ebc20f..fa1ee74 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -43,8 +43,7 @@ LIBEFL_CONF_OPTS = \
>  	--disable-cxx-bindings \
>  	--disable-sdl \
>  	--disable-systemd \
> -	--enable-lua-old \
> -	--with-opengl=none
> +	--enable-lua-old
>  
>  # Disable untested configuration warning.
>  ifeq ($(BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG),)
> @@ -167,6 +166,20 @@ else
>  LIBEFL_CONF_OPTS += --with-x11=none
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEFL_OPENGL),y)
> +LIBEFL_CONF_OPTS += --with-opengl=full
> +LIBEFL_DEPENDENCIES += libgl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEFL_OPENGLES),y)
> +LIBEFL_CONF_OPTS += --with-opengl=es
> +LIBEFL_DEPENDENCIES += libgles
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEFL_OPENGL_NONE),y)
> +LIBEFL_CONF_OPTS += --with-opengl=none
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
