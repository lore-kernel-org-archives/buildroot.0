From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Fri, 14 Feb 2014 12:59:22 +0100
Subject: [Buildroot] [PATCH 1/1] Qt5: add qttools
Message-ID: <1392379162-17980-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---
 package/qt5/Config.in            |  1 +
 package/qt5/qt5tools/Config.in   | 11 +++++++++++
 package/qt5/qt5tools/qt5tools.mk | 41 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/qt5/qt5tools/Config.in
 create mode 100644 package/qt5/qt5tools/qt5tools.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b62a810..1f9af71 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -41,4 +41,5 @@ source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
+source "package/qt5/qt5tools/Config.in"
 endif
diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
new file mode 100644
index 0000000..e4bcadd
--- /dev/null
+++ b/package/qt5/qt5tools/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT5TOOLS
+	bool "qt5tools"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to qttools and builds QtHelp and QtUiTools 
+	  for the target and Linguist's command line tools for the host.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
new file mode 100644
index 0000000..211c078
--- /dev/null
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# qt5tools
+#
+################################################################################
+
+QT5TOOLS_VERSION = $(QT5_VERSION)
+QT5TOOLS_SITE = $(QT5_SITE)
+QT5TOOLS_SOURCE = qttools-opensource-src-$(QT5TOOLS_VERSION).tar.xz
+QT5TOOLS_DEPENDENCIES = qt5base
+QT5TOOLS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5TOOLS_LICENSE = LGPLv2.1 or GPLv3.0
+QT5TOOLS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5TOOLS_LICENSE = Commercial license
+QT5TOOLS_REDISTRIBUTE = NO
+endif
+
+define QT5TOOLS_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5TOOLS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define QT5TOOLS_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Help.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5CLucene.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+$(eval $(generic-package))
-- 
1.8.3.2
