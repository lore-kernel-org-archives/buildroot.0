From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 22:35:28 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: install basic
	configuration file
Message-ID: <20120509203804.0C63396C71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed3fb173be263e52ef559212f2df465d08405a30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/wpa_supplicant.conf |    6 ++++++
 package/wpa_supplicant/wpa_supplicant.mk   |    8 ++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

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
