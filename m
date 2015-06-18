From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Thu, 18 Jun 2015 18:27:58 +0200
Subject: [Buildroot] [PATCH 2/2] zedboard: Upgrade to U-Boot 2015.07
In-Reply-To: <1434644878-595-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
References: <1434644878-595-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <1434644878-595-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Viktorin <viktorin@rehivetech.com>

Until recently, generation of a bootloader for the Avnet
Zedboard (and in general all Xilinx Zynq based boards)
has required to use the development tools by Xilinx
(Vivado, XSDK) and to walk through a quite painful
procedure to generate the First Stage Boot Loader
(FSBL) and the bootable BOOT.BIN image.

This commit makes Buildroot independent on the Xilinx
flow by utilizing U-Boot SPL and booting the Zynq's
PL by U-Boot.

The FSBL generation is not a problem anymore with U-Boot
2015.07 where a generic ps7_init.c file is included and
used to build the U-Boot SPL for various boards including
Zedboard. The ps7_init.c file has been released under
GNU/GPL license for this purpose. For details, see

 http://lists.denx.de/pipermail/u-boot/2015-April/210664.html

To create the BOOT.BIN automatically, there is a script
zynq-boot-bin.py in the Xilinx github repository. This
script is not included in the upstream of U-Boot so
I attach it as a series of patchs (0001-0003) generated
against U-Boot 2015.07.

There is a little catch, the U-Boot 2015.07 is not released
yet, so this commit is based on 2015.07-rc2. However, as
soon as it is out, the download site of U-Boot can be
redirected to the release archive instead of fetching it
by git.

The last patch (0004) creates a Zedboard+Buildroot specific
U-Boot environment to boot smoothly from SD card. It tries
to load a file system.bit into the Zynq's PL (only if it
exists). It is also possible to alter the booting by an
uEnv.txt file located on your SD card. The uEnv.txt is
a plain text file with <key>=<value> pairs one per line.

Steps to create a working Buildroot for Zedboard:

a) use U-Boot 2015.07 (done by this commit)
b) patch it to use zynq-boot-bin.py (done by this commit)
--------------------------
1) make zedboard_defconfig
2) make UBOOT_BIN=u-boot-dtb.img
3) copy files boot.bin, u-boot-dtb.img, rootfs.cpio.uboot,
	uImage, zynq-zed.dtb into your SD card
4) boot your Zedboard

Note that I redefine variable UBOOT_BIN to u-boot-dtb.img
(instead of u-boot.img) to be installed in to the images/
directory. This binary works for the generated SPL:

 U-Boot SPL 2015.07-rc2 (Jun 18 2015 - 16:42:58)
 mmc boot
 reading system.dtb
 spl_load_image_fat_os: error reading image system.dtb, err - -1
 reading u-boot-dtb.img
 reading u-boot-dtb.img

 U-Boot 2015.07-rc2 (Jun 18 2015 - 16:42:58 +0200)

 Model: Zynq ZED Board
 I2C:   ready
 DRAM:  ECC disabled 512 MiB
 MMC:   zynq_sdhci: 0
 Using default environment
 ...

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 board/avnet/zedboard/readme.txt                    |  62 ++---
 ...0001-zynq-Generate-boot.bin-automatically.patch | 258 +++++++++++++++++++++
 ...-use-argparse-module-in-boot.bin-generati.patch |  98 ++++++++
 ...q-Fix-python-version-for-zynq-boot-bin.py.patch |  27 +++
 ...eate-zedboard-specific-U-Boot-environment.patch |  46 ++++
 configs/zedboard_defconfig                         |   5 +-
 6 files changed, 450 insertions(+), 46 deletions(-)
 create mode 100644 board/avnet/zedboard/uboot-2015.07/uboot-0001-zynq-Generate-boot.bin-automatically.patch
 create mode 100644 board/avnet/zedboard/uboot-2015.07/uboot-0002-zynq-Do-not-use-argparse-module-in-boot.bin-generati.patch
 create mode 100644 board/avnet/zedboard/uboot-2015.07/uboot-0003-zynq-Fix-python-version-for-zynq-boot-bin.py.patch
 create mode 100644 board/avnet/zedboard/uboot-2015.07/uboot-0004-zynq-Create-zedboard-specific-U-Boot-environment.patch

diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
index a3f1f3e..0a2883a 100644
--- a/board/avnet/zedboard/readme.txt
+++ b/board/avnet/zedboard/readme.txt
@@ -5,68 +5,42 @@ System-On-Chip.
 Zedboard information including schematics, reference designs, and manuals are
 available from http://www.zedboard.org .
 
-The U-Boot firmware for the Xilinx Zynq All Programmable SoC depends
-on some proprietary code. This dependency consists of a pair of
-files are available from the Xilinx SDK installation.
-
-You will need these files from Xilinx SDK installation to generate
-the U-Boot firmware:
-	ps7_init.c
-	ps7_init.h
-
 Buildroot will create the following files and place them in the
+$ make UBOOT_BIN=u-boot-dtb.img
 <output>/images directory.
 	zynq-zed.dtb
 	rootfs.cpio.uboot
 	uImage
-	u-boot.img
+	u-boot-dtb.img
 	boot.bin
 
-
-uboot.bin  -- U-Boot SPL w/ Xilinx boot.bin wrapper
----------------------------------------------------
-
-Due to licensing issues, the files ps7_init.c/h are not able to be
-distributed with the U-Boot source code.  These files are required to make a
-boot.bin file.
-
-If you already have the Xilinx tools installed, the following sequence will
-unpack, patch and build the rfs, kernel, uboot, and uboot-spl.
-
-make zedboard_defconfig
-make uboot-patch
-cp ${XILINX}/ISE_DS/EDK/sw/lib/hwplatform_templates/zed_hw_platform/ps7_init.{c,h} \
-output/build/uboot-xilinx-v2014.1/board/xilinx/zynq/
-
-After copying these files into the U-Boot source tree, you can
-continue the build with:
-
-make
-
-*Notice*
-While the build will successfully complete without the ps7_init.*
-files,  the uboot.bin file generated by this configuration will not
-function properly on the Zedboard.  Therefore, it is imperative that
-the ps7_init.* files be copied into the U-Boot source tree any time
-the clean, or uboot-dirclean targets are made.
-
+The SPL searchs for u-boot-dtb.img so it is desirable to redefine
+the UBOOT_BIN variable as it was done in the example above.
 
 Resulting system
 ----------------
 A FAT32 partition should be created at the beginning of the SD Card
 and the following files should be installed:
 	/boot.bin
-	/devicetree.dtb
+	/zynq-zed.dtb
 	/uImage
-	/uramdisk.image.gz
-	/u-boot.img
+	/rootfs-cpio.uboot
+	/u-boot-dtb.img
 
 
 All needed files can be taken from output/images/
 
-boot.bin, uImage and u-boot.img are direct copies of the same files
+boot.bin, uImage and u-boot-dtb.img are direct copies of the same files
 available on output/images/
 
-devicetree.dtb is just zynq-zed.dtb renamed.
+The attachedpatchs of U-Boot enables to create boot.bin file
+automatically without the need of Xilinx tools. The U-Boot's
+environment is redefined there to work with Buildroot out-of-the-box.
+
+You can alter the booting procedure by creating a file uEnv.txt
+in the root of the SD card. It is a plain text file in format
+<key>=<value> one per line:
 
-uramdisk.image.gz is rootfs.cpio.uboot renamed
+kernel_image=myimage
+modeboot=myboot
+myboot=...
diff --git a/board/avnet/zedboard/uboot-2015.07/uboot-0001-zynq-Generate-boot.bin-automatically.patch b/board/avnet/zedboard/uboot-2015.07/uboot-0001-zynq-Generate-boot.bin-automatically.patch
new file mode 100644
index 0000000..1a030af
--- /dev/null
+++ b/board/avnet/zedboard/uboot-2015.07/uboot-0001-zynq-Generate-boot.bin-automatically.patch
@@ -0,0 +1,258 @@
+From c6683e9e1dce2da8f6cee62bd5b904b103d032c6 Mon Sep 17 00:00:00 2001
+From: Michal Simek <michal.simek@xilinx.com>
+Date: Mon, 20 Jan 2014 16:06:35 +0100
+Subject: [PATCH 1/4] zynq: Generate boot.bin automatically
+
+Do not spend any time on boot.bin generation.
+
+Signed-off-by: Michal Simek <michal.simek@xilinx.com>
+---
+ Makefile               |   7 ++
+ tools/zynq-boot-bin.py | 210 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 217 insertions(+)
+ create mode 100755 tools/zynq-boot-bin.py
+
+diff --git a/Makefile b/Makefile
+index 0a674bf..ae730b9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -772,6 +772,10 @@ ifneq ($(CONFIG_BUILD_TARGET),)
+ ALL-y += $(CONFIG_BUILD_TARGET:"%"=%)
+ endif
+ 
++ifneq ($(CONFIG_ARCH_ZYNQ),)
++ALL-y += boot.bin
++endif
++
+ LDFLAGS_u-boot += $(LDFLAGS_FINAL)
+ ifneq ($(CONFIG_SYS_TEXT_BASE),)
+ LDFLAGS_u-boot += -Ttext $(CONFIG_SYS_TEXT_BASE)
+@@ -1098,6 +1102,9 @@ OBJCOPYFLAGS_u-boot-with-spl-pbl.bin = -I binary -O binary --pad-to=$(CONFIG_SPL
+ u-boot-with-spl-pbl.bin: spl/u-boot-spl.pbl $(UBOOT_BINLOAD) FORCE
+ 	$(call if_changed,pad_cat)
+ 
++boot.bin: spl/u-boot-spl.bin
++	env python2 tools/zynq-boot-bin.py -o boot.bin -u spl/u-boot-spl.bin
++
+ # PPC4xx needs the SPL at the end of the image, since the reset vector
+ # is located at 0xfffffffc. So we can't use the "u-boot-img.bin" target
+ # and need to introduce a new build target with the full blown U-Boot
+diff --git a/tools/zynq-boot-bin.py b/tools/zynq-boot-bin.py
+new file mode 100755
+index 0000000..a5c11ca
+--- /dev/null
++++ b/tools/zynq-boot-bin.py
+@@ -0,0 +1,210 @@
++#!/usr/bin/env python
++# -*- coding: utf-8 -*-
++# Copyright (C) 2014, Xilinx.inc.
++#
++# Hack origin version and just take the part which generate boot.bin
++# for U-BOOT SPL.
++#
++# Copyright (C) 2013, Elphel.inc.
++# pre-u-boot configuration of the Xilinx Zynq(R) SoC
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation, either version 3 of the License, or
++# (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++__author__ = "Andrey Filippov"
++__copyright__ = "Copyright 2013, Elphel, Inc."
++__license__ = "GPL"
++__version__ = "3.0+"
++__maintainer__ = "Andrey Filippov"
++__email__ = "andrey at elphel.com"
++__status__ = "Development"
++import os
++import struct
++import argparse # http://docs.python.org/2/howto/argparse.html
++
++
++parser = argparse.ArgumentParser()
++parser.add_argument('-o', '--outfile',   help='Path to save the generated boot file')
++parser.add_argument('-u', '--uboot',      help='path to the u-boot.bin to get it\'s length (second pass, when u-boot.bin is already generated)')
++
++args = parser.parse_args()
++#print args
++
++ACCESSIBLE_REGISTERS=((0xe0001000,0xe0001fff), # UART1 controller registers
++                      (0xe000d000,0xe000efff), # QUAD SPI controller registers
++                      (0xe0100004,0xe0100057), # SDIO 0 controller registers
++                      (0xe0100059,0xe0100fff), # SDIO 0 controller registers
++                      (0xe000e000,0xe000efff), # SMC controller
++                      (0xf8006000,0xf8006fff), # DDR controller
++                      # SLCR_LOCK disables all (0xf8000000,0xf8000b74), but it is locked at reset seems to be unlocked, http://www.xilinx.com/support/answers/47570.html
++                      #prohibited: SLCR_SCL, SLCR_LOCK, SLCR_UNLOCK, SLCR_STA
++                      (0xf8000100,0xf80001b0), # SLCR registers
++                      #DOes not seem to be any gap between 0xf80001b0 and 0xf80001b4
++                      (0xf80001b4,0xf80001ff), # SLCR registers
++                      #prohibited SLCR_PSS_RST_CTRL 0xf8000200
++                      (0xf8000204,0xf8000234), # SLCR registers - is  SLCR_SMC_RST_CTRL 0xf8000234 also prohibited?
++                      #prohibited? SLCR_OCM_RST_CTRL 0xf8000238 SLCR_FPGA_RST_CTRL 0xf8000240
++                      (0xf800024c,0xf800024c), # SLCR registers SLCR_AWDT_CTRL - watchdog timer reset control
++                      #prohibited SLSR_REBOOT_STATUS 0xf8000258, SLCR_BOOT_MODE 0xf800025c, SLCR_APU_CTRL 0xf8000300,
++                      (0xf8000304,0xf8000834), # SLCR registers SLCR_AWDT_CLK_SEL,  DDR, MIO
++                      #prohibited SLCR_LVL_SHFTR_ON 0xf8000900, SLCR_OCM_CFG 0xf8000910,
++                      (0xf8000a00,0xf8000a8c), # SLCR registers All shown "reserved" ???
++                      (0xf8000ab0,0xf8000b74)) # SLCR registers iostd, voltages,  - more DDR stuff
++
++def verify_register_accessible(address):
++    for interval in ACCESSIBLE_REGISTERS:
++        if (address >= interval[0]) and (address <= interval[1]):
++            print 'Register accessible:' , hex(interval[0]),'<=', hex(address), '<=', hex(interval[1])
++            return True
++    else:
++        return False
++
++def image_generator (image,
++                       reg_sets, # registers,
++                       options,
++                       user_def,
++                       ocm_offset,
++                       ocm_len,
++                       start_exec):
++    reserved0044=0;
++
++    rfi_word=0xeafffffe #from actual image
++    waddr=0
++    for _ in range (0x20/4):
++        image[waddr]=rfi_word # fill reserved for interrupts fields
++        waddr+=1
++    #width detection
++    image[waddr]=0xaa995566 # offset 0x20
++    waddr+=1
++
++    #image identification
++    image[waddr]=0x584c4e58 # offset 0x24, XLNX
++    waddr+=1
++
++    #encryption status
++    image[waddr]=0x0 # offset 0x28, no encryption
++    waddr+=1
++
++    #User defined word
++    image[waddr]=user_def # offset 0x2c
++    waddr+=1
++
++    #ocm_offset
++    if ocm_offset<0x8c0:
++        print 'Start offset should be >= 0x8c0, specified', hex(ocm_offset)
++        exit (ERROR_DEFS['HEAD'])
++    elif (ocm_offset & 0x3f) != 0:
++        print 'Start offset should be 64-bytes aligned, specified', hex(ocm_offset)
++        exit (ERROR_DEFS['HEAD'])
++    image[waddr]=ocm_offset # offset 0x30
++    waddr+=1
++
++    #ocm_len
++    if ocm_len>0x30000:
++        print 'Loaded to the OCM image should fit into 3 mapped pages of OCM - 192K (0x30000), specified ',hex(ocm_len)
++        exit (ERROR_DEFS['HEAD'])
++    image[waddr]=ocm_len # offset 0x34
++    waddr+=1
++
++    #reserved 0
++    image[waddr]=0 # offset 0x38
++    waddr+=1
++
++    #start_exec
++    if (start_exec>0x30000) or (start_exec<0):
++        print 'Start address is relative to  OCM and should fit there - in 192K (0x30000), specified ',hex(start_exec)
++        exit (ERROR_DEFS['HEAD'])
++    image[waddr]=start_exec # offset 0x3c
++    waddr+=1
++
++    #img_len == ocm_len for unsecure images
++    img_len = ocm_len
++    image[waddr]=img_len # offset 0x40
++    waddr+=1
++
++    #reserved 0
++    image[waddr]=reserved0044 #0  # offset 0x44
++    waddr+=1
++
++    #calculate image checksum
++    def add (x,y): return x+y
++    checksum=(reduce(add,image[0x20/4:0x48/4]) ^ 0xffffffff) & 0xffffffff
++    image[waddr]=checksum # offset 0x48
++    waddr+=1
++    print 'After checksum waddr=',hex(waddr),' byte addr=',hex(4*waddr)
++
++
++    #initialize registers
++    print 'Number of registers to initialize',len(reg_sets)
++    if len (reg_sets)>256:
++        print 'Too many registers to initialize, only 256 allowed,',len(reg_sets),'> 256'
++    waddr=0xa0/4
++    # new_sets.append((addr,data,mask,self.module_name,register_name,self.defs[register_name]))
++
++    for register in reg_sets:
++        op=register[0]
++        addr=register[1]
++        data=register[2]
++        if (op != 's'):
++            raise Exception ('Can not test registers (0x%08x) in RBL, it should be done in user code'%addr)
++        if not verify_register_accessible (addr):
++            print 'Tried to set non-accessible register', hex(addr),' with data ', hex(data)
++            exit (ERROR_DEFS['NONACCESSIBLE_REGISTER'])
++        image[waddr]=addr
++        waddr+=1
++        image[waddr]=data
++        waddr+=1
++    #Fill in FFs for unused registers
++    while waddr < (0x8c0/4):
++        image[waddr]=0xffffffff
++        waddr+=1
++        image[waddr]=0
++        waddr+=1
++
++if (args.uboot):
++    try:
++        uboot_image_len=os.path.getsize(args.uboot)
++        print 'Using %s to get image length - it is %i (0x%x) bytes'%(os.path.abspath(args.uboot),uboot_image_len,uboot_image_len)
++    except:
++        print 'Specified u-boot.bin file: %s (%s) not found'%(args.uboot,os.path.abspath(args.uboot))
++else:
++    uboot_image_len=int(raw_options['CONFIG_EZYNQ_BOOT_OCM_IMAGE_LENGTH'],0)
++    print 'No u-boot.bin path specified, using provided CONFIG_EZYNQ_BOOT_OCM_IMAGE_LENGTH as image size of %i (0x%x) bytes for the RBL header'%(uboot_image_len,uboot_image_len)
++
++image =[ 0 for k in range (0x8c0/4)]
++reg_sets=[]
++num_rbl_regs=0
++
++raw_configs=""
++raw_options={}
++
++
++image_generator (image,
++                 reg_sets[:num_rbl_regs], #
++                 #registers,
++                 raw_options,
++                 0x1010000, # user_def
++                 0x8c0, # ocm_offset,
++                 uboot_image_len, #ocm_len,
++                 0) #start_exec)
++
++if args.outfile:
++    print 'Generating binary output ',os.path.abspath(args.outfile)
++    bf=open(args.outfile,'wb')
++    data=struct.pack('I' * len(image), *image)
++    bf.write(data)
++
++    spl=open(args.uboot,'rb')
++    bf.write(spl.read())
++
++    bf.close()
++    spl.close()
+-- 
+2.4.3
+
diff --git a/board/avnet/zedboard/uboot-2015.07/uboot-0002-zynq-Do-not-use-argparse-module-in-boot.bin-generati.patch b/board/avnet/zedboard/uboot-2015.07/uboot-0002-zynq-Do-not-use-argparse-module-in-boot.bin-generati.patch
new file mode 100644
index 0000000..28dfdca
--- /dev/null
+++ b/board/avnet/zedboard/uboot-2015.07/uboot-0002-zynq-Do-not-use-argparse-module-in-boot.bin-generati.patch
@@ -0,0 +1,98 @@
+From 2ab3f580721e158d04c06e02632f89e4464e6066 Mon Sep 17 00:00:00 2001
+From: Michal Simek <michal.simek@xilinx.com>
+Date: Thu, 30 Jan 2014 11:06:37 +0100
+Subject: [PATCH 2/3] zynq: Do not use argparse module in boot.bin generation
+
+Not all PCs have argparse installed. Use getopt way.
+
+Signed-off-by: Michal Simek <michal.simek@xilinx.com>
+---
+ tools/zynq-boot-bin.py | 53 ++++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 36 insertions(+), 17 deletions(-)
+
+diff --git a/tools/zynq-boot-bin.py b/tools/zynq-boot-bin.py
+index a5c11ca..e35379b 100755
+--- a/tools/zynq-boot-bin.py
++++ b/tools/zynq-boot-bin.py
+@@ -29,15 +29,33 @@ __email__ = "andrey at elphel.com"
+ __status__ = "Development"
+ import os
+ import struct
+-import argparse # http://docs.python.org/2/howto/argparse.html
+-
+-
+-parser = argparse.ArgumentParser()
+-parser.add_argument('-o', '--outfile',   help='Path to save the generated boot file')
+-parser.add_argument('-u', '--uboot',      help='path to the u-boot.bin to get it\'s length (second pass, when u-boot.bin is already generated)')
+-
+-args = parser.parse_args()
+-#print args
++import sys, getopt
++
++inputfile = ''
++outputfile = ''
++argv = sys.argv[1:]
++try:
++  opts, args = getopt.getopt(argv,"hu:o:",["uboot=","outfile="])
++except getopt.GetoptError:
++  print 'test.py -u <inputfile> -o <outputfile>'
++  sys.exit(2)
++
++if len(argv) == 0:
++  print 'test.py -u <inputfile> -o <outputfile>'
++  sys.exit()
++
++for opt, arg in opts:
++  if opt == '-h':
++      print 'test.py -u <inputfile> -o <outputfile>'
++      sys.exit()
++  elif opt in ("-u", "--uboot"):
++      inputfile = arg
++  elif opt in ("-o", "--outfile"):
++      outputfile = arg
++print 'Input file is:', inputfile
++print 'Output file is:', outputfile
++
++exit
+ 
+ ACCESSIBLE_REGISTERS=((0xe0001000,0xe0001fff), # UART1 controller registers
+                       (0xe000d000,0xe000efff), # QUAD SPI controller registers
+@@ -170,12 +188,13 @@ def image_generator (image,
+         image[waddr]=0
+         waddr+=1
+ 
+-if (args.uboot):
++if (inputfile):
+     try:
+-        uboot_image_len=os.path.getsize(args.uboot)
+-        print 'Using %s to get image length - it is %i (0x%x) bytes'%(os.path.abspath(args.uboot),uboot_image_len,uboot_image_len)
++        uboot_image_len=os.path.getsize(inputfile)
++        print 'Using %s to get image length - it is %i (0x%x) bytes'%(os.path.abspath(inputfile),uboot_image_len,uboot_image_len)
+     except:
+-        print 'Specified u-boot.bin file: %s (%s) not found'%(args.uboot,os.path.abspath(args.uboot))
++        print 'Specified u-boot.bin file: %s (%s) not found'%(inputfile,os.path.abspath(inputfile))
++        sys.exit()
+ else:
+     uboot_image_len=int(raw_options['CONFIG_EZYNQ_BOOT_OCM_IMAGE_LENGTH'],0)
+     print 'No u-boot.bin path specified, using provided CONFIG_EZYNQ_BOOT_OCM_IMAGE_LENGTH as image size of %i (0x%x) bytes for the RBL header'%(uboot_image_len,uboot_image_len)
+@@ -197,13 +216,13 @@ image_generator (image,
+                  uboot_image_len, #ocm_len,
+                  0) #start_exec)
+ 
+-if args.outfile:
+-    print 'Generating binary output ',os.path.abspath(args.outfile)
+-    bf=open(args.outfile,'wb')
++if outputfile:
++    print 'Generating binary output ',os.path.abspath(outputfile)
++    bf=open(outputfile,'wb')
+     data=struct.pack('I' * len(image), *image)
+     bf.write(data)
+ 
+-    spl=open(args.uboot,'rb')
++    spl=open(inputfile,'rb')
+     bf.write(spl.read())
+ 
+     bf.close()
+-- 
+2.4.3
+
diff --git a/board/avnet/zedboard/uboot-2015.07/uboot-0003-zynq-Fix-python-version-for-zynq-boot-bin.py.patch b/board/avnet/zedboard/uboot-2015.07/uboot-0003-zynq-Fix-python-version-for-zynq-boot-bin.py.patch
new file mode 100644
index 0000000..f814e87
--- /dev/null
+++ b/board/avnet/zedboard/uboot-2015.07/uboot-0003-zynq-Fix-python-version-for-zynq-boot-bin.py.patch
@@ -0,0 +1,27 @@
+From 4e7271a622e8b202e7d67d1cfd9edf673a8ed676 Mon Sep 17 00:00:00 2001
+From: Jan Viktorin <jan.viktorin@gmail.com>
+Date: Thu, 10 Jul 2014 14:19:43 +0200
+Subject: [PATCH 3/3] zynq: Fix python version for zynq-boot-bin.py
+
+The code does not work when Python 3 is default.
+Enforce using Python 2.
+
+Signed-off-by: Jan Viktorin <jan.viktorin@gmail.com>
+Signed-off-by: Michal Simek <michal.simek@xilinx.com>
+---
+ tools/zynq-boot-bin.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/zynq-boot-bin.py b/tools/zynq-boot-bin.py
+index e35379b..54a0fca 100755
+--- a/tools/zynq-boot-bin.py
++++ b/tools/zynq-boot-bin.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python2
+ # -*- coding: utf-8 -*-
+ # Copyright (C) 2014, Xilinx.inc.
+ #
+-- 
+2.4.3
+
diff --git a/board/avnet/zedboard/uboot-2015.07/uboot-0004-zynq-Create-zedboard-specific-U-Boot-environment.patch b/board/avnet/zedboard/uboot-2015.07/uboot-0004-zynq-Create-zedboard-specific-U-Boot-environment.patch
new file mode 100644
index 0000000..48feeda
--- /dev/null
+++ b/board/avnet/zedboard/uboot-2015.07/uboot-0004-zynq-Create-zedboard-specific-U-Boot-environment.patch
@@ -0,0 +1,46 @@
+From 2c8c419a6e43b31ad596b52eb7dc1a200c51a6df Mon Sep 17 00:00:00 2001
+From: Jan Viktorin <viktorin@rehivetech.com>
+Date: Thu, 18 Jun 2015 16:26:02 +0200
+Subject: [PATCH 4/4] zynq: Create zedboard-specific U-Boot environment
+
+---
+ include/configs/zynq_zed.h | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/include/configs/zynq_zed.h b/include/configs/zynq_zed.h
+index 946de95..2400a88 100644
+--- a/include/configs/zynq_zed.h
++++ b/include/configs/zynq_zed.h
+@@ -24,4 +24,29 @@
+ 
+ #include <configs/zynq-common.h>
+ 
++#undef CONFIG_EXTRA_ENV_SETTINGS
++#define CONFIG_EXTRA_ENV_SETTINGS \
++	"envload=mmc info && if fatload mmc 0 0x1000 uEnv.txt;"\
++	" then echo Importing uEnv.txt; env import -t 0x1000"  \
++	" $filesize; fi;\0"                                    \
++	"bootcmd=run $modeboot\0"                              \
++	"modeboot=sdboot\0"                                    \
++	"baudrate=115200\0"                                    \
++	"bootenv=uEnv.txt\0"                                   \
++	"devicetree_image=zynq-zed.dtb\0"                      \
++	"kernel_image=uImage\0"                                \
++	"ramdisk_image=rootfs.cpio.uboot\0"                    \
++	"fpga_image=system.bit\0"                              \
++	"sdboot=echo Booting from SD...;"                      \
++	" run envload; run fpgaboot;"                          \
++	" fatload mmc 0 0x1000000 ${kernel_image}"             \
++	" && fatload mmc 0 0x2000000 ${ramdisk_image}"         \
++        " && fatload mmc 0 0x3000000 ${devicetree_image}"      \
++	" && bootm 0x1000000 0x2000000 0x3000000\0"            \
++	"fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image};"   \
++	" then echo Booting FPGA from ${fpga_image};"          \
++	" fpga info 0 && fpga loadb 0 0x1000000 $filesize;"    \
++	" else echo FPGA image ${fpga_image} was not found,"   \
++	" skipping...; fi;\0"
++
+ #endif /* __CONFIG_ZYNQ_ZED_H */
+-- 
+2.4.3
+
diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index 76688e9..59aae16 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -19,8 +19,9 @@ BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2014.1"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2015.07-rc2"
+BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/boards/avnet/zedboard/uboot-2015.07"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="boot.bin"
-- 
2.4.3
