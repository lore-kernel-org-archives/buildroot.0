From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 13 Feb 2014 10:14:36 +0100
Subject: [Buildroot] How to get the kernel to mount a rootfs without an
	initramfs ?? (2)
In-Reply-To: <52FC9329020000460004A9FA@gwia2.rz.hs-offenburg.de>
References: <52FC9329020000460004A9FA@gwia2.rz.hs-offenburg.de>
Message-ID: <BE10932E4AAB41FDBE0775843DCAF88A@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Try adding rootwait on the kernel cmd line, not sure if it is needed in case of bootining from sd
but I had to add this before when booting from an USB device.
rootwait gives the kernel time to finisch the USB initialisation.
Why not simply make an ext2 filesystem and partition on your sd card?

Regards Johan


________________________________

Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Frank Ihle
Verzonden: donderdag 13 februari 2014 9:41
Aan: buildroot at busybox.net
Onderwerp: [Buildroot] How to get the kernel to mount a rootfs without an initramfs ?? (2)


Hi everyone,

I already encountered you with this problem and is yet not solved, but it was split up so here is some kind of a summary of what had
happened, I hope someone knows the solution:



I'm using an embedded board ARM9 SAM9G25 which I want to boot from SD Card. When I build a linux kernel with a built-in rootfs
(initramfs) then it's working as it should. Now I want to separate kernel from rootfs and I generated an rootfs.squashfs.

The kernel command line is now
console=ttyAT0,115200 root=/dev/mmcblk0 ro rootfstype=squashfs

When I then boot my system the following kernel panic occurs:

VFS: Cannot open root device "mmcblk0" or unknown-block(0,0)
Please append a correct "root=" boot option; here are the available partitions:
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

I believe that partitioning doesn't lead to the solution, since booting with the same settings but with an initramfs is possible.

I found out that when booting with the initramfs image, when I do an ls /dev neither mmcblk nor sdb is listed.

After hitting dmesg following interesting lines appear:

mmc0: clock 0Hz busmode 1 powermode 0 cs 0 Vdd 0 width 0 timing 0
atmel_mci atmel_mci.0: Atmel MCI controller at 0xf0008000 irq 12, 1 slots
mmc_host mmc0: card is not present
mmc1: clock 0Hz busmode 1 powermode 0 cs 0 Vdd 0 width 0 timing 0
atmel_mci atmel_mci.1: Atmel MCI controller at 0xf000c000 irq 26, 1 slots
mmc_host mmc1: card is not present

(Yes the card is in the slot ;)

So what I think happens now is, that U-Boot can read the SD device but the kernel don't ( since an initramfs is bootable, a single
kernel can be loaded too but the rootfs, opened from kernel, cannot be found). In make linux menuconfig I already enabled

Device Drivers
<*> MMC/SD/SDIO card support
+ + <*> MMC block device driver
+ + <*> MMC host test driver
+ + <*> Atmel SD/MMC Driver (Atmel Multimedia Card Interface support)
+ + [ * ] Atmel MCI DMA support (Exp.)
+ + <M> Secure Digital Host Controller Interface support

but still with this setting it seems that the kernel is not able to use the SD device. I'm a bit clueless at this point, can someone
give me a hint?

Kind regards

Frank
