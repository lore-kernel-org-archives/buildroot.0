From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Mon, 30 Jun 2014 21:53:32 +0200
Subject: [Buildroot] Is grub-bios-setup the way to go to make a bootable
	CF?
In-Reply-To: <20140630114933.33262a25@free-electrons.com>
References: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
 <20140627203224.1149e36a@free-electrons.com>
 <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
 <20140630114933.33262a25@free-electrons.com>
Message-ID: <CAEzGmjAfUbvudT2nwDJOpbWUy3ZHw=UaWEf-WRupSQv6XsbiGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jun 30, 2014 at 11:49 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Lennart Ramberg,
>
> On Mon, 30 Jun 2014 10:23:06 +0200, Lennart Ramberg wrote:
>
> > Thank you Thomas,
> >
> > It helped to use sudo :-)
> > to get rid of that annoying
> > "cannot open `/boot/grub/device.map': No such file or directory."
> >
> > Now, putting the thus created CF in the target system brings me (only)
> to:
> > grub>
> >
> > Should I expect to automatically have come further?
>
> Yes, it should show the menu thanks to the configuration file. What
> exact steps have you followed to put the root filesystem and Grub on
> your Compact Flash?
>
>
>
Below I detail out what I did.
I also attach my .config (dotconfig) that resulted from my actions
described below.

I hope the below could be of use.

Regards
Lennart

On my host, LinuxMint16 dmesg tells me that my 1 GB CF (in a USB-CF
adapter) is /dev/sdc.

lennart at OptiPlex ~/buildroot-2014.05 $ sudo dd if=/dev/zero of=/dev/sdc
bs=1M count=32
lennart at OptiPlex ~/buildroot-2014.05 $ sudo fdisk /dev/sdc
(n, p, 1, 2048, 2001887, a, 1, w)
lennart at OptiPlex ~/buildroot-2014.05 $ sudo partprobe /dev/sdc
-------------------------------------------------------------
Thus:
lennart at OptiPlex ~ $ sudo fdisk /dev/sdc

Command (m for help): p

Disk /dev/sdc: 1024 MB, 1024966656 bytes
1 heads, 32 sectors/track, 62559 cylinders, total 2001888 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0xae6de628

   Device Boot      Start         End      Blocks   Id  System
/dev/sdc1   *        2048     2001887      999920   83  Linux

Command (m for help): q
-------------------------------------------------------------
lennart at OptiPlex ~/buildroot-2014.05 $ sudo umount /dev/sdc1
lennart at OptiPlex ~/buildroot-2014.05 $ sudo mkfs.ext3 -L root /dev/sdc1
lennart at OptiPlex ~/buildroot-2014.05 $ sudo mount /dev/sdc1 /mnt
lennart at OptiPlex ~/buildroot-2014.05 $ make distclean
lennart at OptiPlex ~/buildroot-2014.05 $ make menuconfig
Defaults, except as follows:

Target options:
Target Architecture (i386), Target Architecture Variant: i686

Build options:
[*] Enable compiler cache

Toolchain:
C library, (X) glibc

System configuration:
[ ] Run a getty (login prompt) after boot

Kernel:
[*] Linux Kernel
    Kernel version (3.14.4)
(i386) Defconfig name
[*]   Install kernel image to /boot in target

Target packages:
  Graphic libraries and applications (graphic/text):
     [*] X.org X Window System

  Libraries:
     Database: [*] sqlite
     Graphics: [*] cairo:     [*] png support
               [*] jpeg support
     Networking: [*] libcurl

  Text editors and viewers:
    [*] nano
      [ ]  optimize for size

Filesystem images:
    [*] ext2/3/4 root filesystem:   ext2/3/4 variant (ext3)
    (1000000) size in blocks (leave at 0 for auto calculation)

    [*] initial RAM filesystem linked into linux kernel

Bootloaders:
   [*] grub2

< Save >
...
lennart at OptiPlex ~/buildroot-2014.05 $ make
lennart at OptiPlex ~/buildroot-2014.05 $ sudo tar -C /mnt -xf
output/images/rootfs.tar
lennart at OptiPlex ~/buildroot-2014.05 $ sudo umount /mnt
lennart at OptiPlex ~/buildroot-2014.05 $ sudo
./output/host/usr/sbin/grub-bios-setup -b
./output/host/usr/lib/grub/i386-pc/boot.img -c ./output/images/grub.img -d
. /dev/sdc -v
...
./output/host/usr/sbin/grub-bios-setup: info: Scanning for dmraid_nv
devices on disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: Scanning for ldm devices on
disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: scanning hostdisk//dev/sda
for LDM.
./output/host/usr/sbin/grub-bios-setup: info: no LDM signature found.
./output/host/usr/sbin/grub-bios-setup: info: Scanning for lvm devices on
disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: no LVM signature found.
./output/host/usr/sbin/grub-bios-setup: info: Scanning for DISKFILTER
devices on disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: Scanning for mdraid1x devices
on disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: Scanning for mdraid09 devices
on disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: Scanning for mdraid09_be
devices on disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: Scanning for dmraid_nv
devices on disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: Scanning for ldm devices on
disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: scanning hostdisk//dev/sda
for LDM.
./output/host/usr/sbin/grub-bios-setup: info: no LDM signature found.
./output/host/usr/sbin/grub-bios-setup: info: Scanning for lvm devices on
disk hostdisk//dev/sda.
./output/host/usr/sbin/grub-bios-setup: info: no LVM signature found.
./output/host/usr/sbin/grub-bios-setup: info: Partition 0 starts from 2048.
./output/host/usr/sbin/grub-bios-setup: info: Partition 4 starts from
480159744.
./output/host/usr/sbin/grub-bios-setup: info: Partition 5 starts from
116279296.
./output/host/usr/sbin/grub-bios-setup: info: the size of hostdisk//dev/sda
is 488281250.
./output/host/usr/sbin/grub-bios-setup: info: guessed root_dev
`hostdisk//dev/sda' from dir `.'.
./output/host/usr/sbin/grub-bios-setup: info: setting the root device to
`hostdisk//dev/sda,msdos6'.
./output/host/usr/sbin/grub-bios-setup: info: the first sector is <1,0,512>.
./output/host/usr/sbin/grub-bios-setup: info: saving <2,0,512>.
./output/host/usr/sbin/grub-bios-setup: info: saving <3,0,512>.
./output/host/usr/sbin/grub-bios-setup: info: saving <4,0,512>.
...
./output/host/usr/sbin/grub-bios-setup: info: saving <470,0,512>.
./output/host/usr/sbin/grub-bios-setup: info: saving <471,0,512>.
./output/host/usr/sbin/grub-bios-setup: info: saving <472,0,512>.
./output/host/usr/sbin/grub-bios-setup: info: saving <473,0,512>.
./output/host/usr/sbin/grub-bios-setup: info: saving <474,0,512>.
lennart at OptiPlex ~/buildroot-2014.05 $

Ready to test. Rebooted my PC with CF still in place gives just:
GNU GRUB version 2.00
blablabla
grub>

--- end ---
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140630/18251a09/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dotconfig
Type: application/octet-stream
Size: 49940 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140630/18251a09/attachment-0001.obj>
