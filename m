From: Gary Bisson <bisson.gary@gmail.com>
Date: Fri, 8 Nov 2019 18:33:15 +0100
Subject: [Buildroot] [PATCH 3/7] package/freescale-imx/imx-sc-firmware:
 bump to version 1.1 to support i.MX8QM
In-Reply-To: <20190909121525.13935-3-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
 <20190909121525.13935-3-maeva.manuel@nxp.com>
Message-ID: <20191108173315.GC9828@g751>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maeva,

On Mon, Sep 09, 2019 at 12:15:00PM +0000, Maeva Manuel wrote:
> Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
> ---
>  package/freescale-imx/imx-sc-firmware/Config.in    |  2 +-
>  .../imx-sc-firmware/imx-sc-firmware.mk             | 14 +++++++++-----
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-sc-firmware/Config.in b/package/freescale-imx/imx-sc-firmware/Config.in
> index 4a22f72b1f..93dfeb1a68 100644
> --- a/package/freescale-imx/imx-sc-firmware/Config.in
> +++ b/package/freescale-imx/imx-sc-firmware/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_IMX_SC_FIRMWARE
>  	bool "imx-sc-firmware"
> -	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>  	help
>  	  System Control Unit Firmware blobs for the Freescale i.MX8
>  	  SoCs.
> diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> index fac20d0c6f..08b562a054 100644
> --- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> +++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMX_SC_FIRMWARE_VERSION = 1.0
> +IMX_SC_FIRMWARE_VERSION = 1.1

Can you offer a new patch with latest version?
https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-sc-firmware/imx-sc-firmware_1.2.2.bb?h=rel_imx_4.14.98_2.1.0

>  IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
>  IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
>  
> @@ -18,10 +18,14 @@ endef
>  
>  IMX_SC_FIRMWARE_INSTALL_IMAGES = YES
>  define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
> -	# SCFW firmware is needed when generating imx8-boot-sd.bin which
> -	# is done in post-image script.
> -	cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
> -	cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
> +# SCFW firmware is needed when generating imx8-boot-sd.bin which
> +# is done in post-image script.
> +
> +# For i.MX8QM support the SCFW needed is mx8qm-mek-scfw-tcm.bin
> +# and mx8qm-val-scfw-tcm.bin
> +# For i.MX8QXP support the SCFW needed is mx8qx-mek-scfw-tcm.bin
> +# and mx8qx-val-scfw-tcm.bin
> +cp $(@D)/*-scfw-tcm.bin $(BINARIES_DIR)/*-scfw-tcm.bin

Since we make the user select the CPU used in the other menu, please
split the firmware copy so that only 8X ones are in the image with 8X is
selected.

Regards,
Gary
