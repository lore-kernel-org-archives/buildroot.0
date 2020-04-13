From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 22:33:20 +0200
Subject: [Buildroot] [git commit] package/collectd: add init script for SysV
Message-ID: <20200413201934.43D248EB45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=668fc0ddd96eb812f504b529d12e600ecd1df448
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Carlos Santos <unixmania@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/S90collectd | 51 ++++++++++++++++++++++++++++++++++++++++++++
 package/collectd/collectd.mk |  5 +++++
 2 files changed, 56 insertions(+)

diff --git a/package/collectd/S90collectd b/package/collectd/S90collectd
new file mode 100644
index 0000000000..cf11c7b383
--- /dev/null
+++ b/package/collectd/S90collectd
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DAEMON="collectd"
+EXEC="/usr/sbin/$DAEMON"
+PIDFILE="/var/run/$DAEMON.pid"
+COLLECTD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "$EXEC" \
+		-- $COLLECTD_ARGS
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
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 97e1d17b5e..c09edebfc9 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -232,4 +232,9 @@ define COLLECTD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/collectd.service
 endef
 
+define COLLECTD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/collectd/S90collectd \
+		$(TARGET_DIR)/etc/init.d/S90collectd
+endef
+
 $(eval $(autotools-package))
