From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] netsnmp: allow to disable MIB files
	installation and MIB loading code
Message-ID: <20110912052631.72D0E8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9c83b37cccb51f89a40f69a64b7ffba2e8c6f0f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/Config.in  |    8 ++++++++
 package/netsnmp/netsnmp.mk |    5 +++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 5a3e9aa..431be2d 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -6,3 +6,11 @@ config BR2_PACKAGE_NETSNMP
 
 	  http://net-snmp.sourceforge.net/
 
+config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
+	bool "Install MIB files on target and enable MIB loading code"
+	default y
+	depends on BR2_PACKAGE_NETSNMP
+	help
+	  The net-snmp package contains a selection of MIB files.
+	  Say yes if you want those MIB files installed on the target
+	  and enable the code that parses the MIB files.
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index a44f3fe..05d8db7 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -43,6 +43,11 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	NETSNMP_CONF_OPT += --disable-manuals
 endif
 
+ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
+	NETSNMP_CONF_OPT += --disable-mib-loading
+	NETSNMP_CONF_OPT += --disable-mibs
+endif
+
 # Remove IPv6 MIBs if there's no IPv6
 ifneq ($(BR2_INET_IPV6),y)
 define NETSNMP_REMOVE_MIBS_IPV6
-- 
1.7.3.4
