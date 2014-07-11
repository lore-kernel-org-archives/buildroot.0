From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 11 Jul 2014 14:46:52 +0300
Subject: [Buildroot] [PATCH v3] qt5webkit-examples: new package
Message-ID: <1405079212-25934-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Massimo Callegari <massimocallegari@yahoo.it>

Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>

---
Changes v2 -> v3:
  - improved help text
  - fixed package name in comments
  - added qt5xmlpatterns to _DEPENDENCIES list when selected
  - fixed indentation issues (added missing tabs, removed spaces)
  - added mkdir for the target examples directory
  - passed -dpfr options to cp commands

Changes v1 -> v2:
  - formatted?qt5webkit-examples-0001-build.patch as requested
---
 package/qt5/Config.in                              |  1 +
 package/qt5/qt5webkit-examples/Config.in           | 10 +++++
 .../qt5webkit-examples-0001-build.patch            | 30 +++++++++++++
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   | 51 ++++++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 package/qt5/qt5webkit-examples/Config.in
 create mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
 create mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index efdd9d4..1f6920a 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -40,6 +40,7 @@ source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5webkit/Config.in"
+source "package/qt5/qt5webkit-examples/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5webkit-examples/Config.in b/package/qt5/qt5webkit-examples/Config.in
new file mode 100644
index 0000000..6260f03
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
+	bool "qt5webkit examples"
+	depends on BR2_PACKAGE_QT5WEBKIT
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package contains examples for the qt5webkit module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch b/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
new file mode 100644
index 0000000..68964f0
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
@@ -0,0 +1,30 @@
+This patch improves the qt5webkit examples build for 2 aspects:
+
+# Allows to build even if qt5base examples are not enabled
+# Builds xmlpatterns example only if the qt5xmlpattern package has been built
+
+Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
+
+Index: b/examples/webkitwidgets/webkitwidgets.pro
+===================================================================
+--- /dev/null
++++ b/examples/webkitwidgets/webkitwidgets.pro
+@@ -8,5 +8,6 @@
+             framecapture \
+             browser \
+             embedded \
+-            scroller \
+-            xmlpatterns
++            scroller
++
++qtHaveModule(xmlpatterns): SUBDIRS += xmlpatterns
+Index: b/qtwebkit-examples.pro
+===================================================================
+--- /dev/null
++++ b/qtwebkit-examples.pro
+@@ -3,3 +3,4 @@
+ load(qt_parts)
+ 
+ SUBDIRS += doc
++SUBDIRS += examples
+
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
new file mode 100644
index 0000000..8f9c9f9
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# qt5webkit-examples
+#
+################################################################################
+
+QT5WEBKIT_EXAMPLES_VERSION = $(QT5_VERSION)
+QT5WEBKIT_EXAMPLES_SITE = $(QT5_SITE)
+QT5WEBKIT_EXAMPLES_SOURCE = qtwebkit-examples-opensource-src-$(QT5WEBKIT_EXAMPLES_VERSION).tar.xz
+QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5webkit
+QT5WEBKIT_EXAMPLES_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5WEBKIT_EXAMPLES_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5webkit-examples.
+else
+QT5WEBKIT_EXAMPLES_LICENSE = Commercial license
+QT5WEBKIT_EXAMPLES_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
+QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
+endif
+
+define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5WEBKIT_EXAMPLES_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBKIT_EXAMPLES_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+define QT5WEBKIT_EXAMPLES_INSTALL_QML
+	cp -dpfr $(@D)/examples/webkitqml $(TARGET_DIR)/usr/lib/qt/examples
+endef
+endif
+
+define QT5WEBKIT_EXAMPLES_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib/qt/examples
+	cp -dpfr $(@D)/examples/webkitwidgets $(TARGET_DIR)/usr/lib/qt/examples
+	$(QT5WEBKIT_EXAMPLES_INSTALL_QML)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
