From: Julien Floret <julien.floret@6wind.com>
Date: Mon, 12 Dec 2016 13:11:08 +0100
Subject: [Buildroot] [PATCH] netsnmp: fix libnl include path in configure
	script
Message-ID: <1481544668-900-1-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Search for libnl headers in staging directory, not in the host machine
/usr/include/libnl3 folder.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/netsnmp/netsnmp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 48273b51bcc1..c893ea6189d6 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -93,6 +93,13 @@ else
 NETSNMP_CONF_OPTS += --disable-applications
 endif
 
+define NETSNMP_FIX_LIBNL_INCLUDE_PATH
+	$(SED) "s,-I/usr/include/libnl3,-I$(STAGING_DIR)/usr/include/libnl3,g" \
+		$(@D)/configure
+endef
+
+NETSNMP_PRE_CONFIGURE_HOOKS += NETSNMP_FIX_LIBNL_INCLUDE_PATH
+
 define NETSNMP_REMOVE_BLOAT_MIBS
 	for mib in $(NETSNMP_BLOAT_MIBS); do \
 		rm -f $(TARGET_DIR)/usr/share/snmp/mibs/$$mib-MIB.txt; \
-- 
2.1.0
