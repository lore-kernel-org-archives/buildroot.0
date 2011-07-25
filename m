From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jul 2011 13:50:38 +0200
Subject: [Buildroot] [git commit] New package: ti-utils
Message-ID: <20110725115106.0CB208B4A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=afce67a9029dbcc1eec0b011ed2daa4559455310
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the calibrator and other useful utilities for TI wireless solution,
based on wl12xx driver.

See http://linuxwireless.org/en/users/Drivers/wl12xx/calibrator for
further details.

[Peter: add libnl Config.in dependency]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/ti-utils/Config.in   |    8 ++++++++
 package/ti-utils/ti-utils.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/ti-utils/Config.in
 create mode 100644 package/ti-utils/ti-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 28e5570..dfa6e35 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -206,6 +206,7 @@ source "package/sredird/Config.in"
 source "package/sshfs/Config.in"
 source "package/statserial/Config.in"
 source "package/sysstat/Config.in"
+source "package/ti-utils/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
 source "package/usb_modeswitch/Config.in"
diff --git a/package/ti-utils/Config.in b/package/ti-utils/Config.in
new file mode 100644
index 0000000..02ae336
--- /dev/null
+++ b/package/ti-utils/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TI_UTILS
+	bool "ti-utils"
+	select BR2_PACKAGE_LIBNL
+	help
+	  The calibrator and other useful utilities for TI wireless solution,
+	  based on wl12xx driver.
+
+	  http://linuxwireless.org/en/users/Drivers/wl12xx/calibrator
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
new file mode 100644
index 0000000..8f35b59
--- /dev/null
+++ b/package/ti-utils/ti-utils.mk
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
-- 
1.7.3.4
