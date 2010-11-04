From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] netsnmp: bump to version 5.6
Message-ID: <20101104230334.8BC938DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=de642c9904b13914017af6f10db144d559d6bd0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../netsnmp-5.5-no-ifxtable-module-fix.patch       |   18 ------------
 package/netsnmp/netsnmp.mk                         |   28 +++++++++++++++-----
 2 files changed, 21 insertions(+), 25 deletions(-)
 delete mode 100644 package/netsnmp/netsnmp-5.5-no-ifxtable-module-fix.patch

diff --git a/package/netsnmp/netsnmp-5.5-no-ifxtable-module-fix.patch b/package/netsnmp/netsnmp-5.5-no-ifxtable-module-fix.patch
deleted file mode 100644
index e13106f..0000000
--- a/package/netsnmp/netsnmp-5.5-no-ifxtable-module-fix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- net-snmp-5.5.theorig/agent/mibgroup/if-mib/ifTable/ifTable_data_access.c	2009-06-12 12:02:22.000000000 -0700
-+++ net-snmp-5.5/agent/mibgroup/if-mib/ifTable/ifTable_data_access.c	2009-10-20 11:29:41.000000000 -0700
-@@ -374,6 +374,7 @@ _check_interface_entry_for_updates(ifTab
-      */
-     if (oper_changed) {
-         rowreq_ctx->data.ifLastChange = netsnmp_get_agent_uptime();
-+#ifdef USING_IF_MIB_IFXTABLE_IFXTABLE_MODULE
-         if (rowreq_ctx->data.ifLinkUpDownTrapEnable == 1) {
-             if (rowreq_ctx->data.ifOperStatus == IFOPERSTATUS_UP) {
-                 oid notification_oid[] = { 1, 3, 6, 1, 6, 3, 1, 1, 5, 4 };
-@@ -389,6 +390,7 @@ _check_interface_entry_for_updates(ifTab
-                                              rowreq_ctx->data.ifOperStatus);
-             }
-         }
-+#endif
-     }
- 
-     else
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 0fe2bc8..e8d7788 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,21 +4,24 @@
 #
 #############################################################
 
-NETSNMP_VERSION = 5.5
+NETSNMP_VERSION = 5.6
 NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_INSTALL_STAGING = YES
-NETSNMP_LIBTOOL_PATCH = NO
-NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
 NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
 		--with-defaults --enable-mini-agent --without-rpm \
 		--with-logfile=none --without-kmem-usage $(DISABLE_IPV6) \
 		--enable-as-needed --disable-debugging --without-perl-modules \
 		--disable-embedded-perl --disable-perl-cc-checks \
-		--with-sys-contact="root at unknown" \
+		--disable-scripts --with-default-snmp-version="1" \
+		--enable-silent-libtool --enable-mfd-rewrites \
+		--with-sys-contact="root at localhost" \
 		--with-sys-location="Unknown" \
-		--with-mib-modules="host smux ucd-snmp/dlmod"
+		--with-mib-modules="host ucd-snmp/dlmod" \
+		--with-out-mib-modules="disman/event disman/schedule utilities" \
+		--with-out-transports="Unix"
+NETSNMP_BLOAT_MIBS = BRIDGE DISMAN-EVENT DISMAN-SCHEDULE DISMAN-SCRIPT EtherLike RFC-1215 RFC1155-SMI RFC1213 SCTP SMUX
 
 ifeq ($(BR2_ENDIAN),"BIG")
 	NETSNMP_CONF_OPT += --with-endianness=big
@@ -40,15 +43,26 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	NETSNMP_CONF_OPT += --disable-manuals
 endif
 
+# Remove IPv6 MIBs if there's no IPv6
+ifneq ($(BR2_INET_IPV6),y)
+define NETSNMP_REMOVE_MIBS_IPV6
+	rm -f $(TARGET_DIR)/usr/share/snmp/mibs/IPV6*
+endef
+endif
+
 define NETSNMP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) install
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
 		$(TARGET_DIR)/etc/init.d/S59snmpd
+	for mib in $(NETSNMP_BLOAT_MIBS); do \
+		rm -f $(TARGET_DIR)/usr/share/snmp/mibs/$$mib-MIB.txt; \
+	done
+	$(NETSNMP_REMOVE_MIBS_IPV6)
 endef
 
 define NETSNMP_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) uninstall
 	rm -f $(TARGET_DIR)/etc/init.d/S59snmpd
 	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
-- 
1.7.1
