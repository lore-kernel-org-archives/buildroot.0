From: Mauro Condarelli <mc5686@mclink.it>
Date: Sat,  7 Mar 2020 12:43:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: bump version to 1.38
Message-ID: <20200307114312.14726-1-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added support for iwd.

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/connman/Config.in    | 9 ++++++++-
 package/connman/connman.hash | 1 +
 package/connman/connman.mk   | 5 +++--
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 30eae23..13f9ccc 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
 	default y
 
 config BR2_PACKAGE_CONNMAN_WIFI
-	bool "enable WiFi support"
+	bool "enable WiFi (wpa_supplicant) support"
 	select BR2_PACKAGE_WPA_SUPPLICANT # runtime
 	select BR2_PACKAGE_WPA_SUPPLICANT_DBUS # runtime
 	help
@@ -31,6 +31,13 @@ config BR2_PACKAGE_CONNMAN_WIFI
 	  setup). ConnMan detects the start of wpa_supplicant
 	  automatically.
 
+config BR2_PACKAGE_CONNMAN_IWD
+	bool "enable WiFi (iwd) support"
+	select BR2_PACKAGE_IWD # runtime
+	help
+	  Enable WiFi support (scan and static/dhcp interface
+	  setup). ConnMan detects the start of iwd automatically.
+
 config BR2_PACKAGE_CONNMAN_WISPR
 	bool "enable WISPr support"
 	depends on !BR2_STATIC_LIBS # gnutls
diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index ff5b4d4..9122c43 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
 sha256 6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16  connman-1.37.tar.xz
+sha256 cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b  connman-1.38.tar.xz
 # Locally computed
 sha256 b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 2cbf3fe..181ea14 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.37
+CONNMAN_VERSION = 1.38
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
-CONNMAN_DEPENDENCIES = libglib2 dbus iptables
+CONNMAN_DEPENDENCIES = libmnl libglib2 dbus iptables
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
@@ -16,6 +16,7 @@ CONNMAN_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug) \
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet) \
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) \
+	$(if $(BR2_PACKAGE_CONNMAN_IWD),--enable-iwd,--disable-iwd) \
 	$(if $(BR2_PACKAGE_CONNMAN_WISPR),--enable-wispr,--disable-wispr) \
 	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth) \
 	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback) \
-- 
2.25.1
