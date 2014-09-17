From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Wed, 17 Sep 2014 13:39:59 +0200
Subject: [Buildroot] [PATCH 6/6] targetcli-fb: add sysv initscript
In-Reply-To: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1410953999-16520-7-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/targetcli-fb/S50target       | 46 ++++++++++++++++++++++++++++++++++++
 package/targetcli-fb/targetcli-fb.mk | 11 +++++++++
 2 files changed, 57 insertions(+)
 create mode 100755 package/targetcli-fb/S50target

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
index 2384569..b83a6b6 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -11,4 +11,15 @@ TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_SETUP_TYPE = setuptools
 TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb
 
+define TARGETCLI_FB_INSTALL_INITSCRIPT
+        @if [ ! -f $(TARGET_DIR)/etc/init.d/S50target ]; then \
+                $(INSTALL) -m 0755 -D package/targetcli-fb/S50target $(TARGET_DIR)/etc/init.d/S50target; \
+        fi
+        @if [ ! -d $(TARGET_DIR)/etc/target ]; then \
+                $(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/target; \
+        fi
+endef
+
+TARGETCLI_FB_POST_INSTALL_TARGET_HOOKS += TARGETCLI_FB_INSTALL_INITSCRIPT
+
 $(eval $(python-package))
-- 
2.1.0
