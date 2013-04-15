From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 23:39:41 +0200
Subject: [Buildroot] [git commit] package: add fan-ctrl
Message-ID: <20130415215905.E32CC9AC01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e35c700ca0395146d69605a219a8d1f2b19aaedc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/fan-ctrl/Config.in   |   10 ++++++++++
 package/fan-ctrl/fan-ctrl.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 566d941..f28cedd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -230,6 +230,7 @@ source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
 source "package/evtest/Config.in"
+source "package/fan-ctrl/Config.in"
 source "package/flashrom/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
diff --git a/package/fan-ctrl/Config.in b/package/fan-ctrl/Config.in
new file mode 100644
index 0000000..392904c
--- /dev/null
+++ b/package/fan-ctrl/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_FAN_CTRL
+	bool "fan-ctrl"
+	help
+	  Fan-ctrl is a little daemon that controls the speed of one
+	  or more system or CPU fans. It does so by monitoring
+	  temperature inputs and selecting a fan speed from an array
+	  of available speeds based on a set of temperature
+	  thresholds.
+
+	  http://fan-ctrl.sourceforge.net/
diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
new file mode 100644
index 0000000..b7bfa79
--- /dev/null
+++ b/package/fan-ctrl/fan-ctrl.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# fan-ctrl
+#
+#############################################################
+
+# no release, so grab .c file directly from viewvc
+FAN_CTRL_VERSION = 1.3
+FAN_CTRL_SOURCE = fan-ctrl.c?revision=$(FAN_CTRL_VERSION)
+FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl/
+FAN_CTRL_LICENSE = GPLv2+
+
+define FAN_CTRL_EXTRACT_CMDS
+	cp $(DL_DIR)/$(FAN_CTRL_SOURCE) $(@D)/fan-ctrl.c
+endef
+
+define FAN_CTRL_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		$(@D)/fan-ctrl.c -o $(@D)/fan-ctrl
+endef
+
+define FAN_CTRL_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/fan-ctrl $(TARGET_DIR)/usr/sbin/fan-ctrl
+endef
+
+define FAN_CTRL_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/fan-ctrl
+endef
+
+$(eval $(generic-package))
