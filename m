From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2019 17:41:29 +0100
Subject: [Buildroot] [PATCH 2/2] package/pkg-kconfig.mk: new
 <pkg>-diff-config target
In-Reply-To: <20180921135521.32435-3-m.patzlaff@pilz.de>
References: <20180921135521.32435-1-m.patzlaff@pilz.de>
 <20180921135521.32435-3-m.patzlaff@pilz.de>
Message-ID: <20190317164129.GF14237@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcel, All,

On 2018-09-21 15:55 +0200, Marcel Patzlaff spake thusly:
> This patch introduces the new target to compare the current
> configuration with the one derived from the defconfig + fragments (if
> any). It helps identifying settings not yet inserted to the defconfig
> or any fragment.
> 
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>

Thanks for this new iteration! :-)

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

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
> +	$(call kconfig-package-regen-dot-config,$(1))
> +endef
> +
>  ################################################################################
>  # inner-kconfig-package -- generates the make targets needed to support a
>  # kconfig package
> @@ -121,12 +133,7 @@ $(2)_KCONFIG_RULES = \
>  # Since the file could be a defconfig file it needs to be expanded to a
>  # full .config first.
>  $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
> -	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
> -		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
> -		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
> -	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
> -		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
> -	$$(call kconfig-package-regen-dot-config,$(2))
> +	$$(call kconfig-package-merge-config,$(2),$$(@),$$($(2)_KCONFIG_FRAGMENT_FILES))
>  
>  # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
>  # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
> @@ -248,11 +255,28 @@ $(1)-update-defconfig: PKG=$(2)
>  $(1)-update-defconfig: $(1)-savedefconfig
>  	$$(call kconfig-package-update-config,defconfig)
>  
> +# Target to output differences between the configuration obtained via the
> +# defconfig + fragments (if any) and the current configuration.
> +# Note: it preserves the timestamp of the current configuration when moving it
> +# around.
> +$(1)-diff-config: $(1)-check-configuration-done
> +	$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_DIR)/.config.dc.bak
> +	$$(call kconfig-package-merge-config,$(2),$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG),\
> +		$$($(2)_KCONFIG_FRAGMENT_FILES))
> +	@echo "### start of $$(@) output ###"
> +	@utils/diffconfig $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) \
> +		 $$($(2)_DIR)/.config.dc.bak
> +	@echo "### end of $$(@) output ###"
> +	$$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
> +	$$(Q)rm -f $$($(2)_DIR)/.config.dc.bak
> +
> +
>  endif # package enabled
>  
>  .PHONY: \
>  	$(1)-update-config \
>  	$(1)-update-defconfig \
> +	$(1)-diff-config \
>  	$(1)-savedefconfig \
>  	$(1)-check-configuration-done \
>  	$$($(2)_DIR)/.kconfig_editor_% \
> -- 
> 2.17.1
> 
> Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
> Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
> Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
> Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
> This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
> Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
> We do care about the environment! - Please consider the environment before printing this e-mail.
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
