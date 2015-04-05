From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 6 Apr 2015 01:04:17 +0300
Subject: [Buildroot] [RFC v2 5/6] gpsd: common service startup
In-Reply-To: <cover.1428263859.git.alex.suykov@gmail.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
Message-ID: <af0622922414756dc7802758735e094b7f5420aa.1428263859.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs variable substitution in its .run file.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/gpsd/S50gpsd  | 40 ----------------------------------------
 package/gpsd/gpsd.mk  |  9 ++++++---
 package/gpsd/gpsd.run |  3 +++
 3 files changed, 9 insertions(+), 43 deletions(-)
 delete mode 100644 package/gpsd/S50gpsd
 create mode 100644 package/gpsd/gpsd.run

diff --git a/package/gpsd/S50gpsd b/package/gpsd/S50gpsd
deleted file mode 100644
index 6e5ce88..0000000
--- a/package/gpsd/S50gpsd
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/bin/sh
-#
-# Starts the gps daemon.
-#
-
-NAME=gpsd
-DAEMON=/usr/sbin/$NAME
-DEVICES=/dev/ttyS1
-PIDFILE=/var/run/$NAME.pid
-
-start() {
-        echo -n "Starting $NAME: "
-        start-stop-daemon -S -q -p $PIDFILE --exec $DAEMON -- -P $PIDFILE $DEVICES && echo "OK" || echo "Failed"
-}
-stop() {
-        echo -n "Stopping $NAME: "
-        start-stop-daemon -K -q -p $PIDFILE && echo "OK" || echo "Failed"
-        rm -f $PIDFILE
-}
-restart() {
-        stop
-        start
-}
-
-case "$1" in
-  start)
-        start
-        ;;
-  stop)
-        stop
-        ;;
-  restart|reload)
-        restart
-        ;;
-  *)
-        echo "Usage: $0 {start|stop|restart}"
-        exit 1
-esac
-
-exit $?
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 9623d75..de0aec9 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -208,10 +208,13 @@ define GPSD_INSTALL_TARGET_CMDS
 		install)
 endef
 
-define GPSD_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd
-	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
+ifdef BR2_PACKAGE_GPSD_DEVICES
+define GPSD_INSTALL_INIT
+	cp package/gpsd/gpsd.run $(@D)/gpsd.run
+	$(SED) "s!DEVICES!$(call qstrip,$(BR2_PACKAGE_GPSD_DEVICES))!" $(@D)/gpsd.run
+	support/init/install $(BR2_INIT) $(TARGET_DIR) $(@D)/gpsd.run
 endef
+endif
 
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
diff --git a/package/gpsd/gpsd.run b/package/gpsd/gpsd.run
new file mode 100644
index 0000000..2cb8f4e
--- /dev/null
+++ b/package/gpsd/gpsd.run
@@ -0,0 +1,3 @@
+description: GPS daemon
+foreground: /usr/sbin/gpsd -N DEVICES
+background: /usr/sbin/gpsd DEVICES
-- 
2.0.3
