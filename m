From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  2 Feb 2016 22:59:34 +0100
Subject: [Buildroot] [RFC v1] qt5tools: new package
Message-ID: <1454450374-10677-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First stub for qt5tools package, only linguist host tools lconvert,
lrelease and lupdate done yet.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in              |  1 +
 package/qt5/qt5tools/Config.in     | 19 +++++++++++++
 package/qt5/qt5tools/qt5tools.hash |  4 +++
 package/qt5/qt5tools/qt5tools.mk   | 58 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 package/qt5/qt5tools/Config.in
 create mode 100644 package/qt5/qt5tools/qt5tools.hash
 create mode 100644 package/qt5/qt5tools/qt5tools.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index ad6226e..1c42102 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -42,6 +42,7 @@ source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
+source "package/qt5/qt5tools/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
new file mode 100644
index 0000000..cebff3f
--- /dev/null
+++ b/package/qt5/qt5tools/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_QT5TOOLS
+	bool "qt5tools"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5tools module.
+
+	  http://qt.io
+
+if BR2_PACKAGE_QT5TOOLS
+
+config BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
+	bool "Linguist host tools (lconvert, lrelease, lupdate)"
+	help
+	  This option enables the linguist host tools
+	  lconvert, lrelease and lupdate.
+
+endif
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
new file mode 100644
index 0000000..427dfe7
--- /dev/null
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qttools-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 5b65147187fb7f4456c20ef263f1093709d728f737d6d871a9a5888132fac07d qttools-opensource-src-5.5.0.tar.xz
+sha1   be69ccb338bcc7b397a8b31d7ba0a45fe677390e                         qttools-opensource-src-5.5.0.tar.xz
+md5    2057ef2110b6a1aec260a69e2860a502                                 qttools-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
new file mode 100644
index 0000000..5b99c2e
--- /dev/null
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# qt5tools
+#
+################################################################################
+
+QT5TOOLS_VERSION = $(QT5_VERSION)
+QT5TOOLS_SITE = $(QT5_SITE)
+QT5TOOLS_SOURCE = qttools-opensource-src-$(QT5BASE_VERSION).tar.xz
+
+QT5TOOLS_DEPENDENCIES = qt5base
+QT5TOOLS_INSTALL_STAGING = YES
+
+# linguist tools compile conditionally on qtHaveModule(qmldevtools-private)
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5TOOLS_DEPENDENCIES += qt5declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5TOOLS_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5TOOLS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
+else
+QT5TOOLS_LICENSE = Commercial license
+QT5TOOLS_REDISTRIBUTE = NO
+endif
+
+define QT5TOOLS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5TOOLS_BUILD_CMDS_ALL
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		sub-src-qmake_all
+endef
+
+ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
+define QT5TOOLS_BUILD_CMDS_LINGUIST_TOOLS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist/lconvert
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist/lrelease
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist/lupdate
+endef
+define QT5TOOLS_INSTALL_STAGING_CMDS_LINGUIST_TOOLS
+	cp -dpf $(@D)/bin/lconvert $(STAGING_DIR)/usr/bin
+	cp -dpf $(@D)/bin/lrelease $(STAGING_DIR)/usr/bin
+	cp -dpf $(@D)/bin/lupdate $(STAGING_DIR)/usr/bin
+endef
+endif
+
+define QT5TOOLS_BUILD_CMDS
+	$(QT5TOOLS_BUILD_CMDS_ALL)
+	$(QT5TOOLS_BUILD_CMDS_LINGUIST_TOOLS)
+endef
+
+define QT5TOOLS_INSTALL_STAGING_CMDS
+	$(QT5TOOLS_INSTALL_STAGING_CMDS_LINGUIST_TOOLS)
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
