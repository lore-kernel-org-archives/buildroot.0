From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 22:26:12 +0200
Subject: [Buildroot] [git commit] netsnmp: Remove ldconfig calls
Message-ID: <20140516203248.639389CC3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85235ba2735e7e76080d6791393da0a7efbacf70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ldconfig breaks links created by gpu-viv-bin-mx6q.

fixes
http://autobuild.buildroot.net/results/ab5/ab57dd3729d529366808cbfc802f49360b2ec2b9/

[Peter: use NETSNMP_INSTALL_*_OPT, only install initscript for sysv init]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/netsnmp.mk |   19 +++++++++++++------
 1 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 63ec97a..75956d4 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -24,6 +24,8 @@ NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp \
 		--with-out-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES))" \
 		--with-out-transports="Unix" \
 		--disable-manuals
+NETSNMP_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
+NETSNMP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
 
@@ -61,21 +63,26 @@ ifneq ($(BR2_INET_IPV6),y)
 define NETSNMP_REMOVE_MIBS_IPV6
 	rm -f $(TARGET_DIR)/usr/share/snmp/mibs/IPV6*
 endef
+
+NETSNMP_POST_INSTALL_TARGET_HOOKS += NETSNMP_REMOVE_MIBS_IPV6
 endif
 
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
 	NETSNMP_CONF_OPT += --disable-debugging
 endif
 
-define NETSNMP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) install
-	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
-		$(TARGET_DIR)/etc/init.d/S59snmpd
+
+define NETSNMP_REMOVE_BLOAT_MIBS
 	for mib in $(NETSNMP_BLOAT_MIBS); do \
 		rm -f $(TARGET_DIR)/usr/share/snmp/mibs/$$mib-MIB.txt; \
 	done
-	$(NETSNMP_REMOVE_MIBS_IPV6)
+endef
+
+NETSNMP_POST_INSTALL_TARGET_HOOKS += NETSNMP_REMOVE_BLOAT_MIBS
+
+define NETSNMP_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
+		$(TARGET_DIR)/etc/init.d/S59snmpd
 endef
 
 define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
