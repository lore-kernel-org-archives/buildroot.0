From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 21:37:58 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/thttpd: fix init
 script
Message-ID: <20190925193248.93CF98F4DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5caa972607a8131edb7c5782743ac0c11eb53586
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

The init script provided by thttpd is for FreeBSD. Add a custom one,
made specifically for Buildroot.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc7488e99fb465a134f7ec4d56b77575db7ece7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thttpd/S90thttpd | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/thttpd/thttpd.mk |  4 ++--
 2 files changed, 56 insertions(+), 2 deletions(-)

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
index 29611fff2c..a028e48cb4 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -28,8 +28,8 @@ define THTTPD_INSTALL_TARGET_CMDS
 endef
 
 define THTTPD_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
-	$(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
+	$(INSTALL) -D -m 0755 package/thttpd/S90thttpd \
+		$(TARGET_DIR)/etc/init.d/S90thttpd
 endef
 
 define THTTPD_INSTALL_INIT_SYSTEMD
