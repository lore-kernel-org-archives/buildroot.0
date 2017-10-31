From: Markus Mayer <code@mmayer.net>
Date: Tue, 31 Oct 2017 15:36:58 -0700
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171031223659.6831-1-code@mmayer.net>
References: <20171031223659.6831-1-code@mmayer.net>
Message-ID: <20171031223659.6831-2-code@mmayer.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markus Mayer <mmayer@broadcom.com>

Add System V start-up script for dhcpcd that is run after the network
has been brought up.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/dhcpcd/S41dhcpcd | 34 ++++++++++++++++++++++++++++++++++
 package/dhcpcd/dhcpcd.mk |  5 +++++
 2 files changed, 39 insertions(+)
 create mode 100755 package/dhcpcd/S41dhcpcd

diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
new file mode 100755
index 0000000..a2e87ca
--- /dev/null
+++ b/package/dhcpcd/S41dhcpcd
@@ -0,0 +1,34 @@
+#!/bin/sh
+#
+# Start/stop dhcpcd
+#
+
+DAEMON=/sbin/dhcpcd
+CONFIG=/etc/dhcpcd.conf
+PIDFILE=/var/run/dhcpcd.pid
+
+[ -x $DAEMON ] || exit 0
+[ -f $CONFIG ] || exit 0
+
+case "$1" in
+  start)
+	echo "Starting dhcpcd..."
+	start-stop-daemon -S -x "$DAEMON" -p "$PIDFILE" -- -f "$CONFIG"
+	;;
+  stop)
+	echo "Stopping dhcpcd..."
+	start-stop-daemon -K -x "$DAEMON" -p "$PIDFILE" -o
+	;;
+  reload|force-reload)
+	echo "Reloading dhcpcd configuration..."
+	"$DAEMON" -s reload
+	;;
+  restart)
+	"$0" stop
+	sleep 1 # Prevent race condition: ensure dhcpcd stops before start.
+	"$0" start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|reload|force-reload}"
+	exit 1
+esac
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 1d29cda..cf1da4f 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -36,6 +36,11 @@ define DHCPCD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
 endef
 
+define DHCPCD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/dhcpcd/S41dhcpcd \
+		$(TARGET_DIR)/etc/init.d/S41dhcpcd
+endef
+
 # NOTE: Even though this package has a configure script, it is not generated
 # using the autotools, so we have to use the generic package infrastructure.
 
-- 
2.7.4
