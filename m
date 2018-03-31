From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 16:06:57 +0200
Subject: [Buildroot] [PATCH v2] board: add support for ARC HS
 Development Kit (HSDK)
In-Reply-To: <20180331151039.40c7dce2@windsurf> (Thomas Petazzoni's message of
 "Sat, 31 Mar 2018 15:10:39 +0200")
References: <20171219145554.17718-1-didin@synopsys.com>
 <20180331151039.40c7dce2@windsurf>
Message-ID: <87efk0uyny.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Tue, 19 Dec 2017 17:55:54 +0300, Evgeniy Didin wrote:

 >> index 0000000000..e99a4a0b96
 >> --- /dev/null
 >> +++ b/board/synopsys/hsdk/post-image.sh
 >> @@ -0,0 +1,18 @@
 >> +#!/bin/bash
 >> +
 >> +BOARD_DIR="$(dirname $0)"
 >> +BOARD_NAME="$(basename ${BOARD_DIR})"
 >> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 >> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 >> +rm -rf "${GENIMAGE_TMP}"
 >> +
 >> +mv ${BINARIES_DIR}/uboot-env.bin ${BINARIES_DIR}/uboot.env

 > This rename can be done by the genimage.cfg file.

 >> +
 >> +genimage                           \
 >> +        --rootpath "${TARGET_DIR}"     \
 >> +        --tmppath "${GENIMAGE_TMP}"    \
 >> +        --inputpath "${BINARIES_DIR}"  \
 >> +        --outputpath "${BINARIES_DIR}" \
 >> +        --config "${GENIMAGE_CFG}"
 >> +gzip < ${BINARIES_DIR}/sdcard.img > ${BINARIES_DIR}/sdcard.img.gz

 > And we don't need to generate a compressed SD card image.

 > With those two changes, the common support/scripts/genimage.sh script
 > can be used.

 > I think Peter will fix this up when applying.

Correct. Applied with the following changes:

- Renamed defconfig to snps_archs38_hsdk_defconfig
- Fix comments in defconfig
- Added defconfig to DEVELOPERS and fixup board/synopsys entry
- Drop postimage script, rename env file in genimage.cfg and drop size
  setting for rootfs partition
- Add "" for CONFIG_INITRAMFS_SOURCE in linux fragment

It would be good if you could add a followup patch adding a readme.txt
and update DEVELOPERS with the other snps defconfigs.

-- 
Bye, Peter Korsgaard
