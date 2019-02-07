From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 07 Feb 2019 22:01:47 +0000
Subject: [Buildroot] [Bug 11656] Custom device tree and u-boot boot.scr not
 integrated in boot.vfat (hw: BeagleBoneBlack with LCD cape)
In-Reply-To: <bug-11656-163@https.bugs.busybox.net/>
References: <bug-11656-163@https.bugs.busybox.net/>
Message-ID: <bug-11656-163-CKaDgd3WJQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11656

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
Hi Tibor,

[Discussion like this is more appropriate on the mailing list, where we can do
proper quoting of replies and add people to Cc etc.]

> 1) I had to manually add output/build/linux-4.14.96/include/dt-bindings/board/am335x-bbw-bbb-base.h (downloaded from GitHub), after the kernel has been
> extracted. This is probably a use case outside of the goals of Buildroot, so maybe I'll inline that include file later.

This is probably because you're not using the Linux source that is expected by
that DTS file.

> 2) When building the Linux kernel, Buildroot will copy my am335x-withcapes-4d4r.dts into output/build/linux-4.14.96/arch/arm/boot/dts/, compile it there, and copy the compiled file to output/images/am335x-withcapes-4d4r.dtb.
>   However, !! the .dtb file is not included in output/images/boot.vfat !!

Indeed, because it needs to be enumerated in the genimage.cfg. Two improvements
could make this use case easier:

A. Extend the genimage tool with support for wildcards, so genimage.cfg would
contain "*.dtb" instead of the explicit list.

B. Change the configuration of the bootloader to look for kernel and DTB in
/boot on the ext4 partition, rather than on the FAT partition. With
BR2_LINUX_KERNEL_INSTALL_TARGET=y all the DTBs will be copied there.

> 3) The same problem occurs with a boot.scr file, which I included as of
>    [make menuconfig --> Bootloaders --> Generate a U-Boot boot script: ON]
>    [make menuconfig --> Bootloaders --> U-Boot boot script source: /path/to/boot.scr]
>    The result is that output/images/boot.scr is created, but boot.scr is not part of output/images/boot.vfat!

Yes, the genimage.cfg uses uEnv.txt instead of boot.scr.

Just copy and modify genimage.cfg.

Since this is really not a bug, marking as WORKSFORME.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
