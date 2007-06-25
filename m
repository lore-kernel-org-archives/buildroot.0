From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 08:07:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netsnmp
Message-ID: <20070625150727.730B8A45D0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 08:07:25 -0700 (Mon, 25 Jun 2007)
New Revision: 18930

Log:
- correct installation path


Modified:
   trunk/buildroot/package/netsnmp/netsnmp.mk


Changeset:
Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2007-06-25 14:53:24 UTC (rev 18929)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2007-06-25 15:07:25 UTC (rev 18930)
@@ -34,9 +34,7 @@
 $(NETSNMP_DIR)/.configured: $(NETSNMP_DIR)/.unpacked
 	(cd $(NETSNMP_DIR); autoconf; \
 		ac_cv_CAN_USE_SYSCTL=no \
-		PATH=$(TARGET_PATH) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
 		--with-cc=$(TARGET_CROSS)gcc \
 		--with-ar=$(TARGET_CROSS)ar \
@@ -69,15 +67,14 @@
 	$(MAKE1) -C $(NETSNMP_DIR)
 
 $(TARGET_DIR)/usr/sbin/snmpd: $(NETSNMP_DIR)/agent/snmpd
-	#$(MAKE) DESTDIR=$(TARGET_DIR) -C $(NETSNMP_DIR) install
 	$(MAKE) PREFIX=$(TARGET_DIR)/usr \
 	    prefix=$(TARGET_DIR)/usr \
 	    exec_prefix=$(TARGET_DIR)/usr \
 	    persistentdir=$(TARGET_DIR)/var/lib/snmp \
 	    infodir=$(TARGET_DIR)/usr/info \
 	    mandir=$(TARGET_DIR)/usr/man \
-	    includedir=$(STAGING_DIR)/include/net-snmp \
-	    ucdincludedir=$(STAGING_DIR)/include/ucd-snmp \
+	    includedir=$(STAGING_DIR)/usr/include/net-snmp \
+	    ucdincludedir=$(STAGING_DIR)/usr/include/ucd-snmp \
 	    -C $(NETSNMP_DIR) install;
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
@@ -91,16 +88,16 @@
 	# Remove the unsupported snmpcheck program
 	rm $(TARGET_DIR)/usr/bin/snmpcheck
 	# Install the "broken" headers
-	cp $(NETSNMP_DIR)/agent/mibgroup/struct.h $(STAGING_DIR)/include/net-snmp/agent
-	cp $(NETSNMP_DIR)/agent/mibgroup/util_funcs.h $(STAGING_DIR)/include/net-snmp
-	cp $(NETSNMP_DIR)/agent/mibgroup/mibincl.h $(STAGING_DIR)/include/net-snmp/library
-	cp $(NETSNMP_DIR)/agent/mibgroup/header_complex.h $(STAGING_DIR)/include/net-snmp/agent
+	cp $(NETSNMP_DIR)/agent/mibgroup/struct.h $(STAGING_DIR)/usr/include/net-snmp/agent
+	cp $(NETSNMP_DIR)/agent/mibgroup/util_funcs.h $(STAGING_DIR)/usr/include/net-snmp
+	cp $(NETSNMP_DIR)/agent/mibgroup/mibincl.h $(STAGING_DIR)/usr/include/net-snmp/library
+	cp $(NETSNMP_DIR)/agent/mibgroup/header_complex.h $(STAGING_DIR)/usr/include/net-snmp/agent
 
 netsnmp: openssl $(TARGET_DIR)/usr/sbin/snmpd
 
 netsnmp-headers: $(TARGET_DIR)/usr/include/net-snmp/net-snmp-config.h
-	cp -a $(STAGING_DIR)/include/net-snmp $(TARGET_DIR)/usr/include/net-snmp
-	cp -a $(STAGING_DIR)/include/ucd-snmp $(TARGET_DIR)/usr/include/net-snmp
+	cp -a $(STAGING_DIR)/usr/include/net-snmp $(TARGET_DIR)/usr/include/net-snmp
+	cp -a $(STAGING_DIR)/usr/include/ucd-snmp $(TARGET_DIR)/usr/include/net-snmp
 
 netsnmp-source: $(DL_DIR)/$(NETSNMP_SOURCE)
 
