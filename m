From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 13 May 2015 21:22:56 +0200
Subject: [Buildroot] [PATCH v2 8/9] atmel: add a flashing helper and
	documentation
In-Reply-To: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1431544977-2274-9-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide a flashing helper to properly select the sam-ba configuration
and reuse the sam-ba tcl script provided by Atmel with minimal
modifications.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 board/atmel/flasher.sh    |  74 ++++++++++
 board/atmel/nandflash.tcl | 346 ++++++++++++++++++++++++++++++++++++++++++++++
 board/atmel/nandflash.txt | 106 ++++++++++++++
 3 files changed, 526 insertions(+)
 create mode 100755 board/atmel/flasher.sh
 create mode 100644 board/atmel/nandflash.tcl
 create mode 100644 board/atmel/nandflash.txt

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
new file mode 100755
index 000000000000..2382fba72cf0
--- /dev/null
+++ b/board/atmel/flasher.sh
@@ -0,0 +1,74 @@
+#!/bin/bash
+
+BUILDIR=$1
+TTY=$2
+BOARD=$3
+
+family_at91sam9g45m10ek="FAMILY=at91sam9g45 SUFFIX=ek"
+mach_at91sam9g45m10ek="at91sam9m10-g45-ek"
+
+family_at91sam9rlek="FAMILY=at91sam9rl SUFFIX=ek"
+mach_at91sam9rlek="at91sam9rl64-ek"
+
+family_at91sam9g15ek="FAMILY=at91sam9x5 SUFFIX=ek"
+mach_at91sam9g15ek="at91sam9g15-ek"
+
+family_at91sam9g25ek="FAMILY=at91sam9x5 SUFFIX=ek"
+mach_at91sam9g25ek="at91sam9g25-ek"
+
+family_at91sam9x25ek="FAMILY=at91sam9x5 SUFFIX=ek"
+mach_at91sam9x25ek="at91sam9x25-ek"
+
+family_at91sam9g35ek="FAMILY=at91sam9x5 SUFFIX=ek"
+mach_at91sam9g35ek="at91sam9g35-ek"
+
+family_at91sam9x35ek="FAMILY=at91sam9x5 SUFFIX=ek"
+mach_at91sam9x35ek="at91sam9x35-ek"
+
+family_sama5d3xek="FAMILY=sama5d3 SUFFIX=ek"
+mach_sama5d3xek="at91sama5d3x-ek"
+
+family_sama5d3_xplained="FAMILY=sama5d3 SUFFIX=_xplained"
+mach_sama5d3_xplained="at91sama5d3x-xplained"
+
+family_sama5d4ek="FAMILY=sama5d4 SUFFIX=ek"
+mach_sama5d4ek="at91sama5d4x-ek"
+
+family_sama5d4_xplained="FAMILY=sama5d4 SUFFIX=_xplained"
+mach_sama5d4_xplained="at91sama5d4x-ek"
+
+usage() {
+	cat << EOF
+Usage:
+  $0 <builddir_path> <interface> <board>
+
+Available boards:
+  at91sam9g45m10ek
+  at91sam9rlek
+  at91sam9g15ek
+  at91sam9g25ek
+  at91sam9x25ek
+  at91sam9g35ek
+  at91sam9x35ek
+  sama5d3xek
+  sama5d3_xplained
+  sama5d4ek
+  sama5d4_xplained
+
+Example:
+  $0 ./output /dev/ttyACM0 at91sam9g45m10ek
+EOF
+}
+
+F="family_$BOARD"
+M="mach_$BOARD"
+
+if [[ $# != 3 || -z ${!F} ]]; then
+	usage
+	exit 1
+fi
+
+echo "Executing: ${!F} O=$1/images $1/host/opt/sam-ba/sam-ba $TTY ${!M} $(dirname $0)/nandflash.tcl"
+export ${!F} O=$1/images
+$1/host/opt/sam-ba/sam-ba $TTY ${!M} $(dirname $0)/nandflash.tcl
+
diff --git a/board/atmel/nandflash.tcl b/board/atmel/nandflash.tcl
new file mode 100644
index 000000000000..49c363196de7
--- /dev/null
+++ b/board/atmel/nandflash.tcl
@@ -0,0 +1,346 @@
+# ----------------------------------------------------------------------------
+#         ATMEL Microcontroller
+# ----------------------------------------------------------------------------
+# Copyright (c) 2013, Atmel Corporation
+#
+# All rights reserved.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions are met:
+#
+# - Redistributions of source code must retain the above copyright notice,
+# this list of conditions and the disclaimer below.
+#
+# Atmel's name may not be used to endorse or promote products derived from
+# this software without specific prior written permission.
+#
+# DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
+# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
+# DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
+# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
+# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
+# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# ----------------------------------------------------------------------------
+
+################################################################################
+#  Script data
+################################################################################
+set bootstrapFile	"$env(O)/at91bootstrap.bin"
+set ubootFile		"$env(O)/u-boot.bin"
+set kernelFile		"$env(O)/zImage"
+set rootfsFile		"$env(O)/rootfs.ubi"
+
+set boardFamily		"$env(FAMILY)"
+set board_suffix	"$env(SUFFIX)"
+set use_dtb "yes"
+set build_uboot_env "yes"
+
+# DBGU address for rm9200, 9260/9g20, 9261/9g10, 9rl, 9x5
+set at91_base_dbgu0 0xfffff200
+# DBGU address for 9263, 9g45, sama5d3
+set at91_base_dbgu1 0xffffee00
+
+set arch_exid_offset 0x44
+
+# arch id
+set arch_id_at91sam9g20 0x019905a0
+set arch_id_at91sam9g45 0x819b05a0
+set arch_id_at91sam9x5  0x819a05a0
+set arch_id_at91sam9n12 0x819a07a0
+set arch_id_sama5d3     0x8a5c07c0
+
+## Find out at91sam9x5 variant to load the corresponding dtb file
+array set at91sam9x5_variant {
+   0x00000000 at91sam9g15
+   0x00000001 at91sam9g35
+   0x00000002 at91sam9x35
+   0x00000003 at91sam9g25
+   0x00000004 at91sam9x25
+}
+
+## Find out sama5d3 variant to load the corresponding dtb file
+array set sama5d3_variant {
+   0x00444300 sama5d31
+   0x00414300 sama5d33
+   0x00414301 sama5d34
+   0x00584300 sama5d35
+   0x00004301 sama5d36
+}
+
+################################################################################
+#  proc uboot_env: Convert u-boot variables in a string ready to be flashed
+#                  in the region reserved for environment variables
+################################################################################
+proc set_uboot_env {nameOfLstOfVar} {
+    upvar $nameOfLstOfVar lstOfVar
+
+    # sector size is the size defined in u-boot CFG_ENV_SIZE
+    set sectorSize [expr 0x20000 - 5]
+
+    set strEnv [join $lstOfVar "\0"]
+    while {[string length $strEnv] < $sectorSize} {
+        append strEnv "\0"
+    }
+    # \0 between crc and strEnv is the flag value for redundant environment
+    set strCrc [binary format i [::vfs::crc $strEnv]]
+    return "$strCrc\0$strEnv"
+}
+
+################################################################################
+proc find_variant_name {boardType} {
+   global at91_base_dbgu0
+   global at91_base_dbgu1
+   global arch_exid_offset
+   global at91sam9x5_variant
+   global sama5d3_variant
+   set socName "$boardType"
+
+   puts "-I- === name before switch $boardType ==="
+   switch $boardType {
+      at91sam9g45 {
+         set socName "at91sam9m10g45"
+      }
+      at91sam9x5 {
+         set exidAddr [expr {$at91_base_dbgu0 + $arch_exid_offset}]
+         set chip_variant [format "0x%08x" [read_int $exidAddr]]
+
+         foreach {key value} [array get at91sam9x5_variant] {
+            if {$key == $chip_variant} {
+               set socName "$value"
+               break;
+            }
+         }
+      }
+      sama5d3 {
+         set exidAddr [expr {$at91_base_dbgu1 + $arch_exid_offset}]
+         set chip_variant [format "0x%08x" [read_int $exidAddr]]
+
+         foreach {key value} [array get sama5d3_variant] {
+            puts "-I- === $chip_variant ? $key ($value) ==="
+            if {$key == $chip_variant} {
+               set socName "$value"
+               break;
+            }
+         }
+      }
+   }
+
+   puts "-I- === socName is $socName ==="
+   return "$socName"
+}
+
+proc find_variant_ecc {boardType} {
+   set eccType "none"
+
+   puts "-I- === ecc before switch $boardType ==="
+   switch $boardType {
+      at91sam9x5 {
+         set eccType 0xc0c00405
+      }
+      at91sam9n12 {
+         set eccType 0xc0c00405
+      }
+      sama5d3 {
+         set eccType 0xc0902405
+      }
+      sama5d4 {
+         set eccType 0xc1e04e07
+      }
+   }
+
+   puts "-I- === eccType is $eccType ==="
+   return $eccType
+}
+
+proc find_dtb_name {boardType} {
+   global board_suffix
+   global env
+   global variant_name
+   set dtbPrefix ""
+
+   switch $boardType {
+      sama5d3 {
+         set dtbPrefix "at91-"
+
+         if {[string match "_xplained" $board_suffix]} {
+            set variant_name "sama5d3"
+         }
+
+         if {[string match "ek*" $board_suffix]} {
+            set dtbPrefix ""
+         }
+      }
+      sama5d4 {
+         set dtbPrefix "at91-"
+      }
+   }
+
+   append dtbName $env(O) "/" $dtbPrefix $variant_name $board_suffix ".dtb"
+   puts "-I- === dtbName is $dtbName ==="
+   return $dtbName
+}
+
+proc get_kernel_load_addr {boardType} {
+   set kernel_load_addr 0x22000000
+
+   switch $boardType {
+      at91sam9g45 {
+         set kernel_load_addr 0x72000000
+      }
+   }
+
+   return $kernel_load_addr
+}
+
+proc get_dtb_load_addr {boardType} {
+   set dtb_load_addr 0x21000000
+
+   switch $boardType {
+      at91sam9g45 {
+         set dtb_load_addr 0x71000000
+      }
+   }
+
+   return $dtb_load_addr
+}
+
+################################################################################
+#  Main script: Load the linux demo in NandFlash,
+#               Update the environment variables
+################################################################################
+
+################################################################################
+
+# check for proper variable initialization
+if {! [info exists boardFamily]} {
+   puts "-E- === Board family not defined ==="
+   exit
+}
+
+set variant_name [find_variant_name $boardFamily]
+
+if {$variant_name == "none"} {
+   puts "-E- === Unknown SoC variant ==="
+   exit
+} else {
+   puts "-I- Chip variant is $variant_name"
+}
+if {$board_suffix == "none"} {
+   puts "-E- === Unknown $variant_name board ==="
+   exit
+} else {
+   puts "-I- Board variant is $board_suffix"
+}
+
+set pmeccConfig [find_variant_ecc $boardFamily]
+
+## Additional files to load
+set dtbFile [find_dtb_name $boardFamily]
+set ubootEnvFile	"ubootEnvtFileNandFlash.bin"
+
+## Now check for the needed files
+if {! [file exists $bootstrapFile]} {
+   puts "-E- === AT91Bootstrap file not found ==="
+   exit
+}
+
+if {! [file exists $ubootFile]} {
+   puts "-E- === U-Boot file not found ==="
+   exit
+}
+
+if {! [file exists $kernelFile]} {
+   puts "-E- === Linux kernel file not found ==="
+   exit
+}
+
+if {! [file exists $dtbFile]} {
+   puts "-E- === Unknown $variant_name + board $board_suffix combination ==="
+   exit
+}
+
+if {! [file exists $rootfsFile]} {
+   puts "-E- === Rootfs file not found ==="
+   exit
+}
+
+## NandFlash Mapping
+set bootStrapAddr	0x00000000
+set ubootAddr		0x00040000
+set ubootEnvAddr	0x000c0000
+set dtbAddr		0x00180000
+set kernelAddr		0x00200000
+set rootfsAddr		0x00800000
+
+## u-boot variable
+set kernelLoadAddr [get_kernel_load_addr $boardFamily]
+set dtbLoadAddr	[get_dtb_load_addr $boardFamily]
+
+## NandFlash Mapping
+set kernelSize	[format "0x%08X" [file size $kernelFile]]
+if {$use_dtb == "yes"} {
+   set dtbSize	[format "0x%08X" [file size $dtbFile]]
+   set bootCmd "bootcmd=nand read $dtbLoadAddr $dtbAddr $dtbSize; nand read $kernelLoadAddr $kernelAddr $kernelSize; bootz $kernelLoadAddr - $dtbLoadAddr"
+} else {
+   set bootCmd "bootcmd=nand read $kernelLoadAddr $kernelAddr $kernelSize; bootz $kernelLoadAddr"
+}
+
+lappend u_boot_variables \
+    "bootdelay=1" \
+    "baudrate=115200" \
+    "stdin=serial" \
+    "stdout=serial" \
+    "stderr=serial" \
+    "bootargs=console=ttyS0,115200 mtdparts=atmel_nand:256k(bootstrap)ro,512k(uboot)ro,256k(env),256k(env_redundant),256k(spare),512k(dtb),6M(kernel)ro,-(rootfs) rootfstype=ubifs ubi.mtd=7 root=ubi0:rootfs rw" \
+    "$bootCmd"
+
+puts "-I- === Initialize the NAND access ==="
+NANDFLASH::Init
+
+if {$pmeccConfig != "none"} {
+   puts "-I- === Enable PMECC OS Parameters ==="
+   NANDFLASH::NandHeaderValue HEADER $pmeccConfig
+}
+
+puts "-I- === Erase all the NAND flash blocs and test the erasing ==="
+NANDFLASH::EraseAllNandFlash
+
+puts "-I- === Load the bootstrap in the first sector ==="
+if {$pmeccConfig != "none"} {
+   NANDFLASH::SendBootFilePmeccCmd $bootstrapFile
+} else {
+   NANDFLASH::sendBootFile $bootstrapFile
+}
+
+puts "-I- === Load the u-boot in the next sectors ==="
+send_file {NandFlash} "$ubootFile" $ubootAddr 0 
+
+if {$build_uboot_env == "yes"} {
+   puts "-I- === Load the u-boot environment variables ==="
+   set fh [open "$ubootEnvFile" w]
+   fconfigure $fh -translation binary
+   puts -nonewline $fh [set_uboot_env u_boot_variables]
+   close $fh
+   send_file {NandFlash} "$ubootEnvFile" $ubootEnvAddr 0
+}
+
+puts "-I- === Load the Kernel image and device tree database ==="
+
+if {$use_dtb == "yes"} {
+   send_file {NandFlash} "$dtbFile" $dtbAddr 0
+}
+send_file {NandFlash} "$kernelFile" $kernelAddr 0
+
+if {$pmeccConfig != "none"} {
+   puts "-I- === Enable trimffs ==="
+   NANDFLASH::NandSetTrimffs 1
+}
+
+puts "-I- === Load the linux file system ==="
+send_file {NandFlash} "$rootfsFile" $rootfsAddr 0
+
+puts "-I- === DONE. ==="
diff --git a/board/atmel/nandflash.txt b/board/atmel/nandflash.txt
new file mode 100644
index 000000000000..d8bddfa0f819
--- /dev/null
+++ b/board/atmel/nandflash.txt
@@ -0,0 +1,106 @@
+Flashing the NAND using SAM-BA
+==============================
+
+This document explains how to flash a basic Buildroot system on various
+Atmel boards. Additional details can
+also be found on the Linux4SAM website, in particular here:
+http://www.at91.com/linux4sam/bin/view/Linux4SAM/GettingStarted
+
+This guide covers the following configurations:
+ - at91sam9g45m10ek_defconfig
+ - at91sam9rlek_defconfig
+ - at91sam9x5ek_defconfig (at91sam9g15, at91sam9g25, at91sam9x25,
+   at91sam9g35 and at91sam9x35)
+ - atmel_sama5d3xek_defconfig (sama5d31, sama5d33, sama5d34, sama5d35,
+   sama5d36)
+ - atmel_sama5d3_xplained_defconfig
+ - atmel_sama5d4ek_defconfig
+ - atmel_sama5d4_xplained_defconfig
+
+These configurations will use AT91Bootstrap, u-boot and a linux kernel from
+the git trees maintained by Atmel. They also build u-boot SPL when
+available, it can replace AT91Bootstrap.
+
+
+Configuring and building Buildroot
+----------------------------------
+
+  make <board>_defconfig
+  make
+
+
+Flashing the board
+------------------
+
+Connect the board:
+ o at91sam9g45m10ek: DBGU: J10, USB sam-ba: J14
+ o at91sam9rlek: DBGU: J19, USB sam-ba: J21
+ o at91sam9x5ek: DBGU: J11, USB sam-ba: J20
+ o sama5d3xek: DBGU: J14, USB sam-ba: J20
+ o sama5d3 Xplained: DBGU: J23, USB sam-ba: J6
+ o sama5d4ek: DBGU: J22 or J24, USB sam-ba: J1
+ o sama5d4 Xplained: DBGU: J1, USB sam-ba: J11
+
+Start the board in RomBOOT:
+ o at91sam9g45m10ek:
+    1. open JP8, JP10 and JP12
+    2. start the board
+    3. close JP8, JP10 and JP12
+
+ o at91sam9rlek:
+   1. J11 on 1-2 (BMS=1), open J12 and J13
+   2. start the board
+   3. close J12 and J13
+
+ o at91sam9x5ek:
+   1. open JP9 and:
+      - Cogent: open *NCS jumper
+      - Embest: open SW1
+      - Ronetix: open J1 and J2
+   2. start the board
+   3. close JP9 and:
+      - Cogent: close *NCS jumper
+      - Embest: close SW1 (ON position)
+      - Ronetix: close J1 and J2
+
+ o sama5d3xek:
+   1. start the board
+   2. push BP4 and BP1
+   3. release BP1
+   4. release BP4
+
+ o sama5d3 Xplained:
+   1. open JP5 (NANDCS) and JP6 (SPICS)
+   2. start the board
+   3. close JP5 ans JP6
+
+ o sama5d4ek:
+   1. start the board
+   2. push BP3 and BP4
+   3. release BP4
+   4. release BP3
+
+ o sama5d4 Xplained:
+   1. close JP7 (BOOT_DIS)
+   2. start the board
+   3. open JP7
+
+"RomBOOT" should appear on your console (this should be ttyUSBx or ttyACMx)
+
+Now locate the USB sam-ba interface it should be ttyACMx, usually ttyACM0
+dmesg on your machine should give:
+usb 1-2.1.4: New USB device found, idVendor=03eb, idProduct=6124
+usb 1-2.1.4: New USB device strings: Mfr=0, Product=0, SerialNumber=0
+cdc_acm 1-2.1.4:1.0: ttyACM0: USB ACM device
+
+Look for idVendor=03eb, idProduct=6124, this is the interface you want to use.
+
+You can then flash the board using the provided flasher.sh script in board/atmel:
+
+board/atmel/flasher.sh <builddir_path> <interface> <board>
+
+For example:
+board/atmel/flasher.sh /tmp/atmel_sama5d3_xplained/ /dev/ttyACM0 sama5d3_xplained
+
+Reboot, the system should boot up to the buildroot login invite.
+
-- 
2.1.4
