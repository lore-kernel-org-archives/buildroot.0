From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 17:03:47 +0100
Subject: [Buildroot] [PATCH v5 20/36] package/libevas-generic-loaders:
 add libraw dependency
In-Reply-To: <1445720476-21517-21-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-21-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025160347.GR11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
> libraw it's one of the "highly recommended" dependecies
> according to the README [1].
> 
> [1] https://git.enlightenment.org/core/evas_generic_loaders.git/tree/README?id=v1.15.0#n31
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v4: improve commit log
> ---
>  package/libevas-generic-loaders/Config.in                  | 5 +++++
>  package/libevas-generic-loaders/libevas-generic-loaders.mk | 9 +++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
> index 5b9f009..26166a8 100644
> --- a/package/libevas-generic-loaders/Config.in
> +++ b/package/libevas-generic-loaders/Config.in
> @@ -11,6 +11,11 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
>  
>  if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
>  
> +config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_LIBRAW
> +	bool "Libraw loader"

You forgot to select BR2_PACKAGE_LIBRAW and propagate its dependency on
C++.

Regards,
Yann E. MORIN.

> +	help
> +	  This option enables the Evas generic Libraw loader
> +
>  config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
>  	bool "SVG loader"
>  	select BR2_PACKAGE_LIBRSVG
> diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
> index d8ab252..4665ded 100644
> --- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
> +++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
> @@ -14,14 +14,19 @@ LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
>  
>  LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = libefl zlib
>  
> -# For now, we only support the SVG loader
>  # poppler >= 0.32 is not supported with libevas-generic-loaders 1.14.0
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
