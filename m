From: daggs <daggs@gmx.com>
Date: Sun, 3 Dec 2017 16:54:15 +0100
Subject: [Buildroot] [PATCH 6/8] odoridc2: add mainline post image
 script.
In-Reply-To: <20171203143102.2e05f11b@windsurf.lan>
References: <20171203125619.30919-1-daggs@gmx.com>
 <20171203125619.30919-6-daggs@gmx.com>
 <20171203143102.2e05f11b@windsurf.lan>
Message-ID: <trinity-ad333bae-0cfc-4733-89ea-5e4eba0cecae-1512316455334@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Sunday, December 03, 2017 at 3:31 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 6/8] odoridc2: add mainline post image script.
>
> Hello,
> 
> On Sun,  3 Dec 2017 14:56:17 +0200, Dagg Stompler wrote:
> 
> > +BOARD_DIR="$(dirname $0)"
> > +GENIMAGE_CFG="${BOARD_DIR}/genimage-mainline.cfg"
> > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> > +WORK_DIR="${BUILD_DIR}/hk-uboot-signing"
> > +FINAL_IMG_PATH="${BINARIES_DIR}/sdcard.img"
> > +SIGNED_UBOOT_IMG="${BINARIES_DIR}/uboot-odc2.img"
> > +SIGNED_FILES_URL="https://github.com/hardkernel/u-boot/archive/odroidc2-v2015.01.tar.gz"
> > +SIGNED_FILES_PATH_PREFIX="$(basename $(echo ${SIGNED_FILES_URL} | sed 's/\.tar.*$//g'))"
> > +
> > +rm -rf "${WORK_DIR}" "${GENIMAGE_TMP}"
> > +
> > +echo "Retrieving vendor files for signing"
> > +mkdir -p ${WORK_DIR}
> > +wget -qO- ${SIGNED_FILES_URL} | tar -C ${WORK_DIR} --strip-components=1 -zxf - u-boot-${SIGNED_FILES_PATH_PREFIX}/{tools/fip_create,fip/gxb,sd_fuse/bl1.bin.hardkernel} 
> > +
> > +echo "Building nessesary tools"
> > +CC="${HOSTCC}" make -C ${WORK_DIR}/tools/fip_create
> 
> Downloading and building stuff in the post-image script is clearly not
> good. It works around the download and legal-info mechanisms of
> Buildroot.
the fw is part of the vendor's uboot branch, I'm not sure it is a wise idea to add the vendor's uboot as pkg and rename it to something else.
I'm open for suggestions.

> 
> > +echo "Prepering files"
> 
> Preparing
> 
acked.

> > +${WORK_DIR}/tools/fip_create/fip_create --bl30 ${WORK_DIR}/fip/gxb/bl30.bin --bl301 ${WORK_DIR}/fip/gxb/bl301.bin --bl31 ${WORK_DIR}/fip/gxb/bl31.bin --bl33 ${BINARIES_DIR}/u-boot.bin ${WORK_DIR}/fip.bin
> > +${WORK_DIR}/tools/fip_create/fip_create --dump ${WORK_DIR}/fip.bin
> 
> This feels like creating an ARM Trusted Firmware image. Don't you have
> the source code for ATF, so that you can build it ?
afaik, amlogic doesn't provide a way to compile it's signed fw, you can get it from the vendor alone.

> 
> > +cat ${WORK_DIR}/fip/gxb/bl2.package ${WORK_DIR}/fip.bin > ${WORK_DIR}/boot_new.bin
> > +${HOST_DIR}/bin/amlbootsig ${WORK_DIR}/boot_new.bin ${WORK_DIR}/u-boot.img
> > +cp ${WORK_DIR}/sd_fuse/bl1.bin.hardkernel ${BINARIES_DIR} 
> > +
> > +echo "Genrating new uboot img file"
> 
> Generating
> 
acked.

> > +dd if=${WORK_DIR}/u-boot.img of=${SIGNED_UBOOT_IMG} bs=512 skip=96
> > +
> > +genimage                           \
> > +	--rootpath "${TARGET_DIR}"     \
> > +	--tmppath "${GENIMAGE_TMP}"    \
> > +	--inputpath "${BINARIES_DIR}"  \
> > +	--outputpath "${BINARIES_DIR}" \
> > +	--config "${GENIMAGE_CFG}"
> > +
> > +echo "Signing image"
> > +dd if=${BINARIES_DIR}/bl1.bin.hardkernel of=${FINAL_IMG_PATH} conv=fsync,notrunc bs=1 count=442
> > +dd if=${BINARIES_DIR}/bl1.bin.hardkernel of=${FINAL_IMG_PATH} conv=fsync,notrunc bs=512 skip=1 seek=1
> 
> Best regards,
> 
> Thomas Petazzoni
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
