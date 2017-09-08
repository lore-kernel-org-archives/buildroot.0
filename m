From: Julien Floret <julien.floret@6wind.com>
Date: Fri,  8 Sep 2017 15:45:48 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: install all MIB files
Message-ID: <20170908134548.23645-1-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit be8e32d585f3 ("netsnmp: configurable MIB modules"),
the list of MIB modules can be selected with a configuration option.

However, there was still an hardcoded list of MIB files to exclude from
the target filesystem.
Since it is complicated to know which MIB files are necessary according
to the configuration, let's install all of them.

Cc: przemyslaw <przemyslaw.wrzos@calyptech.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/netsnmp/netsnmp.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index abcf63d56858..742fa6e3b382 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -38,8 +38,6 @@ NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
 NETSNMP_AUTORECONF = YES
 
-NETSNMP_BLOAT_MIBS = BRIDGE DISMAN-EVENT DISMAN-SCHEDULE DISMAN-SCRIPT EtherLike RFC-1215 RFC1155-SMI RFC1213 SCTP SMUX
-
 ifeq ($(BR2_ENDIAN),"BIG")
 NETSNMP_CONF_OPTS += --with-endianness=big
 else
@@ -101,14 +99,6 @@ else
 NETSNMP_CONF_OPTS += --disable-applications
 endif
 
-define NETSNMP_REMOVE_BLOAT_MIBS
-	for mib in $(NETSNMP_BLOAT_MIBS); do \
-		rm -f $(TARGET_DIR)/usr/share/snmp/mibs/$$mib-MIB.txt; \
-	done
-endef
-
-NETSNMP_POST_INSTALL_TARGET_HOOKS += NETSNMP_REMOVE_BLOAT_MIBS
-
 ifeq ($(BR2_PACKAGE_NETSNMP_SERVER),y)
 define NETSNMP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
-- 
2.13.1
