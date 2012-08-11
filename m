From: Jonathan Liu <net147@gmail.com>
Date: Sat, 11 Aug 2012 17:18:32 +1000
Subject: [Buildroot] [PATCH v2] acpid: add init.d script
Message-ID: <1344669512-29193-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/acpid/S02acpid | 22 ++++++++++++++++++++++
 package/acpid/acpid.mk |  1 +
 2 files changed, 23 insertions(+)
 create mode 100755 package/acpid/S02acpid

diff --git a/package/acpid/S02acpid b/package/acpid/S02acpid
new file mode 100755
index 0000000..ec686d8
--- /dev/null
+++ b/package/acpid/S02acpid
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		echo -n "Starting acpid: "
+		start-stop-daemon -S -q -m -b -p /var/run/acpid.pid --exec /usr/sbin/acpid -- -n
+		echo "done"
+		;;
+	stop)
+		echo -n "Stopping acpid: "
+		start-stop-daemon -K -q -p /var/run/acpid.pid
+		echo "done"
+		;;
+	restart)
+		"$0" stop
+		sleep 1
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index cacfb27..45cd8cf 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -18,6 +18,7 @@ define ACPID_INSTALL_TARGET_CMDS
 	install -D -m 644 $(@D)/acpi_listen.8 $(TARGET_DIR)/usr/share/man/man8/acpi_listen.8
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
 	/bin/echo -e "event=button[ /]power\naction=/sbin/poweroff" > $(TARGET_DIR)/etc/acpi/events/powerbtn
+	install -D -m 755 package/acpid/S02acpid $(TARGET_DIR)/etc/init.d/S02acpid
 endef
 
 define ACPID_UNINSTALL_TARGET_CMDS
-- 
1.7.11.3
