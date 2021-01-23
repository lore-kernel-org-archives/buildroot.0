From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:42:15 +0100
Subject: [Buildroot] [git commit] package/mrouted: add sysv init script
Message-ID: <20210123202257.8A4737FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c25115daf2b2761a2f0f411790c6d24b460c7999
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream mrouted package comes with its own systemd unit file, but
no SysV init script.  This script is a modified copy of the sysklogd
init script, but set to start after networking.

Note: for mrouted to start it requires at least two MULTICAST capable
      interfaces that are UP.  This is why an added startup delay of 30
      seconds (-w 30) was added, in case the system has DHCP enabled.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mrouted/S41mrouted | 62 ++++++++++++++++++++++++++++++++++++++++++++++
 package/mrouted/mrouted.mk |  5 ++++
 2 files changed, 67 insertions(+)

diff --git a/package/mrouted/S41mrouted b/package/mrouted/S41mrouted
new file mode 100755
index 0000000000..7dca258255
--- /dev/null
+++ b/package/mrouted/S41mrouted
@@ -0,0 +1,62 @@
+#!/bin/sh
+
+DAEMON="mrouted"
+PIDFILE="/var/run/$DAEMON.pid"
+
+MROUTED_ARGS="-w 30"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+		-- $MROUTED_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+# SIGHUP makes mrouted reload its configuration
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 2ee3c15aea..46a0958d8d 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -13,6 +13,11 @@ MROUTED_LICENSE_FILES = LICENSE
 MROUTED_CONFIGURE_OPTS = --enable-rsrr
 MROUTED_CPE_ID_VENDOR = troglobit
 
+define MROUTED_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/mrouted/S41mrouted \
+		$(TARGET_DIR)/etc/init.d/S41mrouted
+endef
+
 define MROUTED_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(@D)/mrouted.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mrouted.service
