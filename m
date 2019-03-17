From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2019 17:40:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/pkg-kconfig.mk: Reusability
 improvements
In-Reply-To: <20180921135521.32435-2-m.patzlaff@pilz.de>
References: <20180921135521.32435-1-m.patzlaff@pilz.de>
 <20180921135521.32435-2-m.patzlaff@pilz.de>
Message-ID: <20190317164042.GE14237@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcel, All,

On 2018-09-21 15:55 +0200, Marcel Patzlaff spake thusly:
> This patch refactors savedefconfig and the configuration re-generation
> to separate macros so that the functionality can be re-used in further
> rules.
> 
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-kconfig.mk | 43 ++++++++++++++++++++++++------------------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index d6c95b897e..5952be5482 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -27,6 +27,28 @@ define kconfig-package-update-config
>  	$(Q)touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
>  endef
>  
> +# Macro to save the defconfig file
> +# $(1): the name of the package in upper-case letters
> +define kconfig-package-savedefconfig
> +	$($(1)_MAKE_ENV) $(MAKE) -C $($(1)_DIR) \
> +		$($(1)_KCONFIG_OPTS) savedefconfig
> +endef
> +
> +# The correct way to regenerate a .config file is to use 'make olddefconfig'.
> +# For historical reasons, the target name is 'oldnoconfig' between Linux kernel
> +# versions 2.6.36 and 3.6, and remains as an alias in later versions.
> +# In older versions, and in some other projects that use kconfig, the target is
> +# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
> +# only, as this can fail in complex cases.
> +# $(1): the name of the package in upper-case letters
> +define kconfig-package-regen-dot-config
> +	$(if $(filter olddefconfig,$($(1)_KCONFIG_RULES)),
> +		$(Q)$($(1)_KCONFIG_MAKE) olddefconfig,
> +		$(if $(filter oldnoconfig,$($(1)_KCONFIG_RULES)),
> +			$(Q)$($(1)_KCONFIG_MAKE) oldnoconfig,
> +			$(Q)(yes "" | $($(1)_KCONFIG_MAKE) oldconfig)))
> +endef
> +
>  ################################################################################
>  # inner-kconfig-package -- generates the make targets needed to support a
>  # kconfig package
> @@ -94,20 +116,6 @@ $(2)_KCONFIG_RULES = \
>  	$$(shell $$($(2)_KCONFIG_MAKE) -pn config 2>/dev/null | \
>  		sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d')
>  
> -# The correct way to regenerate a .config file is to use 'make olddefconfig'.
> -# For historical reasons, the target name is 'oldnoconfig' between Linux kernel
> -# versions 2.6.36 and 3.6, and remains as an alias in later versions.
> -# In older versions, and in some other projects that use kconfig, the target is
> -# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
> -# only, as this can fail in complex cases.
> -define $(2)_REGEN_DOT_CONFIG
> -	$$(if $$(filter olddefconfig,$$($(2)_KCONFIG_RULES)),
> -		$$(Q)$$($(2)_KCONFIG_MAKE) olddefconfig,
> -		$$(if $$(filter oldnoconfig,$$($(2)_KCONFIG_RULES)),
> -			$$(Q)$$($(2)_KCONFIG_MAKE) oldnoconfig,
> -			$$(Q)(yes "" | $$($(2)_KCONFIG_MAKE) oldconfig)))
> -endef
> -
>  # The specified source configuration file and any additional configuration file
>  # fragments are merged together to .config, after the package has been patched.
>  # Since the file could be a defconfig file it needs to be expanded to a
> @@ -118,7 +126,7 @@ $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_F
>  		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
>  	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
>  		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
> -	$$($(2)_REGEN_DOT_CONFIG)
> +	$$(call kconfig-package-regen-dot-config,$(2))
>  
>  # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
>  # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
> @@ -134,7 +142,7 @@ $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): | $$($(2)_KCONFIG_DEPENDENCIES)
>  # The exact rules are specified by the package .mk file.
>  define $(2)_FIXUP_DOT_CONFIG
>  	$$($(2)_KCONFIG_FIXUP_CMDS)
> -	$$($(2)_REGEN_DOT_CONFIG)
> +	$$(call kconfig-package-regen-dot-config,$(2))
>  	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  endef
>  
> @@ -223,8 +231,7 @@ $(1)-check-configuration-done:
>  	fi
>  
>  $(1)-savedefconfig: $(1)-check-configuration-done
> -	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> -		$$($(2)_KCONFIG_OPTS) savedefconfig
> +	$$(call kconfig-package-savedefconfig,$(2))
>  
>  # Target to copy back the configuration to the source configuration file
>  # Even though we could use 'cp --preserve-timestamps' here, the separate
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
