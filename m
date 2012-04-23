From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Apr 2012 08:55:54 +0200
Subject: [Buildroot] [PATCH v2 1/2] wpa_supplicant: install basic
	configuration file
Message-ID: <1335164155-20004-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/wpa_supplicant/wpa_supplicant.conf |    6 ++++++
 package/wpa_supplicant/wpa_supplicant.mk   |    8 ++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100755 package/wpa_supplicant/wpa_supplicant.conf

diff --git a/package/wpa_supplicant/wpa_supplicant.conf b/package/wpa_supplicant/wpa_supplicant.conf
new file mode 100755
index 0000000..1994a6c
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant.conf
@@ -0,0 +1,6 @@
+ctrl_interface=/var/run/wpa_supplicant
+ap_scan=1
+
+network={
+  key_mgmt=NONE
+}
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 0a672ee..4a1baea 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -118,10 +118,18 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 WPA_SUPPLICANT_POST_INSTALL_TARGET_HOOKS += WPA_SUPPLICANT_INSTALL_DBUS
 endif
 
+define WPA_SUPPLICANT_INSTALL_CONFIG
+	$(INSTALL) -m 644 \
+	  package/wpa_supplicant/wpa_supplicant.conf  $(TARGET_DIR)/etc/wpa_supplicant.conf
+endef
+
+WPA_SUPPLICANT_POST_INSTALL_TARGET_HOOKS += WPA_SUPPLICANT_INSTALL_CONFIG
+
 define WPA_SUPPLICANT_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(WPA_SUPPLICANT_TARGET_BINS))
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
 	rm -f $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
+	rm -f $(TARGET_DIR)/usr/etc/wpa_supplicant.conf
 endef
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.7
