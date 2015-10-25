From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 16:08:23 +0100
Subject: [Buildroot] [PATCH v5 15/36] package/efl/libefl: add
 OpenGL/OpenGLES support
In-Reply-To: <1445720476-21517-16-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-16-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025150823.GM11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> Allow to enable graphic acceleration using OpenGL or
> OpenGLES with efl libraries.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v4: rename libefl
>     improve commit log
> ---
>  package/efl/libefl/Config.in | 26 ++++++++++++++++++++++++++
>  package/efl/libefl/libefl.mk | 17 +++++++++++++++--
>  2 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index 8356fa1..a3b6f0e 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -81,6 +81,32 @@ comment "for libecore XCB support disable recommended configurations"
>  
>  endchoice
>  
> +if BR2_PACKAGE_LIBEFL_X_XLIB
> +
> +choice
> +	prompt "select libevas OpenGL support"
> +
> +config BR2_PACKAGE_LIBEFL_X_XLIB_GLX_FULL
> +	bool "libevas OpenGL full support"
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +
> +comment "libevas OpenGLES support needs libgl"
> +	depends on !BR2_PACKAGE_HAS_LIBGL
> +
> +config BR2_PACKAGE_LIBEFL_X_XLIB_GLX_ES
> +	bool "libevas OpenGLES support"
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +
> +comment "libevas OpenGLES support needs libgles"
> +	depends on !BR2_PACKAGE_HAS_LIBGLES
> +
> +config BR2_PACKAGE_LIBEFL_X_XLIB_GLX_NONE
> +	bool "libevas disable OpenGL support"
> +
> +endchoice
> +
> +endif # BR2_PACKAGE_LIBEFL_X_XLIB
> +

Here is a proposal to rewrite the option names and prompts:

    choice
        bool "OpenGL support"
        default BR2_PACKAGE_LIBEFL_X_XLIB_OPENGL   if BR2_PACKAGE_HAS_LIBGL
        default BR2_PACKAGE_LIBEFL_X_XLIB_OPENGLES if BR2_PACKAGE_HAS_LIBGLES
        help
          libevas can be configured to use HW acceleration with OpenGL
          or OpenGLES.

    config BR2_PACKAGE_LIBEFL_X_XLIB_OPENGL_NONE
        bool "none"

    config BR2_PACKAGE_LIBEFL_X_XLIB_OPENGL
        bool "opengl"
        depends on BR2_PACKAGE_HAS_LIBGL

    comment "opengl support needs an OpenGL provider"
        depends on !BR2_PACKAGE_HAS_LIBGL

    config BR2_PACKAGE_LIBEFL_X_XLIB_OPENGLES
        bool "opengles"
        depends on BR2_PACKAGE_HAS_LIBGLES

    comment "opengles support needs an opengles provider"
        depends on !BR2_PACKAGE_HAS_LIBGLES

    endchoice

If you fell inclined into adoptiong this, update the corresponding
options in the .mk, of course.

Regards,
Yann E. MORIN.

>  endif # BR2_PACKAGE_LIBEFL_X
>  
>  comment "libevas loaders"
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index 6a1a8ae..e275699 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -176,8 +176,7 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
>  LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
>  	--x-includes=$(STAGING_DIR)/usr/include \
> -	--x-libraries=$(STAGING_DIR)/usr/lib \
> -	--with-opengl=none
> +	--x-libraries=$(STAGING_DIR)/usr/lib
>  
>  LIBEFL_DEPENDENCIES += \
>  	xlib_libX11 \
> @@ -187,6 +186,20 @@ LIBEFL_CONF_OPTS += --with-x=no \
>  	--with-x11=none
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB_GLX_FULL),y)
> +LIBEFL_CONF_OPTS += --with-opengl=full
> +LIBEFL_DEPENDENCIES += libgl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB_GLX_ES),y)
> +LIBEFL_CONF_OPTS += --with-opengl=es
> +LIBEFL_DEPENDENCIES += libgles
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB_GLX_NONE),y)
> +LIBEFL_CONF_OPTS += --with-opengl=none
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
>  LIBEFL_DEPENDENCIES += \
>  	xlib_libX11 \
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
