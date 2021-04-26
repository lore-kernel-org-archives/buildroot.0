From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 26 Apr 2021 17:30:16 +0200
Subject: [Buildroot] [PATCH 1/4] board/boundarydevices: update boot scripts
In-Reply-To: <20210426153019.1431844-1-gary.bisson@boundarydevices.com>
References: <20210426153019.1431844-1-gary.bisson@boundarydevices.com>
Message-ID: <20210426153019.1431844-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add support for 8M Plus CPU (A1 and A0 silicon)
- Simplify cpu type parsing
- Update to be closer to Yocto counterpart

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/boundarydevices/common/boot.cmd    | 65 ++++++++++++++----------
 board/boundarydevices/common/upgrade.cmd | 25 ++++++---
 2 files changed, 56 insertions(+), 34 deletions(-)

diff --git a/board/boundarydevices/common/boot.cmd b/board/boundarydevices/common/boot.cmd
index dbc3b3c373..2f2bd8d045 100644
--- a/board/boundarydevices/common/boot.cmd
+++ b/board/boundarydevices/common/boot.cmd
@@ -1,17 +1,20 @@
 setenv bootargs ''
 
-setenv initrd_high 0xffffffff
 m4=''
 kernelimage=zImage
 bootcommand=bootz
 a_base=0x10000000
-if itest.s x51 == "x${imx_cpu}" ; then
+
+#grab 1st 2/3 characters of string
+setexpr cpu2 sub "^(..?).*" "\\1" "${imx_cpu}"
+setexpr cpu3 sub "^(..?.?).*" "\\1" "${imx_cpu}"
+if itest.s x51 == "x${cpu2}" ; then
 	a_base=0x90000000
-elif itest.s x53 == "x${imx_cpu}"; then
+elif itest.s x53 == "x${cpu2}"; then
 	a_base=0x70000000
-elif itest.s x6SX == "x${imx_cpu}" || itest.s x6ULL == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
+elif itest.s x6SX == "x${cpu3}" || itest.s x6U == "x${cpu2}" || itest.s x7D == "x${cpu2}"; then
 	a_base=0x80000000
-elif itest.s x8MQ == "x${imx_cpu}" || itest.s x8MM == "x${imx_cpu}" || itest.s x8MMQ == "x${imx_cpu}" || itest.s x8MNano == "x${imx_cpu}"; then
+elif itest.s x8M == "x${cpu2}"; then
 	a_base=0x40000000
 	kernelimage=Image
 	bootcommand=booti
@@ -24,8 +27,7 @@ fi
 setexpr a_script  ${a_base} + 0x00800000
 setexpr a_zImage  ${a_base} + 0x00800000
 setexpr a_fdt     ${a_base} + 0x03000000
-setexpr a_ramdisk ${a_base} + 0x03800000
-setexpr a_initrd  ${a_base} + 0x03a00000
+setexpr a_initrd  ${a_base} + 0x03100000
 setexpr a_reset_cause_marker ${a_base} + 0x80
 setexpr a_reset_cause	     ${a_base} + 0x84
 
@@ -35,30 +37,32 @@ if itest.s "x" == "x${board}" ; then
 fi
 
 if itest.s "x" == "x${fdt_file}" ; then
-	if itest.s x6SOLO == "x${imx_cpu}" ; then
-		fdt_file=imx6dl-${board}.dtb;
-	elif itest.s x6DL == "x${imx_cpu}" ; then
+	if itest.s x51 == "x${cpu2}" ; then
+		fdt_file=imx51-${board}${m4}.dtb;
+	elif itest.s x53 == "x${cpu2}" ; then
+		fdt_file=imx53-${board}${m4}.dtb;
+	elif itest.s x6DL == "x${cpu3}" || itest.s x6SO == "x${cpu3}" ; then
 		fdt_file=imx6dl-${board}.dtb;
-	elif itest.s x6QP == "x${imx_cpu}" ; then
+	elif itest.s x6QP == "x${cpu3}" ; then
 		fdt_file=imx6qp-${board}.dtb;
-	elif itest.s x6SX == "x${imx_cpu}" ; then
+	elif itest.s x6SX == "x${cpu3}" ; then
 		fdt_file=imx6sx-${board}${m4}.dtb;
-	elif itest.s x6ULL == "x${imx_cpu}" ; then
+	elif itest.s x6UL == "x${cpu3}" ; then
 		fdt_file=imx6ull-${board}.dtb;
-	elif itest.s x7D == "x${imx_cpu}" ; then
+	elif itest.s x7D == "x${cpu2}" ; then
 		fdt_file=imx7d-${board}${m4}.dtb;
-	elif itest.s x8MQ == "x${imx_cpu}" ; then
-		fdt_file=imx8mq-${board}${m4}.dtb;
-	elif itest.s x8MM == "x${imx_cpu}" ; then
+	elif itest.s x8MM == "x${cpu3}" ; then
 		fdt_file=imx8mm-${board}${m4}.dtb;
-	elif itest.s x8MMQ == "x${imx_cpu}" ; then
-		fdt_file=imx8mm-${board}${m4}.dtb;
-	elif itest.s x8MNano == "x${imx_cpu}" ; then
+	elif itest.s x8MN == "x${cpu3}" ; then
 		fdt_file=imx8mn-${board}${m4}.dtb;
-	elif itest.s x51 == "x${imx_cpu}" ; then
-		fdt_file=imx51-${board}.dtb;
-	elif itest.s x53 == "x${imx_cpu}" ; then
-		fdt_file=imx53-${board}.dtb;
+	elif itest.s x8MP == "x${cpu3}" ; then
+		if itest *0x30360800 == 0x00824310 ; then
+			fdt_file=imx8mp-a0-${board}${m4}.dtb;
+		else
+			fdt_file=imx8mp-${board}${m4}.dtb;
+		fi
+	elif itest.s x8MQ == "x${cpu3}" ; then
+		fdt_file=imx8mq-${board}${m4}.dtb;
 	else
 		fdt_file=imx6q-${board}.dtb;
 	fi
@@ -71,11 +75,20 @@ fi
 if load ${devtype} ${devnum}:${distro_bootpart} ${a_script} uEnv.txt ; then
     env import -t ${a_script} ${filesize}
 fi
-setenv bootargs ${bootargs} console=${console},115200 vmalloc=400M consoleblank=0 rootwait fixrtc cpu=${imx_cpu} board=${board}
+
+if itest.s x${console} != x ; then
+	setenv bootargs ${bootargs} console=${console},115200
+fi
+if itest.s "x" == "x$vmalloc" ; then
+	vmalloc=400M
+fi
+if itest.s x${consoleblank} == x ; then
+	consoleblank=0
+fi
+setenv bootargs ${bootargs} vmalloc=${vmalloc} consoleblank=${consoleblank} rootwait fixrtc cpu=${imx_cpu} board=${board} uboot_release=${uboot_release}
 
 if load ${devtype} ${devnum}:${distro_bootpart} ${a_fdt} ${prefix}${fdt_file} ; then
 	fdt addr ${a_fdt}
-	setenv fdt_high 0xffffffff
 else
 	echo "!!!! Error loading ${prefix}${fdt_file}";
 	exit;
diff --git a/board/boundarydevices/common/upgrade.cmd b/board/boundarydevices/common/upgrade.cmd
index ce32d77b5b..a26bacd9aa 100644
--- a/board/boundarydevices/common/upgrade.cmd
+++ b/board/boundarydevices/common/upgrade.cmd
@@ -9,18 +9,24 @@ qspi_offset=0x0
 a_base=0x12000000
 block_size=0x200
 
-if itest.s x51 == "x${imx_cpu}"; then
+#grab 1st 2/3 characters of string
+setexpr cpu2 sub "^(..?).*" "\\1" "${imx_cpu}"
+setexpr cpu3 sub "^(..?.?).*" "\\1" "${imx_cpu}"
+if itest.s x51 == "x${cpu2}"; then
 	a_base=0x92000000
-elif itest.s x53 == "x${imx_cpu}"; then
+elif itest.s x53 == "x${cpu2}"; then
 	a_base=0x72000000
-elif itest.s x6SX == "x${imx_cpu}" || itest.s x6ULL == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
+elif itest.s x6SX == "x${cpu3}" || itest.s x6U == "x${cpu2}" || itest.s x7D == "x${cpu2}"; then
 	a_base=0x82000000
-elif itest.s x8MQ == "x${imx_cpu}" || itest.s x8MM == "x${imx_cpu}" || itest.s x8MMQ == "x${imx_cpu}"; then
+elif itest.s x8M == "x${cpu2}"; then
 	a_base=0x42000000
 	offset=0x8400
-elif itest.s x8MNano == "x${imx_cpu}"; then
-	a_base=0x42000000
-	offset=0x8000
+	if itest.s x8MN == "x${cpu3}" || itest.s x8MP == "x${cpu3}"; then
+		offset=0x8000
+		if itest ${env_part} != 0 ; then
+			offset=0x0
+		fi
+	fi
 fi
 
 qspi_match=1
@@ -30,7 +36,10 @@ setexpr a_uImage1 ${a_qspi1} + 0x400
 setexpr a_uImage2 ${a_qspi2} + 0x400
 setexpr a_script ${a_base}
 
-setenv stdout serial,vga
+if itest.s "x${vidconsole}" == "x" ; then
+	vidconsole=vga
+fi
+setenv stdout serial,${vidconsole}
 
 if itest.s "x${sfname}" == "x" ; then
 # U-Boot resides in (e)MMC
-- 
2.30.2
