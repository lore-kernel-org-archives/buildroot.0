From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 28 Oct 2015 16:55:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: add config option
	to build wpa_client library
Message-ID: <1446047749-16623-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2.5 of wpa_supplicant introduces the config option
CONFIG_BUILD_WPA_CLIENT_SO to enable building wpa_client as shared library.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/wpa_supplicant/Config.in         |  5 +++++
 package/wpa_supplicant/wpa_supplicant.mk | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index eb42257..0b4c484 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -63,6 +63,11 @@ config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 	help
 	  Install wpa_cli command line utility
 
+config BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO
+	bool "Install wpa_client shared library"
+	help
+	  Installs libwpa_client.so.
+
 config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
 	bool "Install wpa_passphrase binary"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 839a419..e3f1434 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -15,6 +15,9 @@ WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 
+# install the wpa_client library
+WPA_SUPPLICANT_INSTALL_STAGING = YES
+
 WPA_SUPPLICANT_CONFIG_EDITS =
 
 WPA_SUPPLICANT_CONFIG_SET =
@@ -117,6 +120,22 @@ WPA_SUPPLICANT_DEPENDENCIES += readline
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO),y)
+WPA_SUPPLICANT_CONFIG_SET += CONFIG_BUILD_WPA_CLIENT_SO
+define WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO
+	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/libwpa_client.so \
+		$(TARGET_DIR)/usr/lib/libwpa_client.so
+	$(INSTALL) -m 0644 -D $(@D)/src/common/wpa_ctrl.h \
+		$(TARGET_DIR)/usr/include/wpa_ctrl.h
+endef
+define WPA_SUPPLICANT_INSTALL_STAGING_WPA_CLIENT_SO
+	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/libwpa_client.so \
+		$(STAGING_DIR)/usr/lib/libwpa_client.so
+	$(INSTALL) -m 0644 -D $(@D)/src/common/wpa_ctrl.h \
+		$(STAGING_DIR)/usr/include/wpa_ctrl.h
+endef
+endif
+
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
 	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
@@ -159,6 +178,10 @@ define WPA_SUPPLICANT_INSTALL_DBUS
 endef
 endif
 
+define WPA_SUPPLICANT_INSTALL_STAGING_CMDS
+	$(WPA_SUPPLICANT_INSTALL_STAGING_WPA_CLIENT_SO)
+endef
+
 define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_supplicant \
 		$(TARGET_DIR)/usr/sbin/wpa_supplicant
@@ -167,6 +190,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_CLI)
 	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
+	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
 endef
 
 define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
-- 
2.6.2
