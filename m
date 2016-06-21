From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 22 Jun 2016 00:12:02 +0200
Subject: [Buildroot] [PATCH v2 2/5] Makefile: Generate %_defconfig
 recipes from macro.
In-Reply-To: <469f863632a69c04b8522ad2a49c4efc50704ca6.1466484997.git.sam.bobroff@au1.ibm.com>
References: <cover.1466484997.git.sam.bobroff@au1.ibm.com>
 <469f863632a69c04b8522ad2a49c4efc50704ca6.1466484997.git.sam.bobroff@au1.ibm.com>
Message-ID: <67d0f049-0493-d915-80e0-603b5382bdf4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam, All

Le 21/06/2016 ? 06:56, Sam Bobroff a ?crit :
> From: Patrick Williams <patrick@stwcx.xyz>
> 
> To reduce duplication in the %_defconfig recipes with $(TOPDIR) and
> $(BR2_EXTERNAL) versions, generate these from a macro.  The macro is
> now called on a list of directories containing the appropriate ones.
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Your Sob is missing here and for the following patches, see
http://nightly.buildroot.org/manual.html#submitting-patches

Best regards,
Romain

> ---
>  Makefile | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9f3fc92..e78b9e2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -842,13 +842,14 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
>  
>  # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
> -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
> -	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
> -		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
> +define CREATE_DEFCONFIG_RECIPES
> +%_defconfig: $$(BUILD_DIR)/buildroot-config/conf $1/%_defconfig outputmakefile
> +	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$$(TOPDIR)/configs/$$@ \
> +		$$< --defconfig=$1/$$@ $$(CONFIG_CONFIG_IN)
> +endef
>  
> -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
> -	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
> -		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
> +BR2_DEFCONFIG_PATHS=$(TOPDIR)/configs $(BR2_EXTERNAL)/configs
> +$(foreach path,$(BR2_DEFCONFIG_PATHS),$(eval $(call CREATE_DEFCONFIG_RECIPES,$(path))))
>  
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< \
> @@ -894,7 +895,7 @@ $(1): $$(BUILD_DIR)/buildroot-config/conf $(call CONFIG_FILE_LIST,$2 $3) outputm
>  	@rm -rf $$(CONFIG_DIR)/.merge_config
>  endef
>  
> -$(foreach d,$(TOPDIR)/configs $(BR2_EXTERNAL)/configs,$(eval -include $(d)/*.mk))
> +$(foreach d,$(BR2_DEFCONFIG_PATHS),$(eval -include $(d)/*.mk))
>  
>  ################################################################################
>  #
> 
