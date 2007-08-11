From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 16:35:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20070811233507.13CCCA65C0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 16:35:07 -0700 (Sat, 11 Aug 2007)
New Revision: 19450

Log:
Use a valid script file for lighttpd in target

Added:
   trunk/buildroot/package/lighttpd/rc.lighttpd

Modified:
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2007-08-11 23:33:22 UTC (rev 19449)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2007-08-11 23:35:07 UTC (rev 19450)
@@ -3,7 +3,7 @@
 # lighttpd
 #
 #############################################################
-LIGHTTPD_VERSION:=1.4.15
+LIGHTTPD_VERSION:=1.4.16
 LIGHTTPD_SOURCE:=lighttpd_$(LIGHTTPD_VERSION).orig.tar.gz
 LIGHTTPD_PATCH:=lighttpd_$(LIGHTTPD_VERSION)-1.diff.gz
 LIGHTTPD_SITE:=http://ftp.debian.org/debian/pool/main/l/lighttpd
@@ -73,7 +73,7 @@
 	@if [ ! -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf ] ; then \
 		$(INSTALL) -m 0644 -D $(LIGHTTPD_DIR)/doc/lighttpd.conf $(TARGET_DIR)/etc/lighttpd/lighttpd.conf; \
 	fi;
-	$(INSTALL) -m 0755 -D $(LIGHTTPD_DIR)/openwrt/S51lighttpd  $(TARGET_DIR)/etc/init.d/S99lighttpd
+	$(INSTALL) -m 0755 -D package/lighttpd/rc.lighttpd $(TARGET_DIR)/etc/init.d/S99lighttpd
 
 ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_OPENSSL)),y)
 lighttpd: uclibc openssl $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)

Added: trunk/buildroot/package/lighttpd/rc.lighttpd
===================================================================
--- trunk/buildroot/package/lighttpd/rc.lighttpd	                        (rev 0)
+++ trunk/buildroot/package/lighttpd/rc.lighttpd	2007-08-11 23:35:07 UTC (rev 19450)
@@ -0,0 +1,39 @@
+#!/bin/sh
+#
+# Starts lighttpd
+#
+
+umask 077
+
+start() {
+ 	echo -n "Starting lighttpd: "
+	start-stop-daemon --start --quiet --make-pidfile --pidfile /var/run/lighttpd.pid -b --exec /usr/sbin/lighttpd -- -f /etc/lighttpd/lighttpd.conf -D
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping lighttpd: "
+	start-stop-daemon --stop --quiet --pidfile /var/run/lighttpd.pid
+	echo "OK"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+  	start
+	;;
+  stop)
+  	stop
+	;;
+  restart|reload)
+  	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
