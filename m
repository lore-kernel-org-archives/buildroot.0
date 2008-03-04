From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Mar 2008 04:19:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20080304121914.3879B120129@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-04 04:19:13 -0800 (Tue, 04 Mar 2008)
New Revision: 21161

Log:
dbus: start earlier

Start dbus early enough so other services can use it (E.G. avahi).


Added:
   trunk/buildroot/package/dbus/S30dbus

Removed:
   trunk/buildroot/package/dbus/S97messagebus

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Copied: trunk/buildroot/package/dbus/S30dbus (from rev 21160, trunk/buildroot/package/dbus/S97messagebus)
===================================================================
--- trunk/buildroot/package/dbus/S30dbus	                        (rev 0)
+++ trunk/buildroot/package/dbus/S30dbus	2008-03-04 12:19:13 UTC (rev 21161)
@@ -0,0 +1,77 @@
+#!/bin/sh
+#
+# messagebus:   The D-BUS systemwide message bus
+#
+# chkconfig: 345 97 03
+# description:  This is a daemon which broadcasts notifications of system events \
+#               and other messages. See http://www.freedesktop.org/software/dbus/
+#
+# processname: dbus-daemon
+# pidfile: /var/run/messagebus.pid
+#
+
+# Sanity checks.
+[ -x /usr/bin/dbus-daemon ] || exit 0
+
+# Create needed directories.
+[ -d /var/run/dbus ] || mkdir -p /var/run/dbus
+[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
+
+RETVAL=0
+
+start() {
+    echo -n "Starting system message bus: "
+
+    dbus-uuidgen --ensure
+    dbus-daemon --system
+    RETVAL=$?
+    echo "done"
+    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/dbus-daemon
+}
+
+stop() {
+    echo -n "Stopping system message bus: "
+
+    ## we don't want to kill all the per-user $processname, we want
+    ## to use the pid file *only*; because we use the fake nonexistent 
+    ## program name "$servicename" that should be safe-ish
+    killall dbus-daemon
+    RETVAL=$?
+    echo "done"
+    if [ $RETVAL -eq 0 ]; then
+        rm -f /var/lock/subsys/dbus-daemon
+        rm -f /var/run/messagebus.pid
+    fi
+}
+
+# See how we were called.
+case "$1" in
+    start)
+        start
+        ;;
+    stop)
+        stop
+        ;;
+    status)
+        status $processname
+        RETVAL=$?
+        ;;
+    restart)
+        stop
+        start
+        ;;
+    condrestart)
+        if [ -f /var/lock/subsys/$servicename ]; then
+            stop
+            start
+        fi
+        ;;
+    reload)
+        echo "Message bus can't reload its configuration, you have to restart it"
+        RETVAL=$?
+        ;;
+    *)
+        echo $"Usage: $0 {start|stop|status|restart|condrestart|reload}"
+        ;;
+esac
+exit $RETVAL

Deleted: trunk/buildroot/package/dbus/S97messagebus
===================================================================
--- trunk/buildroot/package/dbus/S97messagebus	2008-03-04 11:36:25 UTC (rev 21160)
+++ trunk/buildroot/package/dbus/S97messagebus	2008-03-04 12:19:13 UTC (rev 21161)
@@ -1,77 +0,0 @@
-#!/bin/sh
-#
-# messagebus:   The D-BUS systemwide message bus
-#
-# chkconfig: 345 97 03
-# description:  This is a daemon which broadcasts notifications of system events \
-#               and other messages. See http://www.freedesktop.org/software/dbus/
-#
-# processname: dbus-daemon
-# pidfile: /var/run/messagebus.pid
-#
-
-# Sanity checks.
-[ -x /usr/bin/dbus-daemon ] || exit 0
-
-# Create needed directories.
-[ -d /var/run/dbus ] || mkdir -p /var/run/dbus
-[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
-
-RETVAL=0
-
-start() {
-    echo -n "Starting system message bus: "
-
-    dbus-uuidgen --ensure
-    dbus-daemon --system
-    RETVAL=$?
-    echo "done"
-    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/dbus-daemon
-}
-
-stop() {
-    echo -n "Stopping system message bus: "
-
-    ## we don't want to kill all the per-user $processname, we want
-    ## to use the pid file *only*; because we use the fake nonexistent 
-    ## program name "$servicename" that should be safe-ish
-    killall dbus-daemon
-    RETVAL=$?
-    echo "done"
-    if [ $RETVAL -eq 0 ]; then
-        rm -f /var/lock/subsys/dbus-daemon
-        rm -f /var/run/messagebus.pid
-    fi
-}
-
-# See how we were called.
-case "$1" in
-    start)
-        start
-        ;;
-    stop)
-        stop
-        ;;
-    status)
-        status $processname
-        RETVAL=$?
-        ;;
-    restart)
-        stop
-        start
-        ;;
-    condrestart)
-        if [ -f /var/lock/subsys/$servicename ]; then
-            stop
-            start
-        fi
-        ;;
-    reload)
-        echo "Message bus can't reload its configuration, you have to restart it"
-        RETVAL=$?
-        ;;
-    *)
-        echo $"Usage: $0 {start|stop|status|restart|condrestart|reload}"
-        ;;
-esac
-exit $RETVAL

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2008-03-04 11:36:25 UTC (rev 21160)
+++ trunk/buildroot/package/dbus/dbus.mk	2008-03-04 12:19:13 UTC (rev 21161)
@@ -72,7 +72,7 @@
 		$(TARGET_DIR)/usr/lib/libdbus-1.la \
 		$(TARGET_DIR)/usr/include/dbus-1.0 \
 		$(TARGET_DIR)/usr/lib/pkgconfig
-	$(INSTALL) -m 0755 package/dbus/S97messagebus $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
 	rm -f $(TARGET_DIR)/etc/init.d/messagebus
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/man
@@ -84,7 +84,7 @@
 	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.conf
 	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/dbus-1/system.d
-	rm -f $(TARGET_DIR)/etc/init.d/S97messagebus
+	rm -f $(TARGET_DIR)/etc/init.d/S30dbus
 	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.so*
 	rm -f $(TARGET_DIR)/usr/bin/dbus-daemon
 	rm -rf $(TARGET_DIR)/tmp/dbus
