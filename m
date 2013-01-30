From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Wed, 30 Jan 2013 13:14:44 +1100
Subject: [Buildroot] [PATCH 1/1] netsnmp: configurable MIB modules
Message-ID: <1359512084-17343-1-git-send-email-przemyslaw.wrzos@calyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: przemyslaw <przemyslaw.wrzos@calyptech.com>

Make the MIB modules, which are included/excluded in the build, to be
configurable instead of being hard coded.

Signed-off-by: przemyslaw <przemyslaw.wrzos@calyptech.com>
---
 package/netsnmp/Config.in  |   16 +++++++++++++++-
 package/netsnmp/netsnmp.mk |    4 ++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 108ab83..2e1da20 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_NETSNMP
+menuconfig BR2_PACKAGE_NETSNMP
 	bool "netsnmp"
 	help
 	  Suite of applications used to implement SNMP v1, SNMP v2c, and
@@ -15,6 +15,20 @@ config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 	  Say yes if you want those MIB files installed on the target
 	  and enable the code that parses the MIB files.
 
+config BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES
+	string "Build with these MIB modules"
+	default "host ucd-snmp/dlmod"
+	depends on BR2_PACKAGE_NETSNMP
+	help
+	  Specify which MIB modules to include.
+
+config BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES
+	string "Build without these MIB modules"
+	default "disman/event disman/schedule utilities"
+	depends on BR2_PACKAGE_NETSNMP
+	help
+	  Specify which MIB modules to exclude.
+
 config BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING
 	bool "Enable debugging code"
 	depends on BR2_PACKAGE_NETSNMP
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 2670cf3..a6912e5 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -20,8 +20,8 @@ NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
 		--enable-silent-libtool --enable-mfd-rewrites \
 		--with-sys-contact="root at localhost" \
 		--with-sys-location="Unknown" \
-		--with-mib-modules="host ucd-snmp/dlmod" \
-		--with-out-mib-modules="disman/event disman/schedule utilities" \
+		--with-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES))" \
+		--with-out-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES))" \
 		--with-out-transports="Unix"
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_BLOAT_MIBS = BRIDGE DISMAN-EVENT DISMAN-SCHEDULE DISMAN-SCRIPT EtherLike RFC-1215 RFC1155-SMI RFC1213 SCTP SMUX
-- 
1.7.10.4
