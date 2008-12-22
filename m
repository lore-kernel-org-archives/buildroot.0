From: Quick X <quickx@hotmail.com>
Date: Mon, 22 Dec 2008 15:17:15 -0800
Subject: [Buildroot] EXT2 to JFFS2 Filesystem on AT91SAM9261-EK
Message-ID: <BAY124-W499A5245E65EDDB396F7E7D2EF0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




This is a basic question, however, I'm pretty new to embedded development and havn't found a good place for a begginer like me yet.  I can compile the default "at91sam9261ek_defconfig" fine, and flash it to my board.  It runs, however, the filesystem is in the Dataflash (copied to RAM); I'd like it on the onboard NAND Flash, and I'd like to convert it to JFFS2. I "make at91sam9261ek_defconfig" and do a "make menuconfig" to change the following: 1. Targetfile Options > Uncheck ext2 root filesystem.2. Targetfile Options > Check jffs2 root filesystem.3. Targetfile Options > jffs2 root filesystem > Memory Type > Parallel flash with 4 kB pagesize and 128 kB erase size4. Targetfile Options > jffs2 root filesystem > Check Make all files be owned by root5. Exit > Save > make  Buildroot succeeds and I get all the files including my .jffs2 filesystem.  I Flash the rootfilesystem to NAND Flash at 0x400000.  I change my u-boot bootargs to the following:  root=mtd3 rw rootfstype=jffs2 ip=10.0.2.105:192.168.50.205:10.0.0.1:255.255.0.0 console=ttyS0,115200 mem=64M ---When I boot, linux loads and I get a Kernel Panic---[[[SNIP]]]eth0: link downADDRCONF(NETDEV_UP): eth0: link is not readyIP-Config: Complete:      device=eth0, addr=10.0.2.105, mask=255.255.0.0, gw=10.0.0.1,     host=10.0.2.105, domain=, nis-domain=(none),     bootserver=192.168.50.205, rootserver=192.168.50.205, rootpath=VFS: Cannot open root device "mtd3" or unknown-block(0,0)Please append a correct "root=" boot option; here are the available partitions:1f00       8448 mtdblock0 (driver?)Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)---END--- It looks like my NAND Flash isn't properly partitioned in the board code, else it should be seeing 4 mtdblocks.  mdt3 (0x400000), with mdt0/1/2 not being used (since I'm still booting from Dataflash).  I tried changing it to boot from mtd0, with the RootFS in NAND 0x0, or 0x400000, and I just get a lot of "jffs2_scan_eraseblock()" happening.  Question:  If someone has the time could they give me a quick 1, 2, 3, on how to change the RootFilesystem from EXT2 to JFFS2 using the at91sam9261ek_defconfig as the base?  What files would I have to change exactly?  I think all I have to do is set up the mtd0 parition to point to NAND Flash 0x400000 (or 0x0 since NAND Isn't being used for U-Boot/AT91Bootstrap). Question: The "Memory Type" for the JFFS2 Root Filesystem has basically two options.  "Parallel flash with 4 kB pagesize and 128 kB erase size" and "AT45 dataflash with 1056 byte pagesize".  The Parallel flash is correct if I want to use the onboard NAND Flash?  Or Parallel flash would only be for external flash hooked to the board?  If I use "AT45 Dataflash with 1056 byte pagesize", and put the .jffs2 at 0x001CE000 on the Dataflash, I still can't get it to boot, probably because of the partions again. Thanks, and sorry for any inconviences.
_________________________________________________________________

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20081222/9e15ee11/attachment-0001.htm 
