From: Mark Mason <mason+buildroot@postdiluvian.org>
Date: Wed, 22 Apr 2015 15:52:20 -0400
Subject: [Buildroot] grub on target
In-Reply-To: <HKXPR01MB0312A3D64DA648D6B74794C9C2EF0@HKXPR01MB0312.apcprd01.prod.exchangelabs.com>
References: <HKXPR01MB0312A3D64DA648D6B74794C9C2EF0@HKXPR01MB0312.apcprd01.prod.exchangelabs.com>
Message-ID: <20150422195220.GA19841@postdiluvian.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've installed the Grub2 tools on the target as part of the pre-fs
script, but I've never figured out how to actually make it install a
working bootloader.  If you're using it with UEFI then I'd be
interested in knowing what you did you make it work.

I'm trying to make the simplest possible x86_64 UEFI config work -
just boot a single image off a FAT32 boot partition.  No extra logic,
no loading modules, no fiddling with video modes, no anything except
booting.  Mostly I get either hangs on entry to the kernel or the
kernel parameters appear to not be passed through correctly, resulting
in no rootfs.

Something else I'd like to be able to do is make a disk image that I
can run through a disk duplicator to make bootable disks, but I'm not
sure if that's possible without rewriting the grub.cfg after the first
boot since the UUIDs appear to different for different disks.

I've tried the instructions that are in the Grub2 menuconfig help,
which mostly works on some machines while on others it either hangs
after a "Couldn't terminate EFI services" message or else is unable to
find the root device.  I haven't been able to identify any differences
between the working and non-working machines, and I've tested against
probably 20 different ones.  The machines are a DN2820FYKF Intel NUC,
the lowest end NUC, and the BIOS doesn't inspire confidence, so there
might be bugs there.

I'd appreciate some advice if anyone has any idea what might be going
wrong.

Thanks!

Mike Musterd <MMusterd@kns.com> wrote:

> Hello list,
> 
> I am developing a small OS that functions as a sort of bootloader for windows.
> Its primary function is to check whether windows is available and if so, reboot
> to windows once (then, after that, boot into the bootloader again).
> 
> If not it will repartition disk, install itself on new partition, and format
> drives and clone windows (from a network source) all from within this
> bootloader.
> 
> I am using grub for that, with some custom fixes to the grub-reboot script to
> make it behave as required.
> 
> However to my dismay I found that the grub package does not actually build grub
> for the target.
> 
> grub.mk claims as much:
> 
> # We're cheating here as we're installing the grub binary not in the
> # target directory (where it is useless), but in the host
> # directory. This grub binary can be used to install grub into the MBR
> # of a disk or disk image.
> 
> In my use case I need grub in the target directory, and it?s not useless at all.
> So I modified the grub.mk to actually make grub for the target, and it all
> works.
> 
> Now my question is: is my usecase generic enough to warrant a patch submission,
> or is the ?useless? part always true except in my case?
> 
> Kind regards,
> 
> 
> Mike
