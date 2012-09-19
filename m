From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 19 Sep 2012 12:11:43 +0200
Subject: [Buildroot] [PATCH 3/3] wpa_supplicant: introduce macros for
	editing the .config file
In-Reply-To: <1348049503-1469-1-git-send-email-s.neumann@raumfeld.com>
References: <5058EFD8.4010809@mind.be>
 <1348049503-1469-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1348049503-1469-4-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the substitutions on the .config file more readable by
introducing macros to enable, disable certain options similar
to the macros we use for editing KConfig files.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |   62 ++++++++++++++++++------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index e8d55d3..5337e5f 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -15,49 +15,61 @@ WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 
+define WPA_SUPPLICANT_CONFIG_DISABLE
+	$(SED) 's/^\($(1).*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
+endef
+
+define WPA_SUPPLICANT_CONFIG_ENABLE
+	$(SED) 's/#\($(1).*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+endef
+
+define WPA_SUPPLICANT_CONFIG_SET
+	echo '$(1)=y' >> $(WPA_SUPPLICANT_CONFIG)
+endef
+
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
 define WPA_SUPPLICANT_LIBNL_CONFIG
-	echo 'CONFIG_LIBNL32=y' >>$(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_SET,CONFIG_LIBNL32)
 endef
 else
 define WPA_SUPPLICANT_LIBNL_CONFIG
-	$(SED) 's/^\(CONFIG_DRIVER_NL80211.*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_DISABLE,CONFIG_DRIVER_NL80211)
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
 define WPA_SUPPLICANT_EAP_CONFIG
-	$(SED) 's/#\(CONFIG_EAP_AKA.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_EAP_FAST.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_EAP_GPSK.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_EAP_IKEV2.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_EAP_PAX.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_EAP_PSK.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_EAP_SAKE.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_EAP_SIM.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_EAP_TNC.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_AKA)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_FAST)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_GPSK)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_IKEV2)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_PAX)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_PSK)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_SAKE)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_SIM)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_TNC)
 endef
 else
 define WPA_SUPPLICANT_EAP_CONFIG
-	$(SED) 's/^\(CONFIG_EAP.*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_DISABLE,CONFIG_EAP)
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
 define WPA_SUPPLICANT_AP_CONFIG
-	echo 'CONFIG_AP=y' >>$(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_SET,CONFIG_AP)
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
 define WPA_SUPPLICANT_WPS_CONFIG
-	$(SED) 's/#\(CONFIG_WPS.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_WPS)
 endef
 endif
 
 define WPA_SUPPLICANT_LIBTOMMATH_CONFIG
-	$(SED) 's/#\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_INTERNAL_LIBTOMMATH)
 endef
 
 # Try to use openssl or gnutls if it's already available
@@ -65,7 +77,7 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 define WPA_SUPPLICANT_TLS_CONFIG
 	$(SED) 's/#\(CONFIG_TLS=openssl\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_EAP_PWD.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_EAP_PWD)
 endef
 else
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
@@ -88,7 +100,7 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
 define WPA_SUPPLICANT_DBUS_OLD_CONFIG
-	$(SED) 's/#\(CONFIG_CTRL_IFACE_DBUS=\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_CTRL_IFACE_DBUS=)
 endef
 define WPA_SUPPLICANT_INSTALL_DBUS_OLD
 	$(INSTALL) -D \
@@ -99,7 +111,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW),y)
 define WPA_SUPPLICANT_DBUS_NEW_CONFIG
-	$(SED) 's/#\(CONFIG_CTRL_IFACE_DBUS_NEW=\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_CTRL_IFACE_DBUS_NEW)
 endef
 define WPA_SUPPLICANT_INSTALL_DBUS_NEW
 	$(INSTALL) -D \
@@ -110,7 +122,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION),y)
 define WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG
-	$(SED) 's/#\(CONFIG_CTRL_IFACE_DBUS_INTRO=\)/\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_CTRL_IFACE_DBUS_INTRO)
 endef
 endif
 
@@ -124,12 +136,12 @@ endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_IEEE80211N.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_IEEE80211R.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_INTERWORKING.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/#\(CONFIG_DELAYED_MIC.*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(CONFIG_DRIVER_ATMEL\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(CONFIG_SMARTCARD\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_IEEE80211N)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_IEEE80211R)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_INTERWORKING)
+	$(call WPA_SUPPLICANT_CONFIG_ENABLE,CONFIG_DELAYED_MIC)
+	$(call WPA_SUPPLICANT_CONFIG_DISABLE,CONFIG_DRIVER_ATMEL)
+	$(call WPA_SUPPLICANT_CONFIG_DISABLE,CONFIG_SMARTCARD)
 	$(WPA_SUPPLICANT_LIBTOMMATH_CONFIG)
 	$(WPA_SUPPLICANT_TLS_CONFIG)
 	$(WPA_SUPPLICANT_EAP_CONFIG)
-- 
1.7.9.5
