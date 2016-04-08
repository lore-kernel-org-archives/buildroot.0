From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri,  8 Apr 2016 15:59:53 +0200
Subject: [Buildroot] [PATCH v2] package/wpa_supplicant: Fix systemd service
	stop
In-Reply-To: <1460123993-18653-1-git-send-email-m.niestroj@grinn-global.com>
References: <1460123993-18653-1-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <1460123993-18653-2-git-send-email-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix systemd service stop when using only new DBus bus name.

By default systemd service description comes with old DBus bus name for
wpa_supplicant. If only new bus name is used, then systemd stops
wpa_supplicant.service, because it has not started old bus name with
specified time. In order to suppress stopping wpa_supplicant.service in
such case, we just rename BusName property to the new one, so systemd
sees that the service has started properly.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index ba1180d..7d4ab42 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -193,6 +193,19 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
 endef
 
+# By default systemd service description comes with old DBus bus name for
+# wpa_supplicant. If only new bus name is used, then systemd stops
+# wpa_supplicant.service, because it has not started old bus name with
+# specified time.
+# To suppress stopping wpa_supplicant.service in such case, just rename
+# BusName property to the new one.
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),)
+define WPA_SUPPLICANT_UPDATE_DBUS_NAME
+	sed -i -e 's/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE)/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE)/g' \
+		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant.service
+endef
+endif
+
 define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant.service
@@ -202,6 +215,7 @@ define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-nl80211 at .service
 	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired at .service
+	$(WPA_SUPPLICANT_UPDATE_DBUS_NAME)
 endef
 
 $(eval $(generic-package))
-- 
2.8.0
