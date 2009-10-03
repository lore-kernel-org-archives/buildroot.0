From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 22:01:08 +0200
Subject: [Buildroot] [git commit master] quagga: cleanup kconfig
Message-ID: <20091003200148.E6AFF762E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=191c59c2d232729ec73c5b345a9b219c035dda79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Structure it like other packages with sub-options.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quagga/Config.in |   84 ++++++++++++++-------------------------------
 package/quagga/quagga.mk |    2 -
 2 files changed, 26 insertions(+), 60 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index dc5adec..4a4b175 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,100 +1,68 @@
 config BR2_PACKAGE_QUAGGA
-	bool
-
-comment "quagga suite"
-
-config BR2_PACKAGE_QUAGGA_ZEBRA
-	bool "quagga zebra"
-	select BR2_PACKAGE_QUAGGA
+	bool "quagga"
 	help
 	  routing software suite, providing implementations of
 	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
 
 	  http://www.quagga.net/
 
-config BR2_PACKAGE_QUAGGA_BGPD
-	bool "quagga bgpd"
-	select BR2_PACKAGE_QUAGGA
+if BR2_PACKAGE_QUAGGA
+
+config BR2_PACKAGE_QUAGGA_ZEBRA
+	bool "zebra daemon"
 	help
-	  routing software suite, providing implementations of
-	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+	  Build zebra daemon.
 
-	  http://www.quagga.net/
+config BR2_PACKAGE_QUAGGA_BGPD
+	bool "bgpd support"
+	help
+	  Enable bgpd support in quagga.
 
 config BR2_PACKAGE_QUAGGA_RIPD
-	bool "quagga ripd"
-	select BR2_PACKAGE_QUAGGA
+	bool "ripd support"
 	help
-	  routing software suite, providing implementations of
-	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
-
-	  http://www.quagga.net/
+	  Enable ripd support in quagga.
 
 config BR2_PACKAGE_QUAGGA_RIPNGD
-	bool "quagga ripngd"
-	select BR2_PACKAGE_QUAGGA
+	bool "ripngd support"
 	help
-	  routing software suite, providing implementations of
-	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
-
-	  http://www.quagga.net/
+	  Enable ripngd support in quagga.
 
 config BR2_PACKAGE_QUAGGA_OSPFD
-	bool "quagga ospfd"
-	select BR2_PACKAGE_QUAGGA
+	bool "ospfd support"
 	help
-	  routing software suite, providing implementations of
-	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
-
-	  http://www.quagga.net/
+	  Enable ospfd support in quagga.
 
 config BR2_PACKAGE_QUAGGA_OSPF6D
-	bool "quagga ospf6d"
-	select BR2_PACKAGE_QUAGGA
+	bool "ospf6d support"
 	depends on BR2_INET_IPV6
 	help
-	  routing software suite, providing implementations of
-	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
-
-	  http://www.quagga.net/
+	  Enable ospf6d support in quagga.
 
 config BR2_PACKAGE_QUAGGA_WATCHQUAGGA
-	bool "quagga watchquagga"
-	select BR2_PACKAGE_QUAGGA
+	bool "watchquagga support"
 	help
-	  routing software suite, providing implementations of
-	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
-
-	  http://www.quagga.net/
+	  Enable watchquagga support in quagga.
 
 config BR2_PACKAGE_QUAGGA_ISISD
-	bool "isisd"
-	select BR2_PACKAGE_QUAGGA
+	bool "isisd support"
 	help
-	  routing software suite, providing implementations of
-	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
-
-	  http://www.quagga.net/
+	  Enable isisd support in quagga.
 
-if BR2_PACKAGE_QUAGGA
-comment "common options for quagga suite"
 config BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE
 	bool "BGP route announcement"
 
 config BR2_PACKAGE_QUAGGA_NETLINK
-	bool "quagga: use linux netlink interface"
+	bool "use linux netlink interface"
 	default y
 
 config BR2_PACKAGE_QUAGGA_SNMP
-	bool "quagga: SNMP support"
+	bool "SNMP support"
 
 config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
-	bool "quagga: TCP/IP socket connection between zebra and proto daemon"
+	bool "TCP/IP socket connection between zebra and proto daemon"
 
 config BR2_PACKAGE_QUAGGA_OPAGUE_LSA
-	bool "quagga: OSPF Opaque-LSA with OSPFAPI support (RFC2370)"
+	bool "OSPF Opaque-LSA with OSPFAPI support (RFC2370)"
 
-config BR2_PACKAGE_QUAGGA_CONFIGURE
-	string "quagga: extra configure options"
-	default ""
 endif
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 3aa63f3..fb520ee 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -110,8 +110,6 @@ else
 QUAGGA_CONFIGURE+=--disable-opaque-lsa
 endif
 
-QUAGGA_CONFIGURE+=$(call qstrip,$(BR2_PACKAGE_QUAGGA_CONFIGURE))
-
 $(DL_DIR)/$(QUAGGA_SOURCE):
 	$(call DOWNLOAD,$(QUAGGA_SITE),$(QUAGGA_SOURCE))
 
-- 
1.6.3.3
