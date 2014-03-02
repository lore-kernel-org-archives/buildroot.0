From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 16:42:09 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: bump to version 2.1
Message-ID: <20140302154633.1DCD69B2DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b119a108c771dff4aebf23b1b5a2fd10f2949053
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now with 802.11ac and P2P support.

CONFIG_LIBNL32 was a hidden option so switch to ENABLE/DISABLE now.
CONFIG_DRIVER_ATMEL was dropped.
CONFIG_DELAYED_MIC is no longer optional.
CONFIG_AP was also hidden so also switch to ENABLE/DISABLE.
CONFIG_EAP_* now blindly enabled instead of doing one per each.

P2P support is unified with the AP mode config knob since it's the more
likely scenario and share code between them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |   25 ++++++++++---------------
 1 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 34e8e1f..17788cc 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPA_SUPPLICANT_VERSION = 2.0
+WPA_SUPPLICANT_VERSION = 2.1
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
 WPA_SUPPLICANT_LICENSE_FILES = README
@@ -20,51 +20,46 @@ WPA_SUPPLICANT_CONFIG_EDITS =
 WPA_SUPPLICANT_CONFIG_SET =
 
 WPA_SUPPLICANT_CONFIG_ENABLE = \
+	CONFIG_IEEE80211AC	\
 	CONFIG_IEEE80211N	\
 	CONFIG_IEEE80211R	\
 	CONFIG_INTERWORKING	\
-	CONFIG_DELAYED_MIC	\
 	CONFIG_INTERNAL_LIBTOMMATH
 
 WPA_SUPPLICANT_CONFIG_DISABLE = \
-	CONFIG_DRIVER_ATMEL	\
 	CONFIG_SMARTCARD
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
-	WPA_SUPPLICANT_CONFIG_SET += CONFIG_LIBNL32
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_LIBNL32
 else
 	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
 endif
 
+# Trailing underscore on purpose to not enable CONFIG_EAPOL_TEST
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_AKA		\
-					CONFIG_EAP_FAST		\
-					CONFIG_EAP_GPSK 	\
-					CONFIG_EAP_IKEV2	\
-					CONFIG_EAP_PAX		\
-					CONFIG_EAP_PSK		\
-					CONFIG_EAP_SAKE		\
-					CONFIG_EAP_SIM		\
-					CONFIG_EAP_TNC
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_
 else
 	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
-	WPA_SUPPLICANT_CONFIG_SET += CONFIG_AP
+	WPA_SUPPLICANT_CONFIG_ENABLE += \
+		CONFIG_AP \
+		CONFIG_P2P
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
+	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WPS_NFC
 endif
 
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_PWD
 else
+	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
 	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
