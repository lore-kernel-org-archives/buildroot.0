From: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
Date: Sat, 21 Feb 2015 23:22:00 -0500
Subject: [Buildroot] [PATCH v2] qt-webkit-kiosk: new package
In-Reply-To: <1424497549-8506-1-git-send-email-jerome.oufella@savoirfairelinux.com>
References: <1424497549-8506-1-git-send-email-jerome.oufella@savoirfairelinux.com>
Message-ID: <1424578920-21071-1-git-send-email-jerome.oufella@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt-webkit-kiosk is a simple browser working in kiosk-mode, powered by
QtWebkit. It provides a convenient way to deploy a full-screen browser
on embedded system platforms.

This commit adds the appropriate packaging to Buildroot, including an
option to deploy the optional sound files.

Signed-Off-By: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
---
Changes v1 -> v2 (thanks Thomas for the thorough review):
* Update commit message
* Rework config dependencies formulation
* Reword help strings
* Remove config file customization options
* Add missing Makefile comment header
* Use $(QT5_QMAKE) macro instead of qmake
* Simplify the target installation process
---
 package/Config.in                          |  1 +
 package/qt-webkit-kiosk/Config.in          | 20 +++++++++++++++++++
 package/qt-webkit-kiosk/qt-webkit-kiosk.mk | 32 ++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
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
index 0000000..dd4b06f
--- /dev/null
+++ b/package/qt-webkit-kiosk/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_QT_WEBKIT_KIOSK
+	bool "qt-webkit-kiosk"
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5WEBKIT
+	select BR2_PACKAGE_QT5MULTIMEDIA
+	depends on !BR2_STATIC_LIBS # qt5webkit
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
+	depends on BR2_ARCH_HAS_ATOMICS # qt5webkit
+	depends on !BR2_BINFMT_FLAT # qt5webkit
+	help
+	  Simple kiosk-mode browser powered by Qt5Webkit
+
+if BR2_PACKAGE_QT_WEBKIT_KIOSK
+
+config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
+        bool "Install browser sound files"
+        help
+          Deploy browser sound files on target
+
+endif
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
new file mode 100644
index 0000000..d54c8d5
--- /dev/null
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# qt-webkit-kiosk
+#
+################################################################################
+
+QT_WEBKIT_KIOSK_VERSION = 7fe40a350abfbe5ec194e7c6c740f7099e8704cd
+QT_WEBKIT_KIOSK_SITE = https://github.com/sergey-dryabzhinsky/qt-webkit-kiosk.git
+QT_WEBKIT_KIOSK_SITE_METHOD = git
+QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
+QT_WEBKIT_KIOSK_LICENSE = LGPLv3
+QT_WEBKIT_KIOSK_LICENSE_FILES = doc/lgpl.html
+
+define QT_WEBKIT_KIOSK_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
+endef
+
+define QT_WEBKIT_KIOSK_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src -f Makefile.qt-webkit-kiosk \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		install_target
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		install_config \
+		$(if $(BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS),install_sound)
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
