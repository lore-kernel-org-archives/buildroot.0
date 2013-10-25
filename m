From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 25 Oct 2013 13:56:35 -0500
Subject: [Buildroot] [PATCH 2/2] configs: add sample for freescale p2041rdb
In-Reply-To: <1382727395-23441-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1382727395-23441-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1382727395-23441-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
A custom device tree is needed in order to support the NOR flash
partitions. The device tree that is a part of the kernel does
not have this mapped out.

Eventually, the goal is to move this configuration to boot from the
eSDHC interface utilizing the u-boot.pbl image format. However, while
my patchset is awaiting review, the simple NOR based configuration
will work just fine.
---
 board/freescale/p2041rdb/p2041rdb.dts |  296 +++++++++++++++++++++++++++++++++
 board/freescale/p2041rdb/readme.txt   |   78 +++++++++
 configs/freescale_p2041rdb_defconfig  |   32 ++++
 3 files changed, 406 insertions(+), 0 deletions(-)
 create mode 100644 board/freescale/p2041rdb/p2041rdb.dts
 create mode 100644 board/freescale/p2041rdb/readme.txt
 create mode 100644 configs/freescale_p2041rdb_defconfig

diff --git a/board/freescale/p2041rdb/p2041rdb.dts b/board/freescale/p2041rdb/p2041rdb.dts
new file mode 100644
index 0000000..2d8b084
--- /dev/null
+++ b/board/freescale/p2041rdb/p2041rdb.dts
@@ -0,0 +1,296 @@
+/*
+ * P2041RDB Device Tree Source
+ *
+ * Copyright 2011 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *       notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *       notice, this list of conditions and the following disclaimer in the
+ *       documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *       names of its contributors may be used to endorse or promote products
+ *       derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/include/ "fsl/p2041si-pre.dtsi"
+
+/ {
+	model = "fsl,P2041RDB";
+	compatible = "fsl,P2041RDB";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&mpic>;
+
+	memory {
+		device_type = "memory";
+	};
+
+	dcsr: dcsr at f00000000 {
+		ranges = <0x00000000 0xf 0x00000000 0x01008000>;
+	};
+
+	soc: soc at ffe000000 {
+		ranges = <0x00000000 0xf 0xfe000000 0x1000000>;
+		reg = <0xf 0xfe000000 0 0x00001000>;
+		spi at 110000 {
+			flash at 0 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "spansion,s25sl12801";
+				reg = <0>;
+				spi-max-frequency = <40000000>; /* input clock */
+				partition at u-boot {
+					label = "u-boot";
+					reg = <0x00000000 0x00100000>;
+					read-only;
+				};
+				partition at kernel {
+					label = "kernel";
+					reg = <0x00100000 0x00500000>;
+					read-only;
+				};
+				partition at dtb {
+					label = "dtb";
+					reg = <0x00600000 0x00100000>;
+					read-only;
+				};
+				partition at fs {
+					label = "file system";
+					reg = <0x00700000 0x00900000>;
+				};
+			};
+		};
+
+		i2c at 118000 {
+			lm75b at 48 {
+				compatible = "nxp,lm75a";
+				reg = <0x48>;
+			};
+			eeprom at 50 {
+				compatible = "at24,24c256";
+				reg = <0x50>;
+			};
+			rtc at 68 {
+				compatible = "pericom,pt7c4338";
+				reg = <0x68>;
+			};
+			adt7461 at 4c {
+				compatible = "adi,adt7461";
+				reg = <0x4c>;
+			};
+		};
+
+		i2c at 118100 {
+			eeprom at 50 {
+				compatible = "at24,24c256";
+				reg = <0x50>;
+			};
+		};
+
+		usb1: usb at 211000 {
+			dr_mode = "host";
+		};
+	};
+
+	rio: rapidio at ffe0c0000 {
+		reg = <0xf 0xfe0c0000 0 0x11000>;
+
+		port1 {
+			ranges = <0 0 0xc 0x20000000 0 0x10000000>;
+		};
+		port2 {
+			ranges = <0 0 0xc 0x30000000 0 0x10000000>;
+		};
+	};
+
+	lbc: localbus at ffe124000 {
+		reg = <0xf 0xfe124000 0 0x1000>;
+		ranges = <0 0 0xf 0xe8000000 0x08000000
+			  1 0 0xf 0xffa00000 0x00040000>;
+
+		nor at 0,0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "cfi-flash";
+			reg = <0 0 0x08000000>;
+			bank-width = <2>;
+			device-width = <2>;
+
+			/* Parition layout based on the Freescale Linux SDK */
+			/* http://www.freescale.com/infocenter/topic/QORIQSDK/2989535.html */
+			partition at 0 {
+				/* 128 KB for RCW Binary */
+				reg = <0x00000000 0x00020000>;
+				label = "NOR RCW Binary";
+			};
+
+			partition at 20000 {
+				/* 6MB + 768kB for Linux Kernel Image */
+				reg = <0x00020000 0x006e0000>;
+				label = "NOR Linux Kernel Image";
+			};
+
+			partition at 700000 {
+				/* 1MB for HV Image */
+				reg = <0x00700000 0x00100000>;
+				label = "NOR HV Image";
+			};
+
+			partition at 800000 {
+				/* 1MB for DTB Image */
+				reg = <0x00800000 0x00100000>;
+				label = "NOR DTB Image";
+			};
+
+			partition at 900000 {
+				/* 1MB for HV Config Device Tree */
+				reg = <0x00900000 0x00100000>;
+				label = "NOR HV Config Device Tree";
+			};
+
+			parition at a00000 {
+				/* 3MB for Guest image #1 */
+				reg = <0x00a00000 0x00300000>;
+				label = "NOR Guest image #1";
+			};
+
+			parition at d00000 {
+				/* 3MB for Guest image #2 */
+				reg = <0x00d00000 0x00300000>;
+				label = "NOR Guest image #2";
+			};
+
+			parition at 1000000 {
+				/* 3MB for Guest image #3 */
+				reg = <0x01000000 0x00300000>;
+				label = "NOR Guest image #3";
+			};
+
+			partition at 1300000 {
+				/* 44MB+256KB for JFFS2 based Root file System */
+				reg = <0x01300000 0x02C40000>;
+				label = "NOR JFFS2 Root File System";
+			};
+
+			partition at 7f40000 {
+				/* 128KB for FMAN Ucode */
+				reg = <0x07f40000 0x00020000>;
+				label = "NOR FMAN Ucode";
+			};
+
+			partition at 7f60000 {
+				/* This location must not be altered  */
+				/* 512KB for u-boot Bootloader Image */
+				/* 128KB for u-boot Environment Variables */
+				reg = <0x07f60000 0x000a0000>;
+				label = "NOR U-Boot Image";
+				read-only;
+			};
+		};
+
+		nand at 1,0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "fsl,elbc-fcm-nand";
+			reg = <0x1 0x0 0x40000>;
+
+			partition at 0 {
+				label = "NAND U-Boot Image";
+				reg = <0x0 0x02000000>;
+				read-only;
+			};
+
+			partition at 2000000 {
+				label = "NAND Root File System";
+				reg = <0x02000000 0x10000000>;
+			};
+
+			partition at 12000000 {
+				label = "NAND Compressed RFS Image";
+				reg = <0x12000000 0x08000000>;
+			};
+
+			partition at 1a000000 {
+				label = "NAND Linux Kernel Image";
+				reg = <0x1a000000 0x04000000>;
+			};
+
+			partition at 1e000000 {
+				label = "NAND DTB Image";
+				reg = <0x1e000000 0x01000000>;
+			};
+
+			partition at 1f000000 {
+				label = "NAND Writable User area";
+				reg = <0x1f000000 0x01000000>;
+			};
+		};
+	};
+
+	pci0: pcie at ffe200000 {
+		reg = <0xf 0xfe200000 0 0x1000>;
+		ranges = <0x02000000 0 0xe0000000 0xc 0x00000000 0x0 0x20000000
+			  0x01000000 0 0x00000000 0xf 0xf8000000 0x0 0x00010000>;
+		pcie at 0 {
+			ranges = <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x20000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+
+	pci1: pcie at ffe201000 {
+		reg = <0xf 0xfe201000 0 0x1000>;
+		ranges = <0x02000000 0x0 0xe0000000 0xc 0x20000000 0x0 0x20000000
+			  0x01000000 0x0 0x00000000 0xf 0xf8010000 0x0 0x00010000>;
+		pcie at 0 {
+			ranges = <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x20000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+
+	pci2: pcie at ffe202000 {
+		reg = <0xf 0xfe202000 0 0x1000>;
+		ranges = <0x02000000 0 0xe0000000 0xc 0x40000000 0 0x20000000
+			  0x01000000 0 0x00000000 0xf 0xf8020000 0 0x00010000>;
+		pcie at 0 {
+			ranges = <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x20000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+};
+
+/include/ "fsl/p2041si-post.dtsi"
diff --git a/board/freescale/p2041rdb/readme.txt b/board/freescale/p2041rdb/readme.txt
new file mode 100644
index 0000000..866b595
--- /dev/null
+++ b/board/freescale/p2041rdb/readme.txt
@@ -0,0 +1,78 @@
+
+******************** WARNING ********************
+The compiled U-Boot binary is intended for NOR flash only!
+It won't work for NAND or SPI and will brick those bootloaders!
+
+Also don't go playing around with different U-boot versions or flash targets
+unless you've got the necessary hardware and/or know-how to unbrick your kit.
+
+2013.10 is known good for NOR.
+******************** WARNING ********************
+
+You'll need to program the files created by buildroot into the flash.
+The fast way is to tftp transfer the files via one of the network interfaces.
+
+Alternatively you can transfer the files via serial console with an Ymodem
+file transfer from your terminal program by using a "loady" command
+from the u-boot prompt instead of the "tftp ..." commands stated below.
+Beware that serial console file transfers are quite slow!
+
+Remember to set the P2041RDB switches to NOR boot if you want to use
+your newly built U-Boot.
+
+1. Program the new U-Boot binary to NOR flash (optional)
+    If you don't feel confident upgrading your bootloader then don't do it,
+    it's unnecessary most of the time.
+
+    => tftp $loadaddr u-boot.bin
+    => protect off 0xeff80000 0xefffffff
+    => erase 0xeff80000 0xefffffff
+    => cp.b $loadaddr 0xeff80000 $filesize
+    => protect on 0xeff80000 0xefffffff
+
+2. Program the DTB to NOR flash
+
+    => tftp $loadaddr p2041rdb.dtb
+    => protect off 0xe8800000 0xe88fffff
+    => erase 0xe8800000 0xe88fffff
+    => cp.b $loadaddr 0xe8800000 $filesize
+    => protect on 0xe8800000 0xe88fffff
+
+3. Program the kernel to NOR flash
+
+    => tftp $loadaddr uImage
+    => protect off 0xe8020000 0xe86fffff
+    => erase 0xe8020000 0xe86fffff
+    => cp.b $loadaddr 0xe8020000 $filesize
+    => protect on 0xe8020000 0xe86fffff
+
+4. Program the root filesystem to NOR flash
+
+    => tftp $loadaddr rootfs.jffs2
+    => protect off 0xe9300000 0xebf3ffff
+    => erase 0xe9300000 0xebf3ffff
+    => cp.b $loadaddr 0xe9300000 $filesize
+    => protect on 0xe9300000 0xebf3ffff
+
+5. Program the FMan UCode Binary to NOR flash
+
+    => tftp $loadaddr fm-ucode.bin
+    => protect off 0xeff40000 0xeff5ffff
+    => erase 0xeff40000 0xeff5ffff
+    => cp.b $loadaddr 0xeff40000 $filesize
+    => protect on 0xeff40000 0xeff5ffff
+
+6. Booting your new system
+
+    => setenv norboot 'setenv bootargs root=/dev/mtdblock8 rootfstype=jffs2 rootwait console=$consoledev,$baudrate;bootm 0xe8020000 - 0xe8800000'
+
+    If you want to set this boot option as default:
+
+    => setenv bootcmd 'run norboot'
+    => saveenv
+
+    ...or for a single boot:
+
+    => run norboot
+
+    You can login with user "root".
diff --git a/configs/freescale_p2041rdb_defconfig b/configs/freescale_p2041rdb_defconfig
new file mode 100644
index 0000000..2c146c8
--- /dev/null
+++ b/configs/freescale_p2041rdb_defconfig
@@ -0,0 +1,32 @@
+# Architecture
+BR2_powerpc=y
+BR2_powerpc_e500mc=y
+
+# Lock headers version to match and avoid breakage
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.11.5"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.5"
+BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/freescale/p2041rdb/p2041rdb.dts"
+
+# Target Packages
+BR2_PACKAGE_FM_UCODE_FIRMWARE=y
+BR2_PACKAGE_FM_UCODE_FIRMWARE_FILE="fsl_fman_ucode_p2041_r2.0_106_1_9.bin"
+
+# Filesystem Image
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x10
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="P2041RDB"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
-- 
1.7.1
