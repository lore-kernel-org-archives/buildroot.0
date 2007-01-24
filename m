From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 09:02:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  netcat
Message-ID: <20070124170246.BFB64485A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 09:02:45 -0800 (Wed, 24 Jan 2007)
New Revision: 17503

Log:
- add package netcat


Added:
   trunk/buildroot/package/netcat/
   trunk/buildroot/package/netcat/Config.in
   trunk/buildroot/package/netcat/netcat.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-24 15:56:11 UTC (rev 17502)
+++ trunk/buildroot/package/Config.in	2007-01-24 17:02:45 UTC (rev 17503)
@@ -139,6 +139,9 @@
 source "package/lrzsz/Config.in"
 source "package/mrouted/Config.in"
 source "package/nbd/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/netcat/Config.in"
+endif
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
 source "package/netplug/Config.in"

Added: trunk/buildroot/package/netcat/Config.in
===================================================================
--- trunk/buildroot/package/netcat/Config.in	                        (rev 0)
+++ trunk/buildroot/package/netcat/Config.in	2007-01-24 17:02:45 UTC (rev 17503)
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_NETCAT
+	bool "netcat"
+	default n
+	help
+	  Netcat is a featured networking utility which reads and writes data
+	  across network connections, using the TCP/IP protocol.
+	  It is designed to be a reliable "back-end" tool that can be used
+	  directly or easily driven by other programs and scripts. At the 
+	  same time, it is a feature-rich network debugging and exploration 
+	  tool, since it can create almost any kind of connection you would 
+	  need and has several interesting built-in capabilities.
+
+	  http://netcat.sourceforge.net/download.php
+

Added: trunk/buildroot/package/netcat/netcat.mk
===================================================================
--- trunk/buildroot/package/netcat/netcat.mk	                        (rev 0)
+++ trunk/buildroot/package/netcat/netcat.mk	2007-01-24 17:02:45 UTC (rev 17503)
@@ -0,0 +1,58 @@
+#############################################################
+#
+# netcat
+#
+#############################################################
+
+NETCAT_VERSION=0.7.1
+NETCAT_SOURCE=netcat-$(NETCAT_VERSION).tar.gz
+NETCAT_CAT:=$(ZCAT)
+NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netcat
+NETCAT_DIR:=$(BUILD_DIR)/netcat-$(NETCAT_VERSION)
+NETCAT_BINARY:=src/netcat
+NETCAT_TARGET_BINARY:=sbin/netcat
+
+$(DL_DIR)/$(NETCAT_SOURCE):
+	$(WGET) -P $(DL_DIR) $(NETCAT_SITE)/$(NETCAT_SOURCE)
+
+netcat-source: $(DL_DIR)/$(NETCAT_SOURCE)
+
+$(NETCAT_DIR)/.unpacked: $(DL_DIR)/$(NETCAT_SOURCE)
+	$(NETCAT_CAT) $(DL_DIR)/$(NETCAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(NETCAT_DIR)/.configured: $(NETCAT_DIR)/.unpacked
+	(cd $(NETCAT_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/ \
+	);
+	touch $@
+
+
+$(NETCAT_DIR)/$(NETCAT_BINARY): $(NETCAT_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(NETCAT_DIR)
+
+$(TARGET_DIR)/$(NETCAT_TARGET_BINARY): $(NETCAT_DIR)/$(NETCAT_BINARY)
+	install -D $(NETCAT_DIR)/$(NETCAT_BINARY) $(TARGET_DIR)/$(NETCAT_TARGET_BINARY)
+	$(STRIP) -s $@
+
+netcat: uclibc $(TARGET_DIR)/$(NETCAT_TARGET_BINARY)
+
+netcat-clean:
+	rm -f $(TARGET_DIR)/$(NETCAT_TARGET_BINARY)
+	-$(MAKE) -C $(NETCAT_DIR) clean
+netcat-dirclean:
+	rm -rf $(NETCAT_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_NETCAT)),y)
+TARGETS+=netcat
+endif
