From: Jorge S. <jorgesolla@gmail.com>
Date: Thu, 18 Oct 2007 00:05:55 +0200
Subject: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a *working*
	jffs2 rootfs.
Message-ID: <6090c5eb0710171505r739bd7b1le836930f308f5209@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

 I'm still having problems with the rootfs on my AT91RM9200/Dataflash
(AT45DB642D) based system.

 Now i'm trying to build a jffs2 rootfs and but getting tons of errors from
the kernel when it mounts the rootfs:

..
..
  Kernel messages...
..
..
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
ieee80211: 802.11 data/management/control stack, git-1.1.13
ieee80211: Copyright (C) 2004-2005 Intel Corporation <
jketreno@linux.intel.com>
at91_rtc at91_rtc: setting the system clock to 1998-01-01 02:21:11
(883621271)
JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00233100:
0x8c90 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00233104:
0x8c90 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00233108:
0x8c90 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0023310c:
0x8c90 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00233110:
0x8c90 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00233114:
0x8c90 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00233118:
0x8c90 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0023311c:
0x8c90 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00233120:
0x8c90 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00233124:
0x8c90 instead
(loooooots more of this errors)....

After those errors, it ended up working 1 time (the first time i flashed the
jffs2 rootfs) and  then i logged in, created
some directories, files, and so on...it was WRITABLE and apparently working.

Now, even if i reflash again the rootfs image, it still drops tons of errors
and finally gets
frozen...on this manner:

Further such events for this erase block will not be printed
JFFS2 error: (1) jffs2_build_inode_pass1: child dir "pcmcia" (ino #562) of
dir ino #555 appears to be a hard link
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 128K
JFFS2 warning: (1) jffs2_do_read_inode_internal: Truncating ino #360 to
21168 bytes failed because it only had 4224 bytes to start with!
Kernel panic - not syncing: No init found.  Try passing init= option to
kernel.


Things i've checked so far:

 - Rootfs MTD partition has the right 1056 alignment, this is my bootargs
command line:

     console=/dev/ttyS0,115200
mtdparts=AT45DB642.spi0:168960(boot),2162688(kernel),-(root)
root=/dev/mtdblock2 rootfstype=jffs2

     My rootfs partition starts at 0xC0239400 (0xC000000 is the base address
for the dataflash).

 - Same buildroot .config works if i use ext2 filesystem (it gets mounted as
read-only, but i can login and run commands), so i assume my toolchain is
OK.
 - The rootfs MTD area is *not* locked, my u-boot is unlocking it, and jffs2
rootfs worked 1 time, so i was able to create files, it was WRITABLE.

 - My kernel knows about my dataflash sector/erase sizes because it says
this:

       JFFS2 write-buffering enabled buffer (1056) erasesize (8448).

 - mkfs.jjfs2 is being called with the (apparently) right params:

        mkfs.jffs2 -e 0x2100 -l -s 0x420 -n


My questions:

  - Since my rootfs MTD partition starts at "0xC0239400". Why is jffs
messing around with addresses below the partition start point
(0xC0239400)?!?!

       jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
0x00233100: 0x8c90 instead

   What does the address on the message "not found at 0x00233100" means?
Does it means Dataflash sector? or is it relative to partition start point
position?

  - Any ideas on how to solve this?


 As usual, thanks in advance for your help, and sorry about my bad english.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071018/d35c3aed/attachment.htm 
