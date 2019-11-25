From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 23:09:38 +0100
Subject: [Buildroot] [PATCH v2 06/10] boot/arm-trusted-firmware: Add RCW
 support
In-Reply-To: <20191121102324.35225-7-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-7-jerry.huang@nxp.com>
Message-ID: <20191125230938.211426b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Nov 2019 18:23:20 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 2133d39e6d..2bca8109f1 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -92,6 +92,15 @@ endif
>  
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>  
> +ifeq ($(BR2_PACKAGE_HOST_RCW_ATF),y)

This option should be introduced by this patch.

Overall, I'm not super happy with how arm-trusted-firmware works. In
some cases, it's a sub-option of arm-trusted-firmware that causes it to
use some additional package (for example OPTEE as BL32, U-Boot as
BL33), but sometimes it's the implicit fact of having another package
enabled (mv-ddr-marvell, vexpress-firmware), that causes
arm-trusted-firmware to use it. Not great.

So I'm not sure how to proceed with RCW.

> +RCW_BOOT_MODE = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BOOT_MODE))
> +RCW_PATH = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
> +RCW_FILE = $(lastword $(subst /, ,$(RCW_PATH)))

Those variables names should be prefixed with the package name, i.e ARM_TRUSTED_FIRMWARE.

> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BOOT_MODE=$(RCW_BOOT_MODE) RCW=$(BINARIES_DIR)/$(RCW_FILE)

These BOOT_MODE and RCW options are not supported in ATF upstream,
apparently only in the NXP fork. I'm not sure we want explicit support
for vendor-specific things. Should we look at providing an
arm-trusted-firmware that can more easily be customized through options?

That's really an open discussion, I don't yet have a clear idea on how
to handle that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
