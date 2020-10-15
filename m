From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:40:43 +0200
Subject: [Buildroot] [git commit] package/mrp: add init script and systemd
 unit file
Message-ID: <20201015212930.B294F832C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72de9713f9d0fa37fdf32ac66abe8cf889dfa255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add init script and systemd unit for MRP because it is using a daemon.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mrp/S65mrp      | 55 +++++++++++++++++++++++++++++++++++++++++++++++++
 package/mrp/mrp.mk      | 10 +++++++++
 package/mrp/mrp.service | 10 +++++++++
 3 files changed, 75 insertions(+)

diff --git a/package/mrp/S65mrp b/package/mrp/S65mrp
new file mode 100644
index 0000000000..0ce1f80f81
--- /dev/null
+++ b/package/mrp/S65mrp
@@ -0,0 +1,55 @@
+#!/bin/sh
+#
+# Start mrp
+#
+
+DAEMON="mrp_server"
+
+PIDFILE="/var/run/$DAEMON.pid"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/mrp_server" ] && . "/etc/default/mrp_server"
+
+start() {
+	printf "Starting mrp daemon: "
+	start-stop-daemon -S -b -q -m -p $PIDFILE \
+		-x /usr/bin/$DAEMON
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return $status
+}
+
+stop() {
+	printf "Stopping mrp daemon: "
+	start-stop-daemon -K -q -p $PIDFILE
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return $status
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	stop
+	start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/mrp/mrp.mk b/package/mrp/mrp.mk
index 4d8a1fc92a..7e31e442ce 100644
--- a/package/mrp/mrp.mk
+++ b/package/mrp/mrp.mk
@@ -10,4 +10,14 @@ MRP_DEPENDENCIES = libev libmnl libnl
 MRP_LICENSE = GPL-2.0
 MRP_LICENSE_FILES = LICENSE
 
+define MRP_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D $(MRP_PKGDIR)/S65mrp \
+		$(TARGET_DIR)/etc/init.d/S65mrp
+endef
+
+define MRP_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(MRP_PKGDIR)/mrp.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mrp.service
+endef
+
 $(eval $(cmake-package))
diff --git a/package/mrp/mrp.service b/package/mrp/mrp.service
new file mode 100644
index 0000000000..05006a70aa
--- /dev/null
+++ b/package/mrp/mrp.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Media Redundancy Protocol
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/mrp
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
