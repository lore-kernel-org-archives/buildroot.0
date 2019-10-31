From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 31 Oct 2019 13:53:58 -0600
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: enable systemd
 services
Message-ID: <20191031195358.62213-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9dcebca9bf..55769c2bbd 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -227,6 +227,17 @@ define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-nl80211 at .service
 	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired at .service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/wpa_supplicant.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/wpa_supplicant.service
+	ln -fs ../../../../usr/lib/systemd/system/wpa_supplicant at .service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/wpa_supplicant at .service
+	ln -fs ../../../../usr/lib/systemd/system/wpa_supplicant-nl80211 at .service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/wpa_supplicant-nl80211 at .service
+	ln -fs ../../../../usr/lib/systemd/system/wpa_supplicant-wired at .service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/wpa_supplicant-wired at .service
+	ln -fs ../../../usr/lib/systemd/system/wpa_supplicant.service \
+		$(TARGET_DIR)/etc/systemd/system/dbus-fi.w1.wpa_supplicant1.service
 endef
 
 $(eval $(generic-package))
-- 
2.20.1
