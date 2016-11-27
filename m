From: Dagg Stompler <daggs@gmx.com>
Date: Sun, 27 Nov 2016 23:24:49 +0200
Subject: [Buildroot] [PATCH] odroid-scripts: add support for auto resize on
	first boot for SYSV
Message-ID: <20161127212449.14159-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ported from https://github.com/hardkernel/buildroot, upon first boot,
resize the file system to the max possible remaining size of the flash.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/genimage.cfg   |  1 -
 package/odroid-scripts/Config.in         |  2 ++
 package/odroid-scripts/S03resizing       | 11 ++++++++++
 package/odroid-scripts/odroid-scripts.mk | 12 ++++++++---
 package/odroid-scripts/resize_fs.sh      | 36 ++++++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+), 4 deletions(-)
 create mode 100644 package/odroid-scripts/S03resizing
 create mode 100644 package/odroid-scripts/resize_fs.sh

diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
index 15f97d445..16d2786b1 100644
--- a/board/hardkernel/odroidc2/genimage.cfg
+++ b/board/hardkernel/odroidc2/genimage.cfg
@@ -22,6 +22,5 @@ image sdcard.img {
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 512M
 	}
 }
diff --git a/package/odroid-scripts/Config.in b/package/odroid-scripts/Config.in
index c4e09cad7..c40fa76b9 100644
--- a/package/odroid-scripts/Config.in
+++ b/package/odroid-scripts/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_ODROID_SCRIPTS
 	depends on BR2_aarch64 || BR2_arm
 	select BR2_PACKAGE_FBSET # runtime
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # needed for fbset
+	select BR2_PACKAGE_E2FSPROGS # for resizefs
+	select BR2_PACKAGE_E2FSPROGS_RESIZE2FS # for resizefs
 	help
 	  Install the scripts for the odroidc2 based systems.
 
diff --git a/package/odroid-scripts/S03resizing b/package/odroid-scripts/S03resizing
new file mode 100644
index 000000000..4a19ce40e
--- /dev/null
+++ b/package/odroid-scripts/S03resizing
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		if [ -f /usr/sbin/resize_fs.sh ]; then /usr/sbin/resize_fs.sh; fi
+		;;
+	*)
+		;;
+esac
+
+exit $?
diff --git a/package/odroid-scripts/odroid-scripts.mk b/package/odroid-scripts/odroid-scripts.mk
index 858ec37fe..8769ec597 100644
--- a/package/odroid-scripts/odroid-scripts.mk
+++ b/package/odroid-scripts/odroid-scripts.mk
@@ -16,7 +16,11 @@ endef
 endif
 
 define ODROID_SCRIPTS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/c2_init.sh $(TARGET_DIR)/usr/sbin/odroidc2_init_fb.sh
+	$(INSTALL) -D -m 0755 $(@D)/c2_init.sh \
+		$(TARGET_DIR)/usr/sbin/odroidc2_init_fb.sh
+	$(INSTALL) -D -m 0755 package/odroid-scripts/resize_fs.sh \
+		$(TARGET_DIR)/usr/sbin/resize_fs.sh
+	touch $(TARGET_DIR)/.first_boot
 	$(ODROID_SCRIPTS_INSTALL_UDEV_RULES)
 endef
 
@@ -29,8 +33,10 @@ define ODROID_SCRIPTS_INSTALL_INIT_SYSTEMD
 endef
 
 define ODROID_SCRIPTS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/odroid-scripts/S50odroidc2_fb \
-		$(TARGET_DIR)/etc/init.d/S50odroidc2_fb
+	$(INSTALL) -D -m 0755 package/odroid-scripts/S02odroidc2_fb \
+		$(TARGET_DIR)/etc/init.d/S02odroidc2_fb
+	$(INSTALL) -D -m 0755 package/odroid-scripts/S03resizing \
+		$(TARGET_DIR)/etc/init.d/S03resizing
 endef
 
 $(eval $(generic-package))
diff --git a/package/odroid-scripts/resize_fs.sh b/package/odroid-scripts/resize_fs.sh
new file mode 100644
index 000000000..f39c7f7b8
--- /dev/null
+++ b/package/odroid-scripts/resize_fs.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          resize_fs
+# Required-Start:    $remote_fs $all
+# Required-Stop:
+# Default-Start:     2 3 4 5 S
+# Default-Stop:
+# Short-Description: First boot system setup
+### END INIT INFO
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+if [ -f /.first_boot ]; then
+	echo "Resizing fs, please wait, upon finish the system will be restarted"
+	# ok, its the very first boot, we need to resize the disk.
+	p2_start=`fdisk -l /dev/mmcblk0 | grep mmcblk0p2 | awk '{print $2}'`
+	p2_finish=`fdisk -l /dev/mmcblk0 | grep sectors | awk '{printf $5}'`
+
+	fdisk /dev/mmcblk0 <<EOF
+p
+d
+2
+n
+p
+2
+$p2_start
+$p2_finish
+p
+w
+EOF
+	rm -fr /.first_boot
+	sync
+	reboot
+else
+	resize2fs /dev/mmcblk0p2 && rm -fr $0
+fi
-- 
2.11.0.rc2
