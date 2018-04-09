From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 23:26:19 +0200
Subject: [Buildroot] [PATCH v2-RESEND 4/6] uboot: zynqmp: generate SPL
 image with PMUFW binary
In-Reply-To: <1523032461-3295-5-git-send-email-luca@lucaceresoli.net>
References: <1523032461-3295-1-git-send-email-luca@lucaceresoli.net>
 <1523032461-3295-5-git-send-email-luca@lucaceresoli.net>
Message-ID: <20180409232619.3cb20625@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Apr 2018 18:34:19 +0200, Luca Ceresoli wrote:

> +config BR2_TARGET_UBOOT_ZYNQMP
> +	bool "Boot on the Xilinx ZynqMP SoCs"
> +	depends on BR2_aarch64
> +	select BR2_TARGET_ZYNQMP_PMUFW_BINARIES
> +	help
> +	  Instruct the U-Boot build process to generate a file named
> +	  boot.bin, which is the file loaded by the ZynqMP boot ROM.
> +	  boot.bin contains both the U-Boot SPL and the PMU firmware
> +	  (downloaded by the zynqmp-pmufw-binaries package) formatted
> +	  with the Xilinx-specific format.
> +
>  config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
>  	bool "CRC image for Altera SoC FPGA (mkpimage)"
>  	depends on BR2_arm
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 24d3e4ef5485..e81a9fd41dab 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -278,6 +278,19 @@ define UBOOT_INSTALL_IMAGES_CMDS
>  			$(BINARIES_DIR)/boot.scr)
>  endef
>  
> +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
> +
> +UBOOT_DEPENDENCIES += zynqmp-pmufw-binaries
> +define UBOOT_KCONFIG_FIXUP_CMDS
> +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"board/xilinx/zynqmp/pmufw.bin",$(@D)/.config)
> +endef

I'd prefer if the definition of UBOOT_KCONFIG_FIXUP_CMDS was outside
this condition, and uses a variable like $(UBOOT_ZYNQMP_CONFIG_FIXUP)
instead.

> +define UBOOT_ZYNQMP_COPY_PMUFW
> +	cp ${BINARIES_DIR}/pmufw.bin $(@D)/board/xilinx/zynqmp/

Please use $(...) instead of ${...} to reference make variables. And
use $(INSTALL) -D -m 0644 :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
