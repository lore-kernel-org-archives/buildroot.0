From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Oct 2020 22:14:20 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/uboot-tools: migrate
 BR2_TARGET_UBOOT_ENVIMAGE from U-Boot pkg
In-Reply-To: <20200924192912.51913-2-matthew.weber@rockwellcollins.com>
References: <20200924192912.51913-1-matthew.weber@rockwellcollins.com>
 <20200924192912.51913-2-matthew.weber@rockwellcollins.com>
Message-ID: <fbd51dc2-90f1-7024-37d4-95cb9d4b57d5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

On 24/09/2020 21:29, Matt Weber wrote:
> Migrating the support for this feature to uboot-tools to gain the
> ability to build env files when BR2_TARGET_UBOOT isn't selected.
> 
> Note: This patch creates a circular dependency with uboot until the
> similar migration patch is merged for uboot scripts
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

[snip]
> +config BR2_TARGET_UBOOT_ENVIMAGE
> +	bool "u-boot env generation was moved"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
> +	help
> +	  Migrated U-Boot env generation to uboot-tools
> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
> +	string "The uboot env image source string has been renamed"
> +	help
> +	  Migrated U-Boot env generation to uboot-tools.
> +	  New option is named BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE
> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE_WRAP
> +	bool
> +	default y if BR2_TARGET_UBOOT_ENVIMAGE_SOURCE != ""
> +	select BR2_LEGACY

 I believe we can simplify this to:

config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
	string "The uboot env image source string has been renamed"
	depends on BR2_TARGET_UBOOT_ENVIMAGE
	help
	  Migrated U-Boot env generation to uboot-tools.
	  New option is named BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE

 There is no need to select BR2_LEGACY explicitly, since the top-level option
already selects it. Thanks to the "depends on", it is sufficient to remove the
top-level option and save the .config to start using the new options and get rid
of the legacy ones.

> +
> +# Note: BR2_TARGET_UBOOT_ENVIMAGE_SOURCE is still referenced from package/uboot-tools/Config.in
> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
> +	string "The uboot env image size string has been renamed"
> +	help
> +	  Migrated U-Boot env generation to uboot-tools.
> +	  New option is named BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE
> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_SIZE_WRAP
> +	bool
> +	default y if BR2_TARGET_UBOOT_ENVIMAGE_SIZE != ""
> +	select BR2_LEGACY

 Same here.

> +
> +# Note: BR2_TARGET_UBOOT_ENVIMAGE_SIZE is still referenced from package/uboot-tools/Config.in
> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
> +	bool "u-boot env generation was moved"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT
> +	help
> +	  Migrated U-Boot env generation to uboot-tools

 And this one isn't necessary at all, the top-level one is sufficient. At least
I think so, please double-check :-)


[snip]

> +ifeq ($(BR2_TARGET_UBOOT),y)
> +define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
> +		$(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
> +		$(UBOOT_SRCDIR) \
> +		>$(@D)/boot-env-defaults.txt
> +endef
> +HOST_UBOOT_TOOLS_DEPENDENCIES += uboot

 I believe this dependency is only needed if
BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE is set and
BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE is empty, no?

 Of course the dependency doesn't really *hurt*, but it's nicer to avoid
unneeded dependencies IMHO.

> +endif
> +
> +ifneq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),)
> +UBOOT_TOOLS_GENERATE_ENV_FILE = $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE))
> +define HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE
> +	$(HOST_DIR)/bin/mkenvimage -s $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE) \
> +		$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT),-r) \
> +		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
> +		-o $(BINARIES_DIR)/uboot-env.bin \
> +		$(if $(UBOOT_TOOLS_GENERATE_ENV_FILE), \
> +		$(UBOOT_TOOLS_GENERATE_ENV_FILE), \
> +		$(@D)/boot-env-defaults.txt)
> +endef
> +
> +ifeq ($(BR_BUILDING),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE)),)
> +$(error Please provide U-Boot environment size (BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE setting))
> +endif
> +ifeq ($(BR2_TARGET_UBOOT),)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE),)
> +$(error Please provide U-Boot environment file BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE setting))
> +endif
> +endif #BR2_TARGET_UBOOT
> +endif #BR_BUILDING
> +endif #BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
> +
>  define HOST_UBOOT_TOOLS_INSTALL_CMDS
>  	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/bin/mkimage
>  	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
>  	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
> +	$(HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS)

 This will *always* build boot-env-defaults.txt when uboot is selected, even if
we're not building an environment image. That's not good IMHO.

 Regards,
 Arnout

> +	$(HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE)
>  endef
>  
>  $(eval $(generic-package))
> 
