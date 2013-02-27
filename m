From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:26:16 +0100
Subject: [Buildroot] [PATCH 25/30] qt5/qt5jsbackend: new package
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362007582-14753-26-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                    |    1 +
 package/qt5/qt5jsbackend/Config.in       |   10 ++++++++
 package/qt5/qt5jsbackend/qt5jsbackend.mk |   41 ++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/qt5/qt5jsbackend/Config.in
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 3979fa5..8a4ed53 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -16,6 +16,7 @@ menuconfig BR2_PACKAGE_QT5
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
+source "package/qt5/qt5jsbackend/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5jsbackend/Config.in b/package/qt5/qt5jsbackend/Config.in
new file mode 100644
index 0000000..89d5067
--- /dev/null
+++ b/package/qt5/qt5jsbackend/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5JSBACKEND
+	bool "qt5jsbackend"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5jsbackend module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend.mk b/package/qt5/qt5jsbackend/qt5jsbackend.mk
new file mode 100644
index 0000000..74c19be
--- /dev/null
+++ b/package/qt5/qt5jsbackend/qt5jsbackend.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# qt5jsbackend
+#
+#############################################################
+
+QT5JSBACKEND_VERSION = $(QT5_VERSION)
+QT5JSBACKEND_SITE = http://releases.qt-project.org/qt5/$(QT5JSBACKEND_VERSION)/submodules_tar/
+QT5JSBACKEND_SOURCE = qtjsbackend-opensource-src-$(QT5JSBACKEND_VERSION).tar.xz
+QT5JSBACKEND_DEPENDENCIES = qt5base
+QT5JSBACKEND_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5JSBACKEND_CONFIGURE_OPTS += -opensource -confirm-license
+QT5JSBACKEND_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5JSBACKEND_LICENSE = Commercial license
+QT5JSBACKEND_REDISTRIBUTE = NO
+endif
+
+define QT5JSBACKEND_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5JSBACKEND_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5JSBACKEND_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5JSBACKEND_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5V8*.so.* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
