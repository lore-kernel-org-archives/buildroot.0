From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed,  1 Jul 2015 22:11:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/modem-manager: init script for
	systemV-like init systems
Message-ID: <1435781472-13078-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ModemManager get started by NetworkManager, in case of systemd init
system. In case of other systems it needs to be started by init script.

Debian [1] solved it by detection in code. For Buildroot it's IMHO
enough to install init script for systemV-like init systems.

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=770871

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Rewrited init script to use start-stop-daemon.
* Intended install command.
---
 package/modem-manager/S44modem-manager | 45 ++++++++++++++++++++++++++++++++++
 package/modem-manager/modem-manager.mk |  4 +++
 2 files changed, 49 insertions(+)
 create mode 100755 package/modem-manager/S44modem-manager

diff --git a/package/modem-manager/S44modem-manager b/package/modem-manager/S44modem-manager
new file mode 100755
index 0000000..99076cc
--- /dev/null
+++ b/package/modem-manager/S44modem-manager
@@ -0,0 +1,45 @@
+#!/bin/sh
+#
+# Starts ModemManager
+#
+
+MODEMMANAGER_BIN=/usr/sbin/ModemManager
+PIDFILE=/var/run/ModemManager.pid
+
+[ -x $MODEMMANAGER_BIN ] || exit 0
+
+start() {
+	echo -n "Starting ModemManager: "
+	umask 077
+	start-stop-daemon -S -q -b -m -p $PIDFILE \
+		--exec $MODEMMANAGER_BIN
+	ret=$?
+	[ $ret = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	echo -n "Stopping ModemManager: "
+	start-stop-daemon -K -q -p $PIDFILE
+	ret=$?
+	[ $ret = 0 ] && { echo "OK"; rm -f $PIDFILE; } || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $ret
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 9cd630c..059e336 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -26,4 +26,8 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-mbim
 endif
 
+define MODEM_MANAGER_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager $(TARGET_DIR)/etc/init.d/S44modem-manager
+endef
+
 $(eval $(autotools-package))
-- 
1.8.0
