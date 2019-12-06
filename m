From: Jerry Huang <jerry.huang@nxp.com>
Date: Fri, 6 Dec 2019 07:23:17 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v3 8/9] board/nxp/common/ls: Add
 standard post image script for Layerscape processors
In-Reply-To: <CA+h21hqg2eEg6pDthun89J76z90KD_qrMBtdj94cPZUhjrq16A@mail.gmail.com>
References: <20191127073028.34651-1-jerry.huang@nxp.com>
 <20191127073028.34651-2-jerry.huang@nxp.com>
 <CA+h21hqg2eEg6pDthun89J76z90KD_qrMBtdj94cPZUhjrq16A@mail.gmail.com>
Message-ID: <VI1PR04MB51364FD5ED1B5C4A749AF1EDFE5F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Vladimir,


Best Regards
Jerry Huang

> -----Original Message-----
> From: Vladimir Oltean <olteanv@gmail.com>
> Sent: Tuesday, December 3, 2019 9:34 AM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; Michael Walle <michael@walle.cc>;
> geomatsi at gmail.com; matthew.weber at collins.com; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>
> Subject: [EXT] Re: [Buildroot] [PATCH v3 8/9] board/nxp/common/ls: Add
> standard post image script for Layerscape processors
> 
> Caution: EXT Email
> 
> Hi Jerry,
> 
> On Wed, 27 Nov 2019 at 09:30, Changming Huang <jerry.huang@nxp.com>
> wrote:
> >
> > Add the standard post image script for Layerscape processors (LS1028A
> > and other processors).
> >
> > Introduce BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE to define the
> boot mode.
> > Because the RCW binary can be stored in different media, for example:
> > SD card - RCW locate in SD card, boot the board from SD card
> > eMMC    - RCW locate in eMMC chip, boot the board from eMMC chip
> > flexSPI - RCW locate in flexSPI, boot the board from flexSPI Nor/Nand flash
> > QSPI    - RCW locate in QSPI flash, boot the board from QSPI flash
> >
> > Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> > ---
> > changes since v2:
> > 1. add option BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE for boot
> mode.
> > 2. change the condition for qoriq-cadence-dp-firmware firmware file.
> >
> > changes since v1:
> > 1. update DEVELOPERS.
> > 2. modify the condition for display firmware.
> > ---
> >  DEVELOPERS                            |  1 +
> >  board/nxp/common/ls/busybox.config    |  9 +++
> >  board/nxp/common/ls/post-image-spi.sh | 64 +++++++++++++++++++
> >  board/nxp/common/ls/post-image.sh     | 92
> +++++++++++++++++++++++++++
> >  package/nxp/qoriq-rcw/Config.in.host  |  6 ++
> >  5 files changed, 172 insertions(+)
> >  create mode 100644 board/nxp/common/ls/busybox.config
> >  create mode 100755 board/nxp/common/ls/post-image-spi.sh
> >  create mode 100755 board/nxp/common/ls/post-image.sh
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 70f2671ff8..6fd8f8ee08 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -514,6 +514,7 @@ F:  configs/olimex_a13_olinuxino_defconfig
> >  F:     configs/orangepi_plus_defconfig
> >
> >  N:     Changming Huang <jerry.huang@nxp.com>
> > +F:     board/nxp/common/ls/
> >  F:     package/nxp/qoriq-cadence-dp-firmware/
> >
> >  N:     Chris Packham <judge.packham@gmail.com>
> > diff --git a/board/nxp/common/ls/busybox.config
> > b/board/nxp/common/ls/busybox.config
> > new file mode 100644
> > index 0000000000..7074c65aa6
> > --- /dev/null
> > +++ b/board/nxp/common/ls/busybox.config
> > @@ -0,0 +1,9 @@
> > +#
> > +# Additional Busybox Settings
> > +#
> > +CONFIG_TASKSET=y
> > +CONFIG_FEATURE_TASKSET_FANCY=y
> > +CONFIG_FEATURE_DF_FANCY=y
> > +CONFIG_FEATURE_SEAMLESS_GZ=y
> > +CONFIG_FEATURE_SEAMLESS_BZ2=y
> > +CONFIG_FEATURE_SEAMLESS_XZ=y
> > diff --git a/board/nxp/common/ls/post-image-spi.sh
> > b/board/nxp/common/ls/post-image-spi.sh
> > new file mode 100755
> > index 0000000000..81e9b96648
> > --- /dev/null
> > +++ b/board/nxp/common/ls/post-image-spi.sh
> > @@ -0,0 +1,64 @@
> > +#!/usr/bin/env bash
> > +# args from BR2_ROOTFS_POST_SCRIPT_ARGS # $2 linux building directory
> > +# $3 buildroot top directory # $4 u-boot building directory #
> > +plat_name()
> > +{
> > +       if grep -Eq
> "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"ls1028ardb\"$"
> ${BR2_CONFIG}; then
> > +               echo "ls1028ardb"
> > +       fi
> > +}
> > +
> > +# genimage.qspi.cfg.template: Boot from 64MB QSPI flash #
> > +genimage.xspi.256MB.cfg.template: Boot from 256MB flexSPI_nor flash #
> > +genimage.xspi.64MB.cfg.template: Boot from 64MB flexSPI_nor flash #
> > +genimage.cfg.template: Boot from SD and eMMC #
> > +genimage_type()
> > +{
> > +        if grep -Eq
> "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"qspi\"$"
> > +${BR2_CONFIG}; then
> 
> Tabs or spaces? This is pretty inconsistent across all shell scripts in the board/nxp
> folder.
that's will be corrected.

> > +                echo "genimage.qspi.cfg.template"
> > +        elif grep -Eq
> "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"flexspi_nor\"$"
> ${BR2_CONFIG}; then
> > +               echo "genimage.xspi.cfg.template"
> > +        elif grep -Eq
> "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"emmc\"$"
> ${BR2_CONFIG}; then
> > +                echo "genimage.emmc.cfg.template"
> > +        elif grep -Eq
> "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"sd\"$" ${BR2_CONFIG};
> then
> > +                echo "genimage.sd.cfg.template"
> > +        fi
> > +}
> > +
> > +main()
> > +{
> > +       # build the itb image
> > +       cp board/nxp/$(plat_name)/kernel.its ${BINARIES_DIR}/kernel.its
> > +       cd ${BINARIES_DIR}/
> > +       /usr/bin/mkimage -f kernel.its kernel.itb
> 
> Why does mkimage have the full path specified here?
Use the mkimage at host machine.

> > +       rm kernel.its
> > +
> > +       cd ${3}
> > +
> > +       # build the SDcard image
> > +       local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
> > +       local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> > +
> > +
> > +       sed -e "s/%FILES%/${FILES}/" \
> 
> You might want a different sed separator here than "/", since that is a common
> character to be found in file names.
Ok, will correct it.

> > +               board/nxp/$(plat_name)/$(genimage_type) >
> > + ${GENIMAGE_CFG}
> > +
> > +       rm -rf "${GENIMAGE_TMP}"
> > +
> > +       genimage \
> > +               --rootpath "${TARGET_DIR}" \
> > +               --tmppath "${GENIMAGE_TMP}" \
> > +               --inputpath "${BINARIES_DIR}" \
> > +               --outputpath "${BINARIES_DIR}" \
> > +               --config "${GENIMAGE_CFG}"
> > +
> > +       rm -f ${GENIMAGE_CFG}
> > +
> > +       exit $?
> > +}
> > +
> > +main $@
> > diff --git a/board/nxp/common/ls/post-image.sh
> > b/board/nxp/common/ls/post-image.sh
> > new file mode 100755
> > index 0000000000..6137379d29
> > --- /dev/null
> > +++ b/board/nxp/common/ls/post-image.sh
> > @@ -0,0 +1,92 @@
> > +#!/usr/bin/env bash
> > +# args from BR2_ROOTFS_POST_SCRIPT_ARGS # $2 linux building directory
> > +# $3 buildroot top directory # $4 u-boot building directory
> > +
> > +#
> > +# dtb_list extracts the list of DTB files from
> BR2_LINUX_KERNEL_INTREE_DTS_NAME
> > +# in ${BR_CONFIG}, then prints the corresponding list of file names for the
> > +# genimage configuration file
> > +#
> > +dtb_file()
> > +{
> > +        local DTB_LIST="$(sed -n
> 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p'
> ${BR2_CONFIG})"
> > +
> > +        for dt in $DTB_LIST; do
> > +                echo -n "\"`basename $dt`.dtb\", "
> > +        done
> > +}
> > +
> > +#
> > +# For Freescale/NXP Layerscape serial platforms (ARM v8), we use Image for
> SD/eMMC boot,
> > +# Image.gz for QSPI/XSPI boot. Then,prints the corresponding file name for
> the genimage
> 
> Why does the boot source make any difference to the kernel compression
> format?
Because there are enough space on SD card or eMMC for Image without compressed.
But for qspi or xspi flash, the space is limited, so I used the compressed kernel image.

> > +# configuration file
> > +#
> > +linux_image()
> > +{
> > +       if grep -Eq
> "^BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=\"Image\"$" ${BR2_CONFIG};
> then
> > +               echo "\"Image\""
> > +       else
> > +               echo "\"Image.gz\""
> > +       fi
> > +}
> > +
> > +plat_name()
> > +{
> > +       if grep -Eq
> "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"ls1028ardb\"$"
> ${BR2_CONFIG}; then
> > +               echo "ls1028ardb"
> > +       fi
> > +}
> 
> How will the other boards resolve to a correct plat_name here? Not all
> of them (e.g. LS1021A) use ATF.
> How about specifying it in BR2_ROOTFS_POST_SCRIPT_ARGS=?
> Or creating a board/nxp/ls1028ardb/post-image.sh that sources the
> board/nxp/common/post-image.sh and runs the functions defined there
> with custom parameters?
currently I just think about armv8, which use the ATF.
Yes, we can create post-imag.sh under board directory.

> > +
> > +#
> > +# genimage.qspi.cfg.template: Boot from 64MB QSPI flash
> > +# genimage.xspi.256MB.cfg.template: Boot from 256MB flexSPI_nor flash
> > +# genimage.xspi.64MB.cfg.template: Boot from 64MB flexSPI_nor flash
> > +# genimage.cfg.template: Boot from SD and eMMC
> > +#
> > +genimage_type()
> > +{
> > +        if grep -Eq
> "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"qspi\"$"
> ${BR2_CONFIG}; then
> > +                echo "genimage.qspi.cfg.template"
> > +        elif grep -Eq
> "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"flexspi_nor\"$"
> ${BR2_CONFIG}; then
> > +               echo "genimage.xspi.cfg.template"
> > +        elif grep -Eq
> "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"emmc\"$"
> ${BR2_CONFIG}; then
> > +                echo "genimage.emmc.cfg.template"
> > +        elif grep -Eq
> "^BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE=\"sd\"$" ${BR2_CONFIG};
> then
> > +                echo "genimage.sd.cfg.template"
> > +        fi
> > +}
> > +
> > +dp_fw()
> > +{
> > +       if grep -Eq "^BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y$"
> ${BR2_CONFIG}; then
> > +               echo "\"ls1028a-dp-fw.bin\", "
> > +
> > +       fi
> > +}
> 
> How generic it is to specify the DisplayPort firmware in the common
> post-image.sh script, since no other device than the LS1028A uses it?
> I echo other comments and wonder if it is possible for the kernel
> driver to simply call request_firmware on a file in the rootfs, rather
> than relying on the bootloader to do this operation.
If put firmware into rootfs, we just can load the driver as module, if the driver is build-in which will be loaded before mounting rootfs, then no firmware can be loaded.
I can put this script in board directory to avoid this concern.

> > +
> > +main()
> > +{
> > +       local FILES="$(dtb_file) $(dp_fw) $(linux_image)"
> > +       local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
> > +       local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> > +
> > +       sed -e "s/%FILES%/${FILES}/" \
> > +               board/nxp/$(plat_name)/$(genimage_type) >
> ${GENIMAGE_CFG}
> > +
> > +       rm -rf "${GENIMAGE_TMP}"
> > +
> > +       genimage \
> > +               --rootpath "${TARGET_DIR}" \
> > +               --tmppath "${GENIMAGE_TMP}" \
> > +               --inputpath "${BINARIES_DIR}" \
> > +               --outputpath "${BINARIES_DIR}" \
> > +               --config "${GENIMAGE_CFG}"
> > +
> > +       rm -f ${GENIMAGE_CFG}
> > +
> > +       exit $?
> > +}
> > +
> > +main $@
> > diff --git a/package/nxp/qoriq-rcw/Config.in.host
> b/package/nxp/qoriq-rcw/Config.in.host
> > index 9bf55894e8..7f5fbb3202 100644
> > --- a/package/nxp/qoriq-rcw/Config.in.host
> > +++ b/package/nxp/qoriq-rcw/Config.in.host
> > @@ -37,4 +37,10 @@ config BR2_PACKAGE_HOST_QORIQ_RCW_BIN
> >
> >           If this option is empty, no rcw file is used.
> >
> > +config BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE
> > +       string "QorIQ RCW Boot mode"
> > +       depends on !BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
> > +       help
> > +         Specify the boot mode, for example, sd, emmc, flexspi_nor.
> > +
> >  endif
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> >
> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.busyb
> ox.net%2Fmailman%2Flistinfo%2Fbuildroot&amp;data=02%7C01%7Cjerry.huan
> g%40nxp.com%7Ce81f76b8fc2d40a9339508d77790f67a%7C686ea1d3bc2b4c6f
> a92cd99c5c301635%7C0%7C0%7C637109336805597618&amp;sdata=%2FKzb
> wp%2BdPOd1mI0zxRbtZwmdlOWRInszWY9UDslpDOs%3D&amp;reserved=0
> 
> Thanks,
> -Vladimir
