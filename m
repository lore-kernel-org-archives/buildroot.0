From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 22:50:24 +0200
Subject: [Buildroot] [PATCH 3/4] imx: add imx8 boot preparation script
In-Reply-To: <1523536525-10280-3-git-send-email-karl.erik.larsson@gmail.com>
References: <1523536525-10280-1-git-send-email-karl.erik.larsson@gmail.com>
 <1523536525-10280-3-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180412225024.5dc9b6d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 14:35:24 +0200, Erik Larsson wrote:
> Add a new script, imx8-prepare-boot.sh, that finalize
> the boot file for a specific iMX8 board. Currently only
> imx8mqevk is available and supported.
> 
> Also add genimage template for iMX8.

This commit was doing two fairly unrelated things: adding the
bootloader preparation script, and adding the genimage template, so
I've split this commit into two, and applied to master. Thanks!

> diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> new file mode 100755
> index 0000000..2648147
> --- /dev/null
> +++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> @@ -0,0 +1,16 @@
> +#!/usr/bin/env bash
> +
> +main ()
> +{
> +	# Currently we support imx8mqevk.
> +	cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> +	BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${BINARIES_DIR}/fsl-imx8mq-evk.dtb > ${BINARIES_DIR}/u-boot.its
> +	${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
> +	rm -f ${BINARIES_DIR}/u-boot.its
> +
> +	${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin

Thinking more about this, perhaps moving forward we will want to do
this in the U-Boot package directly. But I'd like to wait and see how
mainline U-Boot will handle i.MX8 platforms in terms of image creation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
