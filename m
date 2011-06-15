From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 15 Jun 2011 17:47:58 +0200
Subject: [Buildroot] [PATCH 2/2] netsnmp: allow not to install MIB files
In-Reply-To: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
References: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1308152878-14593-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/netsnmp/Config.in  |    7 +++++++
 package/netsnmp/netsnmp.mk |    4 ++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 5a3e9aa..2aa537e 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -6,3 +6,10 @@ config BR2_PACKAGE_NETSNMP
 
 	  http://net-snmp.sourceforge.net/
 
+config BR2_PACKAGE_NETSNMP_INSTALL_MIBS
+	bool "Install MIB files on target"
+	default y
+	depends on BR2_PACKAGE_NETSNMP
+	help
+	  The net-snmp package contains a selection of MIB files.
+	  Say yes if you want those MIB files installed on the target.
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 5704327..4eae544 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -43,6 +43,10 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	NETSNMP_CONF_OPT += --disable-manuals
 endif
 
+ifneq ($(BR2_PACKAGE_NETSNMP_INSTALL_MIBS),y)
+	NETSNMP_CONF_OPT += --disable-mibs
+endif
+
 # Remove IPv6 MIBs if there's no IPv6
 ifneq ($(BR2_INET_IPV6),y)
 define NETSNMP_REMOVE_MIBS_IPV6
-- 
1.7.4.1
