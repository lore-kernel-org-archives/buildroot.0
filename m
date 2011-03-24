From: Torsten Mohr <tmohr@s.netic.de>
Date: Thu, 24 Mar 2011 22:19:55 +0100
Subject: [Buildroot] [beagleboard] BeagleBoard-xM, booting 2.6.37,
	root=/dev/mmcblk0p2, kernel hangs
In-Reply-To: <201103232200.55266.tmohr@s.netic.de>
References: <201103232200.55266.tmohr@s.netic.de>
Message-ID: <201103242219.55879.tmohr@s.netic.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

the problem was the kernel configuration, i configured MMC cards but i did not 
enable the "Block Layer".  It seems in the OMAP specific kernel you can't rely 
that every dependency is correctly set (enabling MMC is possible without block 
layer).

After adapting /etc/inittab i can start /bin/sh


Best regards,
Torsten.


Am Mittwoch, 23. M?rz 2011, 22:00:55 schrieb Torsten Mohr:
> Hello,
> 
> i've set up a micro SD card with VFAT on partition 1, EXT2 on partition 2.
> 
> Partition 2 is buildroot's output/images/rootfs.ext2, copied with "dd" to
> the micro SD card.
> 
> On partition 1 i have u-boot and i start the kernel like this:
> mmc init
> mmc rescan 0
> run loaduimage
> bootm 0x82000000
> 
> Then i see the kernel boot log and i see it hanging:
> 
> [    1.215850] twl_rtc twl_rtc: setting system clock to 2000-01-01 00:05:25
> UTC (946685125)
> [    1.226806] Waiting for root device /dev/mmcblk0p2...
> [    1.369873] mmc0: host does not support reading read-only switch.
> assuming write-enable.
> [    1.389953] mmc0: new SDHC card at address e624
> ---> no more output
> 
> 
> I use buildroot-2011.02, the kernel is 2.6.37.
> 
> In the kernel configuration i have set:
> 
> TI OMAP Multimedia Card Interface support (MMC_OMAP)
> TI OMAP High Speed Multimedia Card Interface support (MMC_OMAP_HS)
> 
> 
> Can anybody give me a hint why the kernel does not continue to boot?
> 
> 
> Best regards,
> Torsten.
