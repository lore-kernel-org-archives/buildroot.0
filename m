From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 16:55:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: portmap tftpd
Message-ID: <20070114005525.4A5F34858E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 16:55:25 -0800 (Sat, 13 Jan 2007)
New Revision: 17268

Log:
Update packages to provide properly working initialization scripts. These have been tested with embedded PowerPC systems.


Added:
   trunk/buildroot/package/portmap/init-portmap

Modified:
   trunk/buildroot/package/portmap/portmap.mk
   trunk/buildroot/package/tftpd/init-tftpd
   trunk/buildroot/package/tftpd/tftpd.mk


Changeset:
Added: trunk/buildroot/package/portmap/init-portmap
===================================================================
--- trunk/buildroot/package/portmap/init-portmap	                        (rev 0)
+++ trunk/buildroot/package/portmap/init-portmap	2007-01-14 00:55:25 UTC (rev 17268)
@@ -0,0 +1,44 @@
+#! /bin/sh
+
+[ -f /sbin/portmap ] || exit 0
+
+start() {
+	echo -n "Starting portmap: "
+	portmap
+	mkdir -p /var/lock/subsys
+	touch /var/lock/subsys/portmap
+	echo "done"
+}
+
+
+stop() {
+        echo -n "Stopping portmap: "
+	echo
+        killall portmap
+        rm -rf /var/lock/subsys
+	echo "done"
+}
+
+restart() {
+	stop
+	start
+	rm -f /var/run/portmap.state
+}
+
+# See how we were called.
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|reload|restart}"
+	exit 1
+esac
+
+exit $?


Property changes on: trunk/buildroot/package/portmap/init-portmap
___________________________________________________________________
Name: svn:executable
   + *

Modified: trunk/buildroot/package/portmap/portmap.mk
===================================================================
--- trunk/buildroot/package/portmap/portmap.mk	2007-01-14 00:54:14 UTC (rev 17267)
+++ trunk/buildroot/package/portmap/portmap.mk	2007-01-14 00:55:25 UTC (rev 17268)
@@ -25,12 +25,14 @@
 	$(MAKE) CC=$(TARGET_CC) O="$(TARGET_CFLAGS)" -C $(PORTMAP_DIR)
 
 $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY): $(PORTMAP_DIR)/$(PORTMAP_BINARY)
-	install -D $(PORTMAP_DIR)/$(PORTMAP_BINARY) $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
+	$(INSTALL) -D $(PORTMAP_DIR)/$(PORTMAP_BINARY) $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
+	$(INSTALL) -m 0755 -D package/portmap/init-portmap $(TARGET_DIR)/etc/init.d/S13portmap
 
 portmap: uclibc $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
 
 portmap-clean:
 	rm -f $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/etc/init.d/S13portmap
 	-$(MAKE) -C $(PORTMAP_DIR) clean
 
 portmap-dirclean:

Modified: trunk/buildroot/package/tftpd/init-tftpd
===================================================================
--- trunk/buildroot/package/tftpd/init-tftpd	2007-01-14 00:54:14 UTC (rev 17267)
+++ trunk/buildroot/package/tftpd/init-tftpd	2007-01-14 00:55:25 UTC (rev 17268)
@@ -1,19 +1,7 @@
 #! /bin/sh
-#
-# Author:	Jaakko Niemi <liiwi@iki.fi>
-# Modified from skeleton file in sarge
 
+OPTIONS="-c -l -s /var/lib/tftpboot"
 
-
-
-
-#Defaults for tftpd-hpa
-RUN_DAEMON="yes"
-OPTIONS="-l -s /var/lib/tftpboot"
-
-
-
-
 set -e
 
 PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
@@ -23,46 +11,40 @@
 PIDFILE=/var/run/$NAME.pid
 SCRIPTNAME=/etc/init.d/S80tftpd-hpa
 
-# Gracefully exit if the package has been removed.
-test -x $DAEMON || exit 0
-
-
-if [ "$RUN_DAEMON" != "yes" ] ; then
-         echo "tftpd-hpa disabled in /etc/init.d/S80tftpd-hpa"
-	 exit 0
-fi
-
 #
 #	Function that starts the daemon/service.
 #
 d_start() {
-	start-stop-daemon --start --quiet --exec $DAEMON -- $OPTIONS
+	mkdir -p /var/lib/tftpboot
+	chmod 1777 /var/lib/tftpboot
+	$DAEMON $OPTIONS
 }
 
 #
 #	Function that stops the daemon/service.
 #
 d_stop() {
-	start-stop-daemon --stop --quiet --name $NAME
+	killall -q $NAME
 }
 
 #
 #	Function that sends a SIGHUP to the daemon/service.
 #
 d_reload() {
-	start-stop-daemon --stop --quiet --name $NAME --signal 1
+	d_start
+	d_stop
 }
 
 case "$1" in
   start)
-	echo -n "Starting $DESC: $NAME"
+	echo -n "Starting $DESC: "
 	d_start
-	echo "."
+	echo "done"
 	;;
   stop)
-	echo -n "Stopping $DESC: $NAME"
+	echo -n "Stopping $DESC: "
 	d_stop
-	echo "."
+	echo "done"
 	;;
   #reload)
 	#
@@ -83,11 +65,11 @@
 	#	option to the "reload" entry above. If not, "force-reload" is
 	#	just the same as "restart".
 	#
-	echo -n "Restarting $DESC: $NAME"
+	echo -n "Restarting $DESC: "
 	d_stop
 	sleep 1
 	d_start
-	echo "."
+	echo "done"
 	;;
   *)
 	# echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2

Modified: trunk/buildroot/package/tftpd/tftpd.mk
===================================================================
--- trunk/buildroot/package/tftpd/tftpd.mk	2007-01-14 00:54:14 UTC (rev 17267)
+++ trunk/buildroot/package/tftpd/tftpd.mk	2007-01-14 00:55:25 UTC (rev 17268)
@@ -56,13 +56,13 @@
 	    set -x; \
 	    rm -f $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); \
 	    cp -a $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY) $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); fi ;
-	-mkdir $(TARGET_DIR)/var/lib/tftpboot
 	$(INSTALL) -D -m 0755 package/tftpd/init-tftpd $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
 
 tftpd: uclibc $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY)
 
 tftpd-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(TFTP_HPA_DIR) uninstall
+	rm -rf $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
+	rm -rf $(TARGET_DIR)/usr/sbin/in.tftpd
 	-$(MAKE) -C $(TFTP_HPA_DIR) clean
 
 tftpd-dirclean:
