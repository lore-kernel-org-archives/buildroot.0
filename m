From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Fri, 27 Jun 2014 12:32:03 +0200
Subject: [Buildroot] Is grub-bios-setup the way to go to make a bootable CF?
Message-ID: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am struggling with making a grub 2-bootable Compact Flash for a BIOS
based PC target.
The closest I came so far in the target machine is:
  grub rescue >

Then I found 'grub-bios-setup' as a possibly better alternative, but got
stuck as below.
Is grub-bios-setup the way to go at all?
Thanks
Lennart

I'm using the stable buildroot-2014.05.
After make menuconfig and make my output/images/ contain
  bzImage
  grub.img
  rootfs.ext2
  rootfs.ext3 link
  rootfs.tar

and what I have done is: (Target CF put in the host in an USB CF-adapter,
sdX=sdc in my case.)
sudo fdisk /dev/sdX    and created one primary partition 1GB.
sudo mke2fs -j -m 0 /dev/sdX1
sudo tune2fs -c0 -i0 /dev/sdX1

sudo tar -xvf output/images/rootfs.tar -C
/media/lennart/30bdb69e-d518-4a8c-8b12-70fe8481dae7/
sudo grub-install /dev/sdX
Installation finished. No error reported.

Putting that in the target machine only brought me to 'grub rescue >', so I
tried grub-bios-setup, but got stuck on 'device.map':

lennart at OptiPlex ~/buildroot-2014.05 $
./output/host/usr/sbin/grub-bios-setup -b
./output/host/usr/lib/grub/i386-pc/boot.img -c ./output/images/grub.img -d
. /dev/sdc -v
./output/host/usr/sbin/grub-bios-setup: info: cannot open
`/boot/grub/device.map': No such file or directory.
./output/host/usr/sbin/grub-bios-setup: info: Looking for /dev/sdc.
./output/host/usr/sbin/grub-bios-setup: info: /dev/sdc is a parent of
/dev/sdc.
./output/host/usr/sbin/grub-bios-setup: info: Looking for /dev/sdc.
./output/host/usr/sbin/grub-bios-setup: info: /dev/sdc is a parent of
/dev/sdc.
./output/host/usr/sbin/grub-bios-setup: info: transformed OS device
`/dev/sdc' into GRUB device `hostdisk//dev/sdc'.
./output/host/usr/sbin/grub-bios-setup: info: getting the size of
././output/host/usr/lib/grub/i386-pc/boot.img.
./output/host/usr/sbin/grub-bios-setup: info: reading
././output/host/usr/lib/grub/i386-pc/boot.img.
./output/host/usr/sbin/grub-bios-setup: info: getting the size of
././output/host/usr/lib/grub/i386-pc/boot.img.
./output/host/usr/sbin/grub-bios-setup: info: getting the size of
././output/images/grub.img.
./output/host/usr/sbin/grub-bios-setup: info: reading
././output/images/grub.img.
./output/host/usr/sbin/grub-bios-setup: info: getting the size of
././output/images/grub.img.
./output/host/usr/sbin/grub-bios-setup: info: root is `(null)', dest is
`hostdisk//dev/sdc'.
./output/host/usr/sbin/grub-bios-setup: info: Opening dest.
./output/host/usr/sbin/grub-bios-setup: error: disk `hostdisk//dev/sdc' not
found.
lennart at OptiPlex ~/buildroot-2014.05 $
---
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140627/408f629d/attachment.html>
