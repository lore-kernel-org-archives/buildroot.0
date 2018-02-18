From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Feb 2018 16:47:09 +0200
Subject: [Buildroot] [PATCH 3/3] add support for iMX8MQ-evk board
In-Reply-To: <1518960511-4823-4-git-send-email-karl.erik.larsson@gmail.com>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
 <1518960511-4823-4-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180218144709.gcmyrsjowpmii446@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

On Sun, Feb 18, 2018 at 02:28:31PM +0100, Erik Larsson wrote:
> +gen_imx8_boot()
> +{
> +	objcopy -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_imem.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_imem_pad.bin
> +	objcopy -I binary -O binary --pad-to 0x4000 --gap-fill=0x0 ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_dmem.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_dmem_pad.bin
> +	objcopy -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_imem.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_imem_pad.bin
> +	cat ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_imem_pad.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_dmem_pad.bin > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_fw.bin
> +	cat ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_imem_pad.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_dmem.bin > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_fw.bin
> +	cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_fw.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> +	rm -f ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_fw.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_fw.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_imem_pad.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_dmem_pad.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_imem_pad.bin
> +
> +	BL31=${BINARIES_DIR}/imx-boot/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin mkimage_fit_atf.sh ${BINARIES_DIR}/fsl-imx8mq-evk.dtb > ${BINARIES_DIR}/imx-boot/u-boot.its
> +	pushd ${BINARIES_DIR}
> +	mkimage -E -p 0x3000 -f ${BINARIES_DIR}/imx-boot/u-boot.its ${BINARIES_DIR}/u-boot.itb
> +	popd
> +        rm -f ${BINARIES_DIR}/imx-boot/u-boot.its
> +
> +	mkimage_imx8 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx-boot-imx8mqevk-sd.bin
> +}

Instead of reproducing the convoluted way of generating the i.MX8 boot image, 
can't you just copy the files into the iMX8M/ subdirectory of imx-mkimage, and 
run there 'make SOC=iMX8M flash_spl_uboot'?

[...]

> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 2535caa..adda403 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -1,6 +1,6 @@
>  menuconfig BR2_PACKAGE_FREESCALE_IMX
>  	bool "Freescale i.MX libraries"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>  	help
>  	  Those packages provide hardware acceleration for GPU or VPU,
>  	  hardware optimization or some hardware tools for Freescale
> @@ -40,6 +40,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
>  	bool "imx7d/imx7ulp"
>  
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> +	bool "imx8m"
>  endchoice
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> index fca280a..56d5b80 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_FIRMWARE_IMX
>  	bool "firmware-imx"
> -	depends on BR2_arm # Only relevant for i.MX
> +	depends on BR2_arm || BR2_aarch64 # Only relevant for i.MX
>  	help
>  	  Firmware blobs for the Freescale i.MX SoCs.
>  
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 630afca..040a088 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -18,6 +18,13 @@ define FIRMWARE_IMX_EXTRACT_CMDS
>  	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(FIRMWARE_IMX_SOURCE))
>  endef
>  
> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
> +define FIRMWARE_IMX_INSTALL_TARGET_CMDS
> +	mkdir -p $(BINARIES_DIR)/imx-boot
> +	cp $(@D)/firmware/ddr/synopsys/lpddr4_pmu_train_*.bin $(BINARIES_DIR)/imx-boot
> +	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin $(BINARIES_DIR)/imx-boot
> +endef
> +else
>  define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/lib/firmware/imx
>  	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
> @@ -27,5 +34,6 @@ define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>  	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
>  		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
>  endef
> +endif

These changes should be in a separate patch to firmware-imx.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
