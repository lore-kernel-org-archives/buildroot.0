From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 27 Feb 2020 21:15:53 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/connman: bump to 1.38
Message-ID: <20200227201553.15820-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add choice for either iptables or nftables as firewall types.
Add option to enable/disable wireguard support.
This release requires libmnl (if WireGuard enabled).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
Implement notes from Thomas:
* Add choice for either iptables or nftables as firewall types.
* Add option to enable/disable wireguard support.
* Require libmnl only if WireGuard enabled.

 package/connman/Config.in    | 30 +++++++++++++++++++++++++++++-
 package/connman/connman.hash |  2 +-
 package/connman/connman.mk   | 14 ++++++++++----
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 30eae23c96..5e4ac8bb7d 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_CONNMAN
 	depends on !BR2_TOOLCHAIN_USES_MUSL # missing res_ninit()
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_IPTABLES
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
@@ -18,10 +17,39 @@ config BR2_PACKAGE_CONNMAN
 
 if BR2_PACKAGE_CONNMAN
 
+choice
+	prompt "Firewall type"
+	default BR2_PACKAGE_CONNMAN_IPTABLES
+	help
+	  Select which firewall type is used.
+
+config BR2_PACKAGE_CONNMAN_IPTABLES
+	bool "iptables"
+	select BR2_PACKAGE_IPTABLES
+	help
+	  Use iptables as firewall.
+
+config BR2_PACKAGE_CONNMAN_NFTABLES
+	bool "nftables"
+	select BR2_PACKAGE_NFTABLES
+	help
+	  Use nftables as firewall.
+endchoice
+
 config BR2_PACKAGE_CONNMAN_ETHERNET
 	bool "enable Ethernet support"
 	default y
 
+config BR2_PACKAGE_CONNMAN_WIREGUARD
+	bool "enable WireGuard support"
+	select BR2_PACKAGE_LIBMNL
+	select BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
+	select BR2_PACKAGE_WIREGUARD_TOOLS
+	help
+	  Enable WiFi support (scan and static/dhcp interface
+	  setup). ConnMan detects the start of wpa_supplicant
+	  automatically.
+
 config BR2_PACKAGE_CONNMAN_WIFI
 	bool "enable WiFi support"
 	select BR2_PACKAGE_WPA_SUPPLICANT # runtime
diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index ff5b4d48f0..3039105027 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256 6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16  connman-1.37.tar.xz
+sha256 cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b  connman-1.38.tar.xz
 # Locally computed
 sha256 b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 2cbf3fe752..505e77854a 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.37
+CONNMAN_VERSION = 1.38
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
@@ -13,19 +13,25 @@ CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPTS += \
 	--with-dbusconfdir=/etc \
+	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth) \
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug) \
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet) \
-	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) \
-	$(if $(BR2_PACKAGE_CONNMAN_WISPR),--enable-wispr,--disable-wispr) \
-	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth) \
+	$(if $(BR2_PACKAGE_CONNMAN_IPTABLES),--with-firewall=iptables) \
 	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback) \
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
+	$(if $(BR2_PACKAGE_CONNMAN_NFTABLES),--with-firewall=nftables) \
 	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono) \
+	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) \
+	$(if $(BR2_PACKAGE_CONNMAN_WIREGUARD),--enable-wireguard,--disable-wireguard) \
+	$(if $(BR2_PACKAGE_CONNMAN_WISPR),--enable-wispr,--disable-wispr) \
 	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
 
 CONNMAN_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_CONNMAN_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),neard) \
+	$(if $(BR2_PACKAGE_CONNMAN_NFTABLES),nftables) \
 	$(if $(BR2_PACKAGE_CONNMAN_OFONO),ofono) \
+	$(if $(BR2_PACKAGE_CONNMAN_WIREGUARD),libmnl) \
 	$(if $(BR2_PACKAGE_CONNMAN_WISPR),gnutls)
 
 define CONNMAN_INSTALL_INIT_SYSV
-- 
2.25.1
