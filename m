From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed,  9 Apr 2008 00:35:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
Message-ID: <20080409073513.408C43C436@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-09 00:35:12 -0700 (Wed, 09 Apr 2008)
New Revision: 21679

Log:
* Removed dropbear init patch
* Added dropbear init script
* Added more verbose messages about key generation


Added:
   trunk/buildroot/package/dropbear/S50dropbear

Removed:
   trunk/buildroot/package/dropbear/dropbear-init.patch

Modified:
   trunk/buildroot/package/dropbear/dropbear.mk


Changeset:
Added: trunk/buildroot/package/dropbear/S50dropbear
===================================================================
--- trunk/buildroot/package/dropbear/S50dropbear	                        (rev 0)
+++ trunk/buildroot/package/dropbear/S50dropbear	2008-04-09 07:35:12 UTC (rev 21679)
@@ -0,0 +1,56 @@
+#!/bin/sh
+#
+# Starts dropbear sshd.
+#
+
+# Make sure the dropbearkey progam exists
+[ -f /usr/bin/dropbearkey ] || exit 0
+
+start() {
+ 	echo -n "Starting dropbear sshd: "
+	# Make sure dropbear directory exists
+	if [ ! -d /etc/dropbear ] ; then
+		mkdir -p /etc/dropbear
+	fi
+	# Check for the Dropbear RSA key
+	if [ ! -f /etc/dropbear/dropbear_rsa_host_key ] ; then
+		echo -n "generating rsa key... "
+		/usr/bin/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key > /dev/null 2>&1
+	fi
+
+	# Check for the Dropbear DSS key
+	if [ ! -f /etc/dropbear/dropbear_dss_host_key ] ; then
+		echo -n "generating dsa key... "
+		/usr/bin/dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key > /dev/null 2>&1
+	fi
+	umask 077
+	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping dropbear sshd: "
+	start-stop-daemon -K -q -p /var/run/dropbear.pid
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
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+

Deleted: trunk/buildroot/package/dropbear/dropbear-init.patch
===================================================================
--- trunk/buildroot/package/dropbear/dropbear-init.patch	2008-04-09 07:02:20 UTC (rev 21678)
+++ trunk/buildroot/package/dropbear/dropbear-init.patch	2008-04-09 07:35:12 UTC (rev 21679)
@@ -1,60 +0,0 @@
-diff -rNu dropbear-0.51_vanilla/S50dropbear dropbear-0.51_init/S50dropbear
---- dropbear-0.51_vanilla/S50dropbear	1970-01-01 00:00:00.000000000 +0000
-+++ dropbear-0.51_init/S50dropbear	2008-04-08 14:46:53.000000000 +0000
-@@ -0,0 +1,56 @@
-+#!/bin/sh
-+#
-+# Starts dropbear sshd.
-+#
-+
-+# Make sure the dropbearkey progam exists
-+[ -f /usr/bin/dropbearkey ] || exit 0
-+
-+start() {
-+ 	echo -n "Starting dropbear sshd: "
-+	# Make sure dropbear directory exists
-+	if [ ! -d /etc/dropbear ] ; then
-+		mkdir -p /etc/dropbear
-+	fi
-+	# Check for the Dropbear RSA key
-+	if [ ! -f /etc/dropbear/dropbear_rsa_host_key ] ; then
-+		/usr/bin/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key > /dev/null 2>&1
-+		echo -n .
-+	fi
-+
-+	# Check for the Dropbear DSS key
-+	if [ ! -f /etc/dropbear/dropbear_dss_host_key ] ; then
-+		/usr/bin/dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key > /dev/null 2>&1
-+		echo -n .
-+	fi
-+	umask 077
-+	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear
-+	echo "OK"
-+}
-+stop() {
-+	echo -n "Stopping sshd: "
-+	start-stop-daemon -K -q -p /var/run/dropbear.pid
-+	echo "OK"
-+}
-+restart() {
-+	stop
-+	start
-+}
-+
-+case "$1" in
-+  start)
-+  	start
-+	;;
-+  stop)
-+  	stop
-+	;;
-+  restart|reload)
-+  	restart
-+	;;
-+  *)
-+	echo $"Usage: $0 {start|stop|restart}"
-+	exit 1
-+esac
-+
-+exit $?
-+

Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2008-04-09 07:02:20 UTC (rev 21678)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2008-04-09 07:35:12 UTC (rev 21679)
@@ -57,8 +57,7 @@
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearkey
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearconvert
 	mkdir -p $(TARGET_DIR)/etc/init.d
-	cp -dpf $(DROPBEAR_DIR)/S50dropbear $(TARGET_DIR)/etc/init.d/
-	chmod a+x $(TARGET_DIR)/etc/init.d/S50dropbear
+	$(INSTALL) -m 755 package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d/S50dropbear
 
 dropbear: uclibc zlib $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
 
