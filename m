From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 09:44:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  mdnsresponder
Message-ID: <20070811164454.3B125A5D34@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 09:44:54 -0700 (Sat, 11 Aug 2007)
New Revision: 19427

Log:
Add mdnsresponder package

Added:
   trunk/buildroot/package/mdnsresponder/
   trunk/buildroot/package/mdnsresponder/Config.in
   trunk/buildroot/package/mdnsresponder/mDNSResponderPosix.conf
   trunk/buildroot/package/mdnsresponder/mdnsresponder.mk
   trunk/buildroot/package/mdnsresponder/rc.mdnsresponder

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-08-11 10:08:13 UTC (rev 19426)
+++ trunk/buildroot/package/Config.in	2007-08-11 16:44:54 UTC (rev 19427)
@@ -146,6 +146,7 @@
 source "package/libpcap/Config.in"
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
+source "package/mdnsresponder/Config.in"
 source "package/mrouted/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"

Added: trunk/buildroot/package/mdnsresponder/Config.in
===================================================================
--- trunk/buildroot/package/mdnsresponder/Config.in	                        (rev 0)
+++ trunk/buildroot/package/mdnsresponder/Config.in	2007-08-11 16:44:54 UTC (rev 19427)
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_MDNSRESPONDER
+	bool "mDNSResponder"
+	default n
+	help
+	  The mDNSResponder project is a component of Bonjour,
+	  Apple's initiative for zero-configuration networking.
+
+	  http://developer.apple.com/networking/bonjour/index.html
+
+config BR2_PACKAGE_MDNSRESPONDER_UTILS
+	bool "client and utils"
+	default n
+	depends on BR2_PACKAGE_MDNSRESPONDER
+	help
+	  Install the client applications and debug utils
+
+

Added: trunk/buildroot/package/mdnsresponder/mDNSResponderPosix.conf
===================================================================
--- trunk/buildroot/package/mdnsresponder/mDNSResponderPosix.conf	                        (rev 0)
+++ trunk/buildroot/package/mdnsresponder/mDNSResponderPosix.conf	2007-08-11 16:44:54 UTC (rev 19427)
@@ -0,0 +1,23 @@
+# See http://www.dns-sd.org/ServiceTypes.html for service types and parameters.
+# Format is:
+#	name
+#	service type
+#	port
+#	[params, name=value, one per line]
+# NOTE: At least as of 107.1 there is a bug where you cannot have a blank line
+# NOTE: before the first entry if there are any leading comments.
+#yourhost
+#_ssh._tcp.
+#22
+
+#yourhost
+#_http._tcp.
+#80
+#path=/
+
+#yourhost
+#_ftp._tcp.
+#21
+#u=yourusername
+#p=password
+#path=/somepath

Added: trunk/buildroot/package/mdnsresponder/mdnsresponder.mk
===================================================================
--- trunk/buildroot/package/mdnsresponder/mdnsresponder.mk	                        (rev 0)
+++ trunk/buildroot/package/mdnsresponder/mdnsresponder.mk	2007-08-11 16:44:54 UTC (rev 19427)
@@ -0,0 +1,92 @@
+#############################################################
+#
+# mDNSResponder
+#
+#############################################################
+MDNSRESPONDER_VERSION:=107.6
+MDNSRESPONDER_SOURCE:=mDNSResponder-$(MDNSRESPONDER_VERSION).tar.gz
+MDNSRESPONDER_SITE:=http://www.opensource.apple.com/darwinsource/tarballs/other/$(MDNSRESPONDER_SOURCE)
+MDNSRESPONDER_DIR:=$(BUILD_DIR)/mDNSResponder-$(MDNSRESPONDER_VERSION)
+MDNSRESPONDER_CAT:=zcat
+MDNSRESPONDER_INSTDEPS:=
+
+ifeq ($(BR2_PACKAGE_MDNSRESPONDER_UTILS),y)
+	MDNSRESPONDER_INSTDEPS+=$(TARGET_DIR)/usr/bin/mDNSClientPosix
+endif
+
+$(DL_DIR)/$(MDNSRESPONDER_SOURCE):
+	$(WGET) -P $(DL_DIR) $(MDNSRESPONDER_SITE)
+
+$(MDNSRESPONDER_DIR)/.unpacked: $(DL_DIR)/$(MDNSRESPONDER_SOURCE)
+	$(MDNSRESPONDER_CAT) $(DL_DIR)/$(MDNSRESPONDER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(MDNSRESPONDER_DIR)/.unpacked
+
+$(MDNSRESPONDER_DIR)/.configured: $(MDNSRESPONDER_DIR)/.unpacked
+	$(SED) 's:OPTIONALTARG = nss_mdns::' $(MDNSRESPONDER_DIR)/mDNSPosix/Makefile
+	touch $(MDNSRESPONDER_DIR)/.configured
+
+$(MDNSRESPONDER_DIR)/.built: $(MDNSRESPONDER_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
+	touch $(MDNSRESPONDER_DIR)/.built
+
+$(STAGING_DIR)/usr/lib/libdns_sd.so: $(MDNSRESPONDER_DIR)/.built
+	# lib
+	$(INSTALL) -m 644 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/libdns_sd.so $(STAGING_DIR)/usr/lib/
+	ln -sf $(STAGING_DIR)/usr/lib/libdns_sd.so $(STAGING_DIR)/usr/lib/libdns_sd.so.1
+	# include
+	$(INSTALL) -m 644 -D $(MDNSRESPONDER_DIR)/mDNSShared/dns_sd.h $(STAGING_DIR)/usr/include/
+
+$(TARGET_DIR)/usr/sbin/mdnsd: $(STAGING_DIR)/usr/lib/libdns_sd.so
+	# sbin
+	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/dnsextd $(TARGET_DIR)/usr/sbin/
+	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSResponderPosix $(TARGET_DIR)/usr/sbin/
+	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mdnsd $(TARGET_DIR)/usr/sbin/
+	# lib
+	$(INSTALL) -m 644 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/libdns_sd.so $(TARGET_DIR)/usr/lib/
+	ln -sf $(TARGET_DIR)/usr/lib/libdns_sd.so $(TARGET_DIR)/usr/lib/libdns_sd.so.1
+	# etc
+	$(INSTALL) -m 0644 -D package/mdnsresponder/mDNSResponderPosix.conf $(TARGET_DIR)/etc/	
+	# init
+	$(INSTALL) -m 0755 -D package/mdnsresponder/rc.mdnsresponder $(TARGET_DIR)/etc/init.d/S80mdnsresponder	
+
+$(TARGET_DIR)/usr/bin/mDNSClientPosix: $(STAGING_DIR)/usr/lib/libdns_sd.so
+	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSNetMonitor $(TARGET_DIR)/usr/sbin/
+	# bin
+	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/Clients/build/dns-sd $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSProxyResponderPosix $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSIdentify $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSClientPosix $(TARGET_DIR)/usr/bin/
+
+
+mdnsresponder: uclibc $(TARGET_DIR)/usr/sbin/mdnsd $(MDNSRESPONDER_INSTDEPS)
+
+mdnsresponder-source: $(DL_DIR)/$(MDNSRESPONDER_SOURCE)
+
+mdnsresponder-clean:
+	rm -f $(MDNSRESPONDER_DIR)/.configured $(MDNSRESPONDER_DIR)/.built $(MDNSRESPONDER_DIR)/.staged
+	-$(MAKE) os=linux -C $(MDNSRESPONDER_DIR)/mDNSPosix clean
+	rm -f $(TARGET_DIR)/usr/sbin/dnsextd
+	rm -f $(TARGET_DIR)/usr/sbin/mDNSResponderPosix
+	rm -f $(TARGET_DIR)/usr/sbin/mDNSNetMonitor
+	rm -f $(TARGET_DIR)/usr/sbin/mdnsd
+	rm -f $(TARGET_DIR)/usr/bin/dns-sd
+	rm -f $(TARGET_DIR)/usr/bin/mDNSProxyResponderPosix
+	rm -f $(TARGET_DIR)/usr/bin/mDNSIdentify
+	rm -f $(TARGET_DIR)/usr/bin/mDNSClientPosix
+	rm -f $(TARGET_DIR)/usr/lib/libdns_sd.so*
+	rm -f $(STAGING_DIR)/usr/lib/libdns_sd.so*
+	rm -f $(STAGING_DIR)/usr/include/dns_sd.h
+	rm -f $(TARGET_DIR)/etc/mDNSResponderPosix.conf
+	rm -f $(TARGET_DIR)/etc/init.d/S80mdnsresponder
+
+mdnsresponder-dirclean:
+	rm -rf $(MDNSRESPONDER_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_MDNSRESPONDER)),y)
+TARGETS+=mdnsresponder
+endif

Added: trunk/buildroot/package/mdnsresponder/rc.mdnsresponder
===================================================================
--- trunk/buildroot/package/mdnsresponder/rc.mdnsresponder	                        (rev 0)
+++ trunk/buildroot/package/mdnsresponder/rc.mdnsresponder	2007-08-11 16:44:54 UTC (rev 19427)
@@ -0,0 +1,67 @@
+#!/bin/sh
+#
+# Starts mDNSResponderPosix and mdnsd
+#
+
+umask 077
+
+start() {
+ 	echo -n "Starting mdnsd: "
+	start-stop-daemon --start --quiet --pidfile /var/run/mdnsd.pid \
+                --exec /usr/sbin/mdnsd
+	if [ "$?" != "0" ] ; then
+		echo "FAIL"
+		return 1
+	fi
+	echo "OK"
+
+	echo -n "Starting mDNSResponderPosix: "
+	start-stop-daemon --start --quiet --pidfile /var/run/mDNSResponderPosix.pid \
+                --exec /usr/sbin/mDNSResponderPosix \
+                -- -b -f /etc/mDNSResponderPosix.conf -P /var/run/mDNSResponderPosix.pid
+	if [ "$?" != "0" ] ; then
+		echo "FAIL"
+		return 1
+	fi
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping mDNSResponderPosix: "
+	start-stop-daemon --stop --quiet --pidfile /var/run/mDNSResponderPosix.pid
+	if [ "$?" != "0" ] ; then
+		echo "FAIL"
+		return 1
+	fi
+	echo "OK"
+
+	echo -n "Stopping mdnsd: "
+	start-stop-daemon --stop --quiet --pidfile /var/run/mdnsd.pid
+	if [ "$?" != "0" ] ; then
+		echo "FAIL"
+		return 1
+	fi
+	echo "OK"
+}
+
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
