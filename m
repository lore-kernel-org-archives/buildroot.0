From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:22:14 +0100
Subject: [Buildroot] [git commit branch/next] Revert
 "package/qt5webkit-examples: remove obsolete package"
Message-ID: <20171129211534.77BC080ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43e1d099b4fca37ce7cbbf3dd41fe4330610b723
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit 940bfe2f4336a3fea1ec6805db1f90ce83bd4a78 with the
following changes:

 - new hashes for 5.6.3 and 5.9.1 (there is no 5.9.2).
 - BR2_PACKAGE_QT5BASE_LICENSE_APPROVED has been removed
 - add GPL-3 to licences
 - uses SPDX identifier for licences
 - add missing dependencies (qt5base, qt5webkit, qt5declarative)
 - removes /usr when qmake host-tools is invoked at configure

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
[Thomas: add entry in the DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  7 ---
 DEVELOPERS                                         |  1 +
 package/qt5/Config.in                              |  1 +
 .../qt5webkit-examples/0001-Build-examples.patch   | 52 +++++++++++++++++++++
 package/qt5/qt5webkit-examples/Config.in           | 10 ++++
 .../qt5/qt5webkit-examples/qt5webkit-examples.hash |  5 ++
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   | 54 ++++++++++++++++++++++
 7 files changed, 123 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c8db9fa..decbace 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1154,13 +1154,6 @@ config BR2_x86_i386
 	  The support for the i386 processors of the x86 architecture
 	  has been removed.
 
-config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
-	bool "qt5webkit-examples package removed"
-	select BR2_LEGACY
-	help
-	  The qt5webkit-examples package has been removed, since it
-	  was removed from upstream starting from Qt 5.6.
-
 config BR2_PACKAGE_QT5QUICK1
 	bool "qt5quick1 package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 4057438..8bd7d85 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -679,6 +679,7 @@ F:	package/zxing-cpp/
 N:	Ga??l Portay <gael.portay@savoirfairelinux.com>
 F:	package/qt5/qt5virtualkeyboard/
 F:	package/qt5/qt5webengine/
+F:	package/qt5/qt5webkit-examples/
 
 N:	Gary Bisson <gary.bisson@boundarydevices.com>
 F:	board/boundarydevices/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 8513c36..0136e11 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -80,6 +80,7 @@ source "package/qt5/qt5virtualkeyboard/Config.in"
 source "package/qt5/qt5wayland/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
+source "package/qt5/qt5webkit-examples/Config.in"
 source "package/qt5/qt5webengine/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
diff --git a/package/qt5/qt5webkit-examples/0001-Build-examples.patch b/package/qt5/qt5webkit-examples/0001-Build-examples.patch
new file mode 100644
index 0000000..6303006
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/0001-Build-examples.patch
@@ -0,0 +1,52 @@
+From 78f558df35860484711a600d155ae7a13ebf44b2 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Tue, 28 Nov 2017 23:14:42 -0500
+Subject: [PATCH 1/1] Build examples
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+This patch improves the qt5webkit examples build for 2 aspects:
+
+	- Allows to build even if qt5base examples are not enabled
+	- Builds xmlpatterns example only if the qt5xmlpattern package
+	has been built
+
+Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
+Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
+[gportay: build imageanalyzer example if concurrent module is built]
+---
+ examples/webkitwidgets/webkitwidgets.pro | 7 ++++---
+ qtwebkit-examples.pro                    | 1 +
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/examples/webkitwidgets/webkitwidgets.pro b/examples/webkitwidgets/webkitwidgets.pro
+index ab20df4..67f6785 100644
+--- a/examples/webkitwidgets/webkitwidgets.pro
++++ b/examples/webkitwidgets/webkitwidgets.pro
+@@ -4,9 +4,10 @@ SUBDIRS +=  domtraversal \
+             previewer \
+             fancybrowser \
+             simpleselector \
+-            imageanalyzer \
+             framecapture \
+             browser \
+             embedded \
+-            scroller \
+-            xmlpatterns
++            scroller
++
++qtHaveModule(xmlpatterns): SUBDIRS += xmlpatterns
++qtHaveModule(concurrent): SUBDIRS += imageanalyzer
+diff --git a/qtwebkit-examples.pro b/qtwebkit-examples.pro
+index 3fcecf1..2ade7ff 100644
+--- a/qtwebkit-examples.pro
++++ b/qtwebkit-examples.pro
+@@ -3,3 +3,4 @@ requires(qtHaveModule(webkit))
+ load(qt_parts)
+ 
+ SUBDIRS += doc
++SUBDIRS += examples
+-- 
+2.15.0
+
diff --git a/package/qt5/qt5webkit-examples/Config.in b/package/qt5/qt5webkit-examples/Config.in
new file mode 100644
index 0000000..47bbcba
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
+	bool "qt5webkit-examples"
+	depends on BR2_PACKAGE_QT5WEBKIT
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package contains examples for the qt5webkit module.
+
+	  http://qt.io
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
new file mode 100644
index 0000000..2af1efb
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -0,0 +1,5 @@
+# Hash from: http://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-examples-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 2d6ce7146298d03b443cca4390bbfee17c4c0b08a31efcbf9fe0732291a6169e qtwebkit-examples-opensource-src-5.6.3.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-examples-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 e4ce4de6b468243abad2baabbe8ddfb05d25b186529bfe88cb8662fc983f54d0 qtwebkit-examples-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
new file mode 100644
index 0000000..59e9248
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# qt5webkit-examples
+#
+################################################################################
+
+# no 5.9.2 package available, fall back to 5.9.1 version
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5WEBKIT_EXAMPLES_VERSION = 5.9.1
+QT5WEBKIT_EXAMPLES_SITE = http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
+else
+QT5WEBKIT_EXAMPLES_VERSION = $(QT5_VERSION)
+QT5WEBKIT_EXAMPLES_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)
+endif
+
+QT5WEBKIT_EXAMPLES_SOURCE = qtwebkit-examples-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
+QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5base qt5webkit
+
+QT5WEBKIT_EXAMPLES_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2 LICENSE.GPLv3
+
+QT5WEBKIT_EXAMPLES_LICENSE = LGPL-2.1 with exception or LGPL-3 or GPL-2 or GPL-3
+# Source files contain references to LGPL_EXCEPTION.txt but it is not included
+# in the archive.
+
+ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
+QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
+endif
+
+define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
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
+QT5WEBKIT_DEPENDENCIES += qt5declarative
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
