From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:48:56 +0100
Subject: [Buildroot] [git commit] configs: nitrogen*: bump u-boot version to
 2017.07
Message-ID: <20180107144906.8A93C802F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=505ae63b60ffa14789512511fdec30cb9a10bfda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also include new boot scripts to match standard distro uboot commands.

Our previous 6x_bootscript and 6x_upgrade used custom variables and
their naming don't make sense now that we target more than i.MX6 CPU.

Therefore those old scripts are marked as legacy and kept for now but
the goal is to deprecate and remove them later.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/common/boot.cmd      | 155 +++++++++++++++++++++++++++++
 board/boundarydevices/common/post-build.sh |   7 +-
 board/boundarydevices/common/upgrade.cmd   | 154 ++++++++++++++++++++++++++++
 configs/nitrogen6sx_defconfig              |  11 +-
 configs/nitrogen6x_defconfig               |  11 +-
 configs/nitrogen7_defconfig                |  11 +-
 6 files changed, 336 insertions(+), 13 deletions(-)

diff --git a/board/boundarydevices/common/boot.cmd b/board/boundarydevices/common/boot.cmd
new file mode 100644
index 0000000..7602b01
--- /dev/null
+++ b/board/boundarydevices/common/boot.cmd
@@ -0,0 +1,155 @@
+setenv bootargs ''
+
+setenv initrd_high 0xffffffff
+m4=''
+a_base=0x10000000
+if itest.s x51 == "x${imx_cpu}" ; then
+	a_base=0x90000000
+elif itest.s x53 == "x${imx_cpu}"; then
+	a_base=0x70000000
+elif itest.s x6SX == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
+	a_base=0x80000000
+	if itest.s "x1" == "x$m4enabled" ; then
+		run m4boot;
+		m4='-m4';
+	fi
+fi
+
+setexpr a_script  ${a_base} + 0x00800000
+setexpr a_zImage  ${a_base} + 0x00800000
+setexpr a_fdt     ${a_base} + 0x03000000
+setexpr a_ramdisk ${a_base} + 0x03800000
+setexpr a_initrd  ${a_base} + 0x03a00000
+setexpr a_reset_cause_marker ${a_base} + 0x80
+setexpr a_reset_cause	     ${a_base} + 0x84
+
+if itest.s "x" == "x${board}" ; then
+	echo "!!!! Error: Your u-boot is outdated. Please upgrade.";
+	exit;
+fi
+
+if itest.s "x" == "x${fdt_file}" ; then
+	if itest.s x6SOLO == "x${imx_cpu}" ; then
+		fdt_file=imx6dl-${board}.dtb;
+	elif itest.s x6DL == "x${imx_cpu}" ; then
+		fdt_file=imx6dl-${board}.dtb;
+	elif itest.s x6QP == "x${imx_cpu}" ; then
+		fdt_file=imx6qp-${board}.dtb;
+	elif itest.s x6SX == "x${imx_cpu}" ; then
+		fdt_file=imx6sx-${board}${m4}.dtb;
+	elif itest.s x7D == "x${imx_cpu}" ; then
+		fdt_file=imx7d-${board}${m4}.dtb;
+	elif itest.s x51 == "x${imx_cpu}" ; then
+		fdt_file=imx51-${board}${m4}.dtb;
+	elif itest.s x53 == "x${imx_cpu}" ; then
+		fdt_file=imx53-${board}${m4}.dtb;
+	else
+		fdt_file=imx6q-${board}.dtb;
+	fi
+fi
+
+if itest.s x${distro_bootpart} == x ; then
+	distro_bootpart=1
+fi
+
+if load ${devtype} ${devnum}:${distro_bootpart} ${a_script} uEnv.txt ; then
+    env import -t ${a_script} ${filesize}
+fi
+
+setenv bootargs ${bootargs} console=${console},115200 vmalloc=400M consoleblank=0 rootwait fixrtc cpu=${imx_cpu} board=${board}
+
+if load ${devtype} ${devnum}:${distro_bootpart} ${a_fdt} ${prefix}${fdt_file} ; then
+	fdt addr ${a_fdt}
+	setenv fdt_high 0xffffffff
+else
+	echo "!!!! Error loading ${prefix}${fdt_file}";
+	exit;
+fi
+
+cmd_xxx_present=
+fdt resize
+if itest.s "x" != "x${cmd_custom}" ; then
+	run cmd_custom
+	cmd_xxx_present=1;
+fi
+
+if itest.s "x" != "x${cmd_hdmi}" ; then
+	run cmd_hdmi
+	cmd_xxx_present=1;
+	if itest.s x == x${allow_noncea} ; then
+		setenv bootargs ${bootargs} mxc_hdmi.only_cea=1;
+		echo "only CEA modes allowed on HDMI port";
+	else
+		setenv bootargs ${bootargs} mxc_hdmi.only_cea=0;
+		echo "non-CEA modes allowed on HDMI, audio may be affected";
+	fi
+fi
+
+if itest.s "x" != "x${cmd_lcd}" ; then
+	run cmd_lcd
+	cmd_xxx_present=1;
+fi
+if itest.s "x" != "x${cmd_lcd2}" ; then
+	run cmd_lcd2
+	cmd_xxx_present=1;
+fi
+if itest.s "x" != "x${cmd_lvds}" ; then
+	run cmd_lvds
+	cmd_xxx_present=1;
+fi
+if itest.s "x" != "x${cmd_lvds2}" ; then
+	run cmd_lvds2
+	cmd_xxx_present=1;
+fi
+
+if itest.s "x" == "x${cmd_xxx_present}" ; then
+	echo "!!!!!!!!!!!!!!!!"
+	echo "warning: your u-boot may be outdated, please upgrade"
+	echo "!!!!!!!!!!!!!!!!"
+fi
+
+if test "sata" = "${devtype}" ; then
+	setenv bootargs "${bootargs} root=/dev/sda${distro_bootpart}" ;
+elif test "usb" = "${devtype}" ; then
+	setenv bootargs "${bootargs} root=/dev/sda${distro_bootpart}" ;
+else
+	setenv bootargs "${bootargs} root=/dev/mmcblk${devnum}p${distro_bootpart}"
+fi
+
+if itest.s "x" != "x${disable_msi}" ; then
+	setenv bootargs ${bootargs} pci=nomsi
+fi;
+
+if itest.s "x" != "x${disable_giga}" ; then
+	setenv bootargs ${bootargs} fec.disable_giga=1
+fi
+
+if itest.s "x" != "x${wlmac}" ; then
+	setenv bootargs ${bootargs} wlcore.mac=${wlmac}
+	setenv bootargs ${bootargs} wlan.mac=${wlmac}
+fi
+
+if itest.s "x" != "x${gpumem}" ; then
+	setenv bootargs ${bootargs} galcore.contiguousSize=${gpumem}
+fi
+
+if itest.s "x" != "x${cma}" ; then
+	setenv bootargs ${bootargs} cma=${cma}
+fi
+
+if itest.s "x" != "x${loglevel}" ; then
+	setenv bootargs ${bootargs} loglevel=${loglevel}
+fi
+
+if itest.s "x" != "x${show_fdt}" ; then
+	fdt print /
+fi
+
+if itest.s "x" != "x${show_env}" ; then
+	printenv
+fi
+
+if load ${devtype} ${devnum}:${distro_bootpart} ${a_zImage} ${prefix}zImage ; then
+	bootz ${a_zImage} - ${a_fdt}
+fi
+echo "Error loading kernel image"
diff --git a/board/boundarydevices/common/post-build.sh b/board/boundarydevices/common/post-build.sh
index 8f1d444..b8abb26 100755
--- a/board/boundarydevices/common/post-build.sh
+++ b/board/boundarydevices/common/post-build.sh
@@ -7,7 +7,9 @@
 
 BOARD_DIR="$(dirname $0)"
 
-# bd u-boot looks for bootscript here
+# bd u-boot looks for standard bootscript
+install -m 0644 -D $BINARIES_DIR/boot.scr $TARGET_DIR/boot/
+# legacy 6x_bootscript script
 $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
 -n "boot script" -d $BOARD_DIR/6x_bootscript.txt $TARGET_DIR/6x_bootscript
 
@@ -16,5 +18,8 @@ if [ -e $BINARIES_DIR/u-boot.imx ];
 then
     install -D -m 0644 $BINARIES_DIR/u-boot.imx $TARGET_DIR/u-boot.imx
     $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
+    -n "upgrade script" -d $BOARD_DIR/upgrade.cmd $TARGET_DIR/upgrade.scr
+    # legacy 6x_upgrade script
+    $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
     -n "upgrade script" -d $BOARD_DIR/6x_upgrade.txt $TARGET_DIR/6x_upgrade
 fi
diff --git a/board/boundarydevices/common/upgrade.cmd b/board/boundarydevices/common/upgrade.cmd
new file mode 100644
index 0000000..249185d
--- /dev/null
+++ b/board/boundarydevices/common/upgrade.cmd
@@ -0,0 +1,154 @@
+if itest.s a$uboot_defconfig == a; then
+        echo "Please set uboot_defconfig to the appropriate value"
+        exit
+fi
+
+offset=0x400
+erase_size=0xC0000
+qspi_offset=0x0
+a_base=0x12000000
+
+if itest.s x51 == "x${imx_cpu}"; then
+	a_base=0x92000000
+elif itest.s x53 == "x${imx_cpu}"; then
+	a_base=0x72000000
+elif itest.s x6SX == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
+	a_base=0x82000000
+fi
+
+qspi_match=1
+setexpr a_qspi1 ${a_base}
+setexpr a_qspi2 ${a_qspi1} + 0x400000
+setexpr a_uImage1 ${a_qspi1} + 0x400
+setexpr a_uImage2 ${a_qspi2} + 0x400
+setexpr a_script ${a_base}
+
+setenv stdout serial,vga
+
+if sf probe || sf probe || sf probe 1 27000000 || sf probe 1 27000000 ; then
+	echo "probed SPI ROM" ;
+else
+	echo "Error initializing EEPROM"
+	exit
+fi
+
+if itest.s x7D == "x${imx_cpu}"; then
+	echo "check qspi parameter block" ;
+	if ${fs}load ${devtype} ${devnum}:1 ${a_qspi1} qspi-${sfname}.${uboot_defconfig} ; then
+	else
+		echo "parameter file qspi-${sfname}.${uboot_defconfig} not found on SD card"
+		exit
+	fi
+	if itest ${filesize} != 0x200 ; then
+		echo "------- qspi-${sfname}.${uboot_defconfig} 0x${filesize} != 0x200 bytes" ;
+		exit
+	fi
+	setexpr a_marker ${a_qspi1} + 0x1fc
+	if itest *${a_marker} != c0ffee01 ; then
+		echo "------- qspi-${sfname}.${uboot_defconfig} c0ffee01 marker missing" ;
+		exit
+	fi
+	if sf read ${a_qspi2} ${qspi_offset} 0x200 ; then
+	else
+		echo "Error reading qspi parameter from EEPROM"
+		exit
+	fi
+	if cmp.b ${a_qspi1} ${a_qspi2} 0x200 ; then
+		echo "------- qspi parameters match"
+	else
+		echo "------- qspi parameters mismatch"
+		qspi_match=0
+	fi
+fi
+
+echo "check U-Boot" ;
+
+if ${fs}load ${devtype} ${devnum}:1 ${a_uImage1} u-boot.$uboot_defconfig ; then
+else
+	echo "File u-boot.$uboot_defconfig not found on SD card" ;
+	exit
+fi
+echo "read $filesize bytes from SD card" ;
+if sf read ${a_uImage2} $offset $filesize ; then
+else
+	echo "Error reading boot loader from EEPROM" ;
+	exit
+fi
+
+if cmp.b ${a_uImage1} ${a_uImage2} $filesize ; then
+	echo "------- U-Boot versions match" ;
+	if itest.s "${qspi_match}" == "1" ; then
+		echo "------- upgrade not needed" ;
+		if itest.s "x" != "x${next}" ; then
+			if ${fs}load ${devtype} ${devnum}:1 ${a_script} ${next} ; then
+				source ${a_script}
+			else
+				echo "${next} not found on SD card"
+			fi
+		fi
+		exit
+	fi
+	erase_size=0x1000
+	if itest.s xMX25L6405D == "x${sfname}"; then
+		erase_size=0x10000
+	fi
+	setexpr filesize ${erase_size} - ${offset}
+fi
+
+echo "Need U-Boot upgrade" ;
+echo "Program in 5 seconds" ;
+for n in 5 4 3 2 1 ; do
+	echo $n ;
+	sleep 1 ;
+done
+echo "erasing" ;
+sf erase 0 ${erase_size} ;
+
+# two steps to prevent bricking
+echo "programming" ;
+setexpr a1 ${a_uImage1} + 0x400
+setexpr o1 ${offset} + 0x400
+setexpr s1 ${filesize} - 0x400
+sf write ${a1} ${o1} ${s1} ;
+sf write ${a_uImage1} $offset 0x400 ;
+
+if itest.s x7D == "x${imx_cpu}"; then
+	sf write ${a_qspi1} ${qspi_offset} 0x200
+fi
+
+echo "verifying" ;
+if sf read ${a_uImage2} $offset $filesize ; then
+else
+	echo "Error re-reading EEPROM" ;
+	exit
+fi
+if cmp.b ${a_uImage1} ${a_uImage2} $filesize ; then
+else
+	echo "Read verification error" ;
+	exit
+fi
+
+if itest.s x7D == "x${imx_cpu}"; then
+	if sf read ${a_qspi2} ${qspi_offset} 0x200 ; then
+	else
+		echo "Error re-reading qspi" ;
+		exit
+	fi
+	if cmp.b ${a_qspi1} ${a_qspi2} 0x200 ; then
+	else
+		echo "qspi parameter block verification error" ;
+		exit
+	fi
+fi
+
+if itest.s "x" != "x${next}" ; then
+	if ${fs}load ${devtype} ${devnum}:1 ${a_script} ${next} ; then
+		source ${a_script}
+	else
+		echo "${next} not found on ${devtype} ${devnum}"
+	fi
+fi
+
+while echo "---- U-Boot upgraded. reset" ; do
+	sleep 120
+done
diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 03c8f9a..b29adf2 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -22,11 +22,14 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="nitrogen6sx"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Last version of branch boundary-v2017.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/4280a700.tar.gz"
+# Last version of branch boundary-v2017.07
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1530219d.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
 
 # kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 049c684..5905a40 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -22,11 +22,14 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Last version of branch boundary-v2017.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/4280a700.tar.gz"
+# Last version of branch boundary-v2017.07
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1530219d.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
 
 # kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 3b50828..fa8f36c 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -21,11 +21,14 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="nitrogen7"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Last version of branch boundary-v2017.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/4280a700.tar.gz"
+# Last version of branch boundary-v2017.07
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1530219d.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
 
 # kernel
 BR2_LINUX_KERNEL=y
