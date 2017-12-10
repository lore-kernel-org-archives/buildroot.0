From: daggs <daggs@gmx.com>
Date: Sun, 10 Dec 2017 08:54:18 +0100
Subject: [Buildroot] [PATCH v2 4/4] odroidc2: add support for mainline
 kernel and u-boot
In-Reply-To: <20171209163454.w2bdg7kw3d7nkovv@speedy.hunter>
References: <20171209075219.23240-1-daggs@gmx.com>
 <20171209075219.23240-4-daggs@gmx.com>
 <20171209125929.cuongkggfehwuxjo@speedy.hunter>
 <trinity-f349fa8b-c277-47f7-b45e-ba2308869c49-1512829006831@3c-app-mailcom-bs14>
 <20171209163454.w2bdg7kw3d7nkovv@speedy.hunter>
Message-ID: <trinity-ca367267-2ee4-4625-b1c5-7defbecbeb28-1512892458893@3c-app-mailcom-bs08>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Sergey,

>
> Hello Dagg,
> 
> > > Maybe it makes sense to rename odroid-c2 defconfigs (existing and new)
> > > adding vendor name: e.g. hardkernel_odroidc2_mainline_defconfig.
> > can you elaborate on what is the gains of such renaming?
> 
> More consistent and searchable naming. This is going to make
> even more sense when other odroid boards will be added.
> But anyway, this is up to maintainers.
from what I know, the only other board that has any buildroot support is the c1+ in the vendor's buildroot repo.
I think your suggestion will be valid if and when a new board will be introduced into buildroot.

> 
> > > 
> > > ...
> > > 
> > > > diff --git a/board/hardkernel/odroidc2/post-image.sh b/board/hardkernel/odroidc2/post-image.sh
> > > > index a53f87ec11..bc885d4c51 100755
> > > > --- a/board/hardkernel/odroidc2/post-image.sh
> > > > +++ b/board/hardkernel/odroidc2/post-image.sh
> > > > @@ -2,12 +2,29 @@
> > > >  
> > > >  BOARD_DIR="$(dirname $0)"
> > > >  GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> > > > +TARGET_MAINLINE="$2"
> > > >  IM_FILE=""
> > > > +CLEANUPS_CMD=""
> > > >  
> > > > -GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> > > > -IM_FILE="${BINARIES_DIR}/u-boot.bin"
> > > > +if [ "${TARGET_MAINLINE}" = "yes" ]; then
> > > > +	GENIMAGE_CFG="${BOARD_DIR}/genimage-mainline.cfg"
> > > > +	SIGNED_UBOOT_IMG="${BINARIES_DIR}/uboot-odc2.img"
> > > > +	ODRODIDC2_ATF_FOLDER="${HOST_DIR}/usr/share/odroidc2_atf"
> > > > +	IM_FILE="${ODRODIDC2_ATF_FOLDER}/bl1.bin.hardkernel"
> > > > +	CLEANUPS_CMD="rm -rf ${BINARIES_DIR}/fip.bin ${BINARIES_DIR}/boot_new.bin ${BINARIES_DIR}/u-boot.img"
> > > >  
> > > > -cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
> > > > +	${HOST_DIR}/bin/fip_create --bl30 ${ODRODIDC2_ATF_FOLDER}/bl30.bin --bl301 ${ODRODIDC2_ATF_FOLDER}/bl301.bin --bl31 ${ODRODIDC2_ATF_FOLDER}/bl31.bin --bl33 ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/fip.bin
> > > > +	${HOST_DIR}/bin/fip_create --dump ${BINARIES_DIR}/fip.bin
> > > > +	cat ${ODRODIDC2_ATF_FOLDER}/bl2.package ${BINARIES_DIR}/fip.bin > ${BINARIES_DIR}/boot_new.bin
> > > > +	${HOST_DIR}/bin/amlbootsig ${BINARIES_DIR}/boot_new.bin ${BINARIES_DIR}/u-boot.img
> > > > +
> > > > +	dd if=${BINARIES_DIR}/u-boot.img of=${SIGNED_UBOOT_IMG} bs=512 skip=96
> > > > +else
> > > > +	GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> > > > +	IM_FILE="${BINARIES_DIR}/u-boot.bin"
> > > > +
> > > > +	cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
> > > > +fi
> > > 
> > > It would be great if boot image generation could be integrated into current
> > > ATF/U-Boot dependency model. However from your patches it looks like
> > > there is no way to build ATF for odroid-c2 from sources. Could you please
> > > clarify several points regarding ATF and different odroid-c2 u-boot flavors.
> > > In particular, am I correct assuming the following:
> > > 
> > > - there is no way to build ATF binaries from sources for odroid-c2
> > >   -- ATF binaries are only available in hardkernel u-boot repository
> > > 
> > I don't quite know, I've asked in the board's forums about this repo: https://github.com/hardkernel/u-boot_firmware/tree/odroidc2-bl301
> > unfortunately, I did not got clear answer from the moderator (I got an answer but but without any reference to my question).
> > he did referenced me to this: https://wiki.odroid.com/odroid-c2/software/building_u-boot#how_to_build_u-boot_with_bl301_firmware
> > problem is, it refers to vendor's boot and looking at the page, from what I can see, it needs to be merged into u-boot.
> > another issue is that my git and u-boot knowledge are rather basic...
> > 
> > > - nothing changes for hardkernel u-boot with these patches:
> > >   -- ATF binaries are in the same github repository
> > >   -- ATF/U-Boot image generation is already in build rules
> > > 
> > hardkernel u-boot repo includes the ATF injection in it already.
> > 
> > > - mainline u-boot needs ATF binaries from hardkernel u-boot repositories
> > >   -- mainline u-boot builds fine w/o ATF binaries
> > >   -- ATF binaries are needed when signed boot.img is created from u-boot.bin
> > indeed.
> > 
> > > 
> > > If so, then could you please check how UBOOT_ZYNQ_IMAGE and
> > > UBOOT_CRC_ALTERA_SOCFPGA_IMAGE are now supported in boot/uboot/uboot.mk.
> > > It looks like similar approach can be implemented for odroid-c2 mainline
> > > u-boot. In this case there will be no need for complicated post-image script.
> > > Besides, dependency of mainline u-boot from hardkernel u-boot will be
> > > explicitely tracked.
> > > 
> > > Regards,
> > > Sergey
> > looks like the might have similar approach, just to be sure it will generate the signed image after u-boot was built, am I correct?
> 
> I did a bit more investigation around hardkernel u-boot and u-boot_firmware
> repositories. It looks like we need the following pieces in order to
> create sdcard images using mainline u-boot:
> 
> - amlbootsig: a part of meson-tools (you have just added it)
> - fip_create: host tool, a part of hardkernel u-boot
> - binaries: bl30.bin, bl31.bin, bl301.bin, bl1.bin.hardkernel
>   -- all binaries are a part of hardkernel u-boot repository
>   -- only bl301.bin can be built from sources
>   -- bl33 will be mainline u-boot
> 
> To summarize, it looks like there is no way to use existing ATF package,
> unless I am missing something. On the other hand, it should be possible
> to use UBOOT_ZYNQ_IMAGE approach. But in this case we need to pull the whole
> hardkernel u-boot repository, just to get all binaries and fip_create tool.
> Wierd...
> 
> Maybe it makes sense to wrap the same hardkernel u-boot repository into
> one more package, e.g. amlogic-binaries. We could use it only for building
> fip_create and getting binary blobs.
> 
> Lets see what others think...
> 
> Regards,
> Sergey
> 
the UBOOT_ZYNQ_IMAGE approach is good if either the ATF code will be moved into the uboot makefile or to an external script that will be called via the uboot makefile.

either way, without been able to compile the ATF, I don't see and better solution.
as you said, maybe the others will have a better solution.

Dagg.
