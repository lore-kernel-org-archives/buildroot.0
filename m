From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 14:27:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  olsr
Message-ID: <20070919212750.3873830042@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 14:27:49 -0700 (Wed, 19 Sep 2007)
New Revision: 19901

Log:
- add olsr package (Sushi Sensei)


Added:
   trunk/buildroot/package/olsr/
   trunk/buildroot/package/olsr/Config.in
   trunk/buildroot/package/olsr/S50olsr
   trunk/buildroot/package/olsr/files/
   trunk/buildroot/package/olsr/olsr.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-09-19 20:24:01 UTC (rev 19900)
+++ trunk/buildroot/package/Config.in	2007-09-19 21:27:49 UTC (rev 19901)
@@ -161,6 +161,7 @@
 source "package/netsnmp/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ntp/Config.in"
+source "package/olsr/Config.in"
 source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
 source "package/openssl/Config.in"

Added: trunk/buildroot/package/olsr/Config.in
===================================================================
--- trunk/buildroot/package/olsr/Config.in	                        (rev 0)
+++ trunk/buildroot/package/olsr/Config.in	2007-09-19 21:27:49 UTC (rev 19901)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OLSR
+	bool "OLSR mesh networking Daemon"
+	default n
+	help
+	  olsr
+	  
+	  The Optimized Link State Routing protocol (OLSR) is a routing protocol that is optimised
+	  for mobile ad-hoc networks, sometimes called wireless mesh networks. It is a proactive
+	  link-state routing protocol that floods a full topology table to all nodes in the network
+	  which then compute optimal forwarding paths locally.
+
+	  http://www.olsr.org/

Added: trunk/buildroot/package/olsr/S50olsr
===================================================================
--- trunk/buildroot/package/olsr/S50olsr	                        (rev 0)
+++ trunk/buildroot/package/olsr/S50olsr	2007-09-19 21:27:49 UTC (rev 19901)
@@ -0,0 +1,21 @@
+#!/bin/sh
+#
+# Starts OLSRD daemon
+#
+
+case "$1" in
+  start)
+  	echo "Starting OLSRd daemon: "
+	/usr/sbin/olsrd -d 0 -nofork & 
+	;;
+  stop)
+  	echo "Stopping OLSRd daemon: "
+	killall olsrd
+	;;
+  *)
+	echo $"Usage: $0 {start|stop}"
+	exit 1
+esac
+
+exit $?
+


Property changes on: trunk/buildroot/package/olsr/S50olsr
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/olsr/olsr.mk
===================================================================
--- trunk/buildroot/package/olsr/olsr.mk	                        (rev 0)
+++ trunk/buildroot/package/olsr/olsr.mk	2007-09-19 21:27:49 UTC (rev 19901)
@@ -0,0 +1,63 @@
+#############################################################
+#
+# olsr
+#
+#############################################################
+
+OLSR_VERSION_MAJOR=0.5
+OLSR_VERSION_MINOR=3
+OLSR_VERSION:=$(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
+OLSR_SOURCE:=olsrd-$(OLSR_VERSION).tar.bz2
+OLSR_SITE:=http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
+OLSR_DIR:=$(BUILD_DIR)/olsrd-$(OLSR_VERSION)
+OLSR_CAT:=$(BZCAT)
+OLSR_BINARY:=olsrd
+OLSR_TARGET_BINARY:=usr/bin/olsrd
+#OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph bmf quagga secure
+OLSR_PLUGINS=dot_draw dyn_gw secure
+OLSR_TARGET_PLUGIN=usr/lib/
+
+$(DL_DIR)/$(OLSR_SOURCE):
+	$(WGET) -P $(DL_DIR) $(OLSR_SITE)/$(OLSR_SOURCE)
+
+olsr-source: $(DL_DIR)/$(OLSR_SOURCE)
+
+olsr-unpacked: $(OLSR_DIR)/.unpacked
+$(OLSR_DIR)/.unpacked: $(DL_DIR)/$(OLSR_SOURCE)
+	$(OLSR_CAT) $(DL_DIR)/$(OLSR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(OLSR_DIR)/$(OLSR_BINARY): $(OLSR_DIR)/.unpacked
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(OLSR_DIR) olsrd $(OLSR_PLUGINS)
+
+$(TARGET_DIR)/$(OLSR_TARGET_BINARY): $(OLSR_DIR)/$(OLSR_BINARY)
+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
+	cp -dpf $(OLSR_DIR)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
+	cp -R $(OLSR_DIR)/lib/*/olsrd_*.so* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
+	mkdir -p $(TARGET_DIR)/etc/init.d
+	cp -dpf package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/
+	test -r $(TARGET_DIR)/etc/olsrd.conf || \
+		cp -dpf $(OLSR_DIR)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
+	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so*
+	$(STRIP) $(STRIP_STRIP_ALL) $@
+
+olsr: uclibc $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
+
+olsr-clean:
+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY) \
+		$(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so* \
+		$(TARGET_DIR)/etc/init.d/S50olsr \
+		$(TARGET_DIR)/etc/olsrd.conf
+	-$(MAKE) -C $(OLSR_DIR) clean
+
+olsr-dirclean:
+	rm -rf $(OLSR_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_OLSR)),y)
+TARGETS+=olsr $(OLSR_PLUGINS)
+endif
