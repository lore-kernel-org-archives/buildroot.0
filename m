From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jan 2018 23:28:03 +0100
Subject: [Buildroot] [PATCH] swupdate: bump to version 2017.11
In-Reply-To: <20180110222816.20579-1-joerg.krause@embedded.rocks>
References: <20180110222816.20579-1-joerg.krause@embedded.rocks>
Message-ID: <20180113222803.GI3226@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2018-01-10 23:28 +0100, J?rg Krause spake thusly:
[--SNIP--]
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index fbb092da05..d1afbc4882 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SWUPDATE_VERSION = 2017.07
> +SWUPDATE_VERSION = 2017.11
>  SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
>  SWUPDATE_LICENSE = GPL-2.0+, MIT, Public Domain
>  SWUPDATE_LICENSE_FILES = COPYING
> @@ -39,8 +39,13 @@ else
>  SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUA_5_3),y)
> -SWUPDATE_DEPENDENCIES += lua host-pkgconf
> +

This is adding an extra empty line, which would have been caught by
running:

    $ ./utils/check-package package/swupdate/swupdate.mk
    package/swupdate/swupdate.mk:42: consecutive empty lines
    140 lines processed
    1 warnings generated

Care to fix, please?

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
> +SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
> +# defines the base name for the pkg-config file ("lua" or "luajit")
> +define SWUPDATE_SET_LUA_VERSION
> +	$(call KCONFIG_SET_OPT,CONFIG_LUAPKG,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER),$(SWUPDATE_BUILD_CONFIG))
> +endef
>  SWUPDATE_MAKE_ENV += HAVE_LUA=y
>  else
>  SWUPDATE_MAKE_ENV += HAVE_LUA=n
> @@ -110,6 +115,7 @@ endef
>  define SWUPDATE_KCONFIG_FIXUP_CMDS
>  	$(SWUPDATE_PREFER_STATIC)
>  	$(SWUPDATE_SET_BUILD_OPTIONS)
> +	$(SWUPDATE_SET_LUA_VERSION)
>  endef
>  
>  define SWUPDATE_BUILD_CMDS
> -- 
> 2.15.1
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
