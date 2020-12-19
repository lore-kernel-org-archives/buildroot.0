From: Trond Melen <trond.melen@holosynth.com>
Date: Sat, 19 Dec 2020 16:01:24 +0100
Subject: [Buildroot] Extracting DDR3 training code from bootable (Marvell
 Armada 370)
Message-ID: <e15851e4-569d-213a-13f5-e53d8ea36863@holosynth.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I'm trying to build U-Boot for Netgear ReadyNAS RN102 
(https://wikidevi.wi-cat.ru/Netgear_ReadyNAS_RN102) which hosts a 
Marvell Armada 370 SoC (88F6710). I believe what I need to do is 
something like this:

dd if=backup.mtd0 of=u-boot-spl.bin bs=1 skip=X count=Y

Right? Is there sufficient information below to make a qualified guess 
about the values X and Y?

Regards,
Trond Melen


DDR3 training code for this CPU is not included in the U-Boot source 
tree, so, as expected, 'make' in '~/buildroot-2020.11' fails:
[...]
 ? MKIMAGE u-boot.kwb
Didn't find the file 'spl/u-boot-spl.bin' in 
'/home/tme/buildroot-2020.11/output/build/uboot-2020.10' which is 
mandatory to generate the image
This file generally contains the DDR3 training code, and should be 
extracted from an existing bootable
image for your board. See 'kwbimage -x' to extract it from an existing 
image.
[...]
Could not create image
make[2]: *** [Makefile:1440: u-boot.kwb] Error 1
make[2]: *** Deleting file 'u-boot.kwb'
make[2]: *** Waiting for unfinished jobs....
[...]

On the box I did:
================
tme at debian:~$ cat /proc/mtd
dev:??? size?? erasesize? name
mtd0: 00180000 00020000 "u-boot"
mtd1: 00020000 00020000 "u-boot-env"
mtd2: 00600000 00020000 "uImage"
mtd3: 00400000 00020000 "minirootfs"
mtd4: 07400000 00020000 "ubifs"

tme at debian:~$ sudo nanddump --noecc --omitoob -f backup.mtd0 /dev/mtd0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00180000...

tme at debian:~$ binwalk backup.mtd0
DECIMAL?????? HEXADECIMAL???? DESCRIPTION
--------------------------------------------------------------------------------
600340??????? 0x92914???????? device tree image (dtb)
608589??????? 0x9494D???????? Certificate in DER format (x509 v3), 
header length: 4, sequence length: 1284
608705??????? 0x949C1???????? Certificate in DER format (x509 v3), 
header length: 4, sequence length: 1288
662640??????? 0xA1C70???????? CRC32 polynomial table, little endian
667340??????? 0xA2ECC???????? CRC32 polynomial table, little endian
671327??????? 0xA3E5F???????? LZO compressed data
868352??????? 0xD4000???????? device tree image (dtb)

me at debian:~$ hexdump backup.mtd0 | head
0000000 008b 0000 5f18 000c 0101 4000 4000 0001
0000010 0000 0000 0000 0000 0200 0001 0000 e001
0000020 0102 3518 0002 0000 005b 0000 0000 0000
0000030 5fff e92d 001c fa00 0000 e3a0 9fff e8bd
0000040 1ffe e92d 0f36 ee07 1ffe e8bd ff1e e12f
0000050 1ffe e92d 0fba ee07 0f3e ee07 0f9a ee07
0000060 1ffe e8bd ff1e e12f 1ffe e92d f05f f57f
0000070 0f3e ee07 f04f f57f 1ffe e8bd ff1e e12f
0000080 1f10 ee11 1a02 e3c1 1000 e181 1f10 ee01
0000090 f04f f57f ff1e e12f 1000 e10f 1c01 e3c1

tme at debian:~$ hexdump backup.mtd0 | tail
00d75e0 6c6c 702c 6963 2d65 6f70 7472 6d00 7261
00d75f0 6576 6c6c 702c 6963 2d65 616c 656e 6400
00d7600 6665 7561 746c 732d 6174 6574 6c00 6e69
00d7610 7875 632c 646f 0065 0a0a 0a0a 0a0a 0a0a
00d7620 0a0a 0a0a 0a0a 0a0a 0a0a 0a0a 0a0a 0a0a
*
00d9f10 0a0a 0a0a 4783 d19c ffff ffff ffff ffff
00d9f20 ffff ffff ffff ffff ffff ffff ffff ffff
*
0180000
================
