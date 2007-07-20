From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Fri, 20 Jul 2007 07:37:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: hdparm thttpd
Message-ID: <20070720143749.7A11730069@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-20 07:37:48 -0700 (Fri, 20 Jul 2007)
New Revision: 19182

Log:
Fix hdparm to cross build correctly. Also fix thttpd to build and install sanely and add simplified start up.


Added:
   trunk/buildroot/package/hdparm/hdparm.patch
   trunk/buildroot/package/thttpd/S90thttpd
   trunk/buildroot/package/thttpd/thttpd.conf

Modified:
   trunk/buildroot/package/hdparm/hdparm.mk
   trunk/buildroot/package/thttpd/thttpd.mk


Changeset:
Modified: trunk/buildroot/package/hdparm/hdparm.mk
===================================================================
--- trunk/buildroot/package/hdparm/hdparm.mk	2007-07-20 12:03:54 UTC (rev 19181)
+++ trunk/buildroot/package/hdparm/hdparm.mk	2007-07-20 14:37:48 UTC (rev 19182)
@@ -19,15 +19,17 @@
 hdparm-unpacked: $(HDPARM_DIR)/.unpacked
 $(HDPARM_DIR)/.unpacked: $(DL_DIR)/$(HDPARM_SOURCE)
 	$(HDPARM_CAT) $(DL_DIR)/$(HDPARM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(HDPARM_DIR) package/hdparm hdparm.patch
 	touch $(HDPARM_DIR)/.unpacked
 
 $(HDPARM_DIR)/.configured: $(HDPARM_DIR)/.unpacked
 	touch $(HDPARM_DIR)/.configured
 
 $(HDPARM_DIR)/$(HDPARM_BINARY): $(HDPARM_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(HDPARM_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(HDPARM_DIR)
 
 $(TARGET_DIR)/$(HDPARM_TARGET_BINARY): $(HDPARM_DIR)/$(HDPARM_BINARY)
+	rm -f $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
 	cp -a $(HDPARM_DIR)/$(HDPARM_BINARY) $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
 
 hdparm: uclibc $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)

Added: trunk/buildroot/package/hdparm/hdparm.patch
===================================================================
--- trunk/buildroot/package/hdparm/hdparm.patch	                        (rev 0)
+++ trunk/buildroot/package/hdparm/hdparm.patch	2007-07-20 14:37:48 UTC (rev 19182)
@@ -0,0 +1,12 @@
+diff -ur hdparm-7.6/Makefile hdparm-7.6-patched/Makefile
+--- hdparm-7.6/Makefile	2007-06-07 12:39:24.000000000 -0500
++++ hdparm-7.6-patched/Makefile	2007-07-19 12:11:03.000000000 -0500
+@@ -28,7 +28,7 @@
+ 
+ hdparm: hdparm.h $(OBJS)
+ 	$(CC) $(LDFLAGS) -o hdparm $(OBJS)
+-	strip hdparm
++	$(STRIP) hdparm
+  
+ install: all hdparm.8
+ 	if [ ! -z $(DESTDIR) ]; then $(INSTALL_DIR) $(DESTDIR) ; fi

Added: trunk/buildroot/package/thttpd/S90thttpd
===================================================================
--- trunk/buildroot/package/thttpd/S90thttpd	                        (rev 0)
+++ trunk/buildroot/package/thttpd/S90thttpd	2007-07-20 14:37:48 UTC (rev 19182)
@@ -0,0 +1,43 @@
+#!/bin/sh 
+
+DAEMON=/usr/sbin/thttpd
+test -f $DAEMON || exit 0
+
+start() {
+	echo -n "Starting thttpd: "
+	$DAEMON -C /etc/thttpd.conf
+	if [ $? != 0 ]; then
+		echo "FAILED"
+		exit 1
+	else
+		echo "done"
+	fi
+}
+
+stop() {
+	echo -n "Stopping ProFTPD: "
+	kill -9 `cat /var/run/thttpd.pid`
+        echo "done"
+}
+
+case "$1" in
+    start)
+	start
+	;;
+
+    stop)
+	stop
+	;;
+
+    restart)
+    	stop
+    	start
+	;;
+
+    *)
+	echo "Usage: /etc/init.d/S90thttpd {start|stop|restart}"
+	exit 1
+	;;
+esac
+
+exit 0


Property changes on: trunk/buildroot/package/thttpd/S90thttpd
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/thttpd/thttpd.conf
===================================================================
--- trunk/buildroot/package/thttpd/thttpd.conf	                        (rev 0)
+++ trunk/buildroot/package/thttpd/thttpd.conf	2007-07-20 14:37:48 UTC (rev 19182)
@@ -0,0 +1,7 @@
+chroot
+dir=/var/www
+pidfile=/var/run/thttpd.pid
+logfile=/var/log/thttpd
+host=dtu-7100
+user=nobody
+cgipat=**.cgi

Modified: trunk/buildroot/package/thttpd/thttpd.mk
===================================================================
--- trunk/buildroot/package/thttpd/thttpd.mk	2007-07-20 12:03:54 UTC (rev 19181)
+++ trunk/buildroot/package/thttpd/thttpd.mk	2007-07-20 14:37:48 UTC (rev 19182)
@@ -9,9 +9,8 @@
 THTTPD_DIR:=$(BUILD_DIR)/thttpd-$(THTTPD_VERSION)
 THTTPD_CAT:=$(ZCAT)
 THTTPD_BINARY:=thttpd
-THTTPD_TARGET_BINARY:=sbin/thttpd
-THTTPD_ROOT:=/var
-THTTPD_WEB_DIR:=$(THTTPD_ROOT)/www
+THTTPD_TARGET_BINARY:=usr/sbin/thttpd
+THTTPD_WEB_DIR:=/var/www
 
 $(DL_DIR)/$(THTTPD_SOURCE):
 	$(WGET) -P $(DL_DIR) $(THTTPD_SITE)/$(THTTPD_SOURCE)
@@ -30,48 +29,31 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=$(THTTPD_ROOT) \
+		--prefix=/usr \
 	);
 	touch $(THTTPD_DIR)/.configured
 
 $(THTTPD_DIR)/$(THTTPD_BINARY): $(THTTPD_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(THTTPD_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) WEBDIR=$(THTTPD_WEB_DIR) -C $(THTTPD_DIR)
 
 $(TARGET_DIR)/$(THTTPD_TARGET_BINARY): $(THTTPD_DIR)/$(THTTPD_BINARY)
-	install -D $(THTTPD_DIR)/$(THTTPD_BINARY) $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
-	install -D $(THTTPD_DIR)/extras/htpasswd $(TARGET_DIR)/bin/htpasswd
-	install -D $(THTTPD_DIR)/extras/makeweb $(TARGET_DIR)/bin/makeweb
-	install -D $(THTTPD_DIR)/extras/syslogtocern $(TARGET_DIR)/bin/syslogtocern
-	install -D $(THTTPD_DIR)/scripts/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper
-	install -D $(THTTPD_DIR)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
-	cp $(TARGET_DIR)/etc/init.d/S90thttpd $(TARGET_DIR)/etc/init.d/S90thttpd.in
-	cp $(TARGET_DIR)/sbin/thttpd_wrapper $(TARGET_DIR)/sbin/thttpd_wrapper.in
-	sed -e "s:/usr/local/sbin:/sbin:g" -e "s:/usr/local/www:$(THTTPD_WEB_DIR):g" < $(TARGET_DIR)/sbin/thttpd_wrapper.in > $(TARGET_DIR)/sbin/httpd_wrapper
-	sed -e "s:/usr/local/sbin:/sbin:g" < $(TARGET_DIR)/etc/init.d/S90thttpd.in > $(TARGET_DIR)/etc/init.d/S90thttpd
-	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd.in $(TARGET_DIR)/sbin/thttpd_wrapper.in
-	install -d $(TARGET_DIR)$(THTTPD_WEB_DIR)/data
-	install -d $(TARGET_DIR)$(THTTPD_WEB_DIR)/logs
-	echo "dir=$(THTTPD_WEB_DIR)/data" > $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
-	echo 'cgipat=**.cgi' >> $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
-	echo "logfile=$(THTTPD_WEB_DIR)/logs/thttpd_log" >> $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
-	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)$(THTTPD_WEB_DIR)/thttpd_config
-	echo "<HTML><BODY>thttpd test page</BODY></HTML>" > $(TARGET_DIR)$(THTTPD_WEB_DIR)/data/index.html
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) prefix=$(TARGET_DIR)/usr WEBDIR=$(THTTPD_WEB_DIR) -C $(THTTPD_DIR) installthis
+	$(STRIP) --strip-unneeded $(THTTPD_DIR)/$(THTTPD_BINARY)
+	$(INSTALL) -d $(TARGET_DIR)$(THTTPD_WEB_DIR)/cgi-bin
+	$(INSTALL) -m 0755 package/thttpd/S90thttpd $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0644 package/thttpd/thttpd.conf $(TARGET_DIR)/etc
 
 thttpd: uclibc $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
 
 thttpd-clean:
 	rm -f $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/sbin/httpd_wrapper
-	rm -f $(TARGET_DIR)/sbin/thttpd_wrapper
 	rm -rf $(TARGET_DIR)/var/www
-	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd
-	rm -f $(TARGET_DIR)/bin/htpasswd
-	rm -f $(TARGET_DIR)/bin/makeweb
-	rm -f $(TARGET_DIR)/bin/syslogtocern
+	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd $(TARGET_DIR)/etc/thttpd.conf
 	-$(MAKE) -C $(THTTPD_DIR) clean
 
 thttpd-dirclean:
 	rm -rf $(THTTPD_DIR)
+
 #############################################################
 #
 # Toplevel Makefile options
