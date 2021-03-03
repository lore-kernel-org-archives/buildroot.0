From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 3 Mar 2021 18:11:46 +0100
Subject: [Buildroot] [PATCH 1/1] fix failure during 'make
 linux-menuconfig' when PATH env var has spaces
In-Reply-To: <16100eb6-bac8-2e4d-65f2-26333179f3b8@foxvalley.net>
References: <16100eb6-bac8-2e4d-65f2-26333179f3b8@foxvalley.net>
Message-ID: <9469affa-d61e-347a-ef52-1ce6b1a11a23@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Dan,

On 01/03/2021 03:40, Dan Raymond wrote:
> From 4db6db355723bedb5918be214fbd6c6eb4a39257 Mon Sep 17 00:00:00 2001
> From: Dan Raymond <draymond@foxvalley.net>
> Date: Sun, 28 Feb 2021 18:27:18 -0700
> Subject: [PATCH 1/1] fix failure during 'make linux-menuconfig' when PATH env
> var has spaces
> 
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
> +sed_cmds=$(foreach var,$(1),-e 's/$(var)="[^"]*" *//' -e 's/$(var)=[^ ]* *//')
> +strip_env=$(shell echo "$(subst ",\",$(2))" | sed $(call sed_cmds,$(1)))

 This is a bit of half-hearted quoting. It happens to work for spaces, but
breaks down on double quotes, backslashes, dollar signs, and probably others as
well.

 I don't like to solve one specific corner case but leaving the door wide open
for different ones...

 Unfortunately, proper shell quoting is really really hard.

 Therefore, I'd propose to skirt around the issue entirely by overriding the
environment variables directly. Something like this (untested):

$(2)_CONFIGURATOR_MAKE_ENV = \
	$$($(2)_MAKE_ENV) \
	PATH="$$(BR_PATH)" \
	PKG_CONFIG= \
	...


 Regards,
 Arnout
