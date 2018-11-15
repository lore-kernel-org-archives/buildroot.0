From: Andreas Naumann <dev@andin.de>
Date: Thu, 15 Nov 2018 17:41:35 +0100
Subject: [Buildroot] [PATCH next v4 6/6] core: implement per-package SDK
 and target
In-Reply-To: <20181114105557.12599-7-thomas.petazzoni@bootlin.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-7-thomas.petazzoni@bootlin.com>
Message-ID: <de9da9af-71f4-cfe2-f691-5aae17e3ca0a@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 14.11.18 um 11:55 schrieb Thomas Petazzoni:
...
> +# $1: deps
> +ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
> +define prepare-per-package-folder
> +	mkdir -p $(HOST_DIR) $(TARGET_DIR)
> +	$(foreach pkg,$(1),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> +		$(HOST_DIR)$(sep))
> +	$(foreach pkg,$(1),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
> +		$(TARGET_DIR)$(sep))
> +endef
> +endif
> +
>   ################################################################################
>   # Implicit targets -- produce a stamp file for each step of a package build
>   ################################################################################
> @@ -133,6 +148,7 @@ endif
>   # Retrieve the archive
>   $(BUILD_DIR)/%/.stamp_downloaded:
>   	@$(call step_start,download)
> +	$(call prepare-per-package-folder,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
>   	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>   # Only show the download message if it isn't already downloaded
>   	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
> @@ -159,6 +175,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
>   $(BUILD_DIR)/%/.stamp_extracted:
>   	@$(call step_start,extract)
>   	@$(call MESSAGE,"Extracting")
> +	$(call prepare-per-package-folder,$($(PKG)_FINAL_EXTRACT_DEPENDENCIES))
>   	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
>   	$(Q)mkdir -p $(@D)
>   	$($(PKG)_EXTRACT_CMDS)
> @@ -219,6 +236,7 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>   $(BUILD_DIR)/%/.stamp_configured:
>   	@$(call step_start,configure)
>   	@$(call MESSAGE,"Configuring")
> +	$(call prepare-per-package-folder,$($(PKG)_FINAL_DEPENDENCIES))
>   	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
>   	$($(PKG)_CONFIGURE_CMDS)
>   	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))

This is much clearer to me than v3, however there is a problem with 
kconfig packages. Unfortunately, the kconfig infrastructure is running 
the 'make xxx_defconfig' step before the configure-step is "officially" 
started. This is due to the kconfig_fixup target being a dependency of 
-configure. This in turn requires availability of the toolchain and 
other prerequisites that are part of _FINAL_DEPENDENCIES earlier as 
prepared in your above patch.

I made a patch which moves the _FINAL_DEPENDENCIES preparation to an 
additional .stamp-configure-prepare step just before .stamp_configured. 
That works but is not particularly beautiful.
I guess a more proper solution would be to somehow move the 
kconfig_fixup code into the configure-step. Maybe use the 
pre-configure-hook, any suggestions?


regards,
Andreas
