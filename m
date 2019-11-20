From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 20 Nov 2019 10:37:54 +0300
Subject: [Buildroot] [PATCH 3/9] boot/arm-trusted-firmware: Add
 u-boot-dtb.bin support
In-Reply-To: <20191120040725.32207-4-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-4-jerry.huang@nxp.com>
Message-ID: <20191120073754.ror57blke4sx2gup@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> NXP Layerscape platforms use u-boot-dtb.bin to boot the board.
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index e528686aa1..70d36fff73 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -70,7 +70,11 @@ endif
>  endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
> +ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_BIN),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot-dtb.bin
> +else
>  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
> +endif
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
>  endif

Hi Jerry, Thomas, and all

Looks good, but probably we could make it a little bit more future-proof.
What do you think about using the same pattern-based approach here as
implemented in commit e4d276c357fdf9f19f99f8 (buildroot next branch)
for ATF firmware images.

In brief, to add option BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
in arm-trusted-firmware Config.in and set its default value to u-boot.bin.
Then u-boot-dtb.bin value could be specified in the board defconfig.

Thoughts ? Comments ?

Regards,
Sergey
