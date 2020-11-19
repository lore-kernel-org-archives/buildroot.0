From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 14:30:39 +0100
Subject: [Buildroot] [PATCH v2 3/3] configs/qcom_db410c: new defconfig
In-Reply-To: <20201119090854.48955-4-mikeframpo@gmail.com>
References: <20201119090854.48955-1-mikeframpo@gmail.com>
 <20201119090854.48955-4-mikeframpo@gmail.com>
Message-ID: <20201119143039.726f1485@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

Thanks as well for this new iteration!

On Thu, 19 Nov 2020 22:08:54 +1300
Mike Frampton <mikeframpo@gmail.com> wrote:

> +OUTIMG=$BINARIES_DIR/boot-db410c.img
> +KERNEL_BUILD=$BUILD_DIR/linux-release_qcomlt-5.4
> +
> +cp $KERNEL_BUILD/arch/arm64/boot/dts/qcom/apq8016-sbc.dtb $BINARIES_DIR
> +cp $KERNEL_BUILD/arch/arm64/boot/Image.gz $BINARIES_DIR

Why is this needed ? Buildroot should have already copied the DT and
kernel image to BINARIES_DIR.

> +# now assemble the bootimg
> +cat $BINARIES_DIR/Image.gz $BINARIES_DIR/apq8016-sbc.dtb > $BINARIES_DIR/Image.gz+dtb
> +echo "not a ramdisk" > $BINARIES_DIR/ramdisk.img
> +
> +abootimg --create $OUTIMG -k $BINARIES_DIR/Image.gz+dtb -r $BINARIES_DIR/ramdisk.img \
> +	-c pagesize=2048 -c kerneladdr=0x80008000 -c ramdiskaddr=0x81000000 \
> +	-c cmdline="root=/dev/mmcblk1p13 rw rootwait console=tty0 console=ttyMSM0,115200n8"
> +
> +echo "boot img written to $OUTIMG"

The echo here is probably not needed ?

> +How to set up the SD card
> +=========================
> +
> +The bootloader on the DB410c expects the SD card to be formatted in a 
> +particular way. The simplest way to set up the SD card correctly is to flash
> +a prebuilt Debian image on to the card to set up the required partitions.

This is a bit annoying, having to depend on flashing the SD card with
another system first. What is so special that we can't do in Buildroot ?


> diff --git a/configs/qcom_db410c_defconfig b/configs/qcom_db410c_defconfig
> new file mode 100644
> index 0000000000..732751c787
> --- /dev/null
> +++ b/configs/qcom_db410c_defconfig
> @@ -0,0 +1,28 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a53=y
> +
> +# Toolchain options
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +
> +# Firmware
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS=y
> +BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO=y
> +BR2_PACKAGE_QCOM_DB410C_FIRMWARE=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/landing-teams/working/qualcomm/kernel.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="release/qcomlt-5.4"

This is a branch, which is a moving target, and we prefer to point to a
specific tag or commit to make sure this defconfig always builds the
same kernel version. Could you adjust this ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
