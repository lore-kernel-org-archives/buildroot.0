From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Mar 2015 10:11:15 -0300
Subject: [Buildroot] [PATCH] quagga: bump to version 0.99.24
Message-ID: <1425474675-17472-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quagga/Config.in   | 17 ++++++++++-------
 package/quagga/quagga.hash |  2 ++
 package/quagga/quagga.mk   |  8 ++++++--
 3 files changed, 18 insertions(+), 9 deletions(-)
 create mode 100644 package/quagga/quagga.hash

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index ebec2c8..d8b10f8 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,6 +1,11 @@
+comment "quagga needs a toolchain w/ IPv6"
+	depends on BR2_USE_MMU
+	depends on !BR2_INET_IPV6
+
 config BR2_PACKAGE_QUAGGA
 	bool "quagga"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_INET_IPV6
 	help
 	  Routing software suite, providing implementations of
 	  OSPFv2, OSPFv3 (IPv6), RIP v1 and v2, RIPng (IPv6) and BGPv4+.
@@ -11,13 +16,9 @@ if BR2_PACKAGE_QUAGGA
 
 config BR2_PACKAGE_QUAGGA_ZEBRA
 	bool "zebra daemon"
-	depends on BR2_INET_IPV6
 	help
 	  Build zebra daemon.
 
-comment "zebra daemon needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 	bool "Use TCP sockets between zebra and protocol daemons"
 	depends on BR2_PACKAGE_QUAGGA_ZEBRA
@@ -30,7 +31,6 @@ config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 
 config BR2_PACKAGE_QUAGGA_BABELD
 	bool "BABEL protocol"
-	depends on BR2_INET_IPV6
 	help
 	  Build babeld daemon.
 
@@ -59,7 +59,6 @@ config BR2_PACKAGE_QUAGGA_OPAQUE_LSA
 
 config BR2_PACKAGE_QUAGGA_OSPF6D
 	bool "OSPFv3 (IPv6) protocol"
-	depends on BR2_INET_IPV6
 	help
 	  Build ospf6d daemon.
 
@@ -70,10 +69,14 @@ config BR2_PACKAGE_QUAGGA_RIPD
 
 config BR2_PACKAGE_QUAGGA_RIPNGD
 	bool "RIPng (IPv6) protocol"
-	depends on BR2_INET_IPV6
 	help
 	  Build ripngd daemon.
 
+config BR2_PACKAGE_QUAGGA_PIMD
+	bool "PIMd protocol"
+	help
+	  Provides IPv4 PIM-SSM multicast routing.
+
 config BR2_PACKAGE_QUAGGA_WATCHQUAGGA
 	bool "Build watchquagga"
 	help
diff --git a/package/quagga/quagga.hash b/package/quagga/quagga.hash
new file mode 100644
index 0000000..172ff97
--- /dev/null
+++ b/package/quagga/quagga.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	eca9eeb75005c8c403d48747c93456389e837e07dfc06ce08f70602c32dd4041	quagga-0.99.24.tar.xz
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 6e3acbb..16fcb64 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,13 +4,16 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 0.99.23.1
+QUAGGA_VERSION = 0.99.24
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
+QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LICENSE = GPLv2+
 QUAGGA_LICENSE_FILES = COPYING
-QUAGGA_CONF_OPTS = --program-transform-name='' --enable-netlink
+QUAGGA_CONF_OPTS = --program-transform-name=''
+# Upstream missed some bits when packaging it
+QUAGGA_AUTORECONF = YES
 
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BABELD),--enable-babeld,--disable-babeld)
@@ -19,6 +22,7 @@ QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_RIPD),--enable-ripd,--disable-ripd
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_RIPNGD),--enable-ripngd,--disable-ripngd)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OSPFD),--enable-ospfd,--disable-ospfd)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OSPF6D),--enable-ospf6d,--disable-ospf6d)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_PIMD),--enable-pimd,--disable-pimd)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),--enable-watchquagga,--disable-watchquagga)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ISISD),--enable-isisd,--disable-isisd)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),--enable-bgp-announce,--disable-bgp-announce)
-- 
2.0.5
