From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 08 Mar 2021 07:44:44 -0000
Subject: [Buildroot] [git commit] package/wpa_supplicant: Add options to
 disable more features.
Message-ID: <20210308072133.8615381607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f24dcf4801dd5a345978b26dabdf103970cbf17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Together, they increase the size of the binary by a bit less than a
megabyte.

As a result, make the wpa_supplicant option a menuconfig.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/Config.in         | 35 +++++++++++++++++++++++++++++++-
 package/wpa_supplicant/wpa_supplicant.mk | 19 +++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 8057c0b7be..9553dcf7df 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_WPA_SUPPLICANT
+menuconfig BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
 	depends on BR2_USE_MMU # fork()
 	help
@@ -29,6 +29,33 @@ config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
 comment "nl80211 support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
+	bool "Enable wext (deprecated)"
+	default y if !BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Enable support for wext.  This is the historic wireless API
+	  for Linux, which is now deprecated and in maintenance-only in
+	  the kernel.  It may still be required by out-of-tree drivers.
+
+config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
+	bool "Enable wired support"
+	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
+	help
+	  Include the "wired" driver, so the internal IEEE 802.1x
+	  supplicant can be used with Ethernet.  This also enables
+	  support for MACSEC.
+
+comment "wpa_supplicant will be useless without at least one driver"
+	depends on !BR2_PACKAGE_WPA_SUPPLICANT_NL80211 && \
+		!BR2_PACKAGE_WPA_SUPPLICANT_WEXT && \
+		!BR2_PACKAGE_WPA_SUPPLICANT_WIRED
+
+config BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN
+	bool "Enable IBSS RSN"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211
+	help
+	  Enable support for RSN/WPA2 in Ad-Hoc mode.
+
 config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	bool "Enable AP mode"
 	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211
@@ -90,6 +117,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WPA3
 
 config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 	bool "Install wpa_cli binary"
+	select BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE
 	help
 	  Install wpa_cli command line utility
 
@@ -107,6 +135,11 @@ config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
 	help
 	  Install wpa_passphrase command line utility.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE
+	bool "Enable the Unix-socket control interface"
+	help
+	  Enable support for the Unix-socket-based API.
+
 config BR2_PACKAGE_WPA_SUPPLICANT_DBUS
 	bool "Enable support for the DBus control interface"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 295f368d78..f4ed74abc3 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -47,6 +47,14 @@ else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WEXT),)
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_WEXT
+endif
+
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN), )
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_IBSS_RSN
+endif
+
 # Trailing underscore on purpose to not enable CONFIG_EAPOL_TEST
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_
@@ -61,6 +69,13 @@ WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_FILS
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),)
+WPA_SUPPLICANT_CONFIG_DISABLE += \
+	CONFIG_DRIVER_WIRED \
+	CONFIG_MACSEC \
+	CONFIG_DRIVER_MACSEC
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),)
 WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_HS20 \
@@ -119,6 +134,10 @@ WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD CONFIG_EAP_TEAP
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),)
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS),y)
 WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
 WPA_SUPPLICANT_MAKE_ENV = \
