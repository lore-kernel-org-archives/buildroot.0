From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 18 Dec 2012 08:52:46 +0100
Subject: [Buildroot] [PATCH RESEND 1/2] wpa-supplicant: add options to
	enable the new DBus interface
In-Reply-To: <50D013FC.7040503@mind.be>
References: <50D013FC.7040503@mind.be>
Message-ID: <1355817167-10100-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sven Neumann <s.neumann@raumfeld.com>

Allow to configure the DBus interfaces that the wpa_supplicant
binary should support (old or new or both). Also allow to
enable introspection support on the new DBus interface.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (build-test with all features enabled)
---
 package/wpa_supplicant/Config.in         |   19 ++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk |   42 ++++++++++++++++++++++++++----
 2 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index d7cefe3..8b0b366 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -30,6 +30,25 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	  (optionally, with WPS); this links in parts of hostapd functionality
 	  into wpa_supplicant.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD
+	bool "Enable support for old DBus control interface"
+	depends on BR2_PACKAGE_DBUS
+	help
+	  Enable support for old DBus control interface
+	  (fi.epitest.hostap.WPASupplicant).
+
+config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW
+	bool "Enable support for new DBus control interface"
+	depends on BR2_PACKAGE_DBUS
+	help
+	  Enable support for new DBus control interface (fi.w1.wpa_supplicant1).
+
+config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
+	bool "Introspection support"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW
+	help
+	  Add introspection support for new DBus control interface.
+
 config BR2_PACKAGE_WPA_SUPPLICANT_WPS
 	bool "Enable support for WPS"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 71be11f..3118913 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -10,7 +10,8 @@ WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
-WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant
+WPA_SUPPLICANT_DBUS_OLD_SERVICE = fi.epitest.hostap.WPASupplicant
+WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -84,9 +85,41 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 	WPA_SUPPLICANT_MAKE_ENV = \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
-define WPA_SUPPLICANT_DBUS_CONFIG
+
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
+define WPA_SUPPLICANT_DBUS_OLD_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
 endef
+define WPA_SUPPLICANT_INSTALL_DBUS_OLD
+	$(INSTALL) -D \
+	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service \
+	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW),y)
+define WPA_SUPPLICANT_DBUS_NEW_CONFIG
+	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_NEW=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+endef
+define WPA_SUPPLICANT_INSTALL_DBUS_NEW
+	$(INSTALL) -D \
+	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service \
+	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION),y)
+define WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG
+	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_INTRO=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
+endef
+endif
+
+define WPA_SUPPLICANT_DBUS_CONFIG
+	$(WPA_SUPPLICANT_DBUS_OLD_CONFIG)
+	$(WPA_SUPPLICANT_DBUS_NEW_CONFIG)
+	$(WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG)
+endef
+
 endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
@@ -131,9 +164,8 @@ define WPA_SUPPLICANT_INSTALL_DBUS
 	$(INSTALL) -D \
 	  $(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
 	  $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
-	$(INSTALL) -D \
-	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_SERVICE).service \
-	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
+	$(WPA_SUPPLICANT_INSTALL_DBUS_OLD)
+	$(WPA_SUPPLICANT_INSTALL_DBUS_NEW)
 endef
 endif
 
-- 
1.7.10.4
