From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 13 Aug 2013 21:04:43 +0800
Subject: [Buildroot] ubifs rootfs attached error
Message-ID: <20130813130443.GA3676@zuhnb712>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I use buildroot created an ubifs as my rootfs, which is intended put on
my ARM target with MTD partitions.  In u-boot bootloader I wrote the ubi
image to my NAND flash and changed kernel command line accordingly. But
the kernel did not boot, the messages shown that it cannot attach the
image successfully. I will describe my steps and related information in
blow and hope people here can sort me out the difficulties.

Firstly, below are the kernel error messages:

------------------------------------------------------------------
NAND_ECC_NONE selected by board driver. This is not recommended !!
Scanning device for bad blocks
Bad eraseblock 77 at 0x0000009a0000
Bad eraseblock 89 at 0x000000b20000
...
Bad eraseblock 2419 at 0x000012e60000
Bad eraseblock 3458 at 0x00001b040000
Creating 5 MTD partitions on "NAND":
0x000000000000-0x000000100000 : "Bootloader"
0x000000100000-0x000000300000 : "LOGO"
0x000000300000-0x000000700000 : "Kernel"
0x000000700000-0x000002700000 : "ROOTFS"
0x000002700000-0x000040000000 : "Data"
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: max. sequence number:       0
UBI error: vtbl_check: volume table check failed: record 0, error 9
UBI error: ubi_init: cannot attach mtd3
----------------------------------------------------------------------

My ubi image was create with the following buildroot configs:

BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f800
BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2048
# BR2_TARGET_ROOTFS_UBIFS_RT_NONE is not set
# BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB is not set
BR2_TARGET_ROOTFS_UBIFS_RT_LZO=y
BR2_TARGET_ROOTFS_UBIFS_NONE=y
# BR2_TARGET_ROOTFS_UBIFS_GZIP is not set
# BR2_TARGET_ROOTFS_UBIFS_BZIP2 is not set
# BR2_TARGET_ROOTFS_UBIFS_LZMA is not set
# BR2_TARGET_ROOTFS_UBIFS_LZO is not set
# BR2_TARGET_ROOTFS_UBIFS_XZ is not set
BR2_TARGET_ROOTFS_UBIFS_OPTS=""
BR2_TARGET_ROOTFS_UBI=y
BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x8000
BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
BR2_TARGET_ROOTFS_UBI_OPTS=""

I write the resulted ubi (not the ubifs) image to my nand flash using
u-boot: 'nand write memory-address my-mtd-part-start my-mtd-part-size'

Then I change my kernel command line before boot it:

ubi.mtd=3 root=ubi0:rootfs rootfstype=ubifs noinitrd ...

Can anyone please have a look at above information and give me a clue?
Is that possible I setup incorrect parameters in making the UBI image?
Actually I don't really understand the meanings of those parameters.

Thanks in advance.


-- 
I can't go back to yesterday - because I was a different person then
