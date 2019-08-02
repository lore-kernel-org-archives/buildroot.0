From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 17:25:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/pkg-kconfig.mk: new
 <pkg>-diff-config target
In-Reply-To: <20180921135521.32435-3-m.patzlaff@pilz.de>
References: <20180921135521.32435-1-m.patzlaff@pilz.de>
 <20180921135521.32435-3-m.patzlaff@pilz.de>
Message-ID: <20190802172554.426fc521@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcel,

On Fri, 21 Sep 2018 15:55:21 +0200
Marcel Patzlaff <m.patzlaff@pilz.de> wrote:

> This patch introduces the new target to compare the current
> configuration with the one derived from the defconfig + fragments (if
> any). It helps identifying settings not yet inserted to the defconfig
> or any fragment.
> 
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> ---
>  package/pkg-kconfig.mk | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 5952be5482..b746dc588c 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -49,6 +49,18 @@ define kconfig-package-regen-dot-config
>  			$(Q)(yes "" | $($(1)_KCONFIG_MAKE) oldconfig)))
>  endef
>  
> +# Macro to create a .config file where all given fragments are merged into.
> +# $(1): the name of the package in upper-case letters
> +# $(2): name of the .config file
> +# $(3): fragment files to merge
> +define kconfig-package-merge-config
> +	$(Q)$(if $($(1)_KCONFIG_DEFCONFIG),\
> +		$($(1)_KCONFIG_MAKE) $($(1)_KCONFIG_DEFCONFIG),\
> +		$(INSTALL) -m 0644 -D $($(1)_KCONFIG_FILE) $(2))
> +	$(Q)support/kconfig/merge_config.sh -m -O $(@D) $(2) $(3)

This $(@D) here cannot work. It works when this macro is called in the
context of the $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) rule, because
$(@D) makes sense. But when it's called inside the $(1)-diff-config
rule, $(@D) doesn't make sense, and evaluates to ".". Due to this,
when building in-tree, kconfig-package-merge-config overwrites the
Buildroot .config file!

I fixed this by using $(dir $(2)) instead of $(@D).

> +$(1)-diff-config: $(1)-check-configuration-done
> +	$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_DIR)/.config.dc.bak
> +	$$(call kconfig-package-merge-config,$(2),$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG),\
> +		$$($(2)_KCONFIG_FRAGMENT_FILES))
> +	@echo "### start of $$(@) output ###"
> +	@utils/diffconfig $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) \
> +		 $$($(2)_DIR)/.config.dc.bak

Changed @utils/diffconfig to $$(Q)utils/diffconfig

> +	@echo "### end of $$(@) output ###"

Both Yann and me found that the start/end messages were not really
needed. It would be nice if the output was less verbose, and really
only contained the output of utils/diffconfig, but we didn't find that
the start/end marker were making things any better.

I've applied with the above changes. Thanks a lot for this contribution!

Could you prepare an addition to the Buildroot manual to document this
new feature ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
