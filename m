From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Dec 2006 09:46:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netsnmp
Message-ID: <20061220174601.969C3485A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-20 09:46:00 -0800 (Wed, 20 Dec 2006)
New Revision: 17021

Log:
- fails for parallel builds, so force -j1
- improve the -clean target


Modified:
   trunk/buildroot/package/netsnmp/netsnmp.mk


Changeset:
Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2006-12-20 17:40:52 UTC (rev 17020)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2006-12-20 17:46:00 UTC (rev 17021)
@@ -58,7 +58,7 @@
 	touch $(NETSNMP_DIR)/.configured
 
 $(NETSNMP_DIR)/agent/snmpd: $(NETSNMP_DIR)/.configured
-	$(MAKE) -C $(NETSNMP_DIR)
+	$(MAKE1) -C $(NETSNMP_DIR)
 
 $(TARGET_DIR)/usr/sbin/snmpd: $(NETSNMP_DIR)/agent/snmpd
 	#$(MAKE) DESTDIR=$(TARGET_DIR) -C $(NETSNMP_DIR) install
@@ -97,7 +97,11 @@
 netsnmp-source: $(DL_DIR)/$(NETSNMP_SOURCE)
 
 netsnmp-clean: 
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETSNMP_DIR) uninstall
 	$(MAKE) -C $(NETSNMP_DIR) clean
+	rm -rf $(TARGET_DIR)/etc/snmp/{snmpd{,trapd},mib2c*}.conf \
+		$(TARGET_DIR)/etc/default/snmpd \
+		$(TARGET_DIR)/usr/include/net-snmp
 
 netsnmp-dirclean: 
 	rm -rf $(NETSNMP_DIR)
