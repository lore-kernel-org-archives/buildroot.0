From: John Stile <john@stilen.com>
Date: Mon, 11 Feb 2013 16:19:30 -0800
Subject: [Buildroot] need smaller filesystem for NOR
In-Reply-To: <1360359245.28641.79.camel@genx.eng.msli.com>
References: <1360344317.17385.31.camel@genx.eng.msli.com>
 <20130208183807.2b2fe572@skate>
 <1360359245.28641.79.camel@genx.eng.msli.com>
Message-ID: <1360628370.13529.110.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2013-02-08 at 13:34 -0800, John Stile wrote:
> Dear Thomas Petazzoni,
> 
> On Fri, 2013-02-08 at 18:38 +0100, Thomas Petazzoni wrote:
> > Dear John Stile,
> > 
> > On Fri, 08 Feb 2013 09:25:17 -0800, John Stile wrote:
> > > I primarily boot from one of two 128Mb NAND areas, but I have an 8Mb NOR
> > > failsafe if NAND is bad.  I have about 5.5Mb available for the
> > > Filesystem after loading at91bootstrap, uboot, uboot-env, and kernel.
> > > ...(using buildroot-2011.11)...
> > > 
> > > The rootfs.jffs2 for NAND is 41Mb.
> > > I need one for NOR that is less than 5.5Mb.
> > > 
> > > Is there a good method or script to copy buildroot's rootfs.jffs2  to
> > > make a smaller copy for NOR?
> > > 
> > > My first attempt  leads to
> > > VFS: Mounted root (jffs2 filesystem) on device 31:1.
> > > Freeing init memory: 104K
> > > Warning: unable to open an initial console.
> > > Kernel panic - not syncing: No init found.  Try passing init= option to kernel.
> > > [<c0028678>] (unwind_backtrace+0x0/0xdc) from [<c0243990>] (panic+0x34/0x110)
> > > [<c0243990>] (panic+0x34/0x110) from [<c002254c>] (init_post+0x138/0x170)
> > > [<c002254c>] (init_post+0x138/0x170) from [<c0008408>] (kernel_init+0xbc/0xe8)
> > > [<c0008408>] (kernel_init+0xbc/0xe8) from [<c003b634>] (do_exit+0x0/0x5a4)
> > > [<c003b634>] (do_exit+0x0/0x5a4) from [<00000003>] (0x3)
> > > 
> > > I think this means the file system is found and mounted, and for some
> > > reason, init isn't found, although I have played with init= to no avail,
> > > and if I mount my little jffs2, I do see busybox and all the links
> > > (/bin/init).
> > 
> > Beware that if a NAND or NOR partition is empty and properly erase,
> > jffs2 will happily mount it and show a filesystem that contains no
> > file. So the behavior you're seeing here could perfectly happen if your
> > NAND or NOR partition is simply empty.
> 
> To check for an empty file system I compared the hex dump of my jffs2
> image to the contents of NOR, and they are the same.
> From the uboot prompt I ran: md.b 0xD0294000 0x19
> From the shell I ran: od -t x1z NORrootfs.jffs2
> Both are identical, and I can mount my .jffs2 and see it contains stuff.
> 
> Could it be my bootargs mtdparts pointing to the wrong place?
> bootargs=mem=64M console=ttyS0,115200 mtdparts=dataflash0:2640k(bootstrap/uboot/env/kernel)ro,-(rootfs) root=/dev/mtdblock1 rw rootfstype=jffs2
> 
> I also tried exchanging 'dataflash0' for 'dataflash1', with no change in
> behavior.
> 
> This is the first time I have tried to put a file system on NOR.
> 

I discovered the kernel mtdparts statement to control the mtd partition
layout, which I guess is a good staring point for mounting the root file
system, but I still can't mount.

I gleaned the information from the kernel boot messages and the kernel
drivers/mtd/devices/at91_dataflash.c.

Default kernel boot messages for NAND and NOR:
 NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron NAND 256MiB 3,3V 8-bit)
 AT91 NAND: 8-bit, Software ECC
 Scanning device for bad blocks
 mtd: no mtd-id
 Creating 3 MTD partitions on "atmel_nand":
 0x000000000000-0x000000400000 : "Bootstrap"
 0x000000400000-0x000004000000 : "Partition 1"
 0x000004000000-0x000010000000 : "Partition 2"
 atmel_spi atmel_spi.0: Atmel SPI Controller at 0xfffc8000 (irq 12)
 mtd_dataflash spi0.1: AT45DB642x (8448 KBytes) pagesize 1056 bytes (OTP)

I changed my boot args to:
bootargs=mem=64M console=ttyS0,115200 mtdparts=spi0.1-AT45DB642x:2640k(bootstrap/env/uboot/kernel)ro,-(rootfs);atmel_nand:128k(bootstrap1)ro,256k(uboot1)ro,128k(env1)ro,1536K(unused),2M(linux1),124M(rootfs1),128k(bootstrap2)ro,256k(uboot2)ro,128k(env2)ro,1536k(unused2),2M(linux2),124M(rootfs2) root=/dev/mtdblock2 rw rootfstype=jffs2

Now kernel boot messages for NAND and NOR show my partitions, but fail
to find the root filesystem:
 NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron NAND 256MiB 3,3V 8-bit)
 AT91 NAND: 8-bit, Software ECC
 Scanning device for bad blocks
 12 cmdlinepart partitions found on MTD device atmel_nand
 Creating 12 MTD partitions on "atmel_nand":
 0x000000000000-0x000000020000 : "bootstrap1"
 0x000000020000-0x000000060000 : "uboot1"
 0x000000060000-0x000000080000 : "env1"
 0x000000080000-0x000000200000 : "unused"
 0x000000200000-0x000000400000 : "linux1"
 0x000000400000-0x000008000000 : "rootfs1"
 0x000008000000-0x000008020000 : "bootstrap2"
 0x000008020000-0x000008060000 : "uboot2"
 0x000008060000-0x000008080000 : "env2"
 0x000008080000-0x000008200000 : "unused2"
 0x000008200000-0x000008400000 : "linux2"
 0x000008400000-0x000010000000 : "rootfs2"
 atmel_spi atmel_spi.0: Atmel SPI Controller at 0xfffc8000 (irq 12)
 mtd_dataflash spi0.1: AT45DB642x (8448 KBytes) pagesize 1056 bytes (OTP)
 2 cmdlinepart partitions found on MTD device spi0.1-AT45DB642x
 Creating 2 MTD partitions on "spi0.1-AT45DB642x":
 0x000000000000-0x000000294000 : "bootstrap/env/uboot/kernel"
 0x000000294000-0x000000840000 : "rootfs"
...
 rtc-at91sam9 at91_rtt.0: hctosys: unable to read the hardware clock
 jffs2: Too few erase blocks (1)
 List of all partitions:
 1f00             128 mtdblock0 (driver?)
 1f01             256 mtdblock1 (driver?)
 1f02             128 mtdblock2 (driver?)
 1f03            1536 mtdblock3 (driver?)
 1f04            2048 mtdblock4 (driver?)
 1f05          126976 mtdblock5 (driver?)
 1f06             128 mtdblock6 (driver?)
 1f07             256 mtdblock7 (driver?)
 1f08             128 mtdblock8 (driver?)
 1f09            1536 mtdblock9 (driver?)
 1f0a            2048 mtdblock10 (driver?)
 1f0b          126976 mtdblock11 (driver?)
 1f0c            2640 mtdblock12 driver: mtd_dataflash
 1f0d            5808 mtdblock13 driver: mtd_dataflash
 No filesystem could mount root, tried:  jffs2
 Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(31,2)

ORDER in mtdparts does not matter (NAND always before NOR)?

Next I changed from:
 root=/dev/mtdblock2
to:
 root=/dev/mtdblock 13

The kernel messages now show my desire layout at boot time, however, the
the file system still does not mount, but the root file system is not
found.

Kernel boot messages for NAND and NOR:
 ... 
 rtc-at91sam9 at91_rtt.0: hctosys: unable to read the hardware clock
 JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
 Node at 0x00001cd8 with length 0x00000489 would run over the end of the erase block
 Perhaps the file system was created with the wrong erase size?
 jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001cdc: 0x0489 instead
 jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001ce0: 0x651a instead
 jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001ce4: 0x0006 instead
 ...
 Further such events for this erase block will not be printed
 VFS: Mounted root (jffs2 filesystem) on device 31:13.
 Freeing init memory: 104K
 Kernel panic - not syncing: Attempted to kill init!
 [<c0028678>] (unwind_backtrace+0x0/0xdc) from [<c0243990>] (panic+0x34/0x110)

I think this means I am close.

Next I tried to edit my jffs options in the .config for my recovery
'failsafe' buildroot:
Filesystem images  --->
 [*] jffs2 root filesystem
 Flash Type (Select custom page and erase size)  --->
 (0x1065) Page Size
 (0xC60) Erase block size

I gleaned these numbers from the output o the sam-ba utility used to
load the NOR flash, but they still don't work.

This had no effect.
