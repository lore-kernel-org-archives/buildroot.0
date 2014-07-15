From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:40:13 +0200
Subject: [Buildroot] [git commit] qt5webkit-examples: new package
Message-ID: <20140715204035.8C4359D24B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=762b14713e21214c4ed43af684888edb821f6a0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: remove QT5WEBKIT_EXAMPLES_INSTALL_STAGING = YES.]

Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                              |    1 +
 package/qt5/qt5webkit-examples/Config.in           |   10 ++++
 .../qt5webkit-examples-0001-build.patch            |   30 ++++++++++++
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   |   50 ++++++++++++++++++++
 4 files changed, 91 insertions(+), 0 deletions(-)

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
index 0000000..b3b9fbe
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -0,0 +1,50 @@
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
