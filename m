From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Apr 2019 16:29:48 -0700
Subject: [Buildroot] [PATCH 2/2] board/sifive: add support for the
 HiFive Unleashed board
In-Reply-To: <c7f0cf15-5ed5-6ab0-2c36-dad0bcc9572e@mind.be>
References: <20190414134307.24754-1-mark.corbin@embecosm.com>
 <20190414134307.24754-2-mark.corbin@embecosm.com>
 <7261729c-385b-8dd1-e969-72f95c9ac0be@mind.be>
 <32b6cdc6-3536-91de-206e-6059eed78b9c@embecosm.com>
 <c7f0cf15-5ed5-6ab0-2c36-dad0bcc9572e@mind.be>
Message-ID: <CAKmqyKPbCKJe_TE4Y0uxhfcoP5FDzVCBXAPkXRWc9qyaX43F3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 15, 2019 at 7:28 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 15/04/2019 15:04, Mark Corbin wrote:
> >>> +Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
> >>  How do you know it is ttyUSB1? It is usually USB0...
> > There are two USB serial devices on the board - the console always seems
> > to be on USB1 on my board. I can be more cautious and say '/dev/ttyUSBx'
> > instead.
>
>  Ah, now I see... So the single USB cable provides two serial ports, and USB1 is
> the one you need? Then it's indeed better to specify USB1 in the README. But
> maybe also explain that there are two ports.

It should always be USB1.

>
> >>> +
> >>> +See the 'SiFive HiFive Unleashed Getting Started Guide' for
> >>> +more details (https://www.sifive.com/documentation).
> >>> +
> >>> +--
> >>> +
> >>> +Mark Corbin <mark.corbin@embecosm.com> April 2019
> >>> diff --git a/configs/sifive_u540_unleashed_defconfig b/configs/sifive_u540_unleashed_defconfig
> >>> new file mode 100644
> >>> index 0000000000..b56ae1b164
> >>> --- /dev/null
> >>> +++ b/configs/sifive_u540_unleashed_defconfig
> >>> @@ -0,0 +1,29 @@
> >>> +# Architecture
> >>> +BR2_riscv=y
> >>> +BR2_RISCV_64=y
> >>> +
> >>> +# Patches
> >>> +BR2_GLOBAL_PATCH_DIR="board/sifive/patches"
> >>> +
> >>> +# Linux headers same as kernel, a 4.20 series
> >>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
> >>> +
> >>> +# System
> >>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sifive/u540-unleashed/post-image.sh"
> >>> +
> >>> +# Kernel
> >>> +BR2_LINUX_KERNEL=y
> >>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> >>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.20.17"
> >>  Oh, now I see, you're porting the changes done by sifive from 4.19 to 4.20...
> >> Is that also what the freedom-u-sdk does? I don't think so...
> > I'm not sure that the freedom-u-sdk has moved to 4.19 yet (the v1_0
> > release uses 4.15), but there is a patched 4.19 kernel tree available in
> > the master branch. I've generated a patch for 4.20.17 based on this
> > patched 4.19 tree. I wanted to move to the most recent version of the
> > 4.20 kernel that Buildroot supported, but I guess that I could also just
> > look at using the patched 4.19 branch that already exists.
>
>  If a board is far away from being supported by upstream, we usually stick to an
> "offical" fork from the board vendor.

Unfortunately there is no "official" upstream fork. If using the 5.1
kernel there are only 8 patches required
(https://github.com/alistair23/linux/tree/hifive-unleashed-5.1). In OE
we just apply those patches on top of mainline for 5.1
(https://github.com/riscv/meta-riscv/tree/master/recipes-kernel/linux/files/freedom-u540)
as that way we can still get updates from the kernel community.

I think the best bet is to use the latest kernel (maybe it's worth
waiting until 5.1) and applying the patches on top. The diff is slowly
shrinking so the newer the kernel the better. Those older kernels are
not in a great shape and no one is maintaining them.

Alistair

>
>
>  Regards,
>  Arnout
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
