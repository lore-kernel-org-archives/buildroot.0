From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Feb 2021 13:42:00 +0100
Subject: [Buildroot] [git commit branch/next] package/wpa_supplicant:
 Simplify D-Bus support.
Message-ID: <20210213122130.1354883799@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3dcb2012522505b1dba0f39da6987b8882252d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

wpa_supplicant 2.8 dropped support for the old D-Bus interface, so
remove mentions of it and rename DBUS_NEW variables to just DBUS.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/Config.in         | 2 +-
 package/wpa_supplicant/wpa_supplicant.mk | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 9553dcf7df..3c986ff4ba 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -154,6 +154,6 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	bool "Introspection support"
 	depends on BR2_PACKAGE_WPA_SUPPLICANT_DBUS
 	help
-	  Add introspection support for new DBus control interface.
+	  Add introspection support for the DBus control interface.
 
 endif
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index f4ed74abc3..b7bdc4e0af 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -13,8 +13,7 @@ WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CPE_ID_VENDOR = w1.fi
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
-WPA_SUPPLICANT_DBUS_OLD_SERVICE = fi.epitest.hostap.WPASupplicant
-WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
+WPA_SUPPLICANT_DBUS_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 WPA_SUPPLICANT_SELINUX_MODULES = networkmanager
@@ -146,8 +145,8 @@ WPA_SUPPLICANT_MAKE_ENV = \
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_NEW
 define WPA_SUPPLICANT_INSTALL_DBUS_NEW
 	$(INSTALL) -m 0644 -D \
-		$(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service \
-		$(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service
+		$(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_SERVICE).service \
+		$(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
 endef
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION),y)
@@ -220,7 +219,6 @@ define WPA_SUPPLICANT_INSTALL_DBUS
 	$(INSTALL) -m 0644 -D \
 		$(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
 		$(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
-	$(WPA_SUPPLICANT_INSTALL_DBUS_OLD)
 	$(WPA_SUPPLICANT_INSTALL_DBUS_NEW)
 endef
 endif
