From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 27 Apr 2011 10:32:48 +0200
Subject: [Buildroot] [PATCH] New package: ti-utils
Message-ID: <4DB7D4B0.9020905@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the calibrator and other useful utilities for TI wireless solution,
based on wl12xx driver. 

See http://linuxwireless.org/en/users/Drivers/wl12xx/calibrator for
further details.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/package/Config.in
===================================================================
--- a/package/Config.in	2011-04-26 02:04:14.130276675 -0700
+++ b/package/Config.in	2011-04-26 03:52:58.106277378 -0700
@@ -203,6 +203,7 @@
 source "package/squashfs3/Config.in"
 source "package/sshfs/Config.in"
 source "package/sysstat/Config.in"
+source "package/ti-utils/Config.in"
 source "package/udev/Config.in"
 source "package/usb_modeswitch/Config.in"
 source "package/usbmount/Config.in"
Index: b/package/ti-utils/Config.in
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/ti-utils/Config.in	2011-04-27 00:58:58.674284049 -0700
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TI_UTILS
+	bool "ti-utils"
+	help
+	  The calibrator and other useful utilities for TI wireless solution,
+	  based on wl12xx driver.
+
+	  http://linuxwireless.org/en/users/Drivers/wl12xx/calibrator
+
Index: b/package/ti-utils/ti-utils.mk
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/ti-utils/ti-utils.mk	2011-04-27 00:57:53.546282739 -0700
@@ -0,0 +1,29 @@
+#############################################################
+#
+# ti-utils
+#
+#############################################################
+
+TI_UTILS_VERSION = fbceab8f228cff80fd29b830bb85a188c69def08
+TI_UTILS_SITE = git://github.com/gxk/ti-utils.git
+TI_UTILS_DEPENDENCIES = libnl
+
+define TI_UTILS_BUILD_CMDS
+	$(MAKE1) NFSROOT="$(STAGING_DIR)" CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		-C $(@D) all
+endef
+
+define TI_UTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/calibrator \
+		$(TARGET_DIR)/usr/bin/calibrator
+	$(INSTALL) -m 0755 $(@D)/scripts/go.sh \
+		$(TARGET_DIR)/usr/bin/go.sh
+endef
+
+define TI_UTILS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/calibrator
+	rm -f $(TARGET_DIR)/usr/bin/go.sh
+endef
+
+$(eval $(call GENTARGETS,package,ti-utils))
+
