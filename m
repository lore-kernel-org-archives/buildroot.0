From: Vishal Thanki <vishalthanki@gmail.com>
Date: Tue, 14 Feb 2017 16:03:52 +0100
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: Add config option to install
	"bdaddr"
Message-ID: <1487084632-16396-1-git-send-email-vishalthanki@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"bdaddr" utility allows to change the Bluetooth device
address. This patch adds a config option to enable
installation of bdaddr utility.

Signed-off-by: Vishal Thanki <vishalthanki@gmail.com>
---
 package/bluez5_utils/Config.in       | 6 ++++++
 package/bluez5_utils/bluez5_utils.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index a7c0ee4..00f8ec2 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -64,6 +64,12 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	help
 	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
 
+config BR2_PACKAGE_BLUEZ5_TOOLS_BDADDR
+	bool "install bdaddr tool"
+	depends on BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
+	help
+	  The "bdaddr" tool is used for changing the Bluetooth device address.
+
 config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 66c3eab..f9e73c2 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -38,6 +38,13 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ5_TOOLS_BDADDR),y)
+define BLUEZ5_UTILS_INSTALL_BDADDR
+	$(INSTALL) -D -m 0755 $(@D)/tools/bdaddr $(TARGET_DIR)/usr/bin/bdaddr
+endef
+BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_BDADDR
+endif
+
 # enable sixaxis plugin
 ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-sixaxis
-- 
2.4.11
