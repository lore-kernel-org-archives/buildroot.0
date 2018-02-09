From: Jens Maus <mail@jens-maus.de>
Date: Fri, 9 Feb 2018 10:55:29 +0100
Subject: [Buildroot] aarch64 + armhf multiarch support?
In-Reply-To: <trinity-b580d83a-4026-4b4f-991c-2bd4db9d4f2f-1518091664400@3c-app-mailcom-bs13>
References: <8EB2320D-F586-45FA-A9F4-F49D7FD5DD5D@jens-maus.de>
 <trinity-566065ed-72d1-4d19-9ae3-ab3368c01d3a-1518087937117@3c-app-mailcom-bs16>
 <E10BD61C-1C84-4039-A741-331FC3C8B961@jens-maus.de>
 <trinity-ad8db11c-f541-454e-8440-6c47520cc02f-1518089812434@3c-app-mailcom-bs15>
 <8A656331-7273-4C87-9E60-F62570C60828@jens-maus.de>
 <trinity-b580d83a-4026-4b4f-991c-2bd4db9d4f2f-1518091664400@3c-app-mailcom-bs13>
Message-ID: <58733ED8-7525-4945-8665-6309CD838F3B@jens-maus.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dagg,

> Am 08.02.2018 um 13:07 schrieb daggs <daggs@gmx.com>:
> 
>>> Am 08.02.2018 um 12:36 schrieb daggs <daggs@gmx.com>:
>>> 
>>> ok, currently in buildroot there is no possibility to build a odroid c2 based 32 big image because the vendor didn't implemented some of the opcode in u-boot.
>>> however, I've posted a bunch of patches 2 months ago which introduce mainline kernel (4.14.x) and mainline uboot (2017.07) support for this board.
>>> you might be able to build a 32 bit image using these patches.
>>> 
>>> imho it worth looking into it.
>> 
>> Would you mind sharing a link with me pointing to the corresponding patches? That would be great.
> 
> sure, see: https://patchwork.ozlabs.org/project/buildroot/list/?submitter=69054

Thanks for the link. I just integrated these patches into my buildroot environment and reconfigured the odroidc2 defconfig to build for BR2_arm=y and BR2_cortex_a53=y instead of aarch64. The results suggest, however, that uboot is not able to build for the odroidc2 with armhf only:

? cut here ?
  CHK     include/config.h
  CFG     u-boot.cfg
cc1: warning: unknown register name: x18
  HOSTLD  tools/dumpimage
  HOSTLD  tools/mkimage
  CC      arch/arm/mach-meson/board.o
  CC      board/amlogic/odroid-c2/odroid-c2.o
  CC      arch/arm/cpu/armv8/cpu.o
cc1: warning: unknown register name: x18
cc1: warning: unknown register name: x18
cc1: warning: unknown register name: x18
In file included from ./arch/arm/include/asm/bitops.h:193:0,
                 from include/linux/bitops.h:124,
                 from include/common.h:25,
                 from board/amlogic/odroid-c2/odroid-c2.c:7:
include/asm-generic/bitops/__fls.h: In function ?__fls?:
include/asm-generic/bitops/__fls.h:17:21: warning: left shift count >= width of type [-Wshift-count-overflow]
  if (!(word & (~0ul << 32))) {
[?]
In file included from include/common.h:97:0,
                 from board/amlogic/odroid-c2/odroid-c2.c:7:
include/dm/of.h: At top level:
./arch/arm/include/asm/global_data.h:107:58: error: invalid register name for ?gd?
 #define DECLARE_GLOBAL_DATA_PTR  register volatile gd_t *gd asm (?x18?)
? cut here ?

To me this looks like U-Boot is not able to be built for the odroidc2 using only a armhf compiler. Or are there any u-boot defconfig changes I could try and hopefully see a 32bit build for the odroidc2?

Apart from that, are there really no possibilities to build a multiarch (aarch64+armhf) buildroot environment that allows to run 64bit and 32bit binaries@the same time? Or am I missing something?

regards,
jens
-- 
Jens Maus, Dresden/Germany
http://jens-maus.de/

*** Content is authentic only with digital signature  ***

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 3745 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180209/5a6fb540/attachment.p7s>
