From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 22 Nov 2019 12:19:51 +0300
Subject: [Buildroot] [PATCH v2 06/10] boot/arm-trusted-firmware: Add RCW
 support
In-Reply-To: <20191121102324.35225-7-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-7-jerry.huang@nxp.com>
Message-ID: <20191122091951.vrznpltgrwkdmeyx@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 2133d39e6d..2bca8109f1 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -92,6 +92,15 @@ endif
>  
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>  
> +ifeq ($(BR2_PACKAGE_HOST_RCW_ATF),y)
> +RCW_BOOT_MODE = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BOOT_MODE))
> +RCW_PATH = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
> +RCW_FILE = $(lastword $(subst /, ,$(RCW_PATH)))
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BOOT_MODE=$(RCW_BOOT_MODE) RCW=$(BINARIES_DIR)/$(RCW_FILE)
> +ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-fsl-qoriq-rcw
> +endif
> +
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl

Hi Jerry, Thomas, and all

This approach looks reasonable to me: if we enable RCW_ATF in board config,
then arm-trusted-firmware build process is modified in accordance
with that choice.

However I am slightly worried about naming.  There was a discussion around the
first version of the patch set regarding too generic name for RCW package.
IIUC here we have the same issue here. Option BR2_PACKAGE_HOST_RCW_ATF
looks fairly generic, but it selects fsl-qoriq specific dependencies.

Thoughts ? Comments ?

Regards,
Sergey
