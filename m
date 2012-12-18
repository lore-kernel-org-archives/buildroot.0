From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 18 Dec 2012 08:52:47 +0100
Subject: [Buildroot] [PATCH RESEND 2/2] wpa_supplicant: rework .config file
	editing
In-Reply-To: <1355817167-10100-1-git-send-email-arnout@mind.be>
References: <50D013FC.7040503@mind.be>
 <1355817167-10100-1-git-send-email-arnout@mind.be>
Message-ID: <1355817167-10100-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sven Neumann <s.neumann@raumfeld.com>

Do all substitutions on the .config file in a single sed command.
Make the .config file editing a lot more readable. Based on ideas
brought up by Arnout Vandecappelle on the mailing-list.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (build-test with all features enabled)
---
 package/wpa_supplicant/wpa_supplicant.mk |  109 +++++++++++-------------------
 1 file changed, 41 insertions(+), 68 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 3118913..c1ef11a 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -15,68 +15,61 @@ WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 
+WPA_SUPPLICANT_CONFIG_EDITS =
+
+WPA_SUPPLICANT_CONFIG_SET =
+
+WPA_SUPPLICANT_CONFIG_ENABLE = \
+	CONFIG_IEEE80211N	\
+	CONFIG_IEEE80211R	\
+	CONFIG_INTERWORKING	\
+	CONFIG_DELAYED_MIC	\
+	CONFIG_INTERNAL_LIBTOMMATH
+
+WPA_SUPPLICANT_CONFIG_DISABLE = \
+	CONFIG_DRIVER_ATMEL	\
+	CONFIG_SMARTCARD
+
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
-define WPA_SUPPLICANT_LIBNL_CONFIG
-	echo 'CONFIG_LIBNL32=y' >>$(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_SET += CONFIG_LIBNL32
 else
-define WPA_SUPPLICANT_LIBNL_CONFIG
-	$(SED) 's/^\(CONFIG_DRIVER_NL80211.*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
-define WPA_SUPPLICANT_EAP_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_EAP_AKA.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_FAST.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_GPSK.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_IKEV2.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_PAX.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_PSK.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_SAKE.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_SIM.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_TNC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_AKA		\
+					CONFIG_EAP_FAST		\
+					CONFIG_EAP_GPSK 	\
+					CONFIG_EAP_IKEV2	\
+					CONFIG_EAP_PAX		\
+					CONFIG_EAP_PSK		\
+					CONFIG_EAP_SAKE		\
+					CONFIG_EAP_SIM		\
+					CONFIG_EAP_TNC
 else
-define WPA_SUPPLICANT_EAP_CONFIG
-	$(SED) 's/^\(CONFIG_EAP.*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
-define WPA_SUPPLICANT_AP_CONFIG
-	echo 'CONFIG_AP=y' >>$(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_SET += CONFIG_AP
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
-define WPA_SUPPLICANT_WPS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_WPS.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
 endif
 
-define WPA_SUPPLICANT_LIBTOMMATH_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-endef
-
 # Try to use openssl or gnutls if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
-define WPA_SUPPLICANT_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=openssl\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_PWD
 else
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 	WPA_SUPPLICANT_DEPENDENCIES += gnutls
-define WPA_SUPPLICANT_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2gnutls/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1gnutls/'
 else
-define WPA_SUPPLICANT_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2internal/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 endif
 
@@ -87,9 +80,7 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
-define WPA_SUPPLICANT_DBUS_OLD_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS=
 define WPA_SUPPLICANT_INSTALL_DBUS_OLD
 	$(INSTALL) -D \
 	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service \
@@ -98,9 +89,7 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW),y)
-define WPA_SUPPLICANT_DBUS_NEW_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_NEW=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_NEW
 define WPA_SUPPLICANT_INSTALL_DBUS_NEW
 	$(INSTALL) -D \
 	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service \
@@ -109,34 +98,18 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION),y)
-define WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_INTRO=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_INTRO
 endif
 
-define WPA_SUPPLICANT_DBUS_CONFIG
-	$(WPA_SUPPLICANT_DBUS_OLD_CONFIG)
-	$(WPA_SUPPLICANT_DBUS_NEW_CONFIG)
-	$(WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG)
-endef
-
 endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_IEEE80211N.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_IEEE80211R.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_INTERWORKING.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_DELAYED_MIC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(CONFIG_DRIVER_ATMEL\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(SED) 's/\(CONFIG_SMARTCARD\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
-	$(WPA_SUPPLICANT_LIBTOMMATH_CONFIG)
-	$(WPA_SUPPLICANT_TLS_CONFIG)
-	$(WPA_SUPPLICANT_EAP_CONFIG)
-	$(WPA_SUPPLICANT_WPS_CONFIG)
-	$(WPA_SUPPLICANT_LIBNL_CONFIG)
-	$(WPA_SUPPLICANT_DBUS_CONFIG)
-	$(WPA_SUPPLICANT_AP_CONFIG)
+	sed -i $(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
+	       $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
+	       $(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
+	       $(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
+	       $(WPA_SUPPLICANT_CONFIG)
 endef
 
 define WPA_SUPPLICANT_BUILD_CMDS
-- 
1.7.10.4
