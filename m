From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 12:00:54 +0100
Subject: [Buildroot] [PATCH v7 17/33] package/libevas-generic-loaders:
 add libraw dependency
In-Reply-To: <1449523775-6582-18-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-18-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151208110054.GF4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> libraw it's one of the "highly recommended" dependecies
> according to the README [1].
> 
> [1] https://git.enlightenment.org/core/evas_generic_loaders.git/tree/README?id=v1.15.0#n31
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v6: select BR2_PACKAGE_LIBRAW and propagate its dependency on
>     C++. (Yann E.Morin)
> v4: improve commit log
> ---
>  package/libevas-generic-loaders/Config.in                  | 10 ++++++++++
>  package/libevas-generic-loaders/libevas-generic-loaders.mk |  9 +++++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
> index 65ced8a..1d5b717 100644
> --- a/package/libevas-generic-loaders/Config.in
> +++ b/package/libevas-generic-loaders/Config.in
> @@ -11,6 +11,16 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
>  
>  if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
>  
> +config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_LIBRAW
> +	bool "libraw loader"
> +	depends on BR2_INSTALL_LIBSTDCPP # libraw
> +	select BR2_PACKAGE_LIBRAW
> +	help
> +	  This option enables the Evas generic Libraw loader
> +
> +comment "libraw loader needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
>  config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
>  	bool "SVG loader"
>  	depends on BR2_USE_MMU # librsvg -> glib2
> diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
> index 47dfa9a..2c1c1cd 100644
> --- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
> +++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
> @@ -14,15 +14,20 @@ LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
>  
>  LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = host-pkgconf libefl zlib
>  
> -# For now, we only support the SVG loader
>  # poppler >= 0.32 is not supported by the current version of
>  # libevas-generic-loaders.
>  LIBEVAS_GENERIC_LOADERS_CONF_OPTS += \
>  	--disable-poppler \
>  	--disable-spectre \
> -	--disable-libraw \
>  	--disable-gstreamer
>  
> +ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_LIBRAW),y)
> +LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += libraw
> +LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-libraw
> +else
> +LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --disable-libraw
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG),y)
>  LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += librsvg cairo
>  LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-svg
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
