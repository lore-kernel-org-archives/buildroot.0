From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 05 Feb 2019 10:06:37 +0000
Subject: [Buildroot] [Bug 11656] Device tree issues with BeagleBoneBlack and
 LCD cape
In-Reply-To: <bug-11656-163@https.bugs.busybox.net/>
References: <bug-11656-163@https.bugs.busybox.net/>
Message-ID: <bug-11656-163-1SRFSQB9Hb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11656

--- Comment #1 from Tibor Stolz <tistolz@outlook.de> ---
Created attachment 7941
  --> https://bugs.busybox.net/attachment.cgi?id=7941&action=edit
Device tree customization for the LCD cape

Hello,

I finally succeeded in building a Buildroot system that properly supports the
gen4-4DCAPE-43T LCD screen. However, it required some "tricks" which are not
properly supported by the Buildroot workflow.

First of all, the "dtc -I fs /proc/device-tree -o my-device-tree.dts" approach
of getting the device tree from a running Debian system was rubbish. To quote
#beagle IRC:
> it's definitely not something that's intended to work in the first place
> [...]
> /proc/device-tree does not show the original DT as it was passed to the kernel
> [...]
> some kernel code modifies these data structures

Therefore I created the attached device tree source code, which takes the
am335x-boneblack.dts as a basis (#include) and adds the definitions from
<https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4R-01-00A1.dts>
translated from "overlay fragment" syntax to normal dts code (reference:
<https://pastebin.com/b8kZfhRG>).

This bug now boils down to Buildroot's handling of such out-of-tree device tree
files. I included my am335x-withcapes-4d4r.dts in [make menuconfig --> Kernel
--> Out-of-tree Device Tree Source file paths]. The problems are as follows:

1) I had to manually add
output/build/linux-4.14.96/include/dt-bindings/board/am335x-bbw-bbb-base.h
(downloaded from GitHub), after the kernel has been extracted. This is probably
a use case outside of the goals of Buildroot, so maybe I'll inline that include
file later.

2) When building the Linux kernel, Buildroot will copy my
am335x-withcapes-4d4r.dts into output/build/linux-4.14.96/arch/arm/boot/dts/,
compile it there, and copy the compiled file to
output/images/am335x-withcapes-4d4r.dtb.
   However, !! the .dtb file is not included in output/images/boot.vfat !!

3) The same problem occurs with a boot.scr file, which I included as of
   [make menuconfig --> Bootloaders --> Generate a U-Boot boot script: ON]
   [make menuconfig --> Bootloaders --> U-Boot boot script source:
/path/to/boot.scr]
   The result is that output/images/boot.scr is created, but boot.scr is not
part of output/images/boot.vfat!

My solution was to manually add am335x-withcapes-4d4r.dtb and boot.scr to the
FAT partition once the sdcard.img was written to the SD card. In this
configuration, the LCD is now working.

I think that problems 2) and 3) are minor bugs of the Buildroot system which
should be fixed.

Best regards,
Tibor Stolz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
