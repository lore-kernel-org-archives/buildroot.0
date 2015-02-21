From: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
Date: Sat, 21 Feb 2015 00:45:49 -0500
Subject: [Buildroot] [PATCH] qt-webkit-kiosk: new package
Message-ID: <1424497549-8506-1-git-send-email-jerome.oufella@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt-webkit-kiosk is a simple browser working in kiosk-mode, powered by
Qt & Webkit. It provides a convenient way to deploy a full-screen
browser on embedded system platforms.

This commit adds the appropriate packaging to Buildroot, including
options to parametrize the deployment of the optional sound files and
the customization of the browser configuration file.

Signed-off-by: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
---
 package/Config.in                          |  1 +
 package/qt-webkit-kiosk/Config.in          | 37 ++++++++++++++++++++++
 package/qt-webkit-kiosk/qt-webkit-kiosk.mk | 51 ++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 package/qt-webkit-kiosk/Config.in
 create mode 100644 package/qt-webkit-kiosk/qt-webkit-kiosk.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..90be326 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -250,6 +250,7 @@ comment "X applications"
 	source "package/leafpad/Config.in"
 	source "package/midori/Config.in"
 	source "package/pcmanfm/Config.in"
+	source "package/qt-webkit-kiosk/Config.in"
 	source "package/rdesktop/Config.in"
 	source "package/synergy/Config.in"
 	source "package/torsmo/Config.in"
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
new file mode 100644
index 0000000..4371ac8
--- /dev/null
+++ b/package/qt-webkit-kiosk/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_QT_WEBKIT_KIOSK
+	depends on BR2_PACKAGE_QT5WEBKIT
+	depends on BR2_PACKAGE_QT5MULTIMEDIA
+	bool "qt-webkit-kiosk"
+	help
+	  Simple browser working in kiosk-mode, powered by Qt & Webkit
+
+if BR2_PACKAGE_QT_WEBKIT_KIOSK
+
+config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
+        bool "Install browser sound files"
+        help
+          Deploy browser sound files on target
+
+choice
+	prompt "Browser configuration file"
+	help
+	  Select what configuration file to use
+
+config BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_DEFAULT
+	bool "Default configuration file"
+
+config BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM
+	bool "Custom configuration file"
+
+endchoice
+
+config BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE
+	depends on BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM
+        string "Custom configuration file"
+        help
+          Enter the path to the custom configuration file. The file
+	  will be deployed as qt-webkit-kiosk.ini in the browser'
+	  resource directory.
+
+endif
+
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
new file mode 100644
index 0000000..a6325a5
--- /dev/null
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
@@ -0,0 +1,51 @@
+QT_WEBKIT_KIOSK_VERSION = 7fe40a350abfbe5ec194e7c6c740f7099e8704cd
+QT_WEBKIT_KIOSK_SITE = https://github.com/sergey-dryabzhinsky/qt-webkit-kiosk.git
+QT_WEBKIT_KIOSK_SITE_METHOD = git
+QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
+QT_WEBKIT_KIOSK_LICENSE = LGPLv3
+QT_WEBKIT_KIOSK_LICENSE_FILES = doc/lgpl.html
+
+ifeq ($(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_DEFAULT),y)
+QT_WEBKIT_KIOSK_INSTALL_TARGET_OPTS += install_config
+endif
+
+ifeq ($(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM),y)
+ifneq ($(call qstrip,$(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE)),)
+define QT_WEBKIT_KIOSK_INSTALL_CFG_CUSTOM
+	if [ -f "$(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE)" ]; then \
+		$(INSTALL) -D -m 0644 "$(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE)" \
+			$(TARGET_DIR)/usr/share/qt-webkit-kiosk/qt-webkit-kiosk.ini; \
+	else \
+		printf "Error: '%s' is not a valid file, check your BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE setting\n" \
+		"$(BR2_PACKAGE_QT_WEBKIT_KIOSK_CFG_CUSTOM_VALUE)"; \
+		exit 1 ; \
+	fi
+endef
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS),y)
+QT_WEBKIT_KIOSK_INSTALL_TARGET_OPTS += install_sound
+endif
+
+ifneq ($(call qstrip,$(QT_WEBKIT_KIOSK_INSTALL_TARGET_OPTS)),)
+define QT_WEBKIT_KIOSK_INSTALL_DATAFILES
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_ROOT=$(TARGET_DIR) $(QT_WEBKIT_KIOSK_INSTALL_TARGET_OPTS)
+endef
+endif
+
+define QT_WEBKIT_KIOSK_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake PREFIX=/usr)
+endef
+
+define QT_WEBKIT_KIOSK_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/src/qt-webkit-kiosk $(TARGET_DIR)/usr/bin/
+	$(QT_WEBKIT_KIOSK_INSTALL_DATAFILES)
+	$(QT_WEBKIT_KIOSK_INSTALL_CFG_CUSTOM)
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
