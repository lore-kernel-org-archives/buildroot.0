From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 23:08:36 +0200
Subject: [Buildroot] [PATCHv2 4/4] Add package cbootimage-configs
In-Reply-To: <1458227038-16383-5-git-send-email-julian@jusst.de>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
 <1458227038-16383-5-git-send-email-julian@jusst.de>
Message-ID: <20160419230836.202d4cbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 16:03:58 +0100, Julian Scheel wrote:
> Add package for cbootimage configurations that contains build scripts to
> generate bct and image files for various tegra based boards using cbootimage
> file.
> Additionally the package makefile includes extra hooks to generate
> self-contained flasher binaries based on u-boot, that are actually able to
> flash a u-boot instance into mmc memory when loaded to tegra via tegrarcm.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>

To be honest, this is too complicated. This package is doing too much
stuff in its .mk file. At some point, you mention that your .mk code is
heavily inspired by
https://github.com/NVIDIA/tegra-uboot-flasher-scripts. Why don't you
use/package those scripts instead?

Or maybe this thing should do less stuff, and simply provide the
necessary tools for a post-image script to do the job.

It would be useful if you could submit the defconfig for a Tegra based
board as part of this series so that we can see how it all fits
together.

I've added some more comments/questions below.



> +if BR2_PACKAGE_CBOOTIMAGE_CONFIGS
> +
> +config BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BUILD
> +	string "cbootimage board to build"

I think the "cbootimage" prefix in the string is useless here, and in
the other options. In menuconfig, we clearly see it's a suboption.


> +config BR2_PACKAGE_CBOOTIMAGE_CONFIGS_IMG_SIGNED
> +	bool "sign generated image for secureboot"
> +	help
> +	  Sign the image using a provided ssl key. This makes it possible to
> +	  run the image in secureboot environments with the matching key being
> +	  burned to the tegra fuses.
> +	  Be aware that the generated image will have the extension simg
> +	  instead of img if signing is enabled.
> +
> +	  Compatible key files can be generated with openssl:
> +	  openssl genrsa -out rsa_priv.pem 2048
> +
> +config BR2_PACKAGE_CBOOTIMAGE_CONFIGS_IMG_KEY
> +	string "pkc file name"
> +	depends on BR2_PACKAGE_CBOOTIMAGE_CONFIGS_IMG_SIGNED
> +	help
> +	  Key file to use for signing the loader image.

When there is such a bool to enable/disable + one string giving the
argument, I believe we generally prefer to just have the string. When
the string is empty -> feature is disabled.

> +if BR2_PACKAGE_CBOOTIMAGE_CONFIGS_GENERATE_FLASHER
> +
> +config BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_CREATE_GPT
> +	bool "write partition table to mmc 0"
> +	help
> +	  Add a flashing step which is writing a custom gpt partition table
> +	  onto the target devices first mmc storage
> +
> +config BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_GPT_FILE
> +	string "partition table file"
> +	depends on BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_CREATE_GPT
> +	default "package/cbootimage-configs/gpt-table"
> +	help
> +	  Provide a file that contains the paritition table to write to mmc.
> +	  Use format as specified in u-boot's README.gpt documentation file.
> +
> +	  Make sure to escape variable properly, as u-boot shall not evaluate
> +	  the variables when setting the environment variable, but only when
> +	  running the gpt command.
> +
> +	  Example file content:
> +	  uuid_disk=\$\{disk_uuid\};name=rootfs,size=2000MiB,uuid=\$\{rootfs_uuid\};name=data,size=-,uuid=\$\{data_uuid\}

Same here.

> diff --git a/package/cbootimage-configs/cbootimage-configs.hash b/package/cbootimage-configs/cbootimage-configs.hash
> new file mode 100644
> index 0000000..a4fd518
> --- /dev/null
> +++ b/package/cbootimage-configs/cbootimage-configs.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  f9eaa2e88fa24ea348d6358f18e4bab58ac21c586b5b6cb5300e21a6e1d9de83  cbootimage-configs-9d45319.tar.gz
> diff --git a/package/cbootimage-configs/cbootimage-configs.mk b/package/cbootimage-configs/cbootimage-configs.mk
> new file mode 100644
> index 0000000..69d6d29
> --- /dev/null
> +++ b/package/cbootimage-configs/cbootimage-configs.mk
> @@ -0,0 +1,128 @@
> +################################################################################
> +#
> +# cbootimage-configs
> +#
> +################################################################################
> +
> +CBOOTIMAGE_CONFIGS_VERSION = 9d45319
> +CBOOTIMAGE_CONFIGS_SITE = $(call github,avionic-design,cbootimage-configs,$(CBOOTIMAGE_CONFIGS_VERSION))

Why do you use the Avionic Design fork and not the original NVIDIA
repository, which you reference as the upstream in your Config.in help
text?

> +CBOOTIMAGE_CONFIGS_DEPENDENCIES = host-cbootimage uboot
> +CBOOTIMAGE_CONFIGS_INSTALL_TARGET = NO
> +CBOOTIMAGE_CONFIGS_INSTALL_IMAGES = YES
> +
> +CONFIGS_BUILD = $(call qstrip,$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BUILD))
> +BCT_NAME = $(call qstrip,$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BCT))
> +IMG_NAME = $(call qstrip,$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_IMG))
> +EXTRA_BOOTCMD = $(call qstrip,$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_EXTRA_BOOTCMD))
> +GPT_FILE = $(call qstrip,$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_GPT_FILE))
> +DFU_MAP = $(call qstrip,$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_DFU_MAP))
> +KEY_FILE = $(call qstrip,$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_IMG_KEY))

The variable namespace in Buildroot is global, so they should always be
prefixed by the name of the package.

> +ifeq ($(BR2_PACKAGE_CBOOTIMAGE_CONFIGS),y)
> +ifeq ($(CONFIGS_BUILD),)
> +	$(warning BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BUILD=$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BUILD))

That's debug stuff.

> +	$(warning CONFIGS_BUILD=$(CONFIGS_BUILD))

Ditto.

> +	$(error No cbootimage-configuration specififed to build. Check your BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BUILD setting)
> +endif
> +ifeq ($(BCT_NAME),)
> +	$(error No bct filename specified. Check your BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BCT setting)
> +endif
> +ifeq ($(IMG_NAME),)
> +	$(error No img filename specified. Check your BR2_PACKAGE_CBOOTIMAGE_CONFIGS_IMG setting)
> +endif
> +ifeq ($(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_CREATE_GPT),y)
> +ifeq ($(GPT_FILE),)
> +	$(error No gpt partitions specified. Check your BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_GPT_FILE setting)
> +endif
> +endif
> +ifeq ($(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_DFU),y)
> +ifeq ($(DFU_MAP),)
> +	$(error No dfu map specified. Check your BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_DFU_MAP setting)
> +endif
> +endif
> +ifeq ($(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_IMG_SIGNED),y)
> +ifeq ($(KEY_FILE),)
> +	$(error No key file specified. Check your BR2_PACKAGE_CBOOTIMAGE_CONFIGS_IMG_KEY setting)
> +endif
> +KEY_OPTS = skb=$(KEY_FILE)
> +else
> +KEY_OPTS =

Incorrect variable name. Also, I believe this should be separated from
the big list of checks.

> +endif
> +
> +TARGET_SIZE = $(TARGET_CROSS)size

To be moved to package/Makefile.in I believe, in a separate patch.

> +endif
> +
> +define CBOOTIMAGE_CONFIGS_BUILD_CMDS
> +	cp $(UBOOT_BUILDDIR)/u-boot-dtb-tegra.bin $(@D)/$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BUILD)/u-boot.bin
> +	(cd $(@D)/$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BUILD) && $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(KEY_OPTS))

use $(MAKE) -C $(@D)/$(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_BUILD)

> +endef
> +
> +# Generate a self-contained u-boot image, flashing u-boot to mmc
> +define CBOOTIMAGE_CONFIGS_BUILD_FLASHER_CMD
> +	# u-boot bss size: ${BSS_SIZE}
> +	# u-boot-nodtb-tegra.bin size: ${UBOOT_NODTB_TEGRA_SIZE}
> +	# u-boot.dtb size: ${UBOOT_DTB_SIZE}
> +	# ${IMG_NAME} size: ${IMG_SIZE}
> +	# u-boot plus dtb size: ${UBOOT_PLUS_DTB_SIZE}
> +	# padded size: ${PADDED_SIZE}
> +	# bootcmd: $(UBOOT_FLASH_ENV)
> +	# gpt-file: $(PWD)/$(GPT_FILE)

I don't see the usefulness of this comment.

> +
> +	cp $(UBOOT_BUILDDIR)/u-boot.dtb ${DTB_FILE}
> +	# Patch environment into u-boot dtb
> +	$(HOST_MAKE_ENV) fdtput -p -t x ${DTB_FILE} '/config' 'bootdelay' '0xfffffffe'
> +	$(HOST_MAKE_ENV) fdtput -p -t s ${DTB_FILE} '/config' 'bootcmd' $(UBOOT_FLASH_ENV)

What guarantees you that fdtput is available? You need to depend on
host-dtc to be sure that it's available.

> +
> +	# Assemble u-boot-flasher.bin
> +	cp $(UBOOT_BUILDDIR)/u-boot-nodtb-tegra.bin $(BINARIES_DIR)/u-boot-flasher.bin
> +	cat ${DTB_FILE} >> $(BINARIES_DIR)/u-boot-flasher.bin

Use $() to reference variables. Why don't you do a single cat here ?

> +	truncate -s $(PADDED_SIZE) $(BINARIES_DIR)/u-boot-flasher.bin
> +	cat $(@D)/$(CONFIGS_BUILD)/$(IMG_NAME) >> $(BINARIES_DIR)/u-boot-flasher.bin
> +endef
> +
> +# Computations for assembling u-boot with custom dtb mostly stolen from
> +# https://github.com/NVIDIA/tegra-uboot-flasher-scripts
> +# All credits go to Stephen Warren
> +ifeq ($(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_GENERATE_FLASHER),y)
> +LOADADDR = 0x80108000 # FIXME: this is Tegra124 only
> +BSS_SIZE = $(shell $(TARGET_SIZE) -A $(UBOOT_BUILDDIR)/u-boot | grep ".bss\b" | tr -s ' ' | cut -d ' ' -f 2)
> +UBOOT_NODTB_TEGRA_SIZE = $(shell stat -c %s $(UBOOT_BUILDDIR)/u-boot-nodtb-tegra.bin)
> +UBOOT_DTB_SIZE = $(shell stat -c %s $(UBOOT_BUILDDIR)/u-boot.dtb)
> +IMG_SIZE = $(shell stat -c %s $(@D)/$(CONFIGS_BUILD)/$(IMG_NAME))
> +IMG_SIZE_SECTORS = $(shell echo $$(( $(IMG_SIZE) / 512 )) )
> +IMG_SIZE_SECTORS_HEX = $(shell printf '0x%x' $(IMG_SIZE_SECTORS) )
> +UBOOT_PLUS_DTB_SIZE = $(shell echo $$(( $(UBOOT_NODTB_TEGRA_SIZE) + $(UBOOT_DTB_SIZE) )) )
> +# Keep BSS area clear, acquire an extra 4kb for incereased dtb, align to 4k
> +# boundary
> +PADDED_SIZE = $(shell echo $$(( $(UBOOT_PLUS_DTB_SIZE) + $(BSS_SIZE) + (2 * 4 * 1024) - 1 & ~((4 * 1024) - 1) )) )
> +IMAGEADDR = $(shell echo $$(( $(LOADADDR) + $(PADDED_SIZE) )) )
> +IMAGEADDR_HEX = $(shell printf '0x%x' $(IMAGEADDR) )

This is really the messy part. That's clearly way too much stuff
encoded into a Buildroot package.

> +ifeq ($(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_CREATE_GPT),y)
> +PWD = $(shell pwd)

Debugging stuff?

> +GPT_SPEC = $(shell cat $(GPT_FILE))

If it's just a string, why is it the path to a file rather than having
direcly the value in the Config.in option?

> +GPT_BOOTCMD = echo >>> Write partition table to MMC; gpt write mmc 0 '$(GPT_SPEC)'; mmc rescan
> +else
> +GPT_BOOTCMD =

Not needed, the default for a variable is to be empty.

Also, remember: all variables should be prefixed by the name of the
package.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_CBOOTIMAGE_CONFIGS_FLASHER_DFU),y)
> +DFU_BOOTCMD = echo >>> Enter DFU mode; setenv dfu_alt_info '$(DFU_MAP)'; dfu 0 mmc 0;
> +else
> +DFU_BOOTCMD =
> +endif
> +
> +UBOOT_FLASH_ENV = "echo >>> Write image to MMC; mmc dev 0 1; mmc write ${IMAGEADDR_HEX} 0 ${IMG_SIZE_SECTORS_HEX}; echo >>> Configure environment; env default -f -a; saveenv; $(GPT_BOOTCMD) $(EXTRA_BOOTCMD); $(DFU_BOOTCMD) echo >>> Resetting system; reset"

All this U-Boot command construction seem really project-specific, and
I don't see why we should hardcode all that stuff in a Buildroot
package. Buildroot should give the tools to generate such a U-Boot
image, but should not hardcode so much logic IMO.

> +DTB_FILE = $(@D)/u-boot-flasher.dtb
> +
> +# Add the actual assembly hook
> +CBOOTIMAGE_CONFIGS_POST_INSTALL_IMAGES_HOOKS += CBOOTIMAGE_CONFIGS_BUILD_FLASHER_CMD
> +endif

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
