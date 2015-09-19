From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:41:13 +0200
Subject: [Buildroot] [git commit] board/boundarydevices: update u-boot
	scripts for 3.14 kernels
Message-ID: <20150919134124.402E37FC34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ebb123893db56ef402a742aca0eeda4224da987
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those scripts will support coming platforms such as iMX6SoloX or
iMX6QuadPlus.

One important change is that the bootscript now relies on U-Boot to
make the display detection in order to simplify the script.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/nitrogen6x/6x_bootscript.txt |  223 ++++++++------------
 board/boundarydevices/nitrogen6x/6x_upgrade.txt    |  106 ++++++----
 2 files changed, 147 insertions(+), 182 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript.txt b/board/boundarydevices/nitrogen6x/6x_bootscript.txt
index ac86fe5..694a9b6 100644
--- a/board/boundarydevices/nitrogen6x/6x_bootscript.txt
+++ b/board/boundarydevices/nitrogen6x/6x_bootscript.txt
@@ -1,186 +1,131 @@
 setenv bootargs ''
 
-if ${fs}load ${dtype} ${disk}:1 10800000 uEnv.txt ; then
-    env import -t 10800000 $filesize
-fi
-
-if itest.s "x" == "x$dtbname" ; then
-	dtbname="imx6";
-	if itest.s x6SOLO == "x$cpu" ; then
-		dtbname=${dtbname}dl-;
-	elif itest.s x6DL == "x$cpu" ; then
-		dtbname=${dtbname}dl-;
+a_script=0x10800000
+a_uImage=0x10800000
+a_fdt=0x13000000
+
+setenv initrd_high 0xffffffff
+if itest.s "x" == "x${dtbname}" ; then
+	if itest.s x6SOLO == "x${cpu}" ; then
+		dtbname=imx6dl-${board}.dtb;
+	elif itest.s x6DL == "x${cpu}" ; then
+		dtbname=imx6dl-${board}.dtb;
+	elif itest.s x6QP == "x${cpu}" ; then
+		dtbname=imx6qp-${board}.dtb;
+	elif itest.s x6SX == "x${cpu}" ; then
+		if itest.s "x1" != "x$m4enabled" ; then
+			dtbname=imx6sx-${board}.dtb;
+		else
+			run m4boot;
+			dtbname=imx6sx-${board}-m4.dtb;
+		fi
+		a_script=0x80800000
+		a_uImage=0x80800000
+		a_fdt=0x83000000
 	else
-		dtbname=${dtbname}q-;
-	fi
-	if itest.s x == "x$board" ; then
-		board=sabrelite
+		dtbname=imx6q-${board}.dtb;
 	fi
-	dtbname=${dtbname}${board}.dtb;
+fi
+
+if load ${dtype} ${disk}:1 ${a_script} uEnv.txt ; then
+    env import -t ${a_script} ${filesize}
 fi
 
 if itest.s x == x${bootdir} ; then
 	bootdir=/boot/
 fi
 
-setenv fdt_addr 0x12000000
-if ${fs}load ${dtype} ${disk}:1 $fdt_addr ${bootdir}$dtbname ; then
-	fdt addr $fdt_addr
+if itest.s x${bootpart} == x ; then
+	bootpart=1
+fi
+
+if load ${dtype} ${disk}:${bootpart} ${a_fdt} ${bootdir}${dtbname} ; then
+	fdt addr ${a_fdt}
 	setenv fdt_high 0xffffffff
 else
-	echo "!!!! Error loading ${bootdir}$dtbname";
+	echo "!!!! Error loading ${bootdir}${dtbname}";
 	exit;
 fi
 
-# ------------------- HDMI detection
-i2c dev 1 ;
-if i2c probe 0x50 ; then
-	echo "------ have HDMI monitor";
-	if itest.s x == x$allow_noncea ; then
-		setenv bootargs $bootargs mxc_hdmi.only_cea=1;
-		echo "only CEA modes allowed on HDMI port";
-	else
-		setenv bootargs $bootargs mxc_hdmi.only_cea=0;
-		echo "non-CEA modes allowed on HDMI, audio may be affected";
-	fi
-else
-	fdt rm hdmi_display
-	echo "------ no HDMI monitor";
-fi
-
-# ------------------- LVDS detection
-if itest.s "x" != "x$lvds_1080p" ; then
-	echo "----- 1080P dual channel LVDS";
-	fdt rm okaya1024x600
-	fdt rm lg1280x800
-	fdt rm hannstar;
-	fdt set ldb split-mode 1
-	fdt set lvds_display interface_pix_fmt "RGB24"
-	fdt set ldb/lvds-channel at 0 fsl,data-width <24>
-else
-	fdt rm ldb split-mode
-	fdt rm lvds1080p
-
-	# -------- LVDS0 (bottom on Nitrogen6_Max)
-	setenv have_lvds
-	i2c dev 2
-	if i2c probe 0x04 ; then
-		echo "------ have Freescale display";
-		setenv have_lvds 1
-	else
-		echo "------ no Freescale display";
-		fdt rm hannstar;
-	fi
+# first enable tfp410
+i2c dev 1
+i2c mw 38 8.1 bd
 
-	if i2c probe 0x38 ; then
-		if itest.s "xLDB-WXGA" == "x$panel"; then
-			screenres=1280,800
-			fdt rm okaya1024x600
-		else
-			screenres=1024,600
-			fdt rm lg1280x800
-		fi
-		setenv have_lvds 1
-		setenv bootargs $bootargs ft5x06_ts.screenres=$screenres
-		if itest.s "x" -ne "x$calibration" ; then
-			setenv bootargs $bootargs ft5x06_ts.calibration=$calibration
-		fi
-	else
-		echo "------ no ft5x06 touch controller";
-		fdt rm okaya1024x600
-		fdt rm lg1280x800
-	fi
-
-	if itest.s "x" == "x$have_lvds"; then
-		fdt rm lvds_display;
-	fi
-
-	# -------- LVDS1 (top on Nitrogen6_Max)
-	if itest.s "xhannstar" == "x$lvds1_panel" ; then
-		echo "configure LVDS1 for Hannstar panel"
-		fdt rm okaya1024x600_2;
-		fdt rm lg1280x800_2;
-		fdt set lvds_display_2 status okay
-	elif itest.s "xokaya1024x600" == "x$lvds1_panel" ; then
-		echo "configure LVDS1 for 1024x600 panel"
-		fdt rm hannstar_2;
-		fdt rm lg1280x800_2;
-		fdt set lvds_display_2 status okay
-	elif itest.s "xlg1280x800" == "x$lvds1_panel" ; then
-		echo "configure LVDS1 for 1280x800 panel"
-		fdt rm hannstar_2;
-		fdt rm okaya1024x600_2;
-		fdt set lvds_display_2 status okay
-	else
-		fdt rm lvds_display_2 ; # ignore errors on boards != 6_max
-	fi
+cmd_xxx_present=
+fdt resize
+if itest.s "x" != "x${cmd_custom}" ; then
+	run cmd_custom
+	cmd_xxx_present=1;
 fi
 
-# ------------------- LCD detection
-setenv have_lcd '';
-if i2c probe 0x48 ; then
-	setenv have_lcd 1;
-	echo "------- found TSC2004 touch controller";
-	if itest.s "x" -eq "x$tsc_calibration" ; then
-		setenv bootargs $bootargs tsc2004.calibration=-67247,-764,272499173,324,69283,-8653010,65536
+if itest.s "x" != "x${cmd_hdmi}" ; then
+	run cmd_hdmi
+	cmd_xxx_present=1;
+	if itest.s x == x${allow_noncea} ; then
+		setenv bootargs ${bootargs} mxc_hdmi.only_cea=1;
+		echo "only CEA modes allowed on HDMI port";
 	else
-		setenv bootargs $bootargs tsc2004.calibration=$tsc_calibration
+		setenv bootargs ${bootargs} mxc_hdmi.only_cea=0;
+		echo "non-CEA modes allowed on HDMI, audio may be affected";
 	fi
-elif i2c probe 0x4d ; then
-	setenv have_lcd 1;
-	echo "------- found AR1020 touch controller";
 fi
 
-if itest.s "x" != "x$ignore_lcd" ; then
-	echo "------ ignoring LCD display";
-	setenv have_lcd '';
+if itest.s "x" != "x${cmd_lcd}" ; then
+	run cmd_lcd
+	cmd_xxx_present=1;
+fi
+if itest.s "x" != "x${cmd_lvds}" ; then
+	run cmd_lvds
+	cmd_xxx_present=1;
+fi
+if itest.s "x" != "x${cmd_lvds2}" ; then
+	run cmd_lvds2
+	cmd_xxx_present=1;
 fi
 
-if itest.s "x" != "x$have_lcd" ; then
-	echo "----- found LCD display";
-else
-	fdt rm lcd_display;
+if itest.s "x" == "x${cmd_xxx_present}" ; then
+	echo "!!!!!!!!!!!!!!!!"
+	echo "warning: your u-boot may be outdated, please upgrade"
+	echo "!!!!!!!!!!!!!!!!"
 fi
 
-setenv bootargs "$bootargs console=ttymxc1,115200 vmalloc=400M consoleblank=0 rootwait"
+setenv bootargs "${bootargs} console=${console},115200 vmalloc=400M consoleblank=0 rootwait fixrtc"
 
-if itest.s x$bootpart == x ; then
-	bootpart=1
-fi
+bpart=1
 
 if test "sata" = "${dtype}" ; then
-	setenv bootargs "$bootargs root=/dev/sda$bootpart" ;
+	setenv bootargs "${bootargs} root=/dev/sda${bpart}" ;
+elif test "usb" = "${dtype}" ; then
+	setenv bootargs "${bootargs} root=/dev/sda${bpart}" ;
 else
-        if test "usb" = "${dtype}" ; then
-                setenv bootargs "$bootargs root=/dev/sda$bootpart" ;
-        elif itest 0 -eq ${disk}; then
-                setenv bootargs "$bootargs root=/dev/mmcblk2p$bootpart" ;
-        else
-                setenv bootargs "$bootargs root=/dev/mmcblk3p$bootpart" ;
-        fi
+	setenv bootargs "${bootargs} root=/dev/mmcblk${disk}p${bpart}"
 fi
 
 if itest.s "x" != "x${disable_giga}" ; then
-	setenv bootargs $bootargs fec.disable_giga=1
+	setenv bootargs ${bootargs} fec.disable_giga=1
+fi
+
+if itest.s "x" != "x${wlmac}" ; then
+	setenv bootargs ${bootargs} wlcore.mac=${wlmac}
 fi
 
-if itest.s "x" != "x$wlmac" ; then
-	setenv bootargs $bootargs wlcore.mac=$wlmac
+if itest.s "x" != "x${gpumem}" ; then
+	setenv bootargs ${bootargs} galcore.contiguousSize=${gpumem}
 fi
 
-if itest.s "x" != "x$gpumem" ; then
-	setenv bootargs $bootargs galcore.contiguousSize=$gpumem
+if itest.s "x" != "x${cma}" ; then
+	setenv bootargs ${bootargs} cma=${cma}
 fi
 
-if itest.s "x" != "x$show_fdt" ; then
+if itest.s "x" != "x${show_fdt}" ; then
 	fdt print /
 fi
 
-if itest.s "x" != "x$show_env" ; then
+if itest.s "x" != "x${show_env}" ; then
 	printenv
 fi
 
-if ${fs}load ${dtype} ${disk}:1 10800000 ${bootdir}uImage ; then
-	bootm 10800000 - $fdt_addr
+if load ${dtype} ${disk}:${bootpart} ${a_uImage} ${bootdir}/uImage ; then
+	bootm ${a_uImage} - ${a_fdt}
 fi
 echo "Error loading kernel image"
diff --git a/board/boundarydevices/nitrogen6x/6x_upgrade.txt b/board/boundarydevices/nitrogen6x/6x_upgrade.txt
index 3f1b96f..9715f16 100644
--- a/board/boundarydevices/nitrogen6x/6x_upgrade.txt
+++ b/board/boundarydevices/nitrogen6x/6x_upgrade.txt
@@ -1,49 +1,69 @@
-if itest.s a$bootfile == a; then
-        bootfile=u-boot.imx
+if itest.s a$uboot_defconfig == a; then
+        echo "Please set uboot_defconfig to the appropriate value"
+        exit
+fi
+
+offset=0x400
+a_uImage1=0x12000000
+a_uImage2=0x12400000
+
+if itest.s x6SX == "x$cpu" ; then
+	a_uImage1=0x82000000
+	a_uImage2=0x82400000
 fi
 
 setenv stdout serial,vga
 echo "check U-Boot" ;
-setenv offset 0x400
-if ${fs}load ${dtype} ${disk}:1 12000000 $bootfile || ${fs}load ${dtype} ${disk}:1 12000000 u-boot.nopadding ; then
-      echo "read $filesize bytes from SD card" ;
-      if sf probe || sf probe || \
-	 sf probe 1 27000000 || sf probe 1 27000000 ; then
-	   echo "probed SPI ROM" ;
-	   if sf read 0x12400000 $offset $filesize ; then
-	       if cmp.b 0x12000000 0x12400000 $filesize ; then
-		   echo "------- U-Boot versions match" ;
-	       else
-		   echo "Need U-Boot upgrade" ;
-		   echo "Program in 5 seconds" ;
-		   for n in 5 4 3 2 1 ; do
-			echo $n ;
-			sleep 1 ;
-		   done
-		   echo "erasing" ;
-		   sf erase 0 0xC0000 ;
-		   # two steps to prevent bricking
-		   echo "programming" ;
-		   sf write 0x12000000 $offset $filesize ;
-		   echo "verifying" ;
-		   if sf read 0x12400000 $offset $filesize ; then
-		       if cmp.b 0x12000000 0x12400000 $filesize ; then
-			   while echo "---- U-Boot upgraded. reset" ; do
-				sleep 120
-			   done
-		       else
-			   echo "Read verification error" ;
-		       fi
-		   else
-			echo "Error re-reading EEPROM" ;
-		   fi
-	       fi
-	   else
-	       echo "Error reading boot loader from EEPROM" ;
-	   fi
-      else
-	   echo "Error initializing EEPROM" ;
-      fi ;
+
+if load ${dtype} ${disk}:1 ${a_uImage1} u-boot.$uboot_defconfig ; then
+else
+	echo "No U-Boot image found on SD card" ;
+	exit
+fi
+echo "read $filesize bytes from SD card" ;
+if sf probe || sf probe || sf probe 1 27000000 || sf probe 1 27000000 ; then
+	echo "probed SPI ROM" ;
+else
+	echo "Error initializing EEPROM" ;
+	exit
+fi ;
+if sf read ${a_uImage2} $offset $filesize ; then
+else
+	echo "Error reading boot loader from EEPROM" ;
+	exit
+fi
+if cmp.b ${a_uImage1} ${a_uImage2} $filesize ; then
+	echo "------- U-Boot versions match" ;
+	exit
+fi
+echo "Need U-Boot upgrade" ;
+echo "Program in 5 seconds" ;
+for n in 5 4 3 2 1 ; do
+	echo $n ;
+	sleep 1 ;
+done
+echo "erasing" ;
+sf erase 0 0xC0000 ;
+
+# two steps to prevent bricking
+echo "programming" ;
+setexpr a1 ${a_uImage1} + 0x400
+setexpr o1 ${offset} + 0x400
+setexpr s1 ${filesize} - 0x400
+sf write ${a1} ${o1} ${s1} ;
+sf write ${a_uImage1} $offset 0x400 ;
+
+echo "verifying" ;
+if sf read ${a_uImage2} $offset $filesize ; then
+else
+	echo "Error re-reading EEPROM" ;
+	exit
+fi
+if cmp.b ${a_uImage1} ${a_uImage2} $filesize ; then
 else
-     echo "No U-Boot image found on SD card" ;
+	echo "Read verification error" ;
+	exit
 fi
+while echo "---- U-Boot upgraded. reset" ; do
+	sleep 120
+done
