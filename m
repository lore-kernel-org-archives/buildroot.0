From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  9 May 2007 06:38:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20070509133837.9B50F4800E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-09 06:38:37 -0700 (Wed, 09 May 2007)
New Revision: 18591

Log:
avahi-daemon support

Added:
   trunk/buildroot/package/avahi/S50avahi-daemon

Modified:
   trunk/buildroot/package/avahi/Config.in
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/Config.in
===================================================================
--- trunk/buildroot/package/avahi/Config.in	2007-05-09 12:50:08 UTC (rev 18590)
+++ trunk/buildroot/package/avahi/Config.in	2007-05-09 13:38:37 UTC (rev 18591)
@@ -2,7 +2,30 @@
 	bool "avahi"
 	default n
 	help
-	  Avahi is a system which facilitates service 
-	  discovery on a local network. 
+	  Avahi is a system which facilitates service
+	  discovery on a local network.
 
 	  http://www.avahi.org/
+
+config BR2_PACKAGE_AVAHI_AUTOIPD
+	bool "  IPv4LL network address configuration daemon"
+	default y
+	depends on BR2_PACKAGE_AVAHI
+	help
+	  Avahi-autoipd implements IPv4LL, "Dynamic Configuration of
+	  IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for
+	  automatic IP address configuration from the link-local
+	  169.254.0.0/16 range without the need for a central server.
+	  It is primarily intended to be used in ad-hoc networks which
+	  lack a DHCP server.
+
+config BR2_PACKAGE_AVAHI_DAEMON
+	bool "  mDNS/DNS-SD daemon"
+	default n
+	depends on BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_EXPAT
+	help
+	  The Avahi mDNS/DNS-SD daemon implementing Apple's ZeroConf
+	  architecture (also known as "Rendezvous" or "Bonjour").
+	  The daemon registers local IP addresses and services using
+	  mDNS/DNS-SD.

Added: trunk/buildroot/package/avahi/S50avahi-daemon
===================================================================
--- trunk/buildroot/package/avahi/S50avahi-daemon	                        (rev 0)
+++ trunk/buildroot/package/avahi/S50avahi-daemon	2007-05-09 13:38:37 UTC (rev 18591)
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# avahi-daemon init script
+
+DAEMON=/usr/sbin/avahi-daemon
+case "$1" in
+    start)
+	$DAEMON -c || $DAEMON -D
+	;;
+    stop)
+	$DAEMON -c && $DAEMON -k
+	;;
+    reload)
+	$DAEMON -c && $DAEMON -r
+	;;
+    *)
+	echo "Usage: S50avahi-daemon {start|stop|reload}" >&2
+	exit 1
+	;;
+esac

Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-05-09 12:50:08 UTC (rev 18590)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-05-09 13:38:37 UTC (rev 18591)
@@ -16,6 +16,23 @@
 AVAHI_SOURCE:=avahi-$(AVAHI_VER).tar.gz
 AVAHI_CAT:=$(ZCAT)
 
+AVAHI_TARGETS:=
+
+ifeq ($(strip $(BR2_PACKAGE_AVAHI_AUTOIPD)),y)
+AVAHI_TARGETS+=$(TARGET_DIR)/usr/sbin/avahi-autoipd
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_AVAHI_DAEMON)),y)
+AVAHI_TARGETS+=$(TARGET_DIR)/usr/sbin/avahi-daemon
+AVAHI_DISABLE_EXPAT:=
+# depend on the exact library file instead of expat so avahi isn't always
+# considered out-of-date
+AVAHI_EXPAT_DEP:=$(STAGING_DIR)/lib/libexpat.so.1
+else
+AVAHI_DISABLE_EXPAT:=--disable-expat
+AVAHI_EXPAT_DEP:=
+endif
+
 $(DL_DIR)/$(AVAHI_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AVAHI_SITE)/$(AVAHI_SOURCE)
 
@@ -26,7 +43,7 @@
 	toolchain/patch-kernel.sh $(AVAHI_DIR) package/avahi/ \*.patch
 	touch $(AVAHI_DIR)/.unpacked
 
-$(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked
+$(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked $(AVAHI_EXPAT_DEP)
 	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
 	( \
 		cd $(AVAHI_DIR) && \
@@ -111,7 +128,7 @@
 		--disable-qt4 \
 		--disable-gtk \
 		--disable-dbus \
-		--disable-expat \
+		$(AVAHI_DISABLE_EXPAT) \
 		--disable-gdbm \
 		--disable-python \
 		--disable-python-dbus \
@@ -132,7 +149,7 @@
 
 $(STAGING_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-autoipd install
-	touch -c $(STAGING_DIR)/usr/sbin/avahi-autoipd
+	touch -c $@
 
 $(TARGET_DIR)/usr/sbin/avahi-autoipd: $(STAGING_DIR)/usr/sbin/avahi-autoipd
 	cp $^ $@
@@ -145,13 +162,34 @@
 	chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
 	$(STRIP) --strip-unneeded $@
 
-avahi: uclibc busybox libdaemon $(TARGET_DIR)/usr/sbin/avahi-autoipd
+$(STAGING_DIR)/usr/lib/libavahi-common.so: $(AVAHI_DIR)/.compiled
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-common install
+	touch -c $@
 
+$(STAGING_DIR)/usr/lib/libavahi-core.so: $(AVAHI_DIR)/.compiled $(STAGING_DIR)/usr/lib/libavahi-common.so
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-core install
+	touch -c $@
+
+$(STAGING_DIR)/usr/sbin/avahi-daemon: $(AVAHI_DIR)/.compiled $(STAGING_DIR)/usr/lib/libavahi-core.so $(STAGING_DIR)/usr/lib/libavahi-common.so
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-daemon install
+	touch -c $@
+
+$(TARGET_DIR)/usr/sbin/avahi-daemon: $(STAGING_DIR)/usr/sbin/avahi-daemon
+	cp $^ $@
+	cp -dpf $(STAGING_DIR)/lib/libavahi-*.so* $(TARGET_DIR)/usr/lib/
+	mkdir -p $(TARGET_DIR)/etc/avahi/services
+	cp -af $(BASE_DIR)/package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
+	$(STRIP) --strip-unneeded $@
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libavahi-*.so*
+
+avahi: uclibc busybox libdaemon $(AVAHI_TARGETS)
+
 avahi-clean:
 	$(MAKE) -C $(AVAHI_DIR) distclean
 	rm -rf $(TARGET_DIR)/etc/avahi
 	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
 	rm -f $(TARGET_DIR)/etc/init.d/S*avahi*
+	rm -f $(TARGET_DIR)/usr/sbin/avahi-*
 
 avahi-dirclean:
 	rm -rf $(AVAHI_DIR)
