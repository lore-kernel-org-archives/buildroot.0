From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 20:07:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netsnmp
Message-ID: <20081228200751.0501776D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 20:07:50 +0000 (Sun, 28 Dec 2008)
New Revision: 24582

Log:
netsnmp: don't list openssl as a hard dependency

netsnmp can be compiled without ssl support, so don't list it as a hard
dependency and only compile in support if enabled by the user.

Modified:
   trunk/buildroot/package/netsnmp/Config.in
   trunk/buildroot/package/netsnmp/netsnmp.mk


Changeset:
Modified: trunk/buildroot/package/netsnmp/Config.in
===================================================================
--- trunk/buildroot/package/netsnmp/Config.in	2008-12-28 20:06:20 UTC (rev 24581)
+++ trunk/buildroot/package/netsnmp/Config.in	2008-12-28 20:07:50 UTC (rev 24582)
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NETSNMP
 	bool "netsnmp"
-	select BR2_PACKAGE_OPENSSL
 	help
 	  Suite of applications used to implement SNMP v1, SNMP v2c, and
 	  SNMP v3 using both IPv4 and IPv6.

Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2008-12-28 20:06:20 UTC (rev 24581)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2008-12-28 20:07:50 UTC (rev 24582)
@@ -130,7 +130,7 @@
 	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/header_complex.h $(STAGING_DIR)/usr/include/net-snmp/agent/header_complex.h
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd $(TARGET_DIR)/etc/init.d/S59snmpd
 
-netsnmp: openssl $(TARGET_DIR)/usr/sbin/snmpd
+netsnmp: $(if $(BR2_PACKAGE_OPENSSL),openssl) $(TARGET_DIR)/usr/sbin/snmpd
 
 netsnmp-headers: $(TARGET_DIR)/usr/include/net-snmp/net-snmp-config.h
 	$(INSTALL) -d $(TARGET_DIR)/usr/include/net-snmp
