From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:57:11 +0200
Subject: [Buildroot] [git commit] board/olpc: add common scripts and files
 for OLPC laptops
Message-ID: <20200417205654.5899F8F055@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cdca2cd5012f713098032bb688d5714763f9991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are muliple generations of OLPC laptops, x86 ones based on
Geode, VIA and ARM based with Marvell Armada. All of boot with
OpenFirmware and share some peripherals.

This patch adds the common files.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  3 +++
 board/olpc/genimage.cfg  |  9 +++++++
 board/olpc/linux.config  | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
 board/olpc/olpc.fth      | 46 +++++++++++++++++++++++++++++++++
 board/olpc/post-build.sh |  4 +++
 5 files changed, 128 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3d9c976a95..b35f543d00 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1542,6 +1542,9 @@ F:	support/legal-info/
 N:	Lucas De Marchi <lucas.de.marchi@gmail.com>
 F:	package/fswebcam/
 
+N:	Lubomir Rintel <lkundrak@v3.sk>
+F:	board/olpc/
+
 N:	Ludovic Desroches <ludovic.desroches@microchip.com>
 F:	board/atmel/
 F:	configs/at91*
diff --git a/board/olpc/genimage.cfg b/board/olpc/genimage.cfg
new file mode 100644
index 0000000000..baafe31714
--- /dev/null
+++ b/board/olpc/genimage.cfg
@@ -0,0 +1,9 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/olpc/linux.config b/board/olpc/linux.config
new file mode 100644
index 0000000000..0ea622eeec
--- /dev/null
+++ b/board/olpc/linux.config
@@ -0,0 +1,66 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=y
+CONFIG_RFKILL=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_NETDEVICES=y
+CONFIG_LIBERTAS=m
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1200
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=900
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_TABLET=y
+CONFIG_SERIO_OLPC_APSP=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_BATTERY_OLPC=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_CONTROLLER=y
+CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=m
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_DRM=y
+CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FB_SIMPLE=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_RTC_CLASS=y
+CONFIG_EXT4_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_FONTS=y
+CONFIG_FONT_TER16x32=y
diff --git a/board/olpc/olpc.fth b/board/olpc/olpc.fth
new file mode 100644
index 0000000000..678f0af5b5
--- /dev/null
+++ b/board/olpc/olpc.fth
@@ -0,0 +1,46 @@
+\ OLPC XO boot script
+
+: (visible)  " unfreeze visible" evaluate  ;
+' (visible) catch  drop  forget (visible)
+
+" /aliases" find-device " last" get-property
+abort" No last alias"
+" /pci/sd at c"          2over substring?  if  " root=/dev/mmcblk0p1 " to boot-file  then
+" /sd/sdhci at d4280000" 2over substring?  if  " root=/dev/mmcblk1p1 " to boot-file  then
+" /pci/usb@"          2over substring?  if  " root=/dev/sda1 "      to boot-file  then
+" /usb@"              2over substring?  if  " root=/dev/sda1 "      to boot-file  then
+2drop
+
+root-device " compatible" get-property dend  if  0 0  then  ( compatible$ )
+" olpc,xo-1.75" 2over sindex -1 > if  ( compatible$ )
+   \ Version check on XO-1.75
+   " mrvl,mmp2" 2over sindex -1 =  if ( compatible$ )
+      2drop                           ( )
+      cr
+      ." Firmware Q4E00 or newer is needed to boot a Devicetree enabled kernel." cr
+      cr
+      ." One way to update is to copy http://dev.laptop.org/~quozl/q4e00ja.rom" cr
+      ." to a FAT partition on a USB flash stick and run ""flash u:\q4e00ja.rom""" cr
+      cr
+      ." Aborting boot." cr
+      " show-sad" evaluate
+      abort
+   then
+then ( compatible$ )
+
+" mmp" 2swap sindex -1 > if
+   \ A Marvell MMP-based machine
+   " last:\boot\zImage" to boot-device
+   boot-file " console=ttyS2,115200 " $cat2 to boot-file
+else
+    \ Assume XO-1
+   " last:\boot\bzImage" to boot-device
+   boot-file " console=ttyS0,115200 reboot=pci " $cat2 to boot-file
+then
+
+\ Pick a terminal that looks better on the XO screen
+root-device " architecture" get-property dend  if  0 0  else  1-  then
+" OLPC" $=  if  boot-file " fbcon=font:TER16x32 vt.color=0xf0 " $cat2 to boot-file  then
+
+boot-file " console=tty0 rootwait" $cat2 to boot-file
+boot
diff --git a/board/olpc/post-build.sh b/board/olpc/post-build.sh
new file mode 100755
index 0000000000..4d4cf97086
--- /dev/null
+++ b/board/olpc/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+install -m 0644 -D $BOARD_DIR/olpc.fth $TARGET_DIR/boot/olpc.fth
