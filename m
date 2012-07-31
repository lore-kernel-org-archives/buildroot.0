From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jul 2012 16:57:45 +0200
Subject: [Buildroot] [PATCH] at91bootstrap3: new package
In-Reply-To: <1343389506-7469-1-git-send-email-spdawson@gmail.com>
References: <1343389506-7469-1-git-send-email-spdawson@gmail.com>
Message-ID: <5017F269.6090508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 13:45, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  [This time I did a build test, with an all-features-enabled
busybox toolchain. First defconfig I tried failed, but at91sam9g45sd
succeeded; the failure is an issue with the at91bootstrap
build system.]

  I have some small, optional comments below, but nothing to stop
inclusion as it is.

  First comment: in the commit message you could mention why
this is a new package rather than a bump of at91bootstrap
(perhaps quoting Thomas).


[snip]
> +config BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG
> +	string "Defconfig name"
> +	depends on BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG
> +	help
> +	 Name of the at91bootstrap3 defconfig file to use, without the
> +	 trailing _defconfig.  The defconfig is located in
> +	 board/<board>  in the at91bootstrap3 tree.

  It's actually in board/<processor>/<board>_defconfig, no?

> +
> +config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the at91bootstrap3 configuration file
> +
> +endif # BR2_TARGET_AT91BOOTSTRAP3
> diff --git a/boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch b/boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch
> new file mode 100644
> index 0000000..0139959
> --- /dev/null
> +++ b/boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch
> @@ -0,0 +1,746 @@
> +Every AT91SAM plaforms were broken between 2010.12 and 2011.03 because
> +of the relocation changes.
> +
> +We have to get JUMP_ADDR consistant with what is used by u-boot

  While your at it: spelling correction consistant -> consistent.

> +(CONFIG_SYS_TEXT_BASE).
> +
> +I also chose to "repartition" the dataflash. u-boot is now living at
> +0x4000, letting 16kB for the bootstrap. We also have to increase the
> +IMG_SIZE as u-boot as grown larger than the default value.
> +As requested on the u-boot ML, we assume that it could be up to 512kB
> +big.
> +
> +It means that now, you have to flash your kernel at 0x0008C000 instead
> +of 0x00042000. And so you also have to load it from that address from
> +u-boot.
> +
> +Then, remember that you could decrease IMG_SIZE to boot faster.
> +
> +Signed-off-by: Alexandre Belloni<alexandre.belloni@piout.net>
> +Signed-off-by: Simon Dawson<spdawson@gmail.com>
> +diff -Nurp a/board/afeb9260/afeb9260_defconfig b/board/afeb9260/afeb9260_defconfig

  Just for clarity, I'd put a --- and/or some whitespace between the S-o-b
and the diff.

[snip]
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> new file mode 100644
> index 0000000..74f08e8
> --- /dev/null
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -0,0 +1,67 @@
> +#############################################################
> +#
> +# at91bootstrap3
> +#
> +#############################################################
> +AT91BOOTSTRAP3_VERSION = 3.2
> +AT91BOOTSTRAP3_SITE = \
> +	ftp://www.at91.com/pub/at91bootstrap/AT91Bootstrap$(AT91BOOTSTRAP3_VERSION)
> +AT91BOOTSTRAP3_SOURCE = at91bootstrap_9n12.tar.gz
> +
> +AT91BOOTSTRAP3_INSTALL_IMAGES = YES
> +AT91BOOTSTRAP3_INSTALL_TARGET = NO
> +
> +AT91BOOTSTRAP3_DEFCONFIG = \
> +	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))
> +AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE = \
> +	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))

  AFAICS these are used only once so defining a variable is unnecessary.

> +AT91BOOTSTRAP3_CUSTOM_PATCH_DIR = \
> +	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR))
> +
> +AT91BOOTSTRAP3_MAKE_OPT = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
> +
> +ifneq ($(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR),)
> +define AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
> +	support/scripts/apply-patches.sh $(@D) $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) \
> +		at91bootstrap3-\*.patch
> +endef

  I smell a refactoring opportunity here, because this pattern is used in
a few bootloaders and in the kernel...

> +
> +AT91BOOTSTRAP3_POST_PATCH_HOOKS += AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
> +endif
> +
> +ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
> +AT91BOOTSTRAP3_SOURCE_CONFIG = \
> +	$(@D)/board/*/$(AT91BOOTSTRAP3_DEFCONFIG)_defconfig
> +else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
> +AT91BOOTSTRAP3_SOURCE_CONFIG = $(AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)
> +endif
> +
> +define AT91BOOTSTRAP3_CONFIGURE_CMDS
> +	cp $(AT91BOOTSTRAP3_SOURCE_CONFIG) $(@D)/.config
> +	$(SED) 's/image.bin/uImage/' $(@D)/.config

  I'd say it's safer to run a 'make silentoldconfig' afterwards to clean up
the config file, but they don't even have that target defined...


  Regards,
  Arnout

> +endef
[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
