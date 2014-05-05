From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Mon, 5 May 2014 11:01:18 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <1694493.96NdL4j4Hh@sagittea>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
 <CAEzGmjByYAXYo2bbnKqRcu4nzJfjbEz8ZsaiB_MdSNQgDs2M3Q@mail.gmail.com>
 <25917145.tTrImWgKe2@sagittea> <1694493.96NdL4j4Hh@sagittea>
Message-ID: <CAEzGmjD3e5_4tVr6zvbE7Op+qrYtSMFNgF80-Avhqt3-DbD9rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 28, 2014 at 4:27 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:

> On Monday 28 April 2014 16:21:20 J?r?me Pouiller wrote:
> > I did not check how it work exactly with grub-legacy. However, I can
> > give you my recipe to get full disk image using grub2:
>
>  Thank you J?r?me,
But I'm afraid your recepie is still a bit over my head.
Now,
what I did do, though, was to download a recent Daily Snapshot, which has
support for GRUB2.
However, booting brings me to
grub rescue>
but not much further, for example:
grub rescue> insmod normal.mod
error: unknown filesystem.
---
To recap, what I have done is: (Target CF sdX=sdc in my case.)
sudo fdisk /dev/sdX    and created one primary partition 1GB.
sudo mke2fs -j -m 0 /dev/sdX1
sudo tune2fs -c0 -i0 /dev/sdX1

~/buildroot $ make menuconfig    with the only changes from default being:
----------
Target options:
   i686
Build options:
   Enable compiler cache
Toolchain:
   C library:
      glibc
System configuration:
   de-selected: Run a getty (logon prompt) after boot
Kernel:
   Linux kernel
   (i386) Defconfig name
   Install  kernel image to /boot in target
Target packages:
   Graphic libraries and applications (graphic/text):
      X.org X Window System
   Libraries:
      Graphics:
         cairo
   Network applications:
      ntp
   Text editors and viewers:
      nano
Filesystem images:
   ext2/3/4 root filesystem
      ext3
   1000000 size in blocks
Bootloaders:
   grub2
Host utilities:
   (no change)
Legacy config options:
   (no change)
----------
~/buildroot $ make
That produced in output/images/ the files:
  bzImage
  grub.img
  rootfs.ext2
  rootfs.ext3
  rootfs.tar
---

~/buildroot $ sudo tar -xvf output/images/rootfs.tar -C
/media/lennart/30bdb69e-d518-4a8c-8b12-70fe8481dae7/

~buildroot $ sudo grub-install /dev/sdX
Installation finished. No error reported.

I unmounted and put the CF as the only IDE-drive in my target system and
power on:
After bios follows 15 seconds black screen, then:
error: no such device: ad7c5498-2ffc-44b0-80dd-01c5dcd23dc2.
Entering rescue mode...
grub rescue>

Hm... that UUID ad7c....c2 comes from my host (/dev/sda6  TYPE="ext4").
Anyway;

grub rescue> set
prefix=(hd0)/boot/grub
root=hd0
grub rescue> insmod normal
error: unknown filesystem.
grub rescue> ls
(hd0) (hd0,msdos1)

My target /boot/ contains only /boot/grub/grub.cfg and /boot/bzImage
Shouldn't there be a /boot/grub/linux.mod and a /boot/grub/normal.mod?
Should I have done anything with buildroot/output/images/grub.img?

grub.cfg looks like below:
--
set default="0"
set timeout="5"
 menuentry "Buildroot" {
         linux /bzImage root=/dev/sda1 console=tty1
}
--
Shouldn't it be /boot/bzImage? Or does the above imply a separate boot
partition, which I don't have?

Please, someone, what gives?

Regards
Lennart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140505/8dab5134/attachment.html>
