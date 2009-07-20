From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 20 Jul 2009 22:11:42 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: add optional dbus support
Message-ID: <20090720201811.2882C777E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=321c254be5342fc8698dfa5604a2e2301dbc5588
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/wpa_supplicant.mk |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 2cceeb3..eaa6ab4 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -13,10 +13,14 @@ WPA_SUPPLICANT_DEPENDENCIES = uclibc
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
 WPA_SUPPLICANT_TARGET_BINS = wpa_cli wpa_supplicant wpa_passphrase
+WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 endif
+ifeq ($(BR2_PACKAGE_DBUS),y)
+	WPA_SUPPLICANT_DEPENDENCIES += dbus
+endif
 
 $(eval $(call AUTOTARGETS,package,wpa_supplicant))
 
@@ -36,6 +40,9 @@ else
 	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
 endif
 endif
+ifeq ($(BR2_PACKAGE_DBUS),y)
+	echo "CONFIG_CTRL_IFACE_DBUS=y" >>$(WPA_SUPPLICANT_CONFIG)
+endif
 	touch $@
 
 $(WPA_SUPPLICANT_HOOK_POST_INSTALL):
@@ -45,9 +52,19 @@ endif
 ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE),y)
 	rm -f $(TARGET_DIR)/usr/sbin/wpa_passphrase
 endif
+ifeq ($(BR2_PACKAGE_DBUS),y)
+	$(INSTALL) -D \
+	  $(WPA_SUPPLICANT_DIR)/wpa_supplicant/dbus-wpa_supplicant.conf \
+	  $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
+	$(INSTALL) -D \
+	  $(WPA_SUPPLICANT_DIR)/wpa_supplicant/dbus-wpa_supplicant.service \
+	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
+endif
 
 $(WPA_SUPPLICANT_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(WPA_SUPPLICANT_TARGET_BINS))
+	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
+	rm -f $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
 	rm -f $(WPA_SUPPLICANT_TARGET_INSTALL_TARGET) $(WPA_SUPPLICANT_HOOK_POST_INSTALL)
 
-- 
1.6.3.3
