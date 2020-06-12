From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Jun 2020 01:24:33 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/iwd: add sysv init script
In-Reply-To: <20200612232433.18442-1-ps.report@gmx.net>
References: <20200612232433.18442-1-ps.report@gmx.net>
Message-ID: <20200612232433.18442-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iwd/S40iwd | 30 ++++++++++++++++++++++++++++++
 package/iwd/iwd.mk |  7 +++++++
 2 files changed, 37 insertions(+)
 create mode 100644 package/iwd/S40iwd

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
new file mode 100644
index 0000000000..4a720b43c2
--- /dev/null
+++ b/package/iwd/S40iwd
@@ -0,0 +1,30 @@
+#!/bin/sh
+#
+# Start iwd daemon
+#
+
+# Create needed directories.
+[ -d /tmp/iwd/hotspot ] || mkdir -p /tmp/iwd/hotspot
+
+case "$1" in
+    start)
+	printf "Starting iwd:"
+	/usr/libexec/iwd &
+	echo "OK"
+        ;;
+    stop)
+	printf "Stopping iwd:"
+	killall iwd
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+        ;;
+    restart|reload)
+        "$0" stop
+        "$0" start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+        ;;
+esac
+
+exit $?
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index d105d3b128..285fef2fd8 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -65,4 +65,11 @@ IWD_POST_INSTALL_TARGET_HOOKS += \
 	IWD_INSTALL_CONFIG_FILE \
 	IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
 
+define IWD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/iwd/S40iwd \
+		$(TARGET_DIR)/etc/init.d/S40iwd
+	mkdir -p $(TARGET_DIR)/var/lib/iwd
+	ln -sf /tmp/iwd/hotspot $(TARGET_DIR)/var/lib/iwd/hotspot
+endef
+
 $(eval $(autotools-package))
-- 
2.26.2
