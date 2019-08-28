From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 27 Aug 2019 23:16:26 -0300
Subject: [Buildroot] [PATCH 2/2] package/thttpd: fix init script
In-Reply-To: <20190828021626.9688-1-unixmania@gmail.com>
References: <20190828021626.9688-1-unixmania@gmail.com>
Message-ID: <20190828021626.9688-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The init script provided by thttpd is for FreeBSD. Add a custom one,
maade specifically for Buirdroot.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/thttpd/S90thttpd | 54 ++++++++++++++++++++++++++++++++++++++++
 package/thttpd/thttpd.mk |  4 +--
 2 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 package/thttpd/S90thttpd

diff --git a/package/thttpd/S90thttpd b/package/thttpd/S90thttpd
new file mode 100644
index 0000000000..94b079b050
--- /dev/null
+++ b/package/thttpd/S90thttpd
@@ -0,0 +1,54 @@
+#!/bin/sh
+
+DAEMON="thttpd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+THTTPD_ARGS="-C /etc/thttpd.conf"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $THTTPD_ARGS
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
+		# thttpd does not remove the pid file on exit
+		rm -f "$PIDFILE"
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
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 03f148eb35..6cf86e4b95 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -29,8 +29,8 @@ define THTTPD_INSTALL_TARGET_CMDS
 endef
 
 define THTTPD_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
-	$(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
+	$(INSTALL) -D -m 0755 package/thttpd/S90thttpd \
+		$(TARGET_DIR)/etc/init.d/S90thttpd
 endef
 
 define THTTPD_INSTALL_INIT_SYSTEMD
-- 
2.18.1
