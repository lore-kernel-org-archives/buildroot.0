From: Fabio Porcedda <fabio.porcedda@telit.com>
Date: Wed,  8 Feb 2012 08:41:33 +0100
Subject: [Buildroot] [PATCH] busybox: add watchdog daemon startup script
Message-ID: <1328686893-6841-1-git-send-email-fabio.porcedda@telit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Fabio Porcedda <fabio.porcedda@telit.com>
---
 package/busybox/Config.in   |    6 ++++++
 package/busybox/S15watchdog |   20 ++++++++++++++++++++
 package/busybox/busybox.mk  |    9 +++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/S15watchdog

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 4176020..c5b2eb8 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -62,6 +62,12 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
 
+config BR2_PACKAGE_BUSYBOX_WATCHDOG
+	bool "Install watchdog daemon startup script"
+	help
+	  Install the watchdog daemon startup script,
+	  that just start at the boot the busybox watchdog daemon.
+
 endif
 
 if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
diff --git a/package/busybox/S15watchdog b/package/busybox/S15watchdog
new file mode 100644
index 0000000..3a2e8eb
--- /dev/null
+++ b/package/busybox/S15watchdog
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# Start watchdog
+#
+
+case "$1" in
+ start)
+	echo "Starting watchdog..."
+	watchdog -t 5 /dev/watchdog
+	;;
+  stop)
+	;;
+  restart|reload)
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 59448d5..985f974 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -142,6 +142,14 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
+define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
+	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
+		install -D -m 0755 package/busybox/S15watchdog \
+			$(TARGET_DIR)/etc/init.d/S15watchdog
+endef
+endif
+
 # We do this here to avoid busting a modified .config in configure
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
@@ -172,6 +180,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
+	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
-- 
1.7.8.3
