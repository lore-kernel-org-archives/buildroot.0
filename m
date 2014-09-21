From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:45:54 +0200
Subject: [Buildroot] [git commit] targetcli-fb: new package
Message-ID: <20140921174754.3D5FD9D6A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3867623c23ec0b1638d55dcb42e58f800de38785
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

targetcli-fb is a command-line interface for configuring the LIO
generic SCSI target, present in 3.x Linux kernel versions.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/targetcli-fb/Config.in       |   14 ++++++++++
 package/targetcli-fb/S50target       |   46 ++++++++++++++++++++++++++++++++++
 package/targetcli-fb/targetcli-fb.mk |   26 +++++++++++++++++++
 4 files changed, 87 insertions(+), 0 deletions(-)

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
