From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Apr 2013 08:47:21 -0300
Subject: [Buildroot] [PATCH] quagga: fix build breakage without snmp
Message-ID: <1366285641-7018-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quagga no longer supports explicitly disabling snmp, and what's worse,
it interprets --disable-snmp as --enable-snmp.
Remove the disable configure option.
While at it add a comment about net-snmp requiring AgentX support for
quagga to build properly as suggested by Arnout.
Fixes:
http://autobuild.buildroot.net/results/a9bce6dd8065ddb1850a4e14f0e4eb257ee89286/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quagga/Config.in | 3 +++
 package/quagga/quagga.mk | 4 +---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 0834201..c364ae1 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -84,4 +84,7 @@ config BR2_PACKAGE_QUAGGA_SNMP
 	help
 	  Make quagga information available via SNMP SMUX.
 
+comment "AgentX support must be enabled in net-snmp or the build will break"
+	depends on BR2_PACKAGE_QUAGGA_SNMP
+
 endif
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 42f8506..347ec4d 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -26,10 +26,8 @@ QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_OPAQUE_LSA),--enable-opaque-lsa,--d
 
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
 QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
-QUAGGA_CONF_OPT += --enable-snmp
+QUAGGA_CONF_OPT += --enable-snmp=agentx
 QUAGGA_DEPENDENCIES += netsnmp
-else
-QUAGGA_CONF_OPT +=--disable-snmp
 endif
 
 $(eval $(autotools-package))
-- 
1.8.1.5
