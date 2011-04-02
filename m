From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 2 Apr 2011 15:28:56 -0700
Subject: [Buildroot] Looking for a little advice
Message-ID: <AANLkTi=aC-0zq4CUF56DrpmgAdsJS4zXYMa8kRt9PhG_@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is not strictly a buildroot question, but is rather a configuration
question and advice would be greatly appreciated.

I have a project with the Freescape MPC8323ERDB board using the buildroot
and can build u-boot, dtb, uImage and rootfs.jffs2. I am having a little
trouble booting the jffs2 image and I suspect it is either a u-boot
environment string, a u-boot CONFIG* setting or a Linux CONFIG* setting.

At this point, I can build a rootfs.jffs2, include uImage into the
rootfs.jffs2 and from the u-boot prompt do things like:

=> *fsload 0x00800000 /uImage*         //the uImage in the jffs2 rootfs.
=> *bootm 0x00800000 - 0xfe080000*

So, I can boot with either the uImage written in the 5th sector of flash, or
a ram copy of the same uImage read out of the JFFS2 image beginning in the
24th sector of flash. I am using NOR flash, not NAND and u-boot is at the
bottom of the flash, then the dtb, then a copy of uImage and finally
rootfs.jffs2 beginning at about the 24th sector.

So, I think my confusion is in making the jump between u-boot's perception
of partitions in NOR flash and the kernels perception of partitions in NOR
flash.

I am hoping for a few ideas that will allow me to complete my understanding
of the boot process with JFFS2 so I can then get to the next problem of
understanding the boot process with UBI.

The end of the kernel boot shows this:
*MTDSB: dev_name "/dev/root"
MTDSB: lookup_bdev() returned 0
List of all partitions:
No filesystem could mount root, tried:  jffs2*

An "ls" in u-boot with DEBUG_JFFS2 defined gives me this:
*=> ls
---mtdparts_init---
dev id: type = 1, num = 0, size = 0x01000000, mtd_id = single part
part  : name = static, size = 0x01000000, offset = 0x00000000
--- jffs2_part_info: partition number 0 for device nor0 (single part)
Scanning JFFS2 FS: ...... done.
 drwxrwxr-x        0 Sat Apr 02 22:04:07 2011 bin
 drwxr-xr-x        0 Sat Apr 02 19:03:52 2011 dev
 drwxr-xr-x        0 Sat Apr 02 22:04:07 2011 etc
...
 -rw-r--r--  2003122 Sat Apr 02 22:03:34 2011 uImage
 drwxrwxr-x        0 Tue Nov 30 15:52:43 2010 usr
 drwxrwxr-x        0 Tue Nov 30 15:52:43 2010 var
=>
*

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110402/0a720f75/attachment.html>
