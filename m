From: Massimo Callegari <massimocallegari@yahoo.it>
Date: Wed, 9 Jul 2014 15:15:18 +0100
Subject: [Buildroot] [PATCH 1/1] New package: qt5webkit-examples
Message-ID: <1404915318.71876.YahooMailNeo@web172306.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Amend the previous. There were minor things missing

Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
---
?package/qt5/Config.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ?1 +
?package/qt5/qt5webkit-examples/Config.in ? ? ? ? ? | 10 +++++
?.../qt5webkit-examples-0001-build.patch ? ? ? ? ? ?| 21 ++++++++++
?.../qt5/qt5webkit-examples/qt5webkit-examples.mk ? | 46 ++++++++++++++++++++++
?4 files changed, 78 insertions(+)
?create mode 100644 package/qt5/qt5webkit-examples/Config.in
?create mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
?create mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index efdd9d4..1f6920a 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -40,6 +40,7 @@ source "package/qt5/qt5sensors/Config.in"
?source "package/qt5/qt5serialport/Config.in"
?source "package/qt5/qt5svg/Config.in"
?source "package/qt5/qt5webkit/Config.in"
+source "package/qt5/qt5webkit-examples/Config.in"
?source "package/qt5/qt5websockets/Config.in"
?source "package/qt5/qt5x11extras/Config.in"
?source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5webkit-examples/Config.in b/package/qt5/qt5webkit-examples/Config.in
new file mode 100644
index 0000000..2840733
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
+bool "qt5webkit examples"
+depends on BR2_PACKAGE_QT5WEBKIT
+help
+ ?Qt is a cross-platform application and UI framework for
+ ?developers using C++.
+
+ ?This package corresponds to the qt5webkit examples module.
+
+ ?http://qt-project.org
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch b/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
new file mode 100644
index 0000000..505f40c
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
@@ -0,0 +1,21 @@
+diff -Naur a/examples/webkitwidgets/webkitwidgets.pro b/examples/webkitwidgets/webkitwidgets.pro
+--- a/examples/webkitwidgets/webkitwidgets.pro2014-06-19 12:08:33.000000000 +0200
++++ b/examples/webkitwidgets/webkitwidgets.pro2014-07-09 14:14:20.247975538 +0200
+@@ -8,5 +8,6 @@
+ ? ? ? ? ? ? framecapture \
+ ? ? ? ? ? ? browser \
+ ? ? ? ? ? ? embedded \
+- ? ? ? ? ? ?scroller \
+- ? ? ? ? ? ?xmlpatterns
++ ? ? ? ? ? ?scroller
++ ? ? ? ? ? ?
++qtHaveModule(xmlpatterns): SUBDIRS += xmlpatterns
+diff -Naur a/qtwebkit-examples.pro b/qtwebkit-examples.pro
+--- a/qtwebkit-examples.pro2014-06-19 12:08:33.000000000 +0200
++++ b/qtwebkit-examples.pro2014-07-09 14:14:09.095975663 +0200
+@@ -3,3 +3,4 @@
+ load(qt_parts)
+?
+ SUBDIRS += doc
++SUBDIRS += examples
+
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
new file mode 100644
index 0000000..fd66941
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# qt5webkitexamples
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
+# qt5webkitexamples.
+else
+QT5WEBKIT_EXAMPLES_LICENSE = Commercial license
+QT5WEBKIT_EXAMPLES_REDISTRIBUTE = NO
+endif
+
+define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
+(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5WEBKIT_EXAMPLES_BUILD_CMDS
+$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBKIT_EXAMPLES_INSTALL_STAGING_CMDS
+$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE), y)
+define QT5WEBKIT_EXAMPLES_INSTALL_QML
+ ? ?cp -af $(@D)/examples/webkitqml $(TARGET_DIR)/usr/lib/qt/examples
+endef
+endif
+
+define QT5WEBKIT_EXAMPLES_INSTALL_TARGET_CMDS
+ ? ?cp -af $(@D)/examples/webkitwidgets $(TARGET_DIR)/usr/lib/qt/examples
+ ? ?$(QT5WEBKIT_EXAMPLES_INSTALL_QML)
+endef
+
+$(eval $(generic-package))
--?
1.8.1.2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140709/79ddfc06/attachment.html>
