From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:43:33 +0100
Subject: [Buildroot] [PATCH v2 3/8] boot/uboot: Add support for Kbuild &
 Kconfig build system
In-Reply-To: <1420897647-25001-4-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
 <1420897647-25001-4-git-send-email-jkrause@posteo.de>
Message-ID: <20150110164333.737e1d6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 10 Jan 2015 14:47:22 +0100, J?rg Krause wrote:

> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index f3e1778..fe62e34 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -4,13 +4,22 @@ config BR2_TARGET_UBOOT
>  	  Build "Das U-Boot" Boot Monitor
>  
>  if BR2_TARGET_UBOOT
> +if !BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
>  config BR2_TARGET_UBOOT_BOARDNAME
>  	string "U-Boot board name"
>  	help
>  	  One of U-Boot supported boards to be built.
> -	  This will be suffixed with _config to meet U-Boot standard naming.
> -	  See boards.cfg in U-Boot source code for the list of available
> -	  configurations.
> +
> +	  Since U-Boot version 2014.10 the board configuration files are
> +	  located in the directory configs in the U-Boot source tree.
> +	  For U-Boot versions before version 2014.10 see boards.cfg in U-Boot
> +	  source code for the list of available configurations.
> +
> +	  The board name will be suffixed with _defconfig in case of building
> +	  the target with the Kbuild and Kconfig build system (only available
> +	  for U-Boot 2014.10 or newer) or with _config in case of building with
> +	  the legacy build system (before U-Boot 2014.10).
> +endif
>  
>  choice
>  	prompt "U-Boot Version"
> @@ -70,6 +79,29 @@ config BR2_TARGET_UBOOT_VERSION
>  	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
>  		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
>  
> +config BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG
> +	bool "Use Kbuild & Kconfig build system"
> +	default y if BR2_TARGET_UBOOT_VERSION = "2014.10"
> +	help
> +	  Use the Kbuild & Kconfig build system for building the target.
> +
> +	  The Kbuild & Kconfig build system is introduced in U-Boot version
> +	  2014.10. The configuration file boards.cfg used in versions before
> +	  2014.10 has been converted to Kconfig and is not used anymore.
> +	  Instead, the configuration is done with a <board>_defconfig file,
> +	  which is the entry point of the build process.
> +
> +if BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG
> +config BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
> +	bool "Use a custom config file"
> +
> +config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
> +	string "Custom config file path"
> +	depends on BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the custom <board>_defconfig file.
> +endif

Hum, this doesn't look really nice. Maybe we want something more like:

choice
	prompt "Build system"
	default BR2_TARGET_UBOOT_BUILD_SYSTEM_KBUILD

config BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
	bool "legacy"
	help
	  Select this option if you use an old U-Boot (older than XYZ),
	  so that we use the old build system.

config BR2_TARGET_UBOOT_BUILD_SYSTEM_KBUILD
	bool "kbuild"
	help
	  Select this option if you use a recent U-Boot (more recent
	  than XYZ), so that we use the kbuild build system.

endchoice

And then have the legacy options enclosed in "if
BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY ... endif", and the kbuild options
enclosed in "if BR2_TARGET_UBOOT_BUILD_SYSTEM_KBUILD ... endif".

> -define UBOOT_CONFIGURE_CMDS
> +ifeq ($(BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG),y)
> +ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
> +define UBOOT_CONFIGURE_BOARD
> +	$(INSTALL) -m 0644 $(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE) $(UBOOT_DIR)/configs/buildroot_defconfig
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) buildroot_defconfig
> +	rm $(UBOOT_DIR)/configs/buildroot_defconfig
> +endef
> +else
> +define UBOOT_CONFIGURE_BOARD
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) $(UBOOT_BOARD_NAME)_defconfig
> +endef
> +endif # BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
> +else
> +define UBOOT_CONFIGURE_BOARD
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) $(UBOOT_BOARD_NAME)_config
> +endef
> +endif # BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG
> +
> +define UBOOT_CONFIGURE_CMDS
> +	$(UBOOT_CONFIGURE_BOARD)
>  	@echo >> $(@D)/include/config.h
>  	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
>  	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
> @@ -166,9 +184,16 @@ $(eval $(generic-package))
>  ifeq ($(BR2_TARGET_UBOOT),y)
>  # we NEED a board name unless we're at make source
>  ifeq ($(filter source,$(MAKECMDGOALS)),)
> +
> +ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),)
>  ifeq ($(UBOOT_BOARD_NAME),)
>  $(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
>  endif
> +else
> +ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)),)
> +$(error No board configuration file specified, check your BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE setting)
> +endif
> +endif

I haven't followed what's going on here, but when configured to use
kbuild, we should use the kconfig-package infrastructure.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
