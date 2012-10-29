From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Mon, 29 Oct 2012 09:41:10 +0100
Subject: [Buildroot] [PATCH 3/6] Add firmware for the AW-NH580 connectivity
	module of the snowball
In-Reply-To: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1351500073-4351-4-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in                              |    1 +
 package/snowball-firmware/Config.in            |    8 ++++++++
 package/snowball-firmware/snowball-firmware.mk |   17 +++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/snowball-firmware/Config.in
 create mode 100644 package/snowball-firmware/snowball-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index 097a94d..fd5281f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -532,6 +532,7 @@ source "package/googlefontdirectory/Config.in"
 source "package/hdmiservice/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
+source "package/snowball-firmware/Config.in"
 source "package/sound-theme-borealis/Config.in"
 source "package/sound-theme-freedesktop/Config.in"
 endmenu
diff --git a/package/snowball-firmware/Config.in b/package/snowball-firmware/Config.in
new file mode 100644
index 0000000..1d0789d
--- /dev/null
+++ b/package/snowball-firmware/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SNOWBALL_FIRMWARE
+	bool "snowball-firmware"
+	help
+	  This package provides various binary firmware files (closed binary blobs)
+	  for the Azurewave AW-NH580 combo module (wifi, bt, gps).
+
+	  https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git
+
diff --git a/package/snowball-firmware/snowball-firmware.mk b/package/snowball-firmware/snowball-firmware.mk
new file mode 100644
index 0000000..05326e2
--- /dev/null
+++ b/package/snowball-firmware/snowball-firmware.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# snowball-firmware
+#
+#############################################################
+SNOWBALL_FIRMWARE_VERSION = 1.1.3-5
+SNOWBALL_FIRMWARE_SOURCE = ux500-firmware_$(SNOWBALL_FIRMWARE_VERSION).tar.gz
+SNOWBALL_FIRMWARE_SITE = https://launchpad.net/~linaro-maintainers/+archive/overlay/+files/
+SNOWBALL_FIRMWARE_LICENSE = PROPRIETARY
+
+define SNOWBALL_FIRMWARE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware
+	cp -r $(@D)/* $(TARGET_DIR)/lib/firmware/
+	rename 's/CG2900/CG29XX/' $(TARGET_DIR)/lib/firmware/*.fw
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
