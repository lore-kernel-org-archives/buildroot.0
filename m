From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 18 Sep 2014 12:00:55 +0200
Subject: [Buildroot] [PATCH v2 5/5] targetcli-fb: new package
In-Reply-To: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
References: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1411034455-19670-6-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

targetcli-fb is a command-line interface for configuring the LIO
generic SCSI target, present in 3.x Linux kernel versions.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
Changes v1 -> v2:
 - Merge "targetcli-fb: add sysv initscript" (as suggested by Thomas)
 - Use TARGETCLI_FB_INSTALL_INIT_SYSV (as suggested by Thomas)
 - Describe the purpose of creating "/etc/target/" (as suggested by Thomas)

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/Config.in                    |  1 +
 package/targetcli-fb/Config.in       | 14 +++++++++++
 package/targetcli-fb/S50target       | 46 ++++++++++++++++++++++++++++++++++++
 package/targetcli-fb/targetcli-fb.mk | 26 ++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 package/targetcli-fb/Config.in
 create mode 100755 package/targetcli-fb/S50target
 create mode 100644 package/targetcli-fb/targetcli-fb.mk

diff --git a/package/Config.in b/package/Config.in
index 096d8c6..b10225b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ endif
 	source "package/sunxi-mali/Config.in"
 	source "package/sunxi-mali-prop/Config.in"
 	source "package/sysstat/Config.in"
+	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
new file mode 100644
index 0000000..dcc6a54
--- /dev/null
+++ b/package/targetcli-fb/Config.in
@@ -0,0 +1,14 @@
+comment "targetcli-fb depends on python"
+	depends on !BR2_PACKAGE_PYTHON
+
+config BR2_PACKAGE_TARGETCLI_FB
+	bool "targetcli-fb"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
+	select BR2_PACKAGE_PYTHON_RTSLIB_FB
+	help
+	  targetcli-fb is a command-line interface for configuring the
+	  LIO generic SCSI target, present in 3.x Linux kernel
+	  versions.
+
+	  https://github.com/agrover/targetcli-fb
diff --git a/package/targetcli-fb/S50target b/package/targetcli-fb/S50target
new file mode 100755
index 0000000..88290e4
--- /dev/null
+++ b/package/targetcli-fb/S50target
@@ -0,0 +1,46 @@
+#!/bin/sh
+#
+# Restore / clear the Linux "SCSI target" driver configuration with `targetctl`
+#
+
+start() {
+	local ret
+
+	echo -n "Restoring target configuration: "
+	/usr/bin/targetctl restore >/dev/null 2>&1
+	ret=$?
+	echo "done"
+
+	return $ret
+}
+
+stop() {
+	local ret
+
+	echo -n "Clearing target configuration: "
+	/usr/bin/targetctl clear >/dev/null 2>&1
+	ret=$?
+	echo "done"
+
+	return $ret
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
new file mode 100644
index 0000000..1faad07
--- /dev/null
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# targetcli-fb
+#
+################################################################################
+
+TARGETCLI_FB_VERSION = v2.1.fb36
+TARGETCLI_FB_SITE = $(call github,agrover,targetcli-fb,$(TARGETCLI_FB_VERSION))
+TARGETCLI_FB_LICENSE = Apache-2.0
+TARGETCLI_FB_LICENSE_FILES = COPYING
+TARGETCLI_FB_SETUP_TYPE = setuptools
+TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb
+
+define TARGETCLI_FB_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target $(TARGET_DIR)/etc/init.d/S50target
+endef
+
+# Targetcli stores its configuration in /etc/target/saveconfig.json
+# and complains if the /etc/target/ directory does not exist.
+define TARGETCLI_FB_INSTALL_CONF_DIR
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/target
+endef
+
+TARGETCLI_FB_POST_INSTALL_TARGET_HOOKS += TARGETCLI_FB_INSTALL_CONF_DIR
+
+$(eval $(python-package))
-- 
2.1.0
