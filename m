From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 16 Feb 2007 10:11:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/l2tp
Message-ID: <20070216181148.66D93485AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-16 10:11:48 -0800 (Fri, 16 Feb 2007)
New Revision: 17911

Log:
- add runlevel script


Added:
   trunk/buildroot/package/l2tp/l2tpd

Modified:
   trunk/buildroot/package/l2tp/l2tp.mk


Changeset:
Modified: trunk/buildroot/package/l2tp/l2tp.mk
===================================================================
--- trunk/buildroot/package/l2tp/l2tp.mk	2007-02-16 18:02:50 UTC (rev 17910)
+++ trunk/buildroot/package/l2tp/l2tp.mk	2007-02-16 18:11:48 UTC (rev 17911)
@@ -39,6 +39,7 @@
 
 $(TARGET_DIR)/$(L2TP_TARGET_BINARY): $(L2TP_DIR)/$(L2TP_BINARY)
 	cp -dpf $(L2TP_DIR)/$(L2TP_BINARY) $@
+	cp -dpf package/l2tp/l2tpd $(TARGET_DIR)/etc/init.d/
 	$(STRIP) $@
 
 l2tp: uclibc $(TARGET_DIR)/$(L2TP_TARGET_BINARY)

Added: trunk/buildroot/package/l2tp/l2tpd
===================================================================
--- trunk/buildroot/package/l2tp/l2tpd	                        (rev 0)
+++ trunk/buildroot/package/l2tp/l2tpd	2007-02-16 18:11:48 UTC (rev 17911)
@@ -0,0 +1,27 @@
+#!/bin/sh
+#
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+DAEMON=/usr/sbin/l2tpd
+PIDFILE=/var/run/l2tpd.pid
+
+test -f $DAEMON || exit 0
+
+case "$1" in
+  start)
+    start-stop-daemon --start  --pidfile $PIDFILE --exec $DAEMON -- -D &
+    ;;
+  stop)
+    start-stop-daemon --stop  --pidfile $PIDFILE --exec $DAEMON
+    ;;
+  restart|force-reload)
+    start-stop-daemon --stop  --pidfile $PIDFILE --exec $DAEMON 
+    sleep 1
+    start-stop-daemon --start  --pidfile $PIDFILE --exec $DAEMON
+    ;;
+  *)
+    echo "Usage: /etc/init.d/l2tdp {start|stop|restart|force-reload}"
+    exit 1
+    ;;
+esac
+
+exit 0


Property changes on: trunk/buildroot/package/l2tp/l2tpd
___________________________________________________________________
Name: svn:executable
   + *
