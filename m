From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Feb 2020 21:26:32 +0100
Subject: [Buildroot] [PATCH v2 3/4] package/openrc: adapt "modules" init
 script to busybox "modprobe"
In-Reply-To: <20200227200815.26613-4-unixmania@gmail.com>
References: <20200227200815.26613-1-unixmania@gmail.com>
 <20200227200815.26613-4-unixmania@gmail.com>
Message-ID: <20200228202632.GI8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-02-27 17:08 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> If kmod tools are not selected, check the busybox configuration files
> and adapt the modules script accordingly:
> 
> - Busybox modprobe does not have a "--first-time" option.
> - The "--verbose" option is just "-v".
> - The "--use-blacklist" option is just "-b". Also blacklist support is
>   not selected in the default busybox configuration.
> 
> If modprobe is not available, do not install the modules script and
> configuration file.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/openrc/openrc.mk | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 3f6453cef5..0fc87f95b1 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -9,7 +9,7 @@ OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
>  OPENRC_LICENSE = BSD-2-Clause
>  OPENRC_LICENSE_FILES = LICENSE
>  
> -OPENRC_DEPENDENCIES = ncurses
> +OPENRC_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)

This not nice, because currently we have no package dpending on busybox.
Instead, busybox depends on all packages (for which it may provide
applets).

Adding this first dependency onto busybox risks introducing a new
circular dependency (if not now, in the future).

>  # set LIBNAME so openrc puts files in proper directories and sets proper
>  # paths in installed files. Since in buildroot /lib64 and /lib32 always
> @@ -29,9 +29,31 @@ else
>  OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
>  endif
>  
> -define OPENRC_BUILD_CMDS
> -	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)
> +# modprobe can be provided by either kmod or busybox
> +ifeq ($(BR2_PACKAGE_KMOD_TOOLS),)
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +# Busybox modprobe does not have a --first-time option; --verbose is just -v
> +# and --use-blacklist is just -b.
> +OPENRC_BB_FILES = $(BUSYBOX_KCONFIG_FILE) $(BUSYBOX_KCONFIG_FRAGMENT_FILES) $(BUSYBOX_BUILD_CONFIG)
> +ifeq ($(call KCONFIG_GET_OPT,CONFIG_MODPROBE,$(OPENRC_BB_FILES)),y)
> +ifeq ($(call KCONFIG_GET_OPT,CONFIG_FEATURE_MODPROBE_BLACKLIST,$(OPENRC_BB_FILES)),y)

This is not guaranteed to work, if the value of either or both of CONFIG_MODPROBE
or CONFIG_FEATURE_MODPROBE_BLACKLIST is not present in any of the config
fragments, and they get their default values (acted upon by running
oldconfig in busybox' package). Indeed, that happens way after we parse
our Makefiles.

Having Makefile constructs in Buildroot that test the presence and/or
content of Kconfig files is flawed by design.

> +OPENRC_MODULES_BLACKLIST = s/ --use-blacklist/ -b/
> +else
> +OPENRC_MODULES_BLACKLIST = s/ --use-blacklist//
> +endif
> +define OPENRC_MODULES_CLEAN
> +	$(SED) 's/ --first-time//;$(OPENRC_MODULES_BLACKLIST);s/--verbose/-v/' \
> +		$(@D)/init.d/modules.in
> +endef

This is conditional patching, and we like to avoid it as much as
possible.

We've discussed this series with the other maintainers, and we believe
that a simpler solution is to just add a dependency to kmod for openrc.

So I've posted that instead:
    https://patchwork.ozlabs.org/patch/1246825/

Regards,
Yann E. MORIN.

> +else # BR2_PACKAGE_BUSYBOX
> +# No modprobe command available. Do not build/install the modules script.
> +define OPENRC_MODULES_CLEAN
> +	$(SED) 's/ modules//' $(@D)/{conf.d,init.d,runlevels}/Makefile
>  endef
> +endif # CONFIG_MODPROBE
> +OPENRC_POST_PATCH_HOOKS += OPENRC_MODULES_CLEAN
> +endif # BR2_PACKAGE_BUSYBOX
> +endif # BR2_PACKAGE_KMOD_TOOLS
>  
>  define OPENRC_INSTALL_TARGET_CMDS
>  	$(MAKE) $(OPENRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
> -- 
> 2.18.2
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
