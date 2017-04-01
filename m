From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat,  1 Apr 2017 18:36:51 -0400
Subject: [Buildroot] [v7] package: add qt5virtualkeyboard
Message-ID: <20170401223651.6393-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the Qt virtualkeyboard package.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
---
Changes since v6:
 - Add missing empty lines in Config.in.
 - Reword note for all flag in help message.
 - Remove mention of GPLv3 license in help message.
 - Use filter text-function instead of strip+findstring to flag/install
   3rd-parties.
 - Fix useless call to strip when installing 3rd-parties.

Changes since v5:
 - Fix LICENSE information.
 - Fix missing QT5VIRTUALKEYBOARD_ prefix for QMAKEFLAGS.
 - Set QT5VIRTUALKEYBOARD_3RDPARTY_PARTS to YES instead of appending a list of
   mudules.

Changes since v4:
 - Prefix local variables to avoid potential naming collisions.

Changes since v3:
 - Fix another build issue when installing to target
   in case of zh_TW (or other layout) is not set.
 - Add licenses files when using 3rd-part modules.
 - Add support for handwriting module.

Changes since v2:
 - Fix build issue when installing libqtvirtualkeyboardplugin.so library
   in case of some other qt5 package installs something to
   plugins/platforminputcontexts.

Changes since v1:
 - Add missing hash file
 - Add license approval statement
 - Add support for languages layouts
   Note: Chinese, Japanese and Korean does not display properly (font?)
 - Install sample if is compiled (BR2_PACKAGE_QT5BASE_EXAMPLES=y)
 - Apply reviews from Peter:
   Add version constraint: message and dependency (needs at least qt 5.8)
   Update help to mention GPLv3 license

 package/qt5/Config.in                              |  1 +
 package/qt5/qt5virtualkeyboard/Config.in           | 53 ++++++++++++++
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  2 +
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 82 ++++++++++++++++++++++
 4 files changed, 138 insertions(+)
 create mode 100644 package/qt5/qt5virtualkeyboard/Config.in
 create mode 100644 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
 create mode 100644 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 4bcbc6ef5..a810503d3 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -76,6 +76,7 @@ source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
+source "package/qt5/qt5virtualkeyboard/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5websockets/Config.in"
diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
new file mode 100644
index 000000000..95b9f1837
--- /dev/null
+++ b/package/qt5/qt5virtualkeyboard/Config.in
@@ -0,0 +1,53 @@
+comment "qt5virtualkeyboard needs at least qt-5.7 and qt5declarative quick module"
+	depends on !BR2_PACKAGE_QT5_VERSION_LATEST || !BR2_PACKAGE_QT5DECLARATIVE_QUICK
+
+config BR2_PACKAGE_QT5VIRTUALKEYBOARD
+	bool "qt5virtualkeyboard"
+	depends on BR2_PACKAGE_QT5_VERSION_LATEST
+	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	select BR2_PACKAGE_QT5SVG
+	help
+	  Qt Virtual Keyboard is a virtual keyboard framework that consists of a
+	  C++ backend supporting custom input methods as well as a UI frontend
+	  implemented in QML.
+
+if BR2_PACKAGE_QT5VIRTUALKEYBOARD
+
+config BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS
+	string "language layouts"
+	default "en_GB"
+	help
+	  The Virtual Keyboard supports the following languages:
+	  - Arabic (ar_AR)
+	  - Danish (da_DK)
+	  - English (en_GB)
+	  - Finnish (fi_FI)
+	  - French (fr_FR)
+	  - German (de_DE)
+	  - Hindi (hi_IN)
+	  - Italian (it_IT)
+	  - Japanese (ja_JP)
+	  - Korean (ko_KR)
+	  - Norwegian (nb_NO)
+	  - Persian/Farsi (fa_FA)
+	  - Polish (pl_PL)
+	  - Portugese (pt_PT)
+	  - Romanian (ro_RO)
+	  - Russian (ru_RU)
+	  - Simplified Chinese (zh_CN)
+	  - Traditional Chinese (zh_TW)
+	  - Spanish (es_ES)
+	  - Swedish (sv_SE)
+
+	  Note: the special value "all" can be used to install support for all
+	  supported languages.
+
+config BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING
+	bool "handwriting"
+	help
+	  Handwriting support, with gestures for fullscreen input.
+
+	  Lipi Toolkit (LipiTk) is an open source toolkit for online Handwriting
+	  Recognition.
+
+endif
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
new file mode 100644
index 000000000..ea30fdb7c
--- /dev/null
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -0,0 +1,2 @@
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtvirtualkeyboard-opensource-src-5.8.0.tar.xz
+sha256 35fdf5b39d930935b6299ac59f347bea89b983e16bd7961fee3f1b8e16f4e21c  qtvirtualkeyboard-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
new file mode 100644
index 000000000..0d79ee976
--- /dev/null
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -0,0 +1,82 @@
+################################################################################
+#
+# qt5virtualkeyboard
+#
+################################################################################
+
+QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
+QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
+QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-opensource-src-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
+QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
+QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5VIRTUALKEYBOARD_LICENSE = GPLv3
+QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
+else
+QT5VIRTUALKEYBOARD_LICENSE = Commercial license
+QT5VIRTUALKEYBOARD_REDISTRIBUTE = NO
+endif
+
+QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
+ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
+QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
+
+ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
+QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (openwnn)
+QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/openwnn/NOTICE
+endif
+
+ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
+QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (pinyin)
+QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
+endif
+
+ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
+QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 BSD-3c (tcime)
+QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING),y)
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
+QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=handwriting
+QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), MIT (lipi-toolkit)
+QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
+endif
+
+ifdef QT5VIRTUALKEYBOARD_3RDPARTY_PARTS
+define QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS
+	cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr
+endef
+endif
+
+define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake $(QT5VIRTUALKEYBOARD_QMAKEFLAGS))
+endef
+
+define QT5VIRTUALKEYBOARD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/virtualkeyboard $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
+	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS)
+	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
-- 
2.12.1
