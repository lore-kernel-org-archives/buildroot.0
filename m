From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 23:08:05 +0200
Subject: [Buildroot] [PATCH v2-RESEND 2/6] arm-trusted-firmware:
 generate atf-uboot.ub for ZynqMP booting
In-Reply-To: <1523032461-3295-3-git-send-email-luca@lucaceresoli.net>
References: <1523032461-3295-1-git-send-email-luca@lucaceresoli.net>
 <1523032461-3295-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20180409230805.66ab7dc5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Apr 2018 18:34:17 +0200, Luca Ceresoli wrote:
> U-Boot SPL for the Xilinx ZynqMP SoCs needs ATF in this format to load
> it.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> Changes v1 -> v2: none.
> ---
>  boot/arm-trusted-firmware/Config.in               |  9 +++++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 21 +++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index 7aef87cb746c..dca9958423b9 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -71,6 +71,15 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
>  	  typically used on platforms where another bootloader (e.g
>  	  U-Boot) encapsulates ATF BL31.
>  
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_MKIMAGE
> +	bool "Generate a U-Boot image (for Xilinx ZynqMP U-Boot)"
> +	depends on BR2_cortex_a53
> +	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
> +	help
> +	  Uses mkimage from uboot-tools to encapsulate bl31.bin into
> +	  a U-Boot image named atf-uboot.ub. This is needed by the
> +	  Xilinx version of U-Boot SPL to load ATF on the ZynqMP SoC.

In fact this doesn't look like very Xilinx-specific. It just
encapsulates the bl31 image in a U-Boot image format. This could
potentially be used by other platforms as well.

So, perhaps we could make this:

config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT
	bool "Build BL31 U-Boot image"
	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
	help
	  This option will generate a bl31.bin that is encapsulates
	  into a U-Boot image named atf-uboot.ub. This is for example
	  used by the Xilinx version of U-Boot SPL to load ATF on the
	  ZynqMP SoC.

> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_MKIMAGE),y)
> +define ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_MKIMAGE
> +# Get the entry point address from the elf.
> +	BASE_ADDR=$$($(TARGET_READELF) -h $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf | \
> +	             grep -E -m 1 -i "entry point.*?0x" | \
> +	             sed -r 's/.*?(0x.*?)/\1/g') && \

Meh, what a mess to get the entry point address :-/ Could this be
simplified with:

$(TARGET_READELF) -h $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf | sed '/^  Entry point address: *\(.*\)/!d; s//\1/'

(Thanks Yann!)

> +	$(HOST_DIR)/bin/mkimage \
> +		-A arm64 -O arm-trusted-firmware -C none \
> +		-a $${BASE_ADDR} -e $${BASE_ADDR} \
> +		-d $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31.bin \
> +		$(ARM_TRUSTED_FIRMWARE_IMG_DIR)/atf-uboot.ub
> +endef
> +define ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_INSTALL
> +	install $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/atf-uboot.ub $(BINARIES_DIR)

Should be:

	$(INSTALL) -m 0644 -D $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/atf-uboot.ub $(BINARIES_DIR)/atf-uboot.ub

> +endef
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RESET_TO_BL31=1
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-uboot-tools
> +ARM_TRUSTED_FIRMWARE_POST_BUILD_HOOKS += ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_MKIMAGE
> +ARM_TRUSTED_FIRMWARE_POST_INSTALL_IMAGES_HOOKS += ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_INSTALL

Rather than hooks, just use directly
ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_MKIMAGE and
ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_INSTALL in the BUILD_CMDS and
INSTALL_IMAGES_CMDS. Of course, remove the ZYNQMP part of the variable
names if you agree with my proposal above.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
