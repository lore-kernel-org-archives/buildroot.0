From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:14:24 +0200
Subject: [Buildroot] [PATCH 2/2] board: Add Libre Computer AML-S905X-CC
 board support
In-Reply-To: <1533545408-11248-3-git-send-email-narmstrong@baylibre.com>
References: <1533545408-11248-1-git-send-email-narmstrong@baylibre.com>
 <1533545408-11248-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180809231424.21b2ae5c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Neil,

On Mon,  6 Aug 2018 08:50:08 +0000, Neil Armstrong wrote:

> +mkdir ${BINARIES_DIR}/fip/tmp
> +cp ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/fip/tmp/bl33.bin
> +cp ${BINARIES_DIR}/fip/bl31.img ${BINARIES_DIR}/fip/tmp/bl31.img
> +
> +${BINARIES_DIR}/fip/blx_fix.sh ${BINARIES_DIR}/fip/bl30.bin \
> +		${BINARIES_DIR}/fip/tmp/zero_tmp \
> +		${BINARIES_DIR}/fip/tmp/bl30_zero.bin \
> +		${BINARIES_DIR}/fip/bl301.bin \
> +		${BINARIES_DIR}/fip/tmp/bl301_zero.bin \
> +		${BINARIES_DIR}/fip/tmp/bl30_new.bin bl30
> +
> +python ${BINARIES_DIR}/fip/acs_tool.pyc ${BINARIES_DIR}/fip/bl2.bin \
> +		${BINARIES_DIR}/fip/tmp/bl2_acs.bin \
> +		${BINARIES_DIR}/fip/acs.bin 0
> +
> +${BINARIES_DIR}/fip/blx_fix.sh ${BINARIES_DIR}/fip/tmp/bl2_acs.bin \
> +		${BINARIES_DIR}/fip/tmp/zero_tmp \
> +		${BINARIES_DIR}/fip/tmp/bl2_zero.bin \
> +		${BINARIES_DIR}/fip/bl21.bin \
> +		${BINARIES_DIR}/fip/tmp/bl21_zero.bin \
> +		${BINARIES_DIR}/fip/tmp/bl2_new.bin bl2
> +
> +${BINARIES_DIR}/fip/aml_encrypt_gxl --bl3enc \
> +		--input ${BINARIES_DIR}/fip/tmp/bl30_new.bin
> +
> +${BINARIES_DIR}/fip/aml_encrypt_gxl --bl3enc \
> +		--input ${BINARIES_DIR}/fip/tmp/bl31.img
> +
> +${BINARIES_DIR}/fip/aml_encrypt_gxl --bl3enc \
> +		--input ${BINARIES_DIR}/fip/tmp/bl33.bin
> +
> +${BINARIES_DIR}/fip/aml_encrypt_gxl --bl2sig \
> +		--input ${BINARIES_DIR}/fip/tmp/bl2_new.bin \
> +		--output ${BINARIES_DIR}/fip/tmp/bl2.n.bin.sig
> +
> +${BINARIES_DIR}/fip/aml_encrypt_gxl --bootmk \
> +		--output ${BINARIES_DIR}/fip/tmp/u-boot.bin \
> +		--bl2 ${BINARIES_DIR}/fip/tmp/bl2.n.bin.sig \
> +		--bl30 ${BINARIES_DIR}/fip/tmp/bl30_new.bin.enc \
> +		--bl31 ${BINARIES_DIR}/fip/tmp/bl31.img.enc \
> +		--bl33 ${BINARIES_DIR}/fip/tmp/bl33.bin.enc

Can't all this stuff be done in a script provided in the aml-s905x-cc
repository ?

> +dd if=${BINARIES_DIR}/fip/tmp/u-boot.bin.sd.bin \
> +   of=${BINARIES_DIR}/sdcard.img \
> +   bs=1 count=444 conv=sync,notrunc
> +
> +dd if=${BINARIES_DIR}/fip/tmp/u-boot.bin.sd.bin \
> +   of=${BINARIES_DIR}/sdcard.img \
> +   bs=512 skip=1 seek=1 conv=fsync,notrunc

Both of these should be done using the genimage configuration file.
genimage allows you to place some image data at an arbitrary offset:

For example:

        partition spl {
                in-partition-table = "no"
                image = "sunxi-spl.bin"
                offset = 8192
        }

        partition u-boot {
                in-partition-table = "no"
                image = "u-boot.itb"
                offset = 40K
                size = 1M # 1MB - 40K
        }


> +How to write the SD card or eMMC
> +================================
> +
> +Once the build process is finished you will have an image called "sdcard.img"
> +in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an SD card or eMMC with "dd":

How is the eMMC visible as a block device on the build machine ?

> diff --git a/configs/aml-s905x-cc_defconfig b/configs/aml-s905x-cc_defconfig
> new file mode 100644
> index 0000000..cb2550b
> --- /dev/null
> +++ b/configs/aml-s905x-cc_defconfig
> @@ -0,0 +1,30 @@
> +# Architecture
> +BR2_aarch64=y

You need something like this:

# Linux headers same as kernel, a 4.14 series
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y

to make sure the toolchain uses the same kernel headers version as the
kernel being built.

> +# System
> +BR2_TARGET_GENERIC_HOSTNAME="aml-s905x-cc"

Probably not needed.

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/librecomputer/aml-s905x-cc/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/librecomputer/aml-s905x-cc/post-image.sh"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y

Please use a fixed version of the Linux kernel.

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
> +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s905x-libretech-cc"
> +BR2_LINUX_KERNEL_IMAGE=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +
> +# U-Boot
> +BR2_TARGET_UBOOT=y

Please use a fixed version of U-Boot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
