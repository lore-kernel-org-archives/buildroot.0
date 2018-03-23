From: =?UTF-8?Q?Rafa=C5=82_Susz?= <rafal.susz@gmail.com>
Date: Fri, 23 Mar 2018 15:19:37 +0100
Subject: [Buildroot] "BR2_TARGET_ROOTFS_INITRAMFS" with U-Boot?
In-Reply-To: <20180323103957.xbnkj6lwwwls7kob@tarshish>
References: <11934B5C-E5F2-4D66-B522-DC095DFFCA26@jens-maus.de>
 <20180323103957.xbnkj6lwwwls7kob@tarshish>
Message-ID: <CANmNbVzyG52=v-5sQ6wUQrXqdzEdpQUp5R8TZTXkXeXJYaJnUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jens,

I made short test on my at91sam ARM9  based board. After simple
enabling  BR2_TARGET_ROOTFS_INITRAMFS
in buildroot  and changing bootargs to contain  root=/dev/ram0
I also observe stuck on "Starting linux kernel ..."  .

Make sure you have enabled RAMFS support in kernel. On my side it was not
selected causing the hang:

General Setup
  [*] Initial RAM filesystem and RAM disk (initramfs/initrd) support


With it in I am able to boot up with ramfs.

best regards,
rafal


2018-03-23 11:39 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:

> Hi Jens,
>
> On Fri, Mar 23, 2018 at 11:05:24AM +0100, Jens Maus wrote:
> > I am currently developing a buildroot-driven system (for RaspberryPi HW)
> > which uses U-Boot together with BR2_TARGET_ROOTFS_CPIO and
> > BR2_TARGET_ROOTFS_CPIO_UIMAGE in buildroot to generate a zImage and
> initrd
> > file which I can then boot via
> >
> > load mmc 0:1 ${kernel_addr_r} /zImage
> > load mmc 0:1 ${ramdisk_addr_r} /initrd
> > setenv bootargs ?root=/dev/ram0?
> > bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}
> >
> > in U-Boot. This works perfectly fine.
> >
> > However, I am currently evaluating the possibilities to directly embed
> the
> > initramfs into the kernel by switching to BR2_TARGET_ROOTFS_INITRAMFS.
> But I
> > am not able to boot the generated zImage via
> >
> > load mmc 0:1 ${kernel_addr_r} /zImage
> > setenv bootargs ??
> > bootz ${kernel_addr_r} - ${fdt_addr}
> >
> > It simply hangs at ?Starting kernel??
> >
> > Unfortunately I don?t have any idea why this kernel with the embedded
> > initramfs doesn?t boot at all? It doesn?t even output any kernel
> > information/debug on the console.
> >
> > Any idea what might be wrong here or how I could debug the situation to
> get
> > that zImage booted?
>
> Your bigger kernel image, or its boot-time decompressed image, might be
> overwriting the DT. See section 4b in Documentation/arm/Booting of the
> kernel
> source.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180323/28b4ead7/attachment.html>
