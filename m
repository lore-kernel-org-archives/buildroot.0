From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 22:31:21 +0200
Subject: [Buildroot] [git commit] netsnmp: cleanup configure flags handling
Message-ID: <20140516203248.6C0D89CC3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=252b5a1fc0f6a30807de7912a958a71e83e9e8e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change, but cleaner.

Remove the double --disable-manuals and move the debug handling together
with the other optional configure flags.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/netsnmp.mk |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 75956d4..1372f2f 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -50,14 +50,15 @@ else
 	NETSNMP_CONF_OPT += --without-openssl
 endif
 
-# Docs
-NETSNMP_CONF_OPT += --disable-manuals
-
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
 	NETSNMP_CONF_OPT += --disable-mib-loading
 	NETSNMP_CONF_OPT += --disable-mibs
 endif
 
+ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
+	NETSNMP_CONF_OPT += --disable-debugging
+endif
+
 # Remove IPv6 MIBs if there's no IPv6
 ifneq ($(BR2_INET_IPV6),y)
 define NETSNMP_REMOVE_MIBS_IPV6
@@ -67,11 +68,6 @@ endef
 NETSNMP_POST_INSTALL_TARGET_HOOKS += NETSNMP_REMOVE_MIBS_IPV6
 endif
 
-ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
-	NETSNMP_CONF_OPT += --disable-debugging
-endif
-
-
 define NETSNMP_REMOVE_BLOAT_MIBS
 	for mib in $(NETSNMP_BLOAT_MIBS); do \
 		rm -f $(TARGET_DIR)/usr/share/snmp/mibs/$$mib-MIB.txt; \
