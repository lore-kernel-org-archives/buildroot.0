From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Dec 2018 22:14:05 +0100
Subject: [Buildroot] [git commit] busybox: rewrite logging init script
Message-ID: <20181210222530.6890D8B922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b87d8768819767285669a25a8e160b6e2faad58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Split S01logging into S01syslogd and S02klogd. Install them only if no
  other syslog package is selected and the corresponding daemons are
  selected in the Busybox configuration.
- Support /etc/default/$DAEMON configuration files.
- Detect and report start/stop errors (previous version ignored them and
  always reported OK).
- Use a separate function for restart.
- Implement reload as restart.

The dependency of busybox on rsyslog and syslog-ng was only needed
because those packages also installed S01logging. Since now they no
longer install the same file, these dependencies are no longer needed.
The dependency on sysklogd is still needed since that one installs the
syslogd and klogd executables with the same name as busybox.

The -n option of syslogd/klogd is obligatory because start-stop-daemon
starts it in the background. Therefore, move it out of the
SYSLOGD_ARGS resp. KLOGD_ARGS variable so the user can no longer remove
it.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Arnout: keep dependency on sysklogd]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/S01logging | 40 ---------------------------------
 package/busybox/S01syslogd | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 package/busybox/S02klogd   | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 18 +++++++++------
 4 files changed, 121 insertions(+), 47 deletions(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
deleted file mode 100644
index fcb3e7d236..0000000000
--- a/package/busybox/S01logging
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/bin/sh
-#
-# Start logging
-#
-
-SYSLOGD_ARGS=-n
-KLOGD_ARGS=-n
-[ -r /etc/default/logging ] && . /etc/default/logging
-
-start() {
-	printf "Starting logging: "
-	start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- $SYSLOGD_ARGS
-	start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd -- $KLOGD_ARGS
-	echo "OK"
-}
-
-stop() {
-	printf "Stopping logging: "
-	start-stop-daemon -K -q -p /var/run/syslogd.pid
-	start-stop-daemon -K -q -p /var/run/klogd.pid
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
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/busybox/S01syslogd b/package/busybox/S01syslogd
new file mode 100644
index 0000000000..6e642a678a
--- /dev/null
+++ b/package/busybox/S01syslogd
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+DAEMON="syslogd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+SYSLOGD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# BusyBox' syslogd does not create a pidfile, so pass "-n" in the command line
+# and use "-m" to instruct start-stop-daemon to create one.
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+		-- -n $SYSLOGD_ARGS
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
+        start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
diff --git a/package/busybox/S02klogd b/package/busybox/S02klogd
new file mode 100644
index 0000000000..a4200cfb34
--- /dev/null
+++ b/package/busybox/S02klogd
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+DAEMON="klogd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+KLOGD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# BusyBox' klogd does not create a pidfile, so pass "-n" in the command line
+# and use "-m" to instruct start-stop-daemon to create one.
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+		-- -n $KLOGD_ARGS
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
+        start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 757086592f..bfcca6ed3e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -55,10 +55,8 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
 	$(if $(BR2_PACKAGE_PROCPS_NG),procps-ng) \
 	$(if $(BR2_PACKAGE_PSMISC),psmisc) \
-	$(if $(BR2_PACKAGE_RSYSLOGD),rsyslog) \
 	$(if $(BR2_PACKAGE_START_STOP_DAEMON),start-stop-daemon) \
 	$(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \
-	$(if $(BR2_PACKAGE_SYSLOG_NG),syslog-ng) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd) \
 	$(if $(BR2_PACKAGE_SYSVINIT),sysvinit) \
 	$(if $(BR2_PACKAGE_TAR),tar) \
@@ -245,15 +243,21 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
 endef
 endif
 
-# Only install our own if no other package already did.
+# Only install our logging scripts if no other package does it.
+ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
-	if grep -q CONFIG_SYSLOGD=y $(@D)/.config && \
-		[ ! -e $(TARGET_DIR)/etc/init.d/S01logging ]; \
+	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; \
 	then \
-		$(INSTALL) -m 0755 -D package/busybox/S01logging \
-			$(TARGET_DIR)/etc/init.d/S01logging; \
+		$(INSTALL) -m 0755 -D package/busybox/S01syslogd \
+			$(TARGET_DIR)/etc/init.d/S01syslogd; \
+	fi; \
+	if grep -q CONFIG_KLOGD=y $(@D)/.config; \
+	then \
+		$(INSTALL) -m 0755 -D package/busybox/S02klogd \
+			$(TARGET_DIR)/etc/init.d/S02klogd; \
 	fi
 endef
+endif
 
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_INITTAB
