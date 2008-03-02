From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  2 Mar 2008 06:36:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20080302143640.A062B12C642@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-02 06:36:40 -0800 (Sun, 02 Mar 2008)
New Revision: 21152

Log:
dnsmasq: make tftp support optional


Modified:
   trunk/buildroot/package/dnsmasq/Config.in
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/Config.in
===================================================================
--- trunk/buildroot/package/dnsmasq/Config.in	2008-03-02 14:36:35 UTC (rev 21151)
+++ trunk/buildroot/package/dnsmasq/Config.in	2008-03-02 14:36:40 UTC (rev 21152)
@@ -6,3 +6,11 @@
 	  coupled DNS and DHCP service to a LAN.
 
 	  http://www.thekelleys.org.uk/dnsmasq/
+
+config BR2_PACKAGE_DNSMASQ_TFTP
+	bool "tftp support"
+	default y
+	depends on BR2_PACKAGE_DNSMASQ
+	help
+	  Enable TFTP support in dnsmasq.
+

Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-03-02 14:36:35 UTC (rev 21151)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-03-02 14:36:40 UTC (rev 21152)
@@ -11,12 +11,16 @@
 DNSMASQ_BINARY:=dnsmasq
 DNSMASQ_TARGET_BINARY:=usr/sbin/dnsmasq
 
+DNSMASQ_COPTS:=
+
 ifneq ($(BR2_INET_IPV6),y)
-DNSMASQ_COPTS:=-DNO_IPV6
-else
-DNSMASQ_COPTS:=
+DNSMASQ_COPTS+=-DNO_IPV6
 endif
 
+ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
+DNSMASQ_COPTS+=-DNO_TFTP
+endif
+
 $(DL_DIR)/$(DNSMASQ_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DNSMASQ_SITE)/$(DNSMASQ_SOURCE)
 
@@ -27,7 +31,7 @@
 
 $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY): $(DNSMASQ_DIR)/.source
 	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
-		COPTS=$(DNSMASQ_COPTS) PREFIX=/usr -C $(DNSMASQ_DIR)
+		COPTS='$(DNSMASQ_COPTS)' PREFIX=/usr -C $(DNSMASQ_DIR)
 
 $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY): $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(DNSMASQ_DIR) install
@@ -41,8 +45,6 @@
 
 dnsmasq: uclibc $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
 
-dnsmasq1: uclibc $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
-
 dnsmasq-source: $(DL_DIR)/$(DNSMASQ_SOURCE)
 
 dnsmasq-clean:
