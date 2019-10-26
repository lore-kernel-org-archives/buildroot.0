From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 26 Oct 2019 10:19:04 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/collectd: add init script for
 SysV
Message-ID: <20191026071905.23036-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
v1->v2: use start-stop-daemon
---
 package/collectd/S90collectd | 36 ++++++++++++++++++++++++++++++++++++
 package/collectd/collectd.mk |  5 +++++
 2 files changed, 41 insertions(+)
 create mode 100644 package/collectd/S90collectd

diff --git a/package/collectd/S90collectd b/package/collectd/S90collectd
new file mode 100644
index 0000000000..3c5af17674
--- /dev/null
+++ b/package/collectd/S90collectd
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+DAEMON="collectd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf "Starting collectd... "
+	start-stop-daemon -b -m -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping collectd... "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
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
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5d94dec46d..1bce196e7e 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -218,4 +218,9 @@ define COLLECTD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/collectd.service
 endef
 
+define COLLECTD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/collectd/S90collectd \
+		$(TARGET_DIR)/etc/init.d/S90collectd
+endef
+
 $(eval $(autotools-package))
-- 
2.20.1
