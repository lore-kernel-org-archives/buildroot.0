From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 23:40:56 +0100
Subject: [Buildroot] [git commit] netsnmp: configurable MIB modules
Message-ID: <20130324224103.1CB439B266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be8e32d585f38cb5527fa65c53bf23fba025c62c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the MIB modules, which are included/excluded in the build, to be
configurable instead of being hard coded.

[Peter: drop menuconfig]
Signed-off-by: przemyslaw <przemyslaw.wrzos@calyptech.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/Config.in  |   14 ++++++++++++++
 package/netsnmp/netsnmp.mk |    4 ++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 108ab83..d5056f9 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
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
