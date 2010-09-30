From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Sep 2010 21:50:43 +0200
Subject: [Buildroot] [git commit master 1/1] quagga: bump version,
	fix conflicting options, enhance help
Message-ID: <20100930195058.CD0368B6B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b8ce1fb184e1308a53ab7f58a1fbcf8add0c3c73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   10 +-
 package/quagga/Config.in                           |   78 ++++++++++----------
 ...ing.patch => quagga-fix-ipctl-forwarding.patch} |    0
 package/quagga/quagga.mk                           |   12 +--
 4 files changed, 48 insertions(+), 52 deletions(-)
 rename package/quagga/{quagga-0.99.16-fix-ipctl-forwarding.patch => quagga-fix-ipctl-forwarding.patch} (100%)

diff --git a/CHANGES b/CHANGES
index 5910bb7..f5c1616 100644
--- a/CHANGES
+++ b/CHANGES
@@ -36,11 +36,11 @@
 	mdadm, mesa3d, metacity, mtd-utils, mysql_client, nano, nbd,
 	ncftp, neon, netperf, netsnmp, ng-spice-rework, ntfsprogs,
 	ntp, openntpd, openssh, openvpn, oprofile, pango, patch, pcre,
-	php, pkg-config, prboom, radvd, rdesktop, ruby, qt, samba,
-	sawman, sdl_mixer, sdl_sound, setserial, shared-mime-info,
-	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
-	thttpd, tiff, tn5250, udev, udpcast, usbmount, usbutils,
-	vsftpd, vtun, which, wpa_supplicant,
+	php, pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga,
+	samba, sawman, sdl_mixer, sdl_sound, setserial,
+	shared-mime-info, speex, sqlite, squashfs, strace, sylpheed,
+	taglib, tcpdump, thttpd, tiff, tn5250, udev, udpcast,
+	usbmount, usbutils, vsftpd, vtun, which, wpa_supplicant,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index fb0d590..9ca2f98 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_QUAGGA
 	bool "quagga"
 	help
-	  routing software suite, providing implementations of
-	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+	  Routing software suite, providing implementations of
+	  OSPFv2, OSPFv3 (IPv6), RIP v1 and v2, RIPng (IPv6) and BGPv4+.
 
 	  http://www.quagga.net/
 
@@ -13,62 +13,64 @@ config BR2_PACKAGE_QUAGGA_ZEBRA
 	help
 	  Build zebra daemon.
 
-config BR2_PACKAGE_QUAGGA_BGPD
-	bool "bgpd support"
+config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
+	bool "Use TCP sockets between zebra and protocol daemons"
 	help
-	  Enable bgpd support in quagga.
+	  Use a TCP socket to communicate between zebra (supervisor) and
+	  the different protocol daemons.
 
-config BR2_PACKAGE_QUAGGA_RIPD
-	bool "ripd support"
+	  You'll want this enabled if zebra and the protocol daemon(s) run
+	  on different hosts.
+
+config BR2_PACKAGE_QUAGGA_BGPD
+	bool "BPGv4+ protocol"
 	help
-	  Enable ripd support in quagga.
+	  Build bpgd daemon.
 
-config BR2_PACKAGE_QUAGGA_RIPNGD
-	bool "ripngd support"
-	depends on BR2_INET_IPV6
+config BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE
+	bool "BGP route announcement"
+	depends on BR2_PACKAGE_QUAGGA_BGPD
+
+config BR2_PACKAGE_QUAGGA_ISISD
+	bool "IS-IS protocol"
 	help
-	  Enable ripngd support in quagga.
+	  Enable isisd support in quagga.
 
 config BR2_PACKAGE_QUAGGA_OSPFD
-	bool "ospfd support"
+	bool "OSPFv2 protocol"
 	help
-	  Enable ospfd support in quagga.
+	  Build ospfd daemon.
+
+config BR2_PACKAGE_QUAGGA_OPAQUE_LSA
+	bool "OSPF Opaque-LSA with OSPFAPI support (RFC2370)"
+	depends on BR2_PACKAGE_QUAGGA_OSPFD
 
 config BR2_PACKAGE_QUAGGA_OSPF6D
-	bool "ospf6d support"
+	bool "OSPFv3 (IPv6) protocol"
 	depends on BR2_INET_IPV6
 	help
-	  Enable ospf6d support in quagga.
+	  Build ospf6d daemon.
 
-config BR2_PACKAGE_QUAGGA_WATCHQUAGGA
-	bool "watchquagga support"
+config BR2_PACKAGE_QUAGGA_RIPD
+	bool "RIPv2/v3 protocol"
 	help
-	  Enable watchquagga support in quagga.
+	  Build ripd daemon.
 
-config BR2_PACKAGE_QUAGGA_ISISD
-	bool "isisd support"
+config BR2_PACKAGE_QUAGGA_RIPNGD
+	bool "RIPng (IPv6) protocol"
+	depends on BR2_INET_IPV6
 	help
-	  Enable isisd support in quagga.
+	  Build ripngd daemon.
 
-config BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE
-	bool "BGP route announcement"
-
-config BR2_PACKAGE_QUAGGA_NETLINK
-	bool "use linux netlink interface"
-	default y
+config BR2_PACKAGE_QUAGGA_WATCHQUAGGA
+	bool "Build watchquagga"
+	help
+	  Build and install watchquagga, a zebra/protocol daemon supervisor.
 
 config BR2_PACKAGE_QUAGGA_SNMP
 	bool "SNMP support"
-	depends on !BR2_TOOLCHAIN_EXTERNAL
 	select BR2_PACKAGE_NETSNMP
-
-comment "quagga snmp support broken with external toolchains"
-	depends on BR2_TOOLCHAIN_EXTERNAL
-
-config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
-	bool "TCP/IP socket connection between zebra and proto daemon"
-
-config BR2_PACKAGE_QUAGGA_OPAGUE_LSA
-	bool "OSPF Opaque-LSA with OSPFAPI support (RFC2370)"
+	help
+	  Make quagga information available via SNMP SMUX.
 
 endif
diff --git a/package/quagga/quagga-0.99.16-fix-ipctl-forwarding.patch b/package/quagga/quagga-fix-ipctl-forwarding.patch
similarity index 100%
rename from package/quagga/quagga-0.99.16-fix-ipctl-forwarding.patch
rename to package/quagga/quagga-fix-ipctl-forwarding.patch
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 79c0b71..c1eeee8 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -3,13 +3,13 @@
 # quagga suite
 #
 #############################################################
-QUAGGA_VERSION:=0.99.16
+QUAGGA_VERSION:=0.99.17
 QUAGGA_SOURCE:=quagga-$(QUAGGA_VERSION).tar.gz
 QUAGGA_SITE:=http://www.quagga.net/download/
 
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LIBTOOL_PATCH = NO
-QUAGGA_CONF_OPT = --program-transform-name=''
+QUAGGA_CONF_OPT = --program-transform-name='' --enable-netlink
 
 ifeq ($(BR2_PACKAGE_QUAGGA_ZEBRA),y)
 QUAGGA_CONF_OPT+=--enable-zebra
@@ -65,12 +65,6 @@ else
 QUAGGA_CONF_OPT+=--disable-bgp-announce
 endif
 
-ifeq ($(BR2_PACKAGE_QUAGGA_NETLINK),y)
-QUAGGA_CONF_OPT+=--enable-netlink
-else
-QUAGGA_CONF_OPT+=--disable-netlink
-endif
-
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
 QUAGGA_CONF_OPT+=--enable-snmp
 QUAGGA_DEPENDENCIES+=netsnmp
@@ -84,7 +78,7 @@ else
 QUAGGA_CONF_OPT+=--disable-tcp-zebra
 endif
 
-ifeq ($(BR2_PACKAGE_QUAGGA_OPAGUE_LSA),y)
+ifeq ($(BR2_PACKAGE_QUAGGA_OPAQUE_LSA),y)
 QUAGGA_CONF_OPT+=--enable-opaque-lsa
 else
 QUAGGA_CONF_OPT+=--disable-opaque-lsa
-- 
1.7.1
