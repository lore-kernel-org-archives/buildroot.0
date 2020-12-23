From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 23 Dec 2020 15:32:31 +0100
Subject: [Buildroot] [PATCH v4 1/8] package/freescale-imx/firmware-imx:
 Add option to install all ddr fw files
In-Reply-To: <20201125183017.15585-2-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
 <20201125183017.15585-2-xroumegue@gmail.com>
Message-ID: <X+NU/0eQvvVjCh9Y@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xavier,

Thanks for your contribution.

On Wed, Nov 25, 2020 at 07:30:10PM +0100, Xavier Roumegue wrote:
> Selecting this option will copy all ([lp]ddr4.bin) DDR training files to
> BINARIES_DIR.
> 
> Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> Changes v3 -> v4:
>     - Fix indentation issue (detected by Stephane Viau)
> ---
>  package/freescale-imx/firmware-imx/Config.in       |  3 +++
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> index 587f402426..09ccacb0c1 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -81,6 +81,9 @@ config BR2_PACKAGE_FIRMWARE_IMX_DMEM_LEN
>  	help
>  	  The DMEM firmware will be padded to this length
>  
> +config BR2_PACKAGE_FIRMWARE_IMX_DDR_FW_MULTIPLE
> +	bool
> +
>  endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
>  
>  endif # BR2_PACKAGE_FIRMWARE_IMX
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index fb3cfe640b..c5ae4fad25 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -36,6 +36,16 @@ define FIRMWARE_IMX_PREPARE_DDR_FW
>  		$(FIRMWARE_IMX_DDRFW_DIR)/$(strip $(3)).bin
>  endef
>  
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR_FW_MULTIPLE),y)
> +define FIRMWARE_IMX_COPY_DDR_FW
> +	cp $(1) $(BINARIES_DIR)/
> +endef
> +else
> +define FIRMWARE_IMX_COPY_DDR_FW
> +	true
> +endef
> +endif
> +
>  ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
>  FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
>  
> @@ -51,6 +61,7 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
>  		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
>  		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
>  	ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.bin
> +	$(call FIRMWARE_IMX_COPY_DDR_FW, $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4*.bin)
>  endef
>  endif
>  
> @@ -69,6 +80,7 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
>  		$(FIRMWARE_IMX_DDRFW_DIR)/ddr4_2d_201810_fw.bin > \
>  		$(BINARIES_DIR)/ddr4_201810_fw.bin
>  	ln -sf $(BINARIES_DIR)/ddr4_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
> +	$(call FIRMWARE_IMX_COPY_DDR_FW, $(FIRMWARE_IMX_DDRFW_DIR)/ddr4*.bin)

Overvall I'm not against this but have a few remarks:
1- Wouldn't it be just easier to copy the ddr binaries in BINARIES_DIR
without adding another option for it?
My take is that we should make that copy without adding
FIRMWARE_IMX_COPY_DDR_FW. We could even remove ddr_fw.bin generation
from here and leave it to imx8-bootloader-prepare.sh to do it. And as a
second step the best would be to get rid of this script when everybody
moved to U-Boot flash.bin generation.
Maybe Thomas has some insights as to what is the preferred option.

2- If we keep that option to make the copy, maybe just merge this patch
with "Copy of all DDR files if uboot needs fw." and move the squashed
commit _after_ UBOOT_NEEDS_FW patch.

Regards,
Gary
