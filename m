From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 19 Jul 2018 09:32:51 +0200
Subject: [Buildroot] [PATCH 3/5] board/boundarydevices: remove obsolete
 u-boot scripts
In-Reply-To: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
Message-ID: <20180719073253.22433-4-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- 6x_bootscript/6x_upgrade have been deprecated for more than a year

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 .../boundarydevices/common/6x_bootscript.txt  | 131 ------------------
 board/boundarydevices/common/6x_upgrade.txt   |  69 ---------
 2 files changed, 200 deletions(-)
 delete mode 100644 board/boundarydevices/common/6x_bootscript.txt
 delete mode 100644 board/boundarydevices/common/6x_upgrade.txt

diff --git a/board/boundarydevices/common/6x_bootscript.txt b/board/boundarydevices/common/6x_bootscript.txt
deleted file mode 100644
index af5822a88b..0000000000
--- a/board/boundarydevices/common/6x_bootscript.txt
+++ /dev/null
@@ -1,131 +0,0 @@
-setenv bootargs ''
-
-if itest.s x6SX == "x${cpu}" || itest.s x7D == "x${cpu}"; then
-	a_script=0x80800000
-	a_zImage=0x80800000
-	a_fdt=0x83000000
-	m4=''
-	if itest.s "x1" == "x$m4enabled" ; then
-		run m4boot;
-		m4='-m4';
-	fi
-else
-	a_script=0x10800000
-	a_zImage=0x10800000
-	a_fdt=0x13000000
-fi
-
-setenv initrd_high 0xffffffff
-if itest.s "x" == "x${dtbname}" ; then
-	if itest.s x6SOLO == "x${cpu}" ; then
-		dtbname=imx6dl-${board}.dtb;
-	elif itest.s x6DL == "x${cpu}" ; then
-		dtbname=imx6dl-${board}.dtb;
-	elif itest.s x6QP == "x${cpu}" ; then
-		dtbname=imx6qp-${board}.dtb;
-	elif itest.s x6SX == "x${cpu}" ; then
-		dtbname=imx6sx-${board}${m4}.dtb;
-	elif itest.s x7D == "x${cpu}" ; then
-		dtbname=imx7d-${board}${m4}.dtb;
-	else
-		dtbname=imx6q-${board}.dtb;
-	fi
-fi
-
-if load ${dtype} ${disk}:1 ${a_script} uEnv.txt ; then
-    env import -t ${a_script} ${filesize}
-fi
-
-if itest.s x == x${bootdir} ; then
-	bootdir=/boot/
-fi
-
-if itest.s x${bootpart} == x ; then
-	bootpart=1
-fi
-
-if load ${dtype} ${disk}:${bootpart} ${a_fdt} ${bootdir}${dtbname} ; then
-	fdt addr ${a_fdt}
-	setenv fdt_high 0xffffffff
-else
-	echo "!!!! Error loading ${bootdir}${dtbname}";
-	exit;
-fi
-
-cmd_xxx_present=
-fdt resize
-if itest.s "x" != "x${cmd_custom}" ; then
-	run cmd_custom
-	cmd_xxx_present=1;
-fi
-
-if itest.s "x" != "x${cmd_hdmi}" ; then
-	run cmd_hdmi
-	cmd_xxx_present=1;
-	if itest.s x == x${allow_noncea} ; then
-		setenv bootargs ${bootargs} mxc_hdmi.only_cea=1;
-		echo "only CEA modes allowed on HDMI port";
-	else
-		setenv bootargs ${bootargs} mxc_hdmi.only_cea=0;
-		echo "non-CEA modes allowed on HDMI, audio may be affected";
-	fi
-fi
-
-if itest.s "x" != "x${cmd_lcd}" ; then
-	run cmd_lcd
-	cmd_xxx_present=1;
-fi
-if itest.s "x" != "x${cmd_lvds}" ; then
-	run cmd_lvds
-	cmd_xxx_present=1;
-fi
-if itest.s "x" != "x${cmd_lvds2}" ; then
-	run cmd_lvds2
-	cmd_xxx_present=1;
-fi
-
-if itest.s "x" == "x${cmd_xxx_present}" ; then
-	echo "!!!!!!!!!!!!!!!!"
-	echo "warning: your u-boot may be outdated, please upgrade"
-	echo "!!!!!!!!!!!!!!!!"
-fi
-
-setenv bootargs "${bootargs} console=${console},115200 vmalloc=400M consoleblank=0 rootwait fixrtc"
-
-if test "sata" = "${dtype}" ; then
-	setenv bootargs "${bootargs} root=/dev/sda${bootpart}" ;
-elif test "usb" = "${dtype}" ; then
-	setenv bootargs "${bootargs} root=/dev/sda${bootpart}" ;
-else
-	setenv bootargs "${bootargs} root=/dev/mmcblk${disk}p${bootpart}"
-fi
-
-if itest.s "x" != "x${disable_giga}" ; then
-	setenv bootargs ${bootargs} fec.disable_giga=1
-fi
-
-if itest.s "x" != "x${wlmac}" ; then
-	setenv bootargs ${bootargs} wlcore.mac=${wlmac}
-	setenv bootargs ${bootargs} wlan.mac=${wlmac}
-fi
-
-if itest.s "x" != "x${gpumem}" ; then
-	setenv bootargs ${bootargs} galcore.contiguousSize=${gpumem}
-fi
-
-if itest.s "x" != "x${cma}" ; then
-	setenv bootargs ${bootargs} cma=${cma}
-fi
-
-if itest.s "x" != "x${show_fdt}" ; then
-	fdt print /
-fi
-
-if itest.s "x" != "x${show_env}" ; then
-	printenv
-fi
-
-if load ${dtype} ${disk}:${bootpart} ${a_zImage} ${bootdir}/zImage ; then
-	bootz ${a_zImage} - ${a_fdt}
-fi
-echo "Error loading kernel image"
diff --git a/board/boundarydevices/common/6x_upgrade.txt b/board/boundarydevices/common/6x_upgrade.txt
deleted file mode 100644
index e012ff97ac..0000000000
--- a/board/boundarydevices/common/6x_upgrade.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-if itest.s a$uboot_defconfig == a; then
-        echo "Please set uboot_defconfig to the appropriate value"
-        exit
-fi
-
-offset=0x400
-a_uImage1=0x12000000
-a_uImage2=0x12400000
-
-if itest.s x6SX == "x${cpu}" || itest.s x7D == "x${cpu}"; then
-	a_uImage1=0x82000000
-	a_uImage2=0x82400000
-fi
-
-setenv stdout serial,vga
-echo "check U-Boot" ;
-
-if load ${dtype} ${disk}:1 ${a_uImage1} u-boot.$uboot_defconfig ; then
-else
-	echo "No U-Boot image found on SD card" ;
-	exit
-fi
-echo "read $filesize bytes from SD card" ;
-if sf probe || sf probe || sf probe 1 27000000 || sf probe 1 27000000 ; then
-	echo "probed SPI ROM" ;
-else
-	echo "Error initializing EEPROM" ;
-	exit
-fi ;
-if sf read ${a_uImage2} $offset $filesize ; then
-else
-	echo "Error reading boot loader from EEPROM" ;
-	exit
-fi
-if cmp.b ${a_uImage1} ${a_uImage2} $filesize ; then
-	echo "------- U-Boot versions match" ;
-	exit
-fi
-echo "Need U-Boot upgrade" ;
-echo "Program in 5 seconds" ;
-for n in 5 4 3 2 1 ; do
-	echo $n ;
-	sleep 1 ;
-done
-echo "erasing" ;
-sf erase 0 0xC0000 ;
-
-# two steps to prevent bricking
-echo "programming" ;
-setexpr a1 ${a_uImage1} + 0x400
-setexpr o1 ${offset} + 0x400
-setexpr s1 ${filesize} - 0x400
-sf write ${a1} ${o1} ${s1} ;
-sf write ${a_uImage1} $offset 0x400 ;
-
-echo "verifying" ;
-if sf read ${a_uImage2} $offset $filesize ; then
-else
-	echo "Error re-reading EEPROM" ;
-	exit
-fi
-if cmp.b ${a_uImage1} ${a_uImage2} $filesize ; then
-else
-	echo "Read verification error" ;
-	exit
-fi
-while echo "---- U-Boot upgraded. reset" ; do
-	sleep 120
-done
-- 
2.18.0
