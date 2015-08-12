From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Wed, 12 Aug 2015 16:24:14 -0700
Subject: [Buildroot] bootm - "Starting kernel"
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474B5DFA4@svr-wa-exch1.atg.lc>
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474B5DFA4@svr-wa-exch1.atg.lc>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD93AD@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

I just did the make process again, with BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7" which is the only change. This time the uImage and rootfs sizes are much bigger than the ones of yesterday:

-rw-r--r-- 1 root root 7776320 Aug 12 14:53 rootfs.cpio.uboot
-rw-r--r-- 1 root root 3539008 Aug 12 14:53 uImage

On my target, I did the TFTP downloads of the above two files in SDRAM. The uImage is loaded at 0x02000000; rootfd.cpio.uboot:

Marvell>> tftp 02000000 10.28.1.20:uImage
Using egiga0 device
TFTP from server 10.28.1.20; our IP address is 10.28.1.47
Filename 'uImage'.
Load address: 0x2000000
Loading: #################################################################
         .....
         ##########################################
         1.6 MiB/s
done
Bytes transferred = 3539008 (360040 hex)
Marvell>>
doneMarvell>> tftp 02400000 10.28.1.20:rootfs.cpio.uboot
Using egiga0 device
TFTP from server 10.28.1.20; our IP address is 10.28.1.47
Filename 'rootfs.cpio.uboot'.
Load address: 0x2400000
Loading: #################################################################
         .....
         ########################
         1.7 MiB/s
done
Bytes transferred = 7776320 (76a840 hex)
Marvell>>

Then I changed the bootargs string:

Marvell>> env print bootargs
bootargs=console=ttyS0,115200n8 mem=2G initrd=0x02400000,8M rw root=/dev/ram0 rw eth=00:50:43:ec:16:4d
Marvell>>

After that, unfortunately,my bootm command still shows no more than "Starting kernel". The attached are the defconfig and .config files used for this make process. I hope you would review them to see the cause of the booting hang.

Tommy

Marvell>> bootm 0x02000000 0x02400000
## Booting kernel from Legacy Image at 02000000 ...
   Image Name:   Linux-4.0.4
   Created:      2015-08-12  21:51:11 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3538944 Bytes = 3.4 MiB
   Load Address: 02000000
   Entry Point:  02000000
   Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 02400000 ...
   Image Name:
   Created:      2015-08-12  21:51:55 UTC
   Image Type:   ARM Linux RAMDisk Image (uncompressed)
   Data Size:    7776256 Bytes = 7.4 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   XIP Kernel Image ... OK
OK

Starting kernel ...




This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 54022 bytes
Desc: config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150812/45b45148/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mvebu_v7_defconfig
Type: application/octet-stream
Size: 2957 bytes
Desc: mvebu_v7_defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150812/45b45148/attachment-0001.obj>
