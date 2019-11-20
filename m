From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 20 Nov 2019 10:50:02 +0300
Subject: [Buildroot] [PATCH 4/9] boot/arm-trusted-firmware: Add RCW
 support
In-Reply-To: <20191120040725.32207-5-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-5-jerry.huang@nxp.com>
Message-ID: <20191120075002.rgn3ymmedtux5dg4@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 70d36fff73..6896d9a7aa 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -95,6 +95,15 @@ endif
>  
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>  
> +RCW_BOOT_MODE = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BOOT_MODE))
> +ifneq ($(RCW_BOOT_MODE),)
> +RCW_PATH = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
> +RCW_FILE = $(lastword $(subst /, ,$(RCW_PATH)))
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BOOT_MODE=$(RCW_BOOT_MODE) RCW=$(BINARIES_DIR)/$(RCW_FILE)
> +ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-rcw
> +endif
> +
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl

Hi Jerry and all,

Here arm-trusted-firmware build is modified when some host package
with specific configuration is enabled in board config.

Shouldn't it be the other way around ? To be more specific: another
Config.in option for arm-trusted-firmware which pulls required build
time dependencies, e.g. see Marvell DDR options or FIP options.

Regards,
Sergey
