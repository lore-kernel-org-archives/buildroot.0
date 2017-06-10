From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Jun 2017 10:55:18 +0200
Subject: [Buildroot] How to generate initrd for booting rootfs with
 root=LABEL= in kernel command line
In-Reply-To: <A112705D-AEA2-495C-8717-A2FCC1142CBE@jens-maus.de>
References: <A112705D-AEA2-495C-8717-A2FCC1142CBE@jens-maus.de>
Message-ID: <1cd1c6dd-673b-87e8-b3f9-47d1a8e15e1e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jens,

On 08-06-17 09:34, Jens Maus wrote:
> Hi,
> 
> I am currently working on a project that is using buildroot and generates system images (*.img) that a user should either be able to put on a SD card or on an external USB drive for booting. For convenience reasons I already modified my /etc/fstab and busybox setup within buildroot to mount the user partitions via ?LABEL=? statements so that a user doesn?t have to manually patch /etc/fstab himself in case he installs the *.img on a USB drive rather than on the SD card of, e.g. a RaspberryPi (/dev/sdaX vs. /dev/mmcblkpX). This already works flawlessly and quite smooth with my buildroot environment.
> 
> However, the only thing missing is to be able to actually boot the linux kernel with a command line where also ?root=LABEL=rootfs? is used rather than ?root=/dev/sdaX? or ?root=/dev/mmcblkpX? so that during boot up it identifies itself from where it should mount the root filesystem. This of course doesn?t work out-of-the-box since the linux kernel itself doesn?t seem to know anything about filesystem labels or how to query them. The only specifiers that can be directly used by the kernel (depending on the kernel version, of course) seems to be UUID= and PARTUUID= which both don?t seem to be solutions for my problem since these UUIDs are regenerated with every filesystem regeneration and PARTUUID is only available with a GUID partition table, which I don?t use. In addition, I even couldn?t get my test system with kernel 4.4.x properly booted with either UUID= or PARTUUID= specified.
> 
> After some investigation I found out that an initrd (initramfs) setup would be required to actually boot the kernel, identify the filesystem labels and then remount the root filesystem from this partition and continue booting using something like pivot_root or similar mechanisms. Thus, this would be a minimal inird/initramfs just for identifying the root filesystem label and immediately continue booting from the identified rootfs.

 That is correct AFAIK.

> Nevertheless, I couldn?t find a way in buildroot to either automatically 
> generate such a minimal initramfs or even have a ?mkinitramfs? tool to
> actually generate my own initrd file for that particular purpose.

 An initramfs is just a cpio archive, no specific mkinitramfs tool is required.


> The only possibility that seem to be implemented in buildroot regarding initramfs 
> seems to be to generate the whole rootfs as a complete initramfs file so that the
> complete system can be booted using a RAM disk.

 Indeed. The reason for this is that there are potentially too many different
things you might want to do with a separate initramfs. You want it to be able to
mount a rootfs with UUID, but a myriad of other reasons are possible.


> This is, however, not what I want to do since my application is mostly
targeted for RaspberryPi systems where I need as much free RAM as possible and
thus I don?t want to have a full-fledged initramfs but only a minimal one for
?just? identifying all filesystem labels and then continue booting the rootfs
from the filesystem with the label specified in the kernel command-line.
> 
> Thus, I wonder if and how it is possible to actually generate an own initrd/initramfs file from within a buildroot environment, which steps I would have to take or if there are other suggestions to solve my issue.

 There are two options:

- In a post-image script, copy some files from the target directory to an
initramfs-root directory, and pack these with cpio. The problem with this
approach is that you need to know exactly which files are needed (e.g. which
libraries), which makes it a bit brittle.

- Create a second Buildroot configuration for the initramfs. This gives you full
flexibility - for example, you can use a different libc here and use static
libraries. I think you only need sh, mount and switch_root, all of which are in
busybox.

 You may also want to build your kernel in this second configuration, and link
the initramfs in the kernel. Disadvantage: you need to move the modules from the
initramfs configuration to the full rootfs.


 Another option for your problem, however, is to modify the bootloader script so
that it sets the correct root= argument in the kernel command line. I'm not
familiar with RPi, but in U-Boot this is pretty standard - there is a different
script for NAND or SD card boot, and they construct the kernel command line
differently. For NAND boot something like this is anyway required because you
need to pass additional options (e.g. rootfstype).


 Regards,
 Arnout

> 
> Any help is of course highly appreciated. Please note that I have also raised a similar question on the raspberrypi forum, but there people couldn?t help due to the fact that this is more a buildroot question rather than a RaspberryPi-specific question.
> 
> Best Regards,
> 
> Jens
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
