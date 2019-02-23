From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 16:36:33 +0100
Subject: [Buildroot] [PATCH/next v3 5/6] board/freescale/common/imx: Add
 support for i.MX8X
In-Reply-To: <20190218204807.16815-6-nerv@dawncrow.de>
References: <20190218204807.16815-1-nerv@dawncrow.de>
 <20190218204807.16815-6-nerv@dawncrow.de>
Message-ID: <20190223163633.20d2daab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Feb 2019 21:48:06 +0100
Andr? Hentschel <nerv@dawncrow.de> wrote:

> From: Andr? Hentschel <andre.hentschel@zf.com>
> 
> Signed-off-by: Andr? Hentschel <andre.hentschel@zf.com>

A more verbose commit log would have been nice, but I've applied to
next anyway.

> -	cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> -	BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> -	${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
> -	rm -f ${BINARIES_DIR}/u-boot.its
>  
> -	${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
> +	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
> +		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> +		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
> +		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
> +		rm -f ${BINARIES_DIR}/u-boot.its
> +
> +		${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
> +	else
> +		${HOST_DIR}/bin/mkimage_imx8 -commit > ${BINARIES_DIR}/mkimg.commit
> +		cat ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/mkimg.commit > ${BINARIES_DIR}/u-boot-hash.bin
> +		cp ${BINARIES_DIR}/bl31.bin ${BINARIES_DIR}/u-boot-atf.bin
> +		dd if=${BINARIES_DIR}/u-boot-hash.bin of=${BINARIES_DIR}/u-boot-atf.bin bs=1K seek=128
> +
> +		${HOST_DIR}/bin/mkimage_imx8 -soc QX -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qx-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
> +	fi

This is getting really atrocious. I'm wondering if we should find a way
to move this to some Buildroot package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
