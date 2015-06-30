From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 15:00:48 +0200
Subject: [Buildroot] [git commit] atmel: add a flashing helper and
	documentation
Message-ID: <20150630130117.153537FC98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=797a3414b951b90694e83a27bd85978122463337
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provide a flashing helper to properly select the sam-ba configuration
and reuse the sam-ba tcl script provided by Atmel with minimal
modifications.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/atmel/flasher.sh    |  136 +++++++++++++++++
 board/atmel/nandflash.tcl |  358 +++++++++++++++++++++++++++++++++++++++++++++
 board/atmel/readme.txt    |  107 ++++++++++++++
 3 files changed, 601 insertions(+), 0 deletions(-)

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
new file mode 100755
index 0000000..b04b53d
--- /dev/null
+++ b/board/atmel/flasher.sh
@@ -0,0 +1,136 @@
+#!/bin/bash
+
+BUILDIR=$1
+TTY=$2
+BOARD=$3
+
+family_at91sam9g45m10ek="at91sam9m10g45ek"
+mach_at91sam9g45m10ek="at91sam9m10-g45-ek"
+dtb_at91sam9g45m10ek="at91sam9m10g45ek.dtb"
+
+family_at91sam9rlek="at91sam9rlek"
+mach_at91sam9rlek="at91sam9rl64-ek"
+dtb_at91sam9rlek="at91sam9rlek.dtb"
+
+family_at91sam9g15ek="at91sam9x5ek"
+mach_at91sam9g15ek="at91sam9g15-ek"
+dtb_at91sam9g15ek="at91sam9g15ek.dtb"
+
+family_at91sam9g25ek="at91sam9x5ek"
+mach_at91sam9g25ek="at91sam9g25-ek"
+dtb_at91sam9g25ek="at91sam9g25ek.dtb"
+
+family_at91sam9g35ek="at91sam9x5ek"
+mach_at91sam9g35ek="at91sam9g35-ek"
+dtb_at91sam9g35ek="at91sam9g35ek.dtb"
+
+family_at91sam9x25ek="at91sam9x5ek"
+mach_at91sam9x25ek="at91sam9x25-ek"
+dtb_at91sam9x25ek="at91sam9x25ek.dtb"
+
+family_at91sam9x35ek="at91sam9x5ek"
+mach_at91sam9x35ek="at91sam9x35-ek"
+dtb_at91sam9x35ek="at91sam9x35ek.dtb"
+
+family_sama5d31ek="sama5d3xek"
+mach_sama5d31ek="at91sama5d3x-ek"
+dtb_sama5d31ek="sama5d31ek.dtb"
+
+family_sama5d31ek_revc="sama5d3xek"
+mach_sama5d31ek_revc="at91sama5d3x-ek"
+dtb_sama5d31ek_revc="sama5d31ek_revc.dtb"
+
+family_sama5d33ek="sama5d3xek"
+mach_sama5d33ek="at91sama5d3x-ek"
+dtb_sama5d33ek="sama5d33ek.dtb"
+
+family_sama5d33ek_revc="sama5d3xek"
+mach_sama5d33ek_revc="at91sama5d3x-ek"
+dtb_sama5d33ek_revc="sama5d33ek_revc.dtb"
+
+family_sama5d34ek="sama5d3xek"
+mach_sama5d34ek="at91sama5d3x-ek"
+dtb_sama5d34ek="sama5d34ek.dtb"
+
+family_sama5d34ek_revc="sama5d3xek"
+mach_sama5d34ek_revc="at91sama5d3x-ek"
+dtb_sama5d34ek_revc="sama5d34ek_revc.dtb"
+
+family_sama5d35ek="sama5d3xek"
+mach_sama5d35ek="at91sama5d3x-ek"
+dtb_sama5d35ek="sama5d35ek.dtb"
+
+family_sama5d35ek_revc="sama5d3xek"
+mach_sama5d35ek_revc="at91sama5d3x-ek"
+dtb_sama5d35ek_revc="sama5d35ek_revc.dtb"
+
+family_sama5d36ek="sama5d3xek"
+mach_sama5d36ek="at91sama5d3x-ek"
+dtb_sama5d36ek="sama5d36ek.dtb"
+
+family_sama5d36ek_revc="sama5d3xek"
+mach_sama5d36ek_revc="at91sama5d3x-ek"
+dtb_sama5d36ek_revc="sama5d36ek_revc.dtb"
+
+family_sama5d3_xplained="sama5d3_xplained"
+mach_sama5d3_xplained="at91sama5d3x-xplained"
+dtb_sama5d3_xplained="at91-sama5d3_xplained.dtb"
+
+family_sama5d4ek="sama5d4ek"
+mach_sama5d4ek="at91sama5d4x-ek"
+dtb_sama5d4ek="at91-sama5d4ek.dtb"
+
+family_sama5d4_xplained="sama5d4_xplained"
+mach_sama5d4_xplained="at91sama5d4x-ek"
+dtb_sama5d4_xplained="at91-sama5d4_xplained.dtb"
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
+  sama5d31ek
+  sama5d33ek
+  sama5d34ek
+  sama5d35ek
+  sama5d36ek
+  sama5d31ek_revc (Until rev. C)
+  sama5d33ek_revc (Until rev. C)
+  sama5d34ek_revc (Until rev. C)
+  sama5d35ek_revc (Until rev. C)
+  sama5d36ek_revc (Until rev. C)
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
+D="dtb_$BOARD"
+
+if [[ $# != 3 || -z ${!F} ]]; then
+	usage
+	exit 1
+fi
+
+video_mode="video=LVDS-1:800x480-16"
+if [[ $BOARD == "*pda4" ]]; then
+	video_mode="video=LVDS-1:480x272-16"
+fi
+
+echo "Executing: ${!F} O=$1/images $1/host/opt/sam-ba/sam-ba $TTY ${!M} $(dirname $0)/nandflash.tcl -- ${!F} ${!D} $video_mode"
+export O=$1/images
+$1/host/opt/sam-ba/sam-ba $TTY ${!M} $(dirname $0)/nandflash.tcl -- ${!F} ${!D} $video_mode
+
diff --git a/board/atmel/nandflash.tcl b/board/atmel/nandflash.tcl
new file mode 100644
index 0000000..3955b34
--- /dev/null
+++ b/board/atmel/nandflash.tcl
@@ -0,0 +1,358 @@
+# ----------------------------------------------------------------------------
+#         ATMEL Microcontroller
+# ----------------------------------------------------------------------------
+# Copyright (c) 2015, Atmel Corporation
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
+# DBGU address for rm9200, 9260/9g20, 9261/9g10, 9rl, 9x5
+set at91_base_dbgu0 0xfffff200
+# DBGU address for 9263, 9g45, sama5d3
+set at91_base_dbgu1 0xffffee00
+# DBGU address for sama5d4
+set at91_base_dbgu2 0xfc069000
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
+## Find out sama5d4 variant
+array set sama5d4_variant {
+   0x00000001 sama5d41
+   0x00000002 sama5d42
+   0x00000003 sama5d43
+   0x00000004 sama5d44
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
+   global at91_base_dbgu2
+   global arch_exid_offset
+   global at91sam9x5_variant
+   global sama5d3_variant
+   global sama5d4_variant
+   set socName "none"
+
+   switch $boardType {
+      at91sam9x5ek {
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
+      sama5d3xek {
+         set exidAddr [expr {$at91_base_dbgu1 + $arch_exid_offset}]
+         set chip_variant [format "0x%08x" [read_int $exidAddr]]
+
+         foreach {key value} [array get sama5d3_variant] {
+            #puts "-I- === $chip_variant ? $key ($value) ==="
+            if {$key == $chip_variant} {
+               set socName "$value"
+               break;
+            }
+         }
+      }
+      sama5d3_xplained {
+         set exidAddr [expr {$at91_base_dbgu1 + $arch_exid_offset}]
+         set chip_variant [format "0x%08x" [read_int $exidAddr]]
+
+         foreach {key value} [array get sama5d3_variant] {
+            #puts "-I- === $chip_variant ? $key ($value) ==="
+            if {$key == $chip_variant} {
+               set socName "$value"
+               break;
+            }
+         }
+      }
+      sama5d4ek {
+         set exidAddr [expr {$at91_base_dbgu2 + $arch_exid_offset}]
+         set chip_variant [format "0x%08x" [read_int $exidAddr]]
+
+         foreach {key value} [array get sama5d4_variant] {
+            #puts "-I- === $chip_variant ? $key ($value) ==="
+            if {$key == $chip_variant} {
+               set socName "$value"
+               break;
+            }
+         }
+      }
+      sama5d4_xplained {
+         set exidAddr [expr {$at91_base_dbgu2 + $arch_exid_offset}]
+         set chip_variant [format "0x%08x" [read_int $exidAddr]]
+
+         foreach {key value} [array get sama5d4_variant] {
+            #puts "-I- === $chip_variant ? $key ($value) ==="
+            if {$key == $chip_variant} {
+               set socName "$value"
+               break;
+            }
+         }
+      }
+   }
+
+   return "$socName"
+}
+
+proc find_variant_ecc {boardType} {
+   set eccType "none"
+
+   switch $boardType {
+      at91sam9x5ek {
+         set eccType 0xc0c00405
+      }
+      at91sam9n12ek {
+         set eccType 0xc0c00405
+      }
+      sama5d3xek {
+         set eccType 0xc0902405
+      }
+      sama5d3_xplained {
+         set eccType 0xc0902405
+      }
+      sama5d4ek {
+         set eccType 0xc1e04e07
+      }
+      sama5d4_xplained {
+         set eccType 0xc1e04e07
+      }
+   }
+
+   puts "-I- === eccType is $eccType ==="
+   return $eccType
+}
+
+proc get_kernel_load_addr {boardType} {
+   set kernel_load_addr 0x22000000
+
+   switch $boardType {
+      at91sam9m10g45ek {
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
+      at91sam9m10g45ek {
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
+   puts "-I- === Parsing script arguments ==="
+   if {! [info exists env(O)]} {
+      puts "-E- === Binaries path not defined ==="
+      exit
+   }
+
+   set bootstrapFile   "$env(O)/at91bootstrap.bin"
+   set ubootFile       "$env(O)/u-boot.bin"
+   set kernelFile      "$env(O)/zImage"
+   set rootfsFile      "$env(O)/rootfs.ubi"
+   set build_uboot_env "yes"
+
+   set i 1
+   foreach arg $::argv {
+      puts "argument $i is $arg"
+      switch $i {
+         4 { set boardFamily $arg }
+         5 { set dtbFile "$env(O)/$arg" }
+         6 { set videoMode $arg }
+      }
+      incr i
+    }
+}
+
+puts "-I- === Board Family is $boardFamily ==="
+
+set pmeccConfig [find_variant_ecc $boardFamily]
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
+   puts "-E- === Device Tree binary: $dtbFile file not found ==="
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
+set dtbSize	[format "0x%08X" [file size $dtbFile]]
+set bootCmd "bootcmd=nand read $dtbLoadAddr $dtbAddr $dtbSize; nand read $kernelLoadAddr $kernelAddr $kernelSize; bootz $kernelLoadAddr - $dtbLoadAddr"
+set rootfsSize	[format "0x%08X" [file size $rootfsFile]]
+
+lappend u_boot_variables \
+    "bootdelay=1" \
+    "baudrate=115200" \
+    "stdin=serial" \
+    "stdout=serial" \
+    "stderr=serial" \
+    "bootargs=console=ttyS0,115200 mtdparts=atmel_nand:256k(bootstrap)ro,512k(uboot)ro,256k(env),256k(env_redundant),256k(spare),512k(dtb),6M(kernel)ro,-(rootfs) rootfstype=ubifs ubi.mtd=7 root=ubi0:rootfs rw $videoMode" \
+    "$bootCmd"
+
+## Additional files to load
+set ubootEnvFile	"ubootEnvtFileNandFlash.bin"
+
+
+##  Start flashing procedure  ##################################################
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
+puts "-I- === Load AT91Bootstrap in the first sector ==="
+if {$pmeccConfig != "none"} {
+   NANDFLASH::SendBootFilePmeccCmd $bootstrapFile
+} else {
+   NANDFLASH::sendBootFile $bootstrapFile
+}
+
+puts "-I- === Load u-boot in the next sectors ==="
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
+send_file {NandFlash} "$dtbFile" $dtbAddr 0
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
diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
new file mode 100644
index 0000000..539ef66
--- /dev/null
+++ b/board/atmel/readme.txt
@@ -0,0 +1,107 @@
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
+For example, for an out of tree build made in
+/tmp/atmel_sama5d3_xplained/ for the sama5d3 Xplained, you would use:
+board/atmel/flasher.sh /tmp/atmel_sama5d3_xplained/ /dev/ttyACM0 sama5d3_xplained
+
+Reboot, the system should boot up to the buildroot login invite.
+
