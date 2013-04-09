From: David Li <w.david.li@gmail.com>
Date: Tue, 9 Apr 2013 08:13:37 -0700
Subject: [Buildroot] Newbie questions on building images for EP405
In-Reply-To: <5162F0E2.2030103@zacarias.com.ar>
References: <CAADET=fm0cNPKvvRj6k9nOiGqXZqVGLM7fabj=y8X8sR197WUw@mail.gmail.com>
 <5162F0E2.2030103@zacarias.com.ar>
Message-ID: <CAADET=cXud-Oyp5Fk5Ybox-_TcdVKpyharCh00am6+bJaXgUXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo:

Thanks for the info.  I chose the "initial RAM filesystem linked into
the linux kernel" option and rebuilt my images. This time I got three in
output/images:

-rw-rw-r--. 1 wdli wdli 1648640 Apr  8 21:19 rootfs.cpio
-rw-rw-r--. 1 wdli wdli 1822720 Apr  8 21:19 rootfs.tar
-rw-rw-r--. 1 wdli wdli 2571997 Apr  8 21:19 uImage

I figured that the uImage is the one that combined both kernel and rootfs.
So I used tftpboot to load it on my EP405. Here is the inflate error I got.
Is this because I forgot about other options in the make menuconfig?


=> bootm 0x100000
## Booting image at 00100000 ...
   Image Name:   Linux-3.7.8
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    2571933 Bytes =  2.5 MB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... Error: inflate() returned -3
GUNZIP ERROR - must RESET board to recover

U-Boot 1.2.0-gd35b508a-dirty (Sep 19 2007 - 14:13:23)




**


On Mon, Apr 8, 2013 at 9:31 AM, Gustavo Zacarias <gustavo@zacarias.com.ar>wrote:

> On 04/08/2013 12:20 PM, David Li wrote:
>
> > Hello,
> >
> > I am new to using buildroot and I am learning this with an ep405 (ppc)
> >         board. My goal is to build an Linux image and boot it up. The
> >     board comes with u-boot loader on bootup.
> >         I did make menuconfig with minmal packages (busybox, devtmpfs,
> >     native buildroot tool chain etc).  After make, I got two image files
> >     in output/images: rootfs.tar and uImage.
> >
> >         My questions are:
> >         1. There are two def kernel config files I used in
> >            output/build/linux-3.7.8/arch/
> >     powerpc/configs/. which one is really  for ep405? I tried both in
> make
> >     menuconfig and all of them built OK:
> >
> >       ppc40x_defconfig
> >       40x/ep405_defconfig
>
> Hi.
> The ppc40x_defconfig is the "common" config - useful if you're
> targetting different 40x-based boards.
> The ep405_defconfig is targetted towards the embedded planet ep405 board
> explicitly - the kernel will be somewhat smaller.
>
> >           2. There are two files in output/images/ - one kernel and the
> >     other a roof filesystem. Can they be combined into one image and boot
> >     up with ep405 uboot?
>
> Yes, you probably want to use an initramfs target for that. In the
> Filesystem images menu you've got "initial RAM filesystem linked into
> the linux kernel" option, that's what you'd want for a quick test.
> The uImage is the kernel prepared/formatted for u-boot to use.
> The tar is just a simple archive of the root filesystem, usable for
> example if you are NFS-booting the board or dumping it into some form of
> removable media (SD card and so on).
>
> >           3. The ep405 board already boots up uboot. Do I need use
>  buildroot to
> >            build another uboot image?
>
> If it's already working like you want it too usually there's no need to
> upgrade the booatloader, specially since in many cases you'll need
> specialized hardware to recover from a botched upgrade.
> Regards.
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130409/a202fb19/attachment.html>
