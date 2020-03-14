From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:32:42 +0100
Subject: [Buildroot] [git commit] package/linuxptp: make initscript options
 configurable
Message-ID: <20200314142412.B9FD082C83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=248229e3b77155be991fdc5c3379bf2ec35e937f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "package/busybox/S01sysklogd" is taken as template to change the
init script of the linuxptp daemon. The init script is split two parts
because there are 2 daemons (ptp4l and phc2sys).

Let the user supply its own options in /etc/default/ptp4l and
/etc/default/phc2sys.

This patch also fixes an issue with the creation of the pid file that is
needed to properly stop the daemon again.

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linuxptp/S65linuxptp | 46 -----------------------------------
 package/linuxptp/S65ptp4l    | 57 ++++++++++++++++++++++++++++++++++++++++++++
 package/linuxptp/S66phc2sys  | 57 ++++++++++++++++++++++++++++++++++++++++++++
 package/linuxptp/linuxptp.mk |  6 +++--
 4 files changed, 118 insertions(+), 48 deletions(-)

diff --git a/package/linuxptp/S65linuxptp b/package/linuxptp/S65linuxptp
deleted file mode 100644
index 46b8921fdd..0000000000
--- a/package/linuxptp/S65linuxptp
+++ /dev/null
@@ -1,46 +0,0 @@
-#!/bin/sh
-#
-# Start linuxptp
-#
-
-start() {
-	printf "Starting linuxptp daemon: "
-	start-stop-daemon -S -b -q -p /var/run/linuxptp-ptp4l.pid \
-		-x /usr/sbin/ptp4l -- -f /etc/linuxptp.cfg
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-
-	printf "Starting linuxptp system clock synchronization: "
-	start-stop-daemon -S -b -q -p /var/run/linuxptp-phc2sys.pid \
-		-x /usr/sbin/phc2sys -- -s eth0 -c CLOCK_REALTIME -w -S 1.0
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-
-stop() {
-	printf "Stopping linuxptp system clock synchronization: "
-	start-stop-daemon -K -q -p /var/run/linuxptp-phc2sys.pid \
-		-x /usr/sbin/phc2sys
-	echo "OK"
-
-	printf "Stopping linuxptp daemon: "
-	start-stop-daemon -K -q -p /var/run/linuxptp-ptp4l.pid \
-		-x /usr/sbin/ptp4l
-	echo "OK"
-}
-
-case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	stop
-	start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/linuxptp/S65ptp4l b/package/linuxptp/S65ptp4l
new file mode 100644
index 0000000000..1b9e3c9300
--- /dev/null
+++ b/package/linuxptp/S65ptp4l
@@ -0,0 +1,57 @@
+#!/bin/sh
+#
+# Start linuxptp
+#
+
+DAEMON="ptp4l"
+
+PIDFILE="/var/run/$DAEMON.pid"
+
+PTP4L_ARGS="-f /etc/linuxptp.cfg"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/ptp4l" ] && . "/etc/default/ptp4l"
+
+start() {
+	printf "Starting linuxptp daemon: "
+	start-stop-daemon -S -b -q -m -p $PIDFILE \
+		-x /usr/sbin/$DAEMON -- $PTP4L_ARGS
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
+	printf "Stopping linuxptp daemon: "
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
diff --git a/package/linuxptp/S66phc2sys b/package/linuxptp/S66phc2sys
new file mode 100644
index 0000000000..fd1ec59bb4
--- /dev/null
+++ b/package/linuxptp/S66phc2sys
@@ -0,0 +1,57 @@
+#!/bin/sh
+#
+# Start linuxptp
+#
+
+DAEMON="phc2sys"
+
+PIDFILE="/var/run/$DAEMON.pid"
+
+PHC2SYS_ARGS="-a -r -S 1.0"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/phc2sys" ] && . "/etc/default/phc2sys"
+
+start() {
+	printf "Starting linuxptp system clock synchronization: "
+	start-stop-daemon -S -b -q -m -p $PIDFILE \
+		-x /usr/sbin/$DAEMON -- $PHC2SYS_ARGS
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
+	printf "Stopping linuxptp system clock synchronization: "
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
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 97e4af7be7..ba57396f86 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -33,8 +33,10 @@ define LINUXPTP_INSTALL_TARGET_CMDS
 endef
 
 define LINUXPTP_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D $(LINUXPTP_PKGDIR)/S65linuxptp \
-		$(TARGET_DIR)/etc/init.d/S65linuxptp
+	$(INSTALL) -m 755 -D $(LINUXPTP_PKGDIR)/S65ptp4l \
+		$(TARGET_DIR)/etc/init.d/S65ptp4l
+	$(INSTALL) -m 755 -D $(LINUXPTP_PKGDIR)/S66phc2sys \
+		$(TARGET_DIR)/etc/init.d/S66phc2sys
 endef
 
 define LINUXPTP_INSTALL_INIT_SYSTEMD
