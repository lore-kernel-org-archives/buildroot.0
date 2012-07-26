From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2012 18:35:47 +0200
Subject: [Buildroot] [PATCH] at91bootstrap: bump version to 3.2
In-Reply-To: <1343248264-6435-1-git-send-email-spdawson@gmail.com>
References: <1343248264-6435-1-git-send-email-spdawson@gmail.com>
Message-ID: <501171E3.5030506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/25/12 22:31, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>

  Since there are quite a few more changes than a simple version bump, a more
extended commit message would be appropriate.

> ---
>   boot/at91bootstrap/Config.in                       |   28 +-
>   .../at91bootstrap-1.16-eabi-fix.patch              |  334 ---------
>   .../at91bootstrap-1.16-u-boot-relocation-fix.patch |  299 --------
>   .../at91bootstrap-3.2-u-boot-relocation-fix.patch  |  750 ++++++++++++++++++++
>   boot/at91bootstrap/at91bootstrap.mk                |   34 +-
>   5 files changed, 769 insertions(+), 676 deletions(-)
>   delete mode 100644 boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
>   delete mode 100644 boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
>   create mode 100644 boot/at91bootstrap/at91bootstrap-3.2-u-boot-relocation-fix.patch
>
> diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
> index 9cbaf81..d4adabd 100644
> --- a/boot/at91bootstrap/Config.in
> +++ b/boot/at91bootstrap/Config.in
> @@ -19,32 +19,10 @@ config BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR
>
>   	  Most users may leave this empty
>
> -config BR2_TARGET_AT91BOOTSTRAP_BOARD
> -	string "Bootstrap board"
> +config BR2_TARGET_AT91BOOTSTRAP_DEFCONFIG
> +	string "Bootstrap defconfig"
>   	default ""
>   	help
[snip]
> +	  This is used to do a make<DEFCONFIG>_defconfig

  This help text is a bit limited.  How about

Name of the defconfig file to use, without the trailing
_defconfig.  The defconfig is located in ...


  With this change from a config.h to a Kconfig, some of the
buildroot defconfigs will also have to be adapted:

$ git grep -l BR2_TARGET_AT91BOOTSTRAP configs 

configs/at91sam9260dfc_defconfig 

configs/at91sam9261ek_defconfig 

configs/at91sam9263ek_defconfig 

configs/at91sam9g20dfc_defconfig 

configs/calao_usb_a9263_defconfig 

configs/calao_usb_a9g20_lpw_defconfig


  Also it would be nice to have the choice to use a custom config rather than
a defconfig (which is the whole point of having a Kconfig system to begin
with).  That could be in a separate patch, though.

  Another nice-to-have is to get add the targets to run xxxconfig directly from
buildroot, like for busybox, for the kernel, etc.  I've been thinking about
creating a generic-kconfig infrastructure (or maybe kconfig-package?) to make
that easier.

[snip]
> diff --git a/boot/at91bootstrap/at91bootstrap-3.2-u-boot-relocation-fix.patch b/boot/at91bootstrap/at91bootstrap-3.2-u-boot-relocation-fix.patch
> new file mode 100644
> index 0000000..51000e6
> --- /dev/null
> +++ b/boot/at91bootstrap/at91bootstrap-3.2-u-boot-relocation-fix.patch

  Nowadays, we prefer to leave out the version number from the patches, unless
we support several versions of the package (like e.g. busybox).

> @@ -0,0 +1,750 @@
> +Every AT91SAM plaforms were broken between 2010.12 and 2011.03 because
> +of the relocation changes.
> +
> +We have to get JUMP_ADDR consistant with what is used by u-boot
> +(CONFIG_SYS_TEXT_BASE).
> +
> +I didn't know what to do with at91sam9m10g45ek as it doesn't seems to be
> +converted yet. But anyway, that means that it is either not working or
> +doesn't care so changing it here shouldn't harm.

  Is this paragraph still true?

> +
> +I also chose to "repartition" the dataflash. u-boot is now living at
> +0x4000, letting 16kB for the bootstrap. We also have to increase the
> +IMG_SIZE as u-boot as grown larger than the default value.
> +As requested on the u-boot ML, we assume that it could be up to 512kB
> +big.
> +
> +It means that now, you have to flash your kernel at 0x0008C000 instead
> +of 0x00042000. And so you also have to load it from that adress from
> +u-boot.
> +
> +Then, remember that you could decrease IMG_SIZE to boot faster.
> +
> +Signed-off-by: Alexandre Belloni<alexandre.belloni@piout.net>
> +Signed-off-by: Simon Dawson<spdawson@gmail.com>
[snip]
> diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
> index d8caed7..00199e4 100644
> --- a/boot/at91bootstrap/at91bootstrap.mk
> +++ b/boot/at91bootstrap/at91bootstrap.mk
> @@ -3,23 +3,14 @@
>   # at91bootstrap
>   #
>   #############################################################
> -AT91BOOTSTRAP_VERSION = 1.16
> -AT91BOOTSTRAP_SITE = http://www.atmel.com/dyn/resources/prod_documents/
> -AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
> -
> -AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
> -AT91BOOTSTRAP_MEMORY = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
> -AT91BOOTSTRAP_MAKE_SUBDIR = board/$(AT91BOOTSTRAP_BOARD)/$(AT91BOOTSTRAP_MEMORY)
> -AT91BOOTSTRAP_BINARY = $(AT91BOOTSTRAP_MAKE_SUBDIR)/$(AT91BOOTSTRAP_MEMORY)_$(AT91BOOTSTRAP_BOARD).bin
> +AT91BOOTSTRAP_VERSION = 3.2
> +AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap/AT91Bootstrap3.2

  Maybe this could be .../AT91Bootstrap$(AT91BOOTSTRAP_VERSION)

> +AT91BOOTSTRAP_SOURCE = at91bootstrap_9n12.tar.gz

  What does the 9n12 stand for, do you know?

>
>   AT91BOOTSTRAP_INSTALL_IMAGES = YES
>   AT91BOOTSTRAP_INSTALL_TARGET = NO
>
> -define AT91BOOTSTRAP_EXTRACT_CMDS
> -	unzip -d $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
> -	mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)/* $(@D)
> -	rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
> -endef
> +AT91BOOTSTRAP_MAKE_OPT += CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)

  Not a biggie, but the += is actually pointless; = is enough.

>
>   ifneq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR)),)
>   define AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
> @@ -30,21 +21,28 @@ endef
>   AT91BOOTSTRAP_POST_PATCH_HOOKS += AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
>   endif
>
> +define AT91BOOTSTRAP_CONFIGURE_CMDS
> +	cp $(@D)/board/*/$(BR2_TARGET_AT91BOOTSTRAP_DEFCONFIG)_defconfig \
> +		$(@D)/.config
> +	$(info Fixing Linux kernel image filename in configuration)
> +	/bin/sed -r -i -e 's/image.bin/uImage/' $(@D)/.config

  The $(info ...) call seems redundant to me.  And in any case, it could use
either @echo or $(call MESSAGE,...).

  The sed call should use $(SED) (which already includes the -i).  The -r
option is redundant since you're not actually using extended regexps.


> +endef
> +
>   define AT91BOOTSTRAP_BUILD_CMDS
> -	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
> +	$(MAKE) $(AT91BOOTSTRAP_MAKE_OPT) -C $(@D) boot
>   endef
>
>   define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS
> -	cp $(@D)/$(AT91BOOTSTRAP_BINARY) $(BINARIES_DIR)
> +	$(MAKE) $(AT91BOOTSTRAP_MAKE_OPT) -C $(@D) bootstrap
>   endef
>
>   $(eval $(generic-package))
>
>   ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
> -# we NEED a board name unless we're at make source
> +# we NEED a defconfig name unless we're at make source
>   ifeq ($(filter source,$(MAKECMDGOALS)),)
> -ifeq ($(AT91BOOTSTRAP_BOARD),)
> -$(error No AT91Bootstrap board name set. Check your BR2_TARGET_AT91BOOTSTRAP_BOARD setting)
> +ifeq ($(BR2_TARGET_AT91BOOTSTRAP_DEFCONFIG),)

  I think you're missing a qstrip here - BR2_TARGET_AT91BOOTSTRAP_DEFCONFIG
is "" when it's not set.

  Regards,
  Arnout

> +$(error No AT91Bootstrap defconfig name set. Check your BR2_TARGET_AT91BOOTSTRAP_DEFCONFIG setting)
>   endif
>   endif
>   endif

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
