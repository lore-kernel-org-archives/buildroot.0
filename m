From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:26:13 +0100
Subject: [Buildroot] [PATCH 22/30] qt5/qt5script: new package
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362007582-14753-23-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in              |    1 +
 package/qt5/qt5script/Config.in    |   10 +++++++++
 package/qt5/qt5script/qt5script.mk |   41 ++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/qt5/qt5script/Config.in
 create mode 100644 package/qt5/qt5script/qt5script.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f4d2b45..3f303e2 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -15,5 +15,6 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
+source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 endif
diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
new file mode 100644
index 0000000..3c5d60c
--- /dev/null
+++ b/package/qt5/qt5script/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5SCRIPT
+	bool "qt5script"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5script module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
new file mode 100644
index 0000000..a009402
--- /dev/null
+++ b/package/qt5/qt5script/qt5script.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# qt5script
+#
+#############################################################
+
+QT5SCRIPT_VERSION = $(QT5_VERSION)
+QT5SCRIPT_SITE = http://releases.qt-project.org/qt5/$(QT5SCRIPT_VERSION)/submodules_tar/
+QT5SCRIPT_SOURCE = qtscript-opensource-src-$(QT5SCRIPT_VERSION).tar.xz
+QT5SCRIPT_DEPENDENCIES = qt5base
+QT5SCRIPT_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5SCRIPT_CONFIGURE_OPTS += -opensource -confirm-license
+QT5SCRIPT_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5SCRIPT_LICENSE = Commercial license
+QT5SCRIPT_REDISTRIBUTE = NO
+endif
+
+define QT5SCRIPT_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5SCRIPT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5SCRIPT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5SCRIPT_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Script*.so.* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
