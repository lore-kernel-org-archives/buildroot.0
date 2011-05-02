From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 May 2011 12:36:05 -0300
Subject: [Buildroot] [PATCH] net-snmp: fixup paths in net-snmp-config
Message-ID: <1304350565-1948-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Exposed by commit 7e3e8ec040b06d6e2fb69e55c004f1ebc02c76d0
net-snmp-config goes for -L/usr/lib thus things break since this wins
over the sysroot if we have a host net-snmp library around when we build
packages that link against net-snmp.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netsnmp/netsnmp.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index edb1704..5704327 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -68,4 +68,14 @@ define NETSNMP_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
 endef
 
+define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
+		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
+		$(STAGING_DIR)/usr/bin/net-snmp-config
+endef
+
+NETSNMP_POST_INSTALL_STAGING_HOOKS += NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
+
 $(eval $(call AUTOTARGETS,package,netsnmp))
-- 
1.7.3.4
