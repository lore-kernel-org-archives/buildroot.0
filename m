From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 16 Jun 2015 22:11:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: init script for
	systemV-like init systems
Message-ID: <1434485488-27833-1-git-send-email-petr.vorel@gmail.com>
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
 package/modem-manager/S44modem-manager | 46 ++++++++++++++++++++++++++++++++++
 package/modem-manager/modem-manager.mk |  4 +++
 2 files changed, 50 insertions(+)
 create mode 100755 package/modem-manager/S44modem-manager

diff --git a/package/modem-manager/S44modem-manager b/package/modem-manager/S44modem-manager
new file mode 100755
index 0000000..56413da
--- /dev/null
+++ b/package/modem-manager/S44modem-manager
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+prefix=/usr
+exec_prefix=/usr
+sbindir=${exec_prefix}/sbin
+
+MODEMMANAGER_BIN=${sbindir}/ModemManager
+
+[ -x $MODEMMANAGER_BIN ] || exit 0
+
+PID=`pidof ModemManager`
+case "$1" in
+	start)
+		echo -n "Starting ModemManager ... "
+		[ ! -d /var/run/ModemManager ] && install -d /var/run/ModemManager
+		if [ -z "$PID" ]; then
+			$MODEMMANAGER_BIN &
+		fi
+		if [ ! -z "$PID" -o $? -gt 0 ]; then
+			echo "failed!"
+		else
+			echo "done."
+		fi
+		;;
+	stop)
+		echo -n "Stopping ModemManager ... "
+			[ ! -z "$PID" ] && kill $PID &> /dev/null
+		if [ $? -gt 0 ]; then
+			echo "failed!"
+		else
+			echo "done."
+		fi
+		;;
+	restart)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "usage: $0 {start|stop|restart|sleep|wake}"
+		;;
+esac
+exit 0
+
+
+
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 9cd630c..1433a68 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -26,4 +26,8 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-mbim
 endif
 
+define MODEM_MANAGER_INSTALL_INIT_SYSV
+$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager $(TARGET_DIR)/etc/init.d/S44modem-manager
+endef
+
 $(eval $(autotools-package))
-- 
1.8.0
