From: Anders Darander <anders@chargestorm.se>
Date: Sat, 11 May 2013 14:57:26 +0200
Subject: [Buildroot] [PATCH v2 2/4] am33x-cm3: add FW for suspend/resume
In-Reply-To: <1368277048-17340-1-git-send-email-anders@chargestorm.se>
References: <1368277048-17340-1-git-send-email-anders@chargestorm.se>
Message-ID: <1368277048-17340-3-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this firmware, the beaglebone won't be able to reboot correctly.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 package/Config.in                         |    1 +
 package/am33x-cm3/Config.in               |    4 ++++
 package/am33x-cm3/am335x-pm-firmware-load |    6 ++++++
 package/am33x-cm3/am33x-cm3.mk            |   28 ++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/am33x-cm3/Config.in
 create mode 100755 package/am33x-cm3/am335x-pm-firmware-load
 create mode 100644 package/am33x-cm3/am33x-cm3.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..329d734 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -213,6 +213,7 @@ endmenu
 
 menu "Hardware handling"
 menu "Misc devices firmwares"
+source "package/am33x-cm3/Config.in"
 source "package/b43-firmware/Config.in"
 source "package/firmware-imx/Config.in"
 source "package/linux-firmware/Config.in"
diff --git a/package/am33x-cm3/Config.in b/package/am33x-cm3/Config.in
new file mode 100644
index 0000000..ee39f7d
--- /dev/null
+++ b/package/am33x-cm3/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_AM33X_CM3
+	bool "am33x-cm3"
+	help
+	  Cortex-M3 binary blob for suspend-resume
diff --git a/package/am33x-cm3/am335x-pm-firmware-load b/package/am33x-cm3/am335x-pm-firmware-load
new file mode 100755
index 0000000..56c17b3
--- /dev/null
+++ b/package/am33x-cm3/am335x-pm-firmware-load
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Load the PM CM3 firmware
+echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
+cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
+echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
new file mode 100644
index 0000000..91884e5
--- /dev/null
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# am33x-cm3
+#
+#############################################################
+
+AM33X_CM3_VERSION = AM335xPSP_04.06.00.10-rc1
+AM33X_CM3_SITE = http://arago-project.org/git/projects/am33x-cm3.git
+AM33X_CM3_SITE_METHOD = git
+AM33X_CM3_LICENSE = TI Publicly Available Software License
+AM33X_CM3_LICENSE_FILES = License.txt
+
+# The build command below will use the standard cross-compiler (normally
+# build for Cortex-A8, to build the FW for the Cortex-M3.
+define AM33X_CM3_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
+endef
+
+# Not all of the firmware files are used
+define AM33X_CM3_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/bin/am335x-pm-firmware.bin $(TARGET_DIR)/lib/firmware/am335x-pm-firwmare.bin
+endef
+
+define AM33X_CM3_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/am33x-cm3/am335x-pm-firmware-load $(TARGET_DIR)/etc/init.d/S93-am335x-pm-firwmare-load
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
