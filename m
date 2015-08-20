From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Wed, 19 Aug 2015 17:13:43 -0700
Subject: [Buildroot] bootm - "Starting kernel"
In-Reply-To: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD9614@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot mailing list,

My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I have made the former meet the latter's requirements. My target is Marvell ARMADA A385 (ARM-Cortex-A9) DB-88F6820-GP. This board is bootable using the U-Boot-1.73 and the USB which are given by Marvell.

The two attachments are my .config file and bootz log file for your review.

I am trying to boot my Buildroot Linux system using Marvell's bootable USB template. I have replaced two Marvell's files with the ones I built using my .config in the Buildroot-2015.05 root folder:


1.      -rwxr-xr-x 1 tclee tclee 3538952 Aug 19 11:37 /media/tclee/24e7139b-655a-45d2-a333-72181bca2e7d/boot/zImage

2.      -rw-r--r-- 1 tclee tclee 13286 Aug 19 11:37 /media/tclee/24e7139b-655a-45d2-a333-72181bca2e7d/boot/armada-385-db-ap.dtb

The original Marvell bootamd, bootargs, fdtfile, image_name console, mtdpars and bootargs_root are:


*        bootcmd=usb reset; ext2load usb 0:1 0x2000000  $image_name; ext2load usb 0:1 0x1000000 $fdtfile; setenv bootargs $console $mtdparts $bootargs_root; bootz 0x2000000 - 0x1000000

*        printenv bootargs

*        bootargs=console=ttyS0,115200 mtdparts=spi_flash:4m(boot),-(spi-rootfs) root=/de

*        v/sda1 rw rootdelay=2

*        fdtfile=/boot/armada-385-db-linux-3.10.39-2014_T3.0p5.dtb - change to /boot/ armada-385-db-ap.dtb

*        image_name=/boot/zImage-linux-3.10.39-2014_T3.0p5-armada_mvebu_smp - changed to =/boot/zImage

*        console=console=ttyS0,115200

*        mtdparts=mtdparts=spi_flash:4m(boot),-(spi-rootfs)

*        bootargs_root=root=/dev/sda1 rw rootdelay=2

I did all the bootcmd commands step by step. The final bootz command ended up with a kernel panic message:

[    3.482970] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

I am reporting this panic to see any adjustments I need to do in my .config file.

Tommy







From: Lee, Tommy
Sent: Tuesday, August 11, 2015 4:28 PM
To: 'buildroot at busybox.net'
Subject: bootm - "Starting kernel"

Hi Buildroot mailing list,

My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I have made the former meet the latter's requirements. My target is Marvell ARMADA A385 (ARM-Cortex-A9) DB-88F6820-GP. This board is bootable using the U-Boot-1.73 and the USB which are given by Marvell.

I used Buildroot-2015.05 and built the uImage and rootfs.cpio.uboot with no problems. I enabled the TFTP server on my host.

On my target, the execution of the following commands, listed below, ended up with "Starting kernel", no display of kernel booting messages. The attached is the .config file I created this the make process.

I am resolving this issue now. Your experience sharing is extremely grateful.

Tommy

Marvell>> tftp 02000000 10.28.1.20:uImage
Using egiga0 device
TFTP from server 10.28.1.20; our IP address is 10.28.1.47
Filename 'uImage'.
Load address: 0x2000000
Loading: #################################################################
         #################################################################
         #################################################################
         ##############
         1.6 MiB/s
done
Bytes transferred = 1066696 (1046c8 hex)
Marvell>> tftp 02200000 10.28.1.20:rootfs.cpio.uboot
Using egiga0 device
TFTP from server 10.28.1.20; our IP address is 10.28.1.47
Filename 'rootfs.cpio.uboot'.
Load address: 0x2200000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ######################
         1.7 MiB/s
done
Bytes transferred = 4769344 (48c640 hex)
Marvell>> bootm 02000000 02200000
## Booting kernel from Legacy Image at 02000000 ...
   Image Name:   Linux-4.0.4
   Created:      2015-08-11   0:21:58 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1066632 Bytes = 1 MiB
   Load Address: 02000000
   Entry Point:  02000000
   Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 02200000 ...
   Image Name:
   Created:      2015-08-11  15:25:49 UTC
   Image Type:   ARM Linux RAMDisk Image (uncompressed)
   Data Size:    4769280 Bytes = 4.5 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   XIP Kernel Image ... OK
OK

Starting kernel ...



________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150819/5352bab1/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.aug19wed15
Type: application/octet-stream
Size: 54123 bytes
Desc: config.aug19wed15
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150819/5352bab1/attachment-0001.obj>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: aug18tue15bad.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150819/5352bab1/attachment-0001.txt>
