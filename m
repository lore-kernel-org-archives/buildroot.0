From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 14 Feb 2020 11:25:18 +0300
Subject: [Buildroot] [PATCH 3/4] boot/arm-trusted-firmware: add support
 for rockchip rk3399
In-Reply-To: <1581573151-18943-4-git-send-email-sunil@amarulasolutions.com>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-4-git-send-email-sunil@amarulasolutions.com>
Message-ID: <20200214082518.g4mwdz5oymjuoanw@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Add support for TF-A image builds for Rockchip rk3399 chip.
> 
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 3473701..cc757b5 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -90,6 +90,10 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
>  endif
>  
> +ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM)),rk3399)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-a-toolchain
> +endif
> +

As per explanation by Thomas and Jagan, RK3399 ATF needs 32bit ARM
toolchain. Taking into account that different vendors may re-use
the same hardware blocks, it probably makes sense to describe this
dependency in a more generic way, not specific to RK3399 chip.

Following the existing patterns in ATF package mk file, new ATF
config option can be introduced:

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 34737018aa..160884e0ff 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -75,6 +75,10 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UB
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_32BIT_ARM_REQUIRED),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-a-toolchain
+endif
+
 ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)

This option BR2_TARGET_ARM_TRUSTED_FIRMWARE_32BIT_ARM_REQUIRED then
can be specified in a defconfig for specific board.

Thoughts ? Comments ?

Regards,
Sergey
