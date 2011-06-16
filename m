From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 16 Jun 2011 17:27:12 +0200
Subject: [Buildroot] [PATCH v2 2/3] netsnmp: allow to disable MIB loading
	code
In-Reply-To: <1308238033-20127-1-git-send-email-luca@lucaceresoli.net>
References: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
 <1308238033-20127-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1308238033-20127-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
Changes in v2:
 - this patch is new in v2.

 package/netsnmp/Config.in  |    7 +++++++
 package/netsnmp/netsnmp.mk |    4 ++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 5a3e9aa..6f88b03 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -6,3 +6,10 @@ config BR2_PACKAGE_NETSNMP
 
 	  http://net-snmp.sourceforge.net/
 
+config BR2_PACKAGE_NETSNMP_ENABLE_MIB_LOADING
+	bool "Enable MIB loading code"
+	default y
+	depends on BR2_PACKAGE_NETSNMP
+	help
+	  Include code that parses and manipulates the mib files.
+
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 5704327..c0e631b 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -43,6 +43,10 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	NETSNMP_CONF_OPT += --disable-manuals
 endif
 
+ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIB_LOADING),y)
+	NETSNMP_CONF_OPT += --disable-mib-loading
+endif
+
 # Remove IPv6 MIBs if there's no IPv6
 ifneq ($(BR2_INET_IPV6),y)
 define NETSNMP_REMOVE_MIBS_IPV6
-- 
1.7.4.1
