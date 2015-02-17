From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Tue, 17 Feb 2015 16:42:39 +0100
Subject: [Buildroot] [PATCH] netsnmp: Make server and client installation
	optional
Message-ID: <1424187759-534-1-git-send-email-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The netsnmp package consists of both a server and a number of client
tools, this makes the installation of both parts optional.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/netsnmp/Config.in  | 12 ++++++++++++
 package/netsnmp/netsnmp.mk | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 8edbd39..a93a7cc 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -9,6 +9,18 @@ config BR2_PACKAGE_NETSNMP
 
 if BR2_PACKAGE_NETSNMP
 
+config BR2_PACKAGE_NETSNMP_SERVER
+	bool "net-snmp server"
+	default y
+	help
+	  The snmpd server
+
+config BR2_PACKAGE_NETSNMP_CLIENTS
+	bool "net-snmp clients"
+	default y
+	help
+	  The net-snmp clients (snmpget, snmpwalk, etc).
+
 config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 	bool "Install MIB files on target and enable MIB loading code"
 	default y
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index f1b103e..b272da2 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -67,6 +67,14 @@ ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
 	NETSNMP_CONF_OPTS += --disable-debugging
 endif
 
+ifneq ($(BR2_PACKAGE_NETSNMP_SERVER),y)
+NETSNMP_CONF_OPTS += --disable-agent
+endif
+
+ifneq ($(BR2_PACKAGE_NETSNMP_CLIENTS),y)
+NETSNMP_CONF_OPTS += --disable-applications
+endif
+
 # Remove IPv6 MIBs if there's no IPv6
 ifneq ($(BR2_INET_IPV6),y)
 define NETSNMP_REMOVE_MIBS_IPV6
@@ -84,10 +92,12 @@ endef
 
 NETSNMP_POST_INSTALL_TARGET_HOOKS += NETSNMP_REMOVE_BLOAT_MIBS
 
+ifeq ($(BR2_PACKAGE_NETSNMP_SERVER),y)
 define NETSNMP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
 		$(TARGET_DIR)/etc/init.d/S59snmpd
 endef
+endif
 
 define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
 	$(SED) 	"s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
-- 
1.9.3
