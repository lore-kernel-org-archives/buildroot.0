From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 17:48:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  proftpd
Message-ID: <20070114014849.CA019485A4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 17:48:49 -0800 (Sat, 13 Jan 2007)
New Revision: 17277

Log:
Add ProFTPD package with working init script.


Added:
   trunk/buildroot/package/proftpd/
   trunk/buildroot/package/proftpd/Config.in
   trunk/buildroot/package/proftpd/init-proftpd
   trunk/buildroot/package/proftpd/proftpd.mk


Changeset:
Added: trunk/buildroot/package/proftpd/Config.in
===================================================================
--- trunk/buildroot/package/proftpd/Config.in	                        (rev 0)
+++ trunk/buildroot/package/proftpd/Config.in	2007-01-14 01:48:49 UTC (rev 17277)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PROFTPD
+	bool "proftpd"
+	default n
+	help
+	  ProFTPD, a highly configurable FTP server.
+

Added: trunk/buildroot/package/proftpd/init-proftpd
===================================================================
--- trunk/buildroot/package/proftpd/init-proftpd	                        (rev 0)
+++ trunk/buildroot/package/proftpd/init-proftpd	2007-01-14 01:48:49 UTC (rev 17277)
@@ -0,0 +1,47 @@
+#!/bin/sh 
+
+DAEMON=/usr/sbin/proftpd
+trap "" 1
+trap "" 15
+test -f $DAEMON || exit 0
+[ ! -d /var/run/proftpd ] && mkdir /var/run/proftpd
+[ ! -f /var/log/wtmp ] && touch /var/log/wtmp
+
+start() {
+	echo -n "Starting ProFTPD: "
+	$DAEMON
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
+	killall proftpd
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
+	echo "Usage: /etc/init.d/S50proftpd {start|stop|restart}"
+	exit 1
+	;;
+esac
+
+exit 0


Property changes on: trunk/buildroot/package/proftpd/init-proftpd
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/proftpd/proftpd.mk
===================================================================
--- trunk/buildroot/package/proftpd/proftpd.mk	                        (rev 0)
+++ trunk/buildroot/package/proftpd/proftpd.mk	2007-01-14 01:48:49 UTC (rev 17277)
@@ -0,0 +1,79 @@
+#############################################################
+#
+# proftpd
+#
+#############################################################
+PROFTPD_VER:=1.3.0a
+PROFTPD_SOURCE:=proftpd-$(PROFTPD_VER).tar.bz2
+PROFTPD_SITE:=ftp://ftp.proftpd.org/distrib/source/
+PROFTPD_DIR:=$(BUILD_DIR)/proftpd-$(PROFTPD_VER)
+PROFTPD_CAT:=bzcat
+PROFTPD_BINARY:=proftpd
+PROFTPD_TARGET_BINARY:=usr/sbin/proftpd
+
+$(DL_DIR)/$(PROFTPD_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(PROFTPD_SITE)/$(PROFTPD_SOURCE)
+
+proftpd-source: $(DL_DIR)/$(PROFTPD_SOURCE)
+
+$(PROFTPD_DIR)/.unpacked: $(DL_DIR)/$(PROFTPD_SOURCE)
+	$(PROFTPD_CAT) $(DL_DIR)/$(PROFTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(PROFTPD_DIR)/.unpacked
+
+$(PROFTPD_DIR)/.configured: $(PROFTPD_DIR)/.unpacked
+	(cd $(PROFTPD_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		ac_cv_func_setpgrp_void=yes \
+		ac_cv_func_setgrent_void=yes \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--localstatedir=/var/run \
+		--disable-static \
+		--disable-curses \
+		--disable-ncurses \
+		--disable-facl \
+		--disable-dso \
+		--enable-shadow \
+		$(DISABLE_LARGEFILE) \
+		--with-gnu-ld \
+	);
+	touch $(PROFTPD_DIR)/.configured
+
+$(PROFTPD_DIR)/$(PROFTPD_BINARY): $(PROFTPD_DIR)/.configured
+	$(MAKE) CC="$(HOSTCC)" CFLAGS="" LDFLAGS=""	\
+		-C $(PROFTPD_DIR)/lib/libcap _makenames
+	$(MAKE) -C $(PROFTPD_DIR)
+
+$(TARGET_DIR)/$(PROFTPD_TARGET_BINARY): $(PROFTPD_DIR)/$(PROFTPD_BINARY)
+	cp -a $(PROFTPD_DIR)/$(PROFTPD_BINARY)	\
+		$(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
+	@if [ ! -f $(TARGET_DIR)/etc/proftpd.conf ] ; then \
+		$(INSTALL) -m 0644 -D $(PROFTPD_DIR)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
+	fi;
+	$(INSTALL) -m 0755 -D package/proftpd/init-proftpd $(TARGET_DIR)/etc/init.d/S50proftpd
+
+proftpd: uclibc $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
+
+proftpd-clean:
+	rm -f $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/etc/init.d/S50proftpd
+	rm -f $(TARGET_DIR)/etc/proftpd.conf
+	-$(MAKE) -C $(PROFTPD_DIR) clean
+
+proftpd-dirclean:
+	rm -rf $(PROFTPD_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_PROFTPD)),y)
+TARGETS+=proftpd
+endif
