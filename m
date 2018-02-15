From: Pierre Crokaert <pct@crookies.net>
Date: Thu, 15 Feb 2018 10:36:11 +0100
Subject: [Buildroot] [PATCH 1/1] Odroid XU4: Hardkernel new board support
In-Reply-To: <20180214224158.7943d151@windsurf.lan>
References: <1517655722-20132-1-git-send-email-pct@crookies.net>
 <20180214224158.7943d151@windsurf.lan>
Message-ID: <CABaAnAcZHJRTefHyB8R4ZuHLqAoB9HGP9KUjpkJ_ZxUkD=xU8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thank you for the quick feedback. My reply in the text:

2018-02-14 22:41 GMT+01:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello Pierre,
>
> On Sat,  3 Feb 2018 12:02:02 +0100, Pierre CROKAERT wrote:
> > This patch provides support for the board Odroid XU4
> > This version is using the latest 4.9 kernel released by Hardkernel,
> > and the current u-boot 2017.05 also from Hardkernel.
> > The support was implemented based on comments about Andi's patch (
> https://patchwork.ozlabs.org/patch/640695/).
> >
> > Signed-off-by: Pierre CROKAERT <pct@crookies.net>
>
> Thanks for working on this topic. However, there are still a few things
> that I don't understand and/or that don't feel correct.
>
> > diff --git a/board/hardkernel/odroidxu4/boot.cmd
> b/board/hardkernel/odroidxu4/boot.cmd
> > new file mode 100644
> > index 0000000..2fb4c16
> > --- /dev/null
> > +++ b/board/hardkernel/odroidxu4/boot.cmd
> > @@ -0,0 +1,10 @@
> > +setenv kernelname zImage;
> > +setenv boot_kernel "setenv bootargs \"${console}
> root=/dev/mmcblk${mmcrootdev}p${mmcrootpart} rootfstype=${rootfstype}
> rootwait ${opts}\";
> > +load mmc ${mmcbootdev}:${mmcbootpart} 0x40007FC0 '${kernelname}';
> > +if load mmc ${mmcbootdev}:${mmcbootpart} 40800000 ${fdtfile}; then
> > +     bootz 0x40007FC0 - 40800000;
> > +else
> > +     echo Warning! Booting without DTB: '${fdtfile}'!;
> > +     bootz 0x40007FC0 -;
> > +fi;"
>
> Is this condition really needed? Aren't you always going to boot with a
> DTB ?
>

Yes, in this buildroot context, the DTB will always be present. I can
remove these lines.
In the meantime, I have removed the boot.cmd and replaced it by a boot.ini
that is required to adjust some platform parameters (video,..). Should I
update the patch already or fix your comments first?


>
> > +run boot_kernel;
> > \ No newline at end of file
>
> Nit: please add a new line here.
>

Ok


>
> > diff --git a/board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg
> b/board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg
> > new file mode 100644
> > index 0000000..a8e8379
> > --- /dev/null
> > +++ b/board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg
>
> I don't see this file being used anywhere. Why isn't this done in
> genimage.cfg itself ?
>

This is actually not used, I have tried to put everything in the genimage
file, but I have a problem with the boot loader part.
Hardkernel provides 3 binary files via there uboot github site, the problem
is that the first 2 files actually overlap when you flash them, the second
one (bl2.bin) overlaps the first one (bl1.bin). I have described this in an
issue on github, but there is no reaction:
https://github.com/hardkernel/u-boot/issues/45
I suppose the end of bl1.bin is erased by bl2.bin and it works, but this is
black box.
Because of this overlap, genimage complains that there there is not enough
room for the first file (bl1.bin).
This is why I have used the "dd" command to flash all the bootloader files.
This  genimage_bootloader_fragment.cfg is the part that should go in the
genimage.cfg file if the blX.bin files were fixed.
Do you prefere to remove this file for now?


>
> > diff --git a/board/hardkernel/odroidxu4/post-image.sh
> b/board/hardkernel/odroidxu4/post-image.sh
> > new file mode 100755
> > index 0000000..1722c4b
> > --- /dev/null
> > +++ b/board/hardkernel/odroidxu4/post-image.sh
> > @@ -0,0 +1,50 @@
> > +#!/bin/sh
> > +
> > +BOARD_DIR="$(dirname $0)"
> > +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> > +
> > +cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
> > +
> > +rm -rf "${GENIMAGE_TMP}"
> > +
> > +genimage                           \
> > +     --rootpath "${TARGET_DIR}"     \
> > +     --tmppath "${GENIMAGE_TMP}"    \
> > +     --inputpath "${BINARIES_DIR}"  \
> > +     --outputpath "${BINARIES_DIR}" \
> > +     --config "${GENIMAGE_CFG}"
> > +
> > +#dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=1
> count=442 conv=sync,notrunc
> > +#dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=512
> skip=1 seek=1 conv=fsync,notrunc
>
> Those lines are commented, they should be removed.
>

Ok.


>
> > +
> > +signed_bl1_position=0
> > +bl2_position=30
> > +uboot_position=62
> > +tzsw_position=1502
> > +device="${BINARIES_DIR}/sdcard.img"
> > +uboot="${BINARIES_DIR}/u-boot-dtb.bin"
> > +
> > +env_position=2015
> > +
> > +#<BL1 fusing>
> > +echo "BL1 fusing"
> > +dd if=${BINARIES_DIR}/bl1.bin.hardkernel of=$device
> seek=$signed_bl1_position conv=fsync,notrunc
> > +
> > +#<BL2 fusing>
> > +echo "BL2 fusing"
> > +dd if=${BINARIES_DIR}/bl2.bin.hardkernel.720k_uboot of=$device
> seek=$bl2_position conv=fsync,notrunc
> > +
> > +#<u-boot fusing>
> > +echo "u-boot fusing"
> > +dd if=$uboot of=$device seek=$uboot_position conv=fsync,notrunc
> > +
> > +#<TrustZone S/W fusing>
> > +echo "TrustZone S/W fusing"
> > +dd if=${BINARIES_DIR}/tzsw.bin.hardkernel of=$device
> seek=$tzsw_position conv=fsync,notrunc
> > +
> > +#<u-boot env erase>
> > +echo "u-boot env erase..."
> > +dd if=/dev/zero of=$device seek=$env_position bs=512 count=32
> conv=fsync,notrunc
>
> Why are you doing all those dd invocations here instead of using a
> genimage configuration file that will put all those images at the right
> offset in the SD card image ?
>

Related to the bl1, bl2 files issue.


>
> > diff --git a/board/hardkernel/odroidxu4/readme.txt
> b/board/hardkernel/odroidxu4/readme.txt
> > new file mode 100644
> > index 0000000..24a0184
> > --- /dev/null
> > +++ b/board/hardkernel/odroidxu4/readme.txt
> > @@ -0,0 +1,76 @@
> > +Odroid XU-4 board with Samsung Exynos 5422 SoC
> > +
> > +Introduction
> > +------------
> > +
> > +The Odroid XU 4 board is developed and shipped by Hrdkernel (
> hardkernel.com). It
> > +uses the Samsung Exynos 5422 Soc.
> > +
> > +Odroid boot process
> > +-------------------
> > +
> > +The odroid boot process requires three stages of boot plus trust zone:
> > +
> > +    boot level 1
> > +
> > +        |
> > +        V
> > +
> > +    boot level 2
> > +
> > +        |
> > +        V
> > +
> > +     u-boot
> > +
> > +and they need to be raw copied to the SD card in the following order:
> > +
> > +    +----------------+----------------+
> > +    | boot level 1   | 1 block        |
> > +    +----------------+----------------+
> > +    | boot level 2   | 31 block       |
> > +    +----------------+----------------+
> > +    | u-boot         | 63 block       |
> > +    +----------------+----------------+
> > +    | trust zone     | 2111 block     |
> > +    +----------------+----------------+
> > +    | boot partition | 4096 block     |
> > +    +----------------+----------------+
>
> Are those "1 block", "31 block", etc. information the offset or the
> size of each part ?
>
> Do we really need this explained in the readme.txt, if the genimage.cfg
> file already documents that ?
>

Right, this could be removed, it is historical but useless.


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180215/017d79f3/attachment.html>
