From: Santhosh Ramani <srcoolz@gmail.com>
Date: Thu, 4 Dec 2014 19:53:15 -0600
Subject: [Buildroot] Problem with UBI filesystem creation
Message-ID: <CADKZYYJ6CpCrw1cnLB80+ezs_wtBDDZhAbQZ1PCMujsTMEMzdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm running into some problems while creating the root file system for my
embedded device using buildroot. I'm trying to generate a UBI filesystem
for my NAND flash. I am using AM3352 with MT29F2G08ABAEAH4 for flash. [PEB
= 128K, Page size = 2048, no sub-page].

I'm continuously getting kernel panic and it keeps indicating that scan_peb
is failing. I will try and get the error logs posted to this chain. I
noticed that I made several mistakes in the configuration prior to posting
the latest config below - *I have not tested the latest one shown below*.
Can someone please let me know if my settings seem correct based on the
following:

1. My UBI image is around 95MB
2. I have created a root partition which is 120MB
3. Since the flash does not support sub-page, my LED size is 128K - 2*2KB =
124KB.
4. I'm writing the rootfs.ubi file from u-boot and
5. I perform NAND erase and scrub before I write to the NAND flash.
6. I've read through the following links and the help in menuconfig and
updated my config as shown below.

*Links I followed: *
http://www.linux-mtd.infradead.org/doc/ubi.html
http://stackoverflow.com/questions/20917921/unable-to-attach-ubi-to-mtd-partition
http://processors.wiki.ti.com/index.php/UBIFS_Support

*My configurations:*
BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1F000
BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=990
BR2_TARGET_ROOTFS_UBIFS_RT_NONE=y
# BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB is not set
# BR2_TARGET_ROOTFS_UBIFS_RT_LZO is not set
BR2_TARGET_ROOTFS_UBIFS_NONE=y
# BR2_TARGET_ROOTFS_UBIFS_GZIP is not set
# BR2_TARGET_ROOTFS_UBIFS_BZIP2 is not set
# BR2_TARGET_ROOTFS_UBIFS_LZMA is not set
# BR2_TARGET_ROOTFS_UBIFS_LZO is not set
# BR2_TARGET_ROOTFS_UBIFS_XZ is not set
BR2_TARGET_ROOTFS_UBIFS_OPTS="-F"
BR2_TARGET_ROOTFS_UBI=y
BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x20000
BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y
BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE="${TOPDIR}/board/custom/ubinize.cfg"
BR2_TARGET_ROOTFS_UBI_OPTS="-O 2048"

*My Ubinize config file*
[ubifs]
mode=ubi
vol_id=0
vol_size=100MiB
vol_type=dynamic
vol_name=rootfs
vol_alignment=1
vol_flags=autoresize
image=BR2_ROOTFS_UBIFS_PATH

Thank you so much for all your help guys, I really appreciate it. Please do
let me know if you need more information from my side.
Regards

Santhosh

-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141204/90df4836/attachment.html>
