From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 9 Dec 2017 15:59:29 +0300
Subject: [Buildroot] [PATCH v2 4/4] odroidc2: add support for mainline
 kernel and u-boot
In-Reply-To: <20171209075219.23240-4-daggs@gmx.com>
References: <20171209075219.23240-1-daggs@gmx.com>
 <20171209075219.23240-4-daggs@gmx.com>
Message-ID: <20171209125929.cuongkggfehwuxjo@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
> Changes v1 -> v2:
>  - handle general mail patch rejects (Thomas)
>  - use BR2_TARGET_UBOOT_BOOT_SCRIPT and BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE instead of script's
>    boot.scr generation (Thomas)
>  - use defconfig in mainline kernel config (Thomas)
>  - add patch of mainline kernel diff instead of complete config and use arch default config (Arnout)
>  - move vendor's ATF handling to a separated patch (Thomas)
>  - add mainline config support for post image script (Thomas)
>  - fixed mainline defconfig rejects (Thomas)
>  - squashed all previous 2-8 patches into one patch (Thomas)
> 
>  board/hardkernel/odroidc2/boot.cmd                 |   10 +
>  board/hardkernel/odroidc2/genimage-mainline.cfg    |   33 +
>  .../odroidc2/odroidc2_mainline_defconfig           | 5657 ++++++++++++++++++++
>  ...update_arm64_defconfig_with_meson_configs.patch |  642 +++
>  board/hardkernel/odroidc2/post-build.sh            |   12 +
>  board/hardkernel/odroidc2/post-image.sh            |   25 +-
>  board/hardkernel/odroidc2/readme.txt               |   27 +-
>  configs/odroidc2_mainline_defconfig                |   38 +
>  8 files changed, 6439 insertions(+), 5 deletions(-)
>  create mode 100644 board/hardkernel/odroidc2/boot.cmd
>  create mode 100644 board/hardkernel/odroidc2/genimage-mainline.cfg
>  create mode 100644 board/hardkernel/odroidc2/odroidc2_mainline_defconfig
>  create mode 100644 board/hardkernel/odroidc2/patches/linux/0001-update_arm64_defconfig_with_meson_configs.patch
>  create mode 100755 board/hardkernel/odroidc2/post-build.sh
>  create mode 100644 configs/odroidc2_mainline_defconfig

Maybe it makes sense to rename odroid-c2 defconfigs (existing and new)
adding vendor name: e.g. hardkernel_odroidc2_mainline_defconfig.

...

> diff --git a/board/hardkernel/odroidc2/post-image.sh b/board/hardkernel/odroidc2/post-image.sh
> index a53f87ec11..bc885d4c51 100755
> --- a/board/hardkernel/odroidc2/post-image.sh
> +++ b/board/hardkernel/odroidc2/post-image.sh
> @@ -2,12 +2,29 @@
>  
>  BOARD_DIR="$(dirname $0)"
>  GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +TARGET_MAINLINE="$2"
>  IM_FILE=""
> +CLEANUPS_CMD=""
>  
> -GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> -IM_FILE="${BINARIES_DIR}/u-boot.bin"
> +if [ "${TARGET_MAINLINE}" = "yes" ]; then
> +	GENIMAGE_CFG="${BOARD_DIR}/genimage-mainline.cfg"
> +	SIGNED_UBOOT_IMG="${BINARIES_DIR}/uboot-odc2.img"
> +	ODRODIDC2_ATF_FOLDER="${HOST_DIR}/usr/share/odroidc2_atf"
> +	IM_FILE="${ODRODIDC2_ATF_FOLDER}/bl1.bin.hardkernel"
> +	CLEANUPS_CMD="rm -rf ${BINARIES_DIR}/fip.bin ${BINARIES_DIR}/boot_new.bin ${BINARIES_DIR}/u-boot.img"
>  
> -cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
> +	${HOST_DIR}/bin/fip_create --bl30 ${ODRODIDC2_ATF_FOLDER}/bl30.bin --bl301 ${ODRODIDC2_ATF_FOLDER}/bl301.bin --bl31 ${ODRODIDC2_ATF_FOLDER}/bl31.bin --bl33 ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/fip.bin
> +	${HOST_DIR}/bin/fip_create --dump ${BINARIES_DIR}/fip.bin
> +	cat ${ODRODIDC2_ATF_FOLDER}/bl2.package ${BINARIES_DIR}/fip.bin > ${BINARIES_DIR}/boot_new.bin
> +	${HOST_DIR}/bin/amlbootsig ${BINARIES_DIR}/boot_new.bin ${BINARIES_DIR}/u-boot.img
> +
> +	dd if=${BINARIES_DIR}/u-boot.img of=${SIGNED_UBOOT_IMG} bs=512 skip=96
> +else
> +	GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +	IM_FILE="${BINARIES_DIR}/u-boot.bin"
> +
> +	cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
> +fi

It would be great if boot image generation could be integrated into current
ATF/U-Boot dependency model. However from your patches it looks like
there is no way to build ATF for odroid-c2 from sources. Could you please
clarify several points regarding ATF and different odroid-c2 u-boot flavors.
In particular, am I correct assuming the following:

- there is no way to build ATF binaries from sources for odroid-c2
  -- ATF binaries are only available in hardkernel u-boot repository

- nothing changes for hardkernel u-boot with these patches:
  -- ATF binaries are in the same github repository
  -- ATF/U-Boot image generation is already in build rules

- mainline u-boot needs ATF binaries from hardkernel u-boot repositories
  -- mainline u-boot builds fine w/o ATF binaries
  -- ATF binaries are needed when signed boot.img is created from u-boot.bin

If so, then could you please check how UBOOT_ZYNQ_IMAGE and
UBOOT_CRC_ALTERA_SOCFPGA_IMAGE are now supported in boot/uboot/uboot.mk.
It looks like similar approach can be implemented for odroid-c2 mainline
u-boot. In this case there will be no need for complicated post-image script.
Besides, dependency of mainline u-boot from hardkernel u-boot will be
explicitely tracked.

Regards,
Sergey
