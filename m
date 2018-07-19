From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 15:43:26 +0200
Subject: [Buildroot] [git commit] board/boundarydevices: add i.MX8MQ support
 to u-boot scripts
Message-ID: <20180719133857.E844988EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdc2246149bdddc96aa93cd43fcf14412353cf3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update RAM address
- Update kernel image name for ARM64
- Update U-Boot boot command for ARM64
- Remove obsolete cmd_xxx_present check
- Remove obsolete wlan.mac parameter
- Add cmd_mipi command for MIPI-DSI interface

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/boundarydevices/common/boot.cmd    | 40 +++++++++---------
 board/boundarydevices/common/upgrade.cmd | 69 +++++++++++++++++++++++++++++---
 2 files changed, 81 insertions(+), 28 deletions(-)

diff --git a/board/boundarydevices/common/boot.cmd b/board/boundarydevices/common/boot.cmd
index 7602b0139e..760363da9b 100644
--- a/board/boundarydevices/common/boot.cmd
+++ b/board/boundarydevices/common/boot.cmd
@@ -2,6 +2,8 @@ setenv bootargs ''
 
 setenv initrd_high 0xffffffff
 m4=''
+kernelimage=zImage
+bootcommand=bootz
 a_base=0x10000000
 if itest.s x51 == "x${imx_cpu}" ; then
 	a_base=0x90000000
@@ -9,10 +11,14 @@ elif itest.s x53 == "x${imx_cpu}"; then
 	a_base=0x70000000
 elif itest.s x6SX == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
 	a_base=0x80000000
-	if itest.s "x1" == "x$m4enabled" ; then
-		run m4boot;
-		m4='-m4';
-	fi
+elif itest.s x8MQ == "x${imx_cpu}"; then
+	a_base=0x40000000
+	kernelimage=Image
+	bootcommand=booti
+fi
+if itest.s "x1" == "x${m4enabled}" ; then
+	run m4boot;
+	m4='-m4';
 fi
 
 setexpr a_script  ${a_base} + 0x00800000
@@ -39,10 +45,12 @@ if itest.s "x" == "x${fdt_file}" ; then
 		fdt_file=imx6sx-${board}${m4}.dtb;
 	elif itest.s x7D == "x${imx_cpu}" ; then
 		fdt_file=imx7d-${board}${m4}.dtb;
+	elif itest.s x8MQ == "x${imx_cpu}" ; then
+		fdt_file=imx8mq-${board}${m4}.dtb;
 	elif itest.s x51 == "x${imx_cpu}" ; then
-		fdt_file=imx51-${board}${m4}.dtb;
+		fdt_file=imx51-${board}.dtb;
 	elif itest.s x53 == "x${imx_cpu}" ; then
-		fdt_file=imx53-${board}${m4}.dtb;
+		fdt_file=imx53-${board}.dtb;
 	else
 		fdt_file=imx6q-${board}.dtb;
 	fi
@@ -66,16 +74,12 @@ else
 	exit;
 fi
 
-cmd_xxx_present=
 fdt resize
 if itest.s "x" != "x${cmd_custom}" ; then
 	run cmd_custom
-	cmd_xxx_present=1;
 fi
-
 if itest.s "x" != "x${cmd_hdmi}" ; then
 	run cmd_hdmi
-	cmd_xxx_present=1;
 	if itest.s x == x${allow_noncea} ; then
 		setenv bootargs ${bootargs} mxc_hdmi.only_cea=1;
 		echo "only CEA modes allowed on HDMI port";
@@ -87,25 +91,18 @@ fi
 
 if itest.s "x" != "x${cmd_lcd}" ; then
 	run cmd_lcd
-	cmd_xxx_present=1;
 fi
 if itest.s "x" != "x${cmd_lcd2}" ; then
 	run cmd_lcd2
-	cmd_xxx_present=1;
 fi
 if itest.s "x" != "x${cmd_lvds}" ; then
 	run cmd_lvds
-	cmd_xxx_present=1;
 fi
 if itest.s "x" != "x${cmd_lvds2}" ; then
 	run cmd_lvds2
-	cmd_xxx_present=1;
 fi
-
-if itest.s "x" == "x${cmd_xxx_present}" ; then
-	echo "!!!!!!!!!!!!!!!!"
-	echo "warning: your u-boot may be outdated, please upgrade"
-	echo "!!!!!!!!!!!!!!!!"
+if itest.s "x" != "x${cmd_mipi}" ; then
+	run cmd_mipi
 fi
 
 if test "sata" = "${devtype}" ; then
@@ -126,7 +123,6 @@ fi
 
 if itest.s "x" != "x${wlmac}" ; then
 	setenv bootargs ${bootargs} wlcore.mac=${wlmac}
-	setenv bootargs ${bootargs} wlan.mac=${wlmac}
 fi
 
 if itest.s "x" != "x${gpumem}" ; then
@@ -149,7 +145,7 @@ if itest.s "x" != "x${show_env}" ; then
 	printenv
 fi
 
-if load ${devtype} ${devnum}:${distro_bootpart} ${a_zImage} ${prefix}zImage ; then
-	bootz ${a_zImage} - ${a_fdt}
+if load ${devtype} ${devnum}:${distro_bootpart} ${a_zImage} ${prefix}${kernelimage} ; then
+	${bootcommand} ${a_zImage} - ${a_fdt}
 fi
 echo "Error loading kernel image"
diff --git a/board/boundarydevices/common/upgrade.cmd b/board/boundarydevices/common/upgrade.cmd
index 249185dba4..24b705eb76 100644
--- a/board/boundarydevices/common/upgrade.cmd
+++ b/board/boundarydevices/common/upgrade.cmd
@@ -7,6 +7,7 @@ offset=0x400
 erase_size=0xC0000
 qspi_offset=0x0
 a_base=0x12000000
+block_size=0x200
 
 if itest.s x51 == "x${imx_cpu}"; then
 	a_base=0x92000000
@@ -14,6 +15,9 @@ elif itest.s x53 == "x${imx_cpu}"; then
 	a_base=0x72000000
 elif itest.s x6SX == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
 	a_base=0x82000000
+elif itest.s x8MQ == "x${imx_cpu}"; then
+	a_base=0x42000000
+	offset=0x8400
 fi
 
 qspi_match=1
@@ -25,6 +29,54 @@ setexpr a_script ${a_base}
 
 setenv stdout serial,vga
 
+if itest.s "x${sfname}" == "x" ; then
+# U-Boot resides in (e)MMC
+if itest.s "x${env_dev}" == "x" || itest.s "x${env_part}" == "x"; then
+        echo "Please set env_dev/part to the appropriate values"
+        exit
+fi
+
+# Load bootloader binary for this board
+if ${fs}load ${devtype} ${devnum}:${distro_bootpart} ${a_uImage1} u-boot.$uboot_defconfig ; then
+else
+	echo "File u-boot.$uboot_defconfig not found on SD card" ;
+	exit
+fi
+
+# Compute block count for filesize and offset
+setexpr cntoffset ${offset} / ${block_size}
+setexpr cntfile ${filesize} / ${block_size}
+# Add 1 in case the $filesize is not a multiple of $block_size
+setexpr cntfile ${cntfile} + 1
+
+# Select media partition (if different from main partition)
+mmc dev ${env_dev} ${env_part}
+
+# Read and compare current U-Boot
+mmc read ${a_uImage2} ${cntoffset} ${cntfile}
+if cmp.b ${a_uImage1} ${a_uImage2} ${filesize} ; then
+	echo "------- U-Boot versions match" ;
+	exit ;
+fi
+
+echo "Need U-Boot upgrade" ;
+echo "Program in 5 seconds" ;
+for n in 5 4 3 2 1 ; do
+	echo $n ;
+	sleep 1 ;
+done
+mmc write ${a_uImage1} ${cntoffset} ${cntfile}
+
+# Make sure to boot from the proper partition
+if itest ${env_part} != 0 ; then
+	mmc partconf ${env_dev} 1 ${env_part} 0
+fi
+
+# Switch back to main eMMC partition (to avoid confusion)
+mmc dev ${env_dev}
+
+else
+# U-Boot resides in NOR flash
 if sf probe || sf probe || sf probe 1 27000000 || sf probe 1 27000000 ; then
 	echo "probed SPI ROM" ;
 else
@@ -32,9 +84,13 @@ else
 	exit
 fi
 
+if itest.s "x${sfname}" == "xat45db041d" ; then
+	erase_size=0x7e000
+fi
+
 if itest.s x7D == "x${imx_cpu}"; then
 	echo "check qspi parameter block" ;
-	if ${fs}load ${devtype} ${devnum}:1 ${a_qspi1} qspi-${sfname}.${uboot_defconfig} ; then
+	if ${fs}load ${devtype} ${devnum}:${distro_bootpart} ${a_qspi1} qspi-${sfname}.${uboot_defconfig} ; then
 	else
 		echo "parameter file qspi-${sfname}.${uboot_defconfig} not found on SD card"
 		exit
@@ -63,7 +119,7 @@ fi
 
 echo "check U-Boot" ;
 
-if ${fs}load ${devtype} ${devnum}:1 ${a_uImage1} u-boot.$uboot_defconfig ; then
+if ${fs}load ${devtype} ${devnum}:${distro_bootpart} ${a_uImage1} u-boot.$uboot_defconfig ; then
 else
 	echo "File u-boot.$uboot_defconfig not found on SD card" ;
 	exit
@@ -80,7 +136,7 @@ if cmp.b ${a_uImage1} ${a_uImage2} $filesize ; then
 	if itest.s "${qspi_match}" == "1" ; then
 		echo "------- upgrade not needed" ;
 		if itest.s "x" != "x${next}" ; then
-			if ${fs}load ${devtype} ${devnum}:1 ${a_script} ${next} ; then
+			if ${fs}load ${devtype} ${devnum}:${distro_bootpart} ${a_script} ${next} ; then
 				source ${a_script}
 			else
 				echo "${next} not found on SD card"
@@ -142,13 +198,14 @@ if itest.s x7D == "x${imx_cpu}"; then
 fi
 
 if itest.s "x" != "x${next}" ; then
-	if ${fs}load ${devtype} ${devnum}:1 ${a_script} ${next} ; then
+	if ${fs}load ${devtype} ${devnum}:${distro_bootpart} ${a_script} ${next} ; then
 		source ${a_script}
 	else
-		echo "${next} not found on ${devtype} ${devnum}"
+		echo "${next} not found on ${devtype} ${devnum}:${distro_bootpart}"
 	fi
 fi
+fi
 
-while echo "---- U-Boot upgraded. reset" ; do
+while echo "---- U-Boot upgraded. Please reset the board" ; do
 	sleep 120
 done
