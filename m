From: Ivo Slanina <ivo.slanina@gmail.com>
Date: Sun,  9 Aug 2015 17:47:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: add configurable
	kernel cmdline option
Message-ID: <1439135221-29285-1-git-send-email-ivo.slanina@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Raspberry Pi expects cmdline.txt file at boot partition, which defines
kernel parameters. Buildroot stores this file in package/rpi-firmware
directory and makes this configuration quite unconfortable. Basicaly
user have to manually edit output/images/rpi-firmware/cmdline.txt for
every build.

This patch adds option to specify content of cmdline.txt and store it
in configuration file. This approach removes need to manually modify
this file for every build and adds posibility to store its value
in configuration file per project.

Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
---
 package/rpi-firmware/Config.in       | 6 ++++++
 package/rpi-firmware/cmdline.txt     | 1 -
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)
 delete mode 100644 package/rpi-firmware/cmdline.txt

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 405674f..978ecfd 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -39,6 +39,12 @@ config BR2_PACKAGE_RPI_FIRMWARE_CD
 
 endchoice
 
+config BR2_PACKAGE_RPI_FIRMWARE_CMDLINE
+	string "Kernel cmdline"
+	default "root=/dev/mmcblk0p2 rootwait"
+	help
+	  Set this value to customize cmdline.txt file at boot partition.
+
 config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	string
 	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
diff --git a/package/rpi-firmware/cmdline.txt b/package/rpi-firmware/cmdline.txt
deleted file mode 100644
index 38aa378..0000000
--- a/package/rpi-firmware/cmdline.txt
+++ /dev/null
@@ -1 +0,0 @@
-root=/dev/mmcblk0p2 rootwait
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 1ef15aa..9d22a69 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -41,7 +41,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
-	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
+	echo $(BR2_PACKAGE_RPI_FIRMWARE_CMDLINE) > $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
-- 
2.1.4
