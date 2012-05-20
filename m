From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 May 2012 20:04:21 +0200
Subject: [Buildroot] [git commit branch/next] quagga: bump to version 0.99.21
Message-ID: <20120520180451.7CB9F96D47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b20c77321fa87f880ead2f27ecf19fd7c4f436da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quagga/Config.in |    5 +++
 package/quagga/quagga.mk |   89 +++++++++------------------------------------
 2 files changed, 23 insertions(+), 71 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 9ca2f98..5a01863 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -22,6 +22,11 @@ config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 	  You'll want this enabled if zebra and the protocol daemon(s) run
 	  on different hosts.
 
+config BR2_PACKAGE_QUAGGA_BABELD
+	bool "BABEL protocol"
+	help
+	  Build babeld daemon.
+
 config BR2_PACKAGE_QUAGGA_BGPD
 	bool "BPGv4+ protocol"
 	help
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 1073852..349e003 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,86 +4,33 @@
 #
 #############################################################
 
-QUAGGA_VERSION = 0.99.20.1
-QUAGGA_SITE = http://www.quagga.net/download
+QUAGGA_VERSION = 0.99.21
+QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_CONF_OPT = --program-transform-name='' --enable-netlink
 
-ifeq ($(BR2_PACKAGE_QUAGGA_ZEBRA),y)
-QUAGGA_CONF_OPT+=--enable-zebra
-else
-QUAGGA_CONF_OPT+=--disable-zebra
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_BGPD),y)
-QUAGGA_CONF_OPT+=--enable-bgpd
-else
-QUAGGA_CONF_OPT+=--disable-bgpd
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_RIPD),y)
-QUAGGA_CONF_OPT+=--enable-ripd
-else
-QUAGGA_CONF_OPT+=--disable-ripd
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_RIPNGD),y)
-QUAGGA_CONF_OPT+=--enable-ripngd
-else
-QUAGGA_CONF_OPT+=--disable-ripngd
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_OSPFD),y)
-QUAGGA_CONF_OPT+=--enable-ospfd
-else
-QUAGGA_CONF_OPT+=--disable-ospfd
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_OSPF6D),y)
-QUAGGA_CONF_OPT+=--enable-ospf6d
-else
-QUAGGA_CONF_OPT+=--disable-ospf6d
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),y)
-QUAGGA_CONF_OPT+=--enable-watchquagga
-else
-QUAGGA_CONF_OPT+=--disable-watchquagga
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_ISISD),y)
-QUAGGA_CONF_OPT+=--enable-isisd
-else
-QUAGGA_CONF_OPT+=--disable-isisd
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),y)
-QUAGGA_CONF_OPT+=--enable-bgp-announce
-else
-QUAGGA_CONF_OPT+=--disable-bgp-announce
-endif
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_BABELD),--enable-babeld,--disable-babeld)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_BGPD),--enable-bgpd,--disable-bgpd)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_RIPD),--enable-ripd,--disable-ripd)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_RIPNGD),--enable-ripngd,--disable-ripngd)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_OSPFD),--enable-ospfd,--disable-ospfd)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_OSPF6D),--enable-ospf6d,--disable-ospf6d)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),--enable-watchquagga,--disable-watchquagga)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_ISISD),--enable-isisd,--disable-isisd)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),--enable-bgp-announce,--disable-bgp-announce)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZERBRA),--enable-tcp-zebra,--disable-tcp-zebra)
+QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_OPAQUE_LSA),--enable-opaque-lsa,--disable-opaque-lsa)
 
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
-QUAGGA_CONF_OPT+=--enable-snmp
-QUAGGA_DEPENDENCIES+=netsnmp
+QUAGGA_CONF_OPT += --enable-snmp
+QUAGGA_DEPENDENCIES += netsnmp
 # SNMP support tries -lcrypto by default, disable it if we ain't got openssl
 ifneq ($(BR2_PACKAGE_OPENSSL),y)
-QUAGGA_CONF_OPT+=--without-crypto
-endif
-else
-QUAGGA_CONF_OPT+=--disable-snmp
+QUAGGA_CONF_OPT +=--without-crypto
 endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_TCP_ZEBRA),y)
-QUAGGA_CONF_OPT+=--enable-tcp-zebra
-else
-QUAGGA_CONF_OPT+=--disable-tcp-zebra
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_OPAQUE_LSA),y)
-QUAGGA_CONF_OPT+=--enable-opaque-lsa
 else
-QUAGGA_CONF_OPT+=--disable-opaque-lsa
+QUAGGA_CONF_OPT +=--disable-snmp
 endif
 
 $(eval $(call AUTOTARGETS))
