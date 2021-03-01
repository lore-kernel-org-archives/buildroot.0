From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Mar 2021 08:21:25 +0100
Subject: [Buildroot] [PATCH 1/1] fix failure during 'make
 linux-menuconfig' when PATH env var has spaces
In-Reply-To: <16100eb6-bac8-2e4d-65f2-26333179f3b8@foxvalley.net>
References: <16100eb6-bac8-2e4d-65f2-26333179f3b8@foxvalley.net>
Message-ID: <20210301072125.GK2390841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dan, All,

On 2021-02-28 19:40 -0700, Dan Raymond spake thusly:
> From 4db6db355723bedb5918be214fbd6c6eb4a39257 Mon Sep 17 00:00:00 2001
> From: Dan Raymond <draymond@foxvalley.net>
> Date: Sun, 28 Feb 2021 18:27:18 -0700
> Subject: [PATCH 1/1] fix failure during 'make linux-menuconfig' when PATH
> env var has spaces

Thanks for the patch.

However, as I explained on IRC, this is far from sufficient. A lot of
places do not expect spaces in PATH. For example, the config.guess from
the gnuconfig package (i.e. a file we do bundle, and that is maintain
elsewhere), and present in virtually all autotools-based packages, has
this line:

    PATH=$PATH:/.attbin ; export PATH

So, basically, all autotools packages are somewhat broken when PATH
contains spaces.

As a second example, package/fakedate/fakedate splits PATH on spaces:

    for P in `echo $PATH | tr ':' ' '`; do

Fixing that is too cumbersome, and again, the vast majority of things is
going to break when PATH contains spaces.

Rather, as I suggested on IRC, please add a sanity check in
support/dependencies/dependencies.sh, lines 31..44, that there indeed is
no spaces in PATH.

Besides, Buildroot does not even build when the top-level or output
directories contain spaces.

Regards,
Yann E. MORIN.

> Signed-off-by: Dan Raymond <draymond@foxvalley.net>
> ---
> ?package/pkg-kconfig.mk | 6 +++---
> ?support/misc/utils.mk? | 6 ++++++
> ?2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 2aecf2e203..6bf87fbead 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -205,9 +205,9 @@ endif
> ?# nconfig, gconfig, xconfig).
> ?# So we simply remove our PATH and PKG_CONFIG_* variables.
> ?$(2)_CONFIGURATOR_MAKE_ENV = \
> -??? $$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% \
> -??? ?? PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=% PKG_CONFIG_ALLOW_SYSTEM_LIBS=% \
> -??? ?? PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
> +??? $$(call strip_env,PATH PKG_CONFIG PKG_CONFIG_SYSROOT_DIR \
> +??? ?? PKG_CONFIG_ALLOW_SYSTEM_CFLAGS PKG_CONFIG_ALLOW_SYSTEM_LIBS \
> +??? ?? PKG_CONFIG_LIBDIR,$$($(2)_MAKE_ENV)) \
> ???? PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)"
> 
> ?# Configuration editors (menuconfig, ...)
> diff --git a/support/misc/utils.mk b/support/misc/utils.mk
> index dc60cad979..640e56c775 100644
> --- a/support/misc/utils.mk
> +++ b/support/misc/utils.mk
> @@ -135,3 +135,9 @@ define PRINTF
> ???? ??? ??? $(subst $(QUOTE),$(QUOTE)\$(QUOTE)$(QUOTE),\
> ???? ??? ??? ??? $(subst \,\\,$(1)))))\n'
> ?endef
> +
> +# strip variables (quoted or unquoted) from an environment string:
> +# MYENV = PATH="/bin:/dir with spaces" USER=root SHELL=/bin/sh
> +# $(call strip_env,PATH SHELL,$(MYENV)) --> USER=root
> +sed_cmds=$(foreach var,$(1),-e 's/$(var)="[^"]*" *//' -e 's/$(var)=[^ ]*
> *//')
> +strip_env=$(shell echo "$(subst ",\",$(2))" | sed $(call sed_cmds,$(1)))
> -- 
> 2.25.1
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
