From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 02 Jun 2013 21:19:28 -0000
Subject: [Buildroot] [git commit] am33x-cm3: add FW for suspend/resume
Message-ID: <20130602212052.D24659A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97fbd80efe6dd29b5d8d5393ea0a4cbc314dcfc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this firmware, the beaglebone won't be able to suspend/resume
correctly.

[Peter: tweak Config.in, rename init script, wrap long lines]
Signed-off-by: Anders Darander <anders@chargestorm.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                             |    1 +
 package/am33x-cm3/Config.in                   |    7 +++++
 package/am33x-cm3/S93-am335x-pm-firmware-load |    6 +++++
 package/am33x-cm3/am33x-cm3.mk                |   30 +++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1dee2ab..6b6ce9d 100644
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
index 0000000..060d0ef
--- /dev/null
+++ b/package/am33x-cm3/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_AM33X_CM3
+	bool "am33x-cm3"
+	depends on BR2_arm # only relevant for TI am335x
+	help
+	  Cortex-M3 binary blob for suspend-resume on am335x
+
+	  http://arago-project.org/git/projects/am33x-cm3.git
diff --git a/package/am33x-cm3/S93-am335x-pm-firmware-load b/package/am33x-cm3/S93-am335x-pm-firmware-load
new file mode 100755
index 0000000..56c17b3
--- /dev/null
+++ b/package/am33x-cm3/S93-am335x-pm-firmware-load
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Load the PM CM3 firmware
+echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
+cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
+echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
new file mode 100644
index 0000000..3805c80
--- /dev/null
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -0,0 +1,30 @@
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
+	$(INSTALL) -m 0644 -D $(@D)/bin/am335x-pm-firmware.bin \
+		$(TARGET_DIR)/lib/firmware/am335x-pm-firmware.bin
+endef
+
+define AM33X_CM3_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/am33x-cm3/S93-am335x-pm-firmware-load \
+		$(TARGET_DIR)/etc/init.d/S93-am335x-pm-firmware-load
+endef
+
+$(eval $(generic-package))
