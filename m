From: Eric <spamsink@scoot.netis.com>
Date: Thu, 23 Oct 2008 07:47:54 -0400
Subject: [Buildroot] New to embedded Linux... questions ref. buildroot
Message-ID: <6.2.5.6.2.20081023070550.02f4eb98@rkt-tech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Good morning, all.

I have developed code for embedded Linux systems in the past, but 
this is my first time working on embedded Linux itself, installing it 
on boards, etc.

I have an Atmel NGW100 board that was given to me by a friend.  I 
have gotten to the point where I can download the operating system 
images from Atmel (ngw100_builds_1.0.2.tar.gz from the Atmel website; 
includes ngw_jffs2_root.img and ngw_jffs2_usr.img), install the root 
image on the board using tftp, and install the usr image on the board 
using wget.  All of that works... good thing because it seems that 
the OS on the board was corrupt or damaged, because I was getting all 
kinds of random errors on bootup.  Installing the new images fixed all of that.

Next step was to download buildroot and see if I can create images 
from that.  Downloaded buildroot-avr32-v2.2.0.tar.bz2 from the Atmel 
site and after several missteps was able to get it to build to completion.

During the later parts of the build process, I got the following messages:


Checking partition file: target/device/Atmel/atngw100/jffs2_partitions.txt
   * found root
     * which is root partition
   * found usr
Using mkfs.jffs2 at location './toolchain_build_avr32/mtd_orig/mkfs.jffs2'
Processing partition: root
   * options '-b -s 0x1000 -e 0x10000 -D
target/device/Atmel/atngw100/device_table.txt -p'
rootdir=/home/eric/AVR32Studio/buildroot/buildroot-avr32-v2.2.0/build_avr32/staging_dir/.tmp/root
table='target/device/Atmel/atngw100/device_table.txt'
mkfs.jffs2: skipping device_table entry '/boot': no parent directory!
mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
mkfs.jffs2: skipping device_table entry '/etc': no parent directory!
mkfs.jffs2: skipping device_table entry '/sys': no parent directory!
mkfs.jffs2: skipping device_table entry '/config': no parent directory!
mkfs.jffs2: skipping device_table entry '/proc': no parent directory!
mkfs.jffs2: skipping device_table entry '/lost+found': no parent directory!
mkfs.jffs2: skipping device_table entry '/media': no parent directory!
mkfs.jffs2: skipping device_table entry '/www': no parent directory!


Then at the end I got:


Build complete

Root file system files are in directory
'/home/eric/AVR32Studio/buildroot/buildroot-avr32-v2.2.0/binaries/atngw100'


(... indicating that it didn't seem all that upset over the missing 
parent directory indicated above).

Now 
/home/eric/AVR32Studio/buildroot/buildroot-avr32-v2.2.0/binaries/atngw100 
looks like this:


drwxrwxr-x 2 eric eric     4096 2008-10-23 03:42 .
drwxrwxr-x 3 eric eric     4096 2008-10-22 16:05 ..
-rw-rw-r-- 1 eric eric  1226398 2008-10-23 03:39 atngw100-linux-2.6.25.10-.gz
-rw-rw-r-- 1 eric eric        0 2008-10-23 03:40 rootfs.avr32.jffs2
-rw-r--r-- 1 eric eric  7798784 2008-10-23 03:42 rootfs.avr32.jffs2-root
-rw-r--r-- 1 eric eric  7451136 2008-10-23 03:42 rootfs.avr32.jffs2-usr
-rw-rw-r-- 1 eric eric 19230720 2008-10-23 03:42 rootfs.avr32.tar
-rw-rw-r-- 1 eric eric 10138625 2008-10-23 03:42 rootfs.avr32.tar.bz2
-rwxrwxr-x 1 eric eric   104708 2008-10-23 03:24 u-boot.bin


Now, my questions are...

1.  Do I need to be concerned about the "no parent directory" 
complaints above, and if so, what can I do about it?

2.  Are the rootfs.avr32.jffs2-root and rootfs.avr32.jffs2-usr files 
the image files like the ngw_jffs2_root.img and ngw_jffs2_usr.img 
files I downloaded from Atmel, and are they installed in the same 
way?  I know... the obvious answer is "try it and see what 
happens".  I am fearful of blowing away my u-boot, because I am told 
I'd need a jtag pod to restore it, and I don't have a jtag pod and 
can't get one any time soon, so if I blow this one away I'm out of business.

3.  The file rootfs.avr32.tar.bz2, when uncompressed and untarred, 
looks like this:

drwxrwxr-x 21 eric eric     4096 2008-10-23 03:42 .
drwxrwxr-x  3 eric eric     4096 2008-10-23 07:22 ..
drwxrwxr-x  2 eric eric     4096 2008-10-23 03:42 bin
drwxr-xr-x  2 eric eric     4096 2008-10-23 03:39 boot
drwxr-xr-x  2 eric eric     4096 2008-10-22 16:05 config
drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 dev
drwxr-xr-x  8 eric eric     4096 2008-10-23 03:42 etc
drwxrwxr-x  4 eric eric     4096 2008-10-23 03:42 home
drwxr-xr-x  3 eric eric     4096 2008-10-23 03:42 lib
lrwxrwxrwx  1 eric eric       11 2008-10-23 07:22 linuxrc -> bin/busybox
drwx------  2 eric eric     4096 2008-10-23 03:42 lost+found
drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 media
drwxrwxr-x  2 eric eric     4096 2008-10-22 16:05 mnt
drwxrwxr-x  2 eric eric     4096 2008-10-22 16:05 opt
drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 proc
drwxrwxr-x  2 eric eric     4096 2008-10-22 16:05 root
drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 sbin
drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 sys
drwxrwxr-x  2 eric eric     4096 2008-09-25 09:21 tmp
drwxrwxr-x  7 eric eric     4096 2008-10-23 03:22 usr
drwxrwxr-x 10 eric eric     4096 2008-09-25 09:21 var
drwxr-xr-x  7 eric eric     4096 2008-10-23 03:22 www

... which looks amazingly like the file structure that's on the 
NGW100 board.  Do I need to do anything with that tarball, or do I 
just load rootfs.avr32.jffs2-root and rootfs.avr32.jffs2-usr and I'll 
have all I need?

4.  Speaking of u-boot, I see the buildroot process also created the 
file u-boot.bin.  Is this the file I need if I blow away my u-boot on 
the board, and is it true that the only way to install it is via a jtag pod?

Thanks to all for helping me get started on this...
