From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Jun 2017 16:41:44 +0200
Subject: [Buildroot] [PATCH 2/2] openblocks_a6_defconfig: improve/fix
	configuration
In-Reply-To: <20170616144144.30280-1-peter@korsgaard.com>
References: <20170616144144.30280-1-peter@korsgaard.com>
Message-ID: <20170616144144.30280-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The board has an ethernet interface, so enable DHCP for it.

The used flash chip uses 16K erase blocks, so use that for JFFS2:

mtdinfo -a
..
mtd5
Name:                           user
Type:                           nand
Eraseblock size:                16384 bytes, 16.0 KiB
Amount of eraseblocks:          1915 (31375360 bytes, 29.9 MiB)
Minimum input/output unit size: 512 bytes
Sub-page size:                  256 bytes
OOB size:                       16 bytes
Character device major/minor:   90:10
Bad blocks are allowed:         true
Device is writable:             true

While we're at it, add a readme explaining how to build and upload the build
to the board.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/openblocks/a6/readme.txt  | 78 +++++++++++++++++++++++++++++++++++++++++
 configs/openblocks_a6_defconfig |  3 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 board/openblocks/a6/readme.txt

diff --git a/board/openblocks/a6/readme.txt b/board/openblocks/a6/readme.txt
new file mode 100644
index 0000000000..10a78bb790
--- /dev/null
+++ b/board/openblocks/a6/readme.txt
@@ -0,0 +1,78 @@
+Openblocks A6
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Openblocks A6. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make openblocks_a6_defconfig
+
+Compile everything:
+
+    $ make
+
+Updating board over TFTP
+========================
+
+Copy the content of output/images to the root of your TFTP server.
+
+Connect serial and ethernet, power up board and stop it in U-Boot:
+
+DRAM (DDR2) CAS Latency = 5 tRP = 5 tRAS = 14 tRCD=5
+DRAM CS[0] base 0x00000000   size 512MB
+DRAM Total size 512MB  16bit width
+Addresses 8M - 0M are saved for the U-Boot usage.
+Mem malloc Initialization (8M - 7M): Done
+NAND:64 MB
+POST:  mac verify Eth0 PASSED
+
+CPU : Marvell Feroceon (Rev 1)
+
+Streaming disabled
+Write allocate disabled
+
+
+USB 0: host mode
+Net:   egiga0
+Hit any key to stop autoboot:  0
+openblocks>>
+
+
+Load kernel from tftp:
+
+setenv serverip <tftp-server-ip>
+setenv bootfile uImage.kirkwood-openblocks_a6
+bootp && tftp
+
+
+Write it to nand:
+
+nand erase 0x590000 0x1c5c000
+nand write.e $loadaddr 0x590000 0x1c5c000
+
+
+Load rootfs from tftp:
+
+setenv serverip <tftp-server-ip>
+setenv bootfile rootfs.jffs2
+bootp && tftp
+
+
+Write it to nand:
+
+nand erase 0x2214000 0x1dc4000
+nand write.jffs2 $loadaddr 0x2214000 0x1dc4000
+
+
+Configure kernel to use rootfs:
+
+setenv root /dev/mtdblock5 rootfstype=jffs2
+saveenv
+boot
diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index fff736389f..4889fb3831 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -5,10 +5,11 @@ BR2_arm926t=y
 # system
 BR2_TARGET_GENERIC_HOSTNAME="openblocks-a6"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
 
 # filesystem
 BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
+BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_16K=y
 
 # Linux headers same as kernel, a 4.11 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
-- 
2.11.0
