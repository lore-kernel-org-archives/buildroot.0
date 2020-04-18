From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 14:50:12 +0200
Subject: [Buildroot] [git commit] package/swupdate: add basic systemd/sysv
 service
Message-ID: <20200418123628.9935E8EE19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37f5f0d257d14d4ff30f36e35c3f173fea10e48c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/S80swupdate      | 47 +++++++++++++++++++++++++++++++++++++++
 package/swupdate/swupdate.mk      | 19 ++++++++++++++++
 package/swupdate/swupdate.service | 11 +++++++++
 package/swupdate/swupdate.sh      | 30 +++++++++++++++++++++++++
 4 files changed, 107 insertions(+)

diff --git a/package/swupdate/S80swupdate b/package/swupdate/S80swupdate
new file mode 100644
index 0000000000..4421084b67
--- /dev/null
+++ b/package/swupdate/S80swupdate
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+DAEMON="swupdate"
+DAEMON_WRAPPER="/usr/lib/swupdate/swupdate.sh"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x $DAEMON_WRAPPER
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
+		# Restart, since there is no true "reload" feature (does not
+		# reconfigure/restart on SIGHUP, just closes all open files).
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 2b51edb66d..4b19ec0f5f 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -189,4 +189,23 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
+define SWUPDATE_INSTALL_COMMON
+	mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
+		$(TARGET_DIR)/usr/lib/swupdate/conf.d
+	$(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
+		$(TARGET_DIR)/usr/lib/swupdate/swupdate.sh
+endef
+define SWUPDATE_INSTALL_INIT_SYSTEMD
+	$(SWUPDATE_INSTALL_COMMON)
+	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
+endef
+define SWUPDATE_INSTALL_INIT_SYSV
+	$(SWUPDATE_INSTALL_COMMON)
+	$(INSTALL) -D -m 755 package/swupdate/S80swupdate \
+		$(TARGET_DIR)/etc/init.d/S80swupdate
+endef
+endif
+
 $(eval $(kconfig-package))
diff --git a/package/swupdate/swupdate.service b/package/swupdate/swupdate.service
new file mode 100644
index 0000000000..a3d8d1939e
--- /dev/null
+++ b/package/swupdate/swupdate.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=SWUpdate daemon
+Documentation=https://github.com/sbabic/swupdate
+Documentation=https://sbabic.github.io/swupdate
+
+[Service]
+ExecStart=/usr/lib/swupdate/swupdate.sh
+KillMode=mixed
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/swupdate/swupdate.sh b/package/swupdate/swupdate.sh
new file mode 100644
index 0000000000..17d99ef0d4
--- /dev/null
+++ b/package/swupdate/swupdate.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+# Based on example script created by Adrian Freihofer
+# https://github.com/sbabic/meta-swupdate/blob/master/recipes-support/swupdate/swupdate/swupdate.sh
+
+# Override these variables in sourced script(s) located
+# in /usr/lib/swupdate/conf.d or /etc/swupdate/conf.d
+SWUPDATE_ARGS="-v ${SWUPDATE_EXTRA_ARGS}"
+SWUPDATE_WEBSERVER_ARGS=""
+SWUPDATE_SURICATTA_ARGS=""
+
+# source all files from /etc/swupdate/conf.d and /usr/lib/swupdate/conf.d/
+# A file found in /etc replaces the same file in /usr
+for f in `(test -d /usr/lib/swupdate/conf.d/ && ls -1 /usr/lib/swupdate/conf.d/; test -d /etc/swupdate/conf.d && ls -1 /etc/swupdate/conf.d) | sort -u`; do
+  if [ -f /etc/swupdate/conf.d/$f ]; then
+    . /etc/swupdate/conf.d/$f
+  else
+    . /usr/lib/swupdate/conf.d/$f
+  fi
+done
+
+if [ "$SWUPDATE_WEBSERVER_ARGS" != "" -a  "$SWUPDATE_SURICATTA_ARGS" != "" ]; then
+  exec /usr/bin/swupdate $SWUPDATE_ARGS -w "$SWUPDATE_WEBSERVER_ARGS" -u "$SWUPDATE_SURICATTA_ARGS"
+elif [ "$SWUPDATE_WEBSERVER_ARGS" != "" ]; then
+  exec /usr/bin/swupdate $SWUPDATE_ARGS -w "$SWUPDATE_WEBSERVER_ARGS"
+elif [ "$SWUPDATE_SURICATTA_ARGS" != "" ]; then
+  exec /usr/bin/swupdate $SWUPDATE_ARGS -u "$SWUPDATE_SURICATTA_ARGS"
+else
+  exec /usr/bin/swupdate $SWUPDATE_ARGS
+fi
