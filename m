From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2021 22:29:35 +0100
Subject: [Buildroot] [PATCH v3,
 2/6] package/gerbera: security bump to version 1.6.4
In-Reply-To: <20210125194949.1173139-2-fontaine.fabrice@gmail.com>
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
 <20210125194949.1173139-2-fontaine.fabrice@gmail.com>
Message-ID: <20210125212935.GP2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Fabrice, All,

On 2021-01-25 20:49 +0100, Fabrice Fontaine spake thusly:
> - This version is compatible with libupnp 1.14.x which fix
>   CallStranger a.k.a. CVE-2020-12695
[--SNIP--]
> diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
> index 7f0ac664fe..f26615a8f8 100644
> --- a/package/gerbera/gerbera.mk
> +++ b/package/gerbera/gerbera.mk
> @@ -4,20 +4,23 @@
>  #
>  ################################################################################
>  
> -GERBERA_VERSION = 1.4.0
> +GERBERA_VERSION = 1.6.4
>  GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
>  GERBERA_LICENSE = GPL-2.0
>  GERBERA_LICENSE_FILES = LICENSE.md
>  GERBERA_DEPENDENCIES = \
> -	expat \
> +	fmt \
>  	host-pkgconf \
> -	libupnp18 \
> +	$(if $(BR2_PACKAGE_LIBUPNP),libupnp) \
> +	pugixml \
> +	spdlog \
>  	sqlite \
>  	util-linux \
>  	zlib
>  GERBERA_CONF_OPTS = \
>  	-DWITH_DEBUG=OFF \
> -	-DWITH_JS=OFF
> +	-DWITH_JS=OFF \
> +	-DCXX_FILESYSTEM_NO_LINK_NEEDED=ON
>  
>  # Uses __atomic_fetch_add_4
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> @@ -70,6 +73,13 @@ else
>  GERBERA_CONF_OPTS += -DWITH_MATROSKA=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBNPUNP),y)
                            ^^
Typo: BR2_PACKAGE_LIBNPUPNP

> +GERBERA_DEPENDENCIES += libnpupnp
> +GERBERA_CONF_OPTS += -DWITH_NPUPNP=ON
> +else
> +GERBERA_CONF_OPTS += -DWITH_NPUPNP=OFF
> +endif

The way you wrote this means that, if both libupnp and libnpupnp
(dmaned, I see why you did that typo!) are enabled, then gerbera will
depend on both, but will only use libnpupnp.

I've changed that so only one of is in the dependency chain, with a
preference toward libnpupnp.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_MYSQL),y)
>  GERBERA_DEPENDENCIES += mysql
>  GERBERA_CONF_OPTS += -DWITH_MYSQL=ON
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
