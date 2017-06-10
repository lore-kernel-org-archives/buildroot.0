From: Jens Maus <mail@jens-maus.de>
Date: Sat, 10 Jun 2017 09:06:35 +0200
Subject: [Buildroot] How to generate initrd for booting rootfs with
 root=LABEL= in kernel command line
In-Reply-To: <A112705D-AEA2-495C-8717-A2FCC1142CBE@jens-maus.de>
References: <A112705D-AEA2-495C-8717-A2FCC1142CBE@jens-maus.de>
Message-ID: <128FE79C-3D97-45D7-AEB7-5D26066FC8BA@jens-maus.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for replying to myself, but does nobody have any idea how exactly a minimal initrd/initramfs can be generated from within buildroot? Is that possible at all ATM?

regards,
jens

> Am 08.06.2017 um 09:34 schrieb Jens Maus <mail@jens-maus.de>:
> 
> Hi,
> 
> I am currently working on a project that is using buildroot and generates system images (*.img) that a user should either be able to put on a SD card or on an external USB drive for booting. For convenience reasons I already modified my /etc/fstab and busybox setup within buildroot to mount the user partitions via ?LABEL=? statements so that a user doesn?t have to manually patch /etc/fstab himself in case he installs the *.img on a USB drive rather than on the SD card of, e.g. a RaspberryPi (/dev/sdaX vs. /dev/mmcblkpX). This already works flawlessly and quite smooth with my buildroot environment.
> 
> However, the only thing missing is to be able to actually boot the linux kernel with a command line where also ?root=LABEL=rootfs? is used rather than ?root=/dev/sdaX? or ?root=/dev/mmcblkpX? so that during boot up it identifies itself from where it should mount the root filesystem. This of course doesn?t work out-of-the-box since the linux kernel itself doesn?t seem to know anything about filesystem labels or how to query them. The only specifiers that can be directly used by the kernel (depending on the kernel version, of course) seems to be UUID= and PARTUUID= which both don?t seem to be solutions for my problem since these UUIDs are regenerated with every filesystem regeneration and PARTUUID is only available with a GUID partition table, which I don?t use. In addition, I even couldn?t get my test system with kernel 4.4.x properly booted with either UUID= or PARTUUID= specified.
> 
> After some investigation I found out that an initrd (initramfs) setup would be required to actually boot the kernel, identify the filesystem labels and then remount the root filesystem from this partition and continue booting using something like pivot_root or similar mechanisms. Thus, this would be a minimal inird/initramfs just for identifying the root filesystem label and immediately continue booting from the identified rootfs.
> 
> Nevertheless, I couldn?t find a way in buildroot to either automatically generate such a minimal initramfs or even have a ?mkinitramfs? tool to actually generate my own initrd file for that particular purpose.  The only possibility that seem to be implemented in buildroot regarding initramfs seems to be to generate the whole rootfs as a complete initramfs file so that the complete system can be booted using a RAM disk. This is, however, not what I want to do since my application is mostly targeted for RaspberryPi systems where I need as much free RAM as possible and thus I don?t want to have a full-fledged initramfs but only a minimal one for ?just? identifying all filesystem labels and then continue booting the rootfs from the filesystem with the label specified in the kernel command-line.
> 
> Thus, I wonder if and how it is possible to actually generate an own initrd/initramfs file from within a buildroot environment, which steps I would have to take or if there are other suggestions to solve my issue.
> 
> Any help is of course highly appreciated. Please note that I have also raised a similar question on the raspberrypi forum, but there people couldn?t help due to the fact that this is more a buildroot question rather than a RaspberryPi-specific question.
> 
> Best Regards,
> 
> Jens
> -- 
> Jens Maus, Dresden/Germany
> http://jens-maus.de/
> 
> *** Content is authentic only with digital signature  ***
> 

-- 
Jens Maus, Dresden/Germany
http://jens-maus.de/

*** Content is authentic only with digital signature  ***

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 3745 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170610/99407e7e/attachment.p7s>
