From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Sun,  6 Oct 2013 00:16:36 +0300
Subject: [Buildroot] [PATCH 2/2] qt5base: add an option to build and install
	examples
In-Reply-To: <1381007796-20031-1-git-send-email-fatih.asici@gmail.com>
References: <1381007796-20031-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1381007796-20031-2-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds two patches to fix building of examples when configured with one of
these options:

  * -no-opengl (patch fetched from upstream)
  * -no-gui    (patch sent to upstream)

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5base/Config.in                      |  7 +++
 ...e-build-failure-in-windowcontainer-exampl.patch | 28 ++++++++++
 ...les-Fix-build-when-configured-with-no-gui.patch | 62 ++++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk                     | 18 ++++++-
 4 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 package/qt5/qt5base/qt5base-0006-Fix-possible-build-failure-in-windowcontainer-exampl.patch
 create mode 100644 package/qt5/qt5base/qt5base-0007-examples-Fix-build-when-configured-with-no-gui.patch

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e433373..278966b 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -28,6 +28,13 @@ config BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
 
 	  See also http://qt-project.org/doc/qt-5.0/qtdoc/licensing.html
 
+config BR2_PACKAGE_QT5BASE_EXAMPLES
+	bool "Compile and install examples (with code)"
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_XML
+	help
+	  If unsure, say N.
+
 config BR2_PACKAGE_QT5BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt5/qt5base/qt5base-0006-Fix-possible-build-failure-in-windowcontainer-exampl.patch b/package/qt5/qt5base/qt5base-0006-Fix-possible-build-failure-in-windowcontainer-exampl.patch
new file mode 100644
index 0000000..15c7a3b
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0006-Fix-possible-build-failure-in-windowcontainer-exampl.patch
@@ -0,0 +1,28 @@
+From f6a7092309e81326bf1fced4f8deb15bebcae9f1 Mon Sep 17 00:00:00 2001
+From: Andrew Knight <andrew.knight@digia.com>
+Date: Sat, 31 Aug 2013 16:36:25 +0300
+Subject: [PATCH] Fix possible build failure in windowcontainer example
+
+The windowcontainer example utilzes the openglwindow example, so it
+must also check that OpenGL is available.
+
+Change-Id: I7ecb372cfd533bb56effe7c61ebee9bd53de4c54
+Reviewed-by: Friedemann Kleint <Friedemann.Kleint@digia.com>
+---
+ examples/widgets/widgets.pro | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/widgets/widgets.pro b/examples/widgets/widgets.pro
+index 726494f..d45a805 100644
+--- a/examples/widgets/widgets.pro
++++ b/examples/widgets/widgets.pro
+@@ -22,5 +22,6 @@ SUBDIRS       = \
+                 widgets \
+                 windowcontainer
+ 
++!contains(QT_CONFIG, opengl(es1|es2)?): SUBDIRS -= windowcontainer
+ contains(DEFINES, QT_NO_CURSOR): SUBDIRS -= mainwindows
+ contains(DEFINES, QT_NO_DRAGANDDROP): SUBDIRS -= draganddrop
+-- 
+1.8.4.rc3
+
diff --git a/package/qt5/qt5base/qt5base-0007-examples-Fix-build-when-configured-with-no-gui.patch b/package/qt5/qt5base/qt5base-0007-examples-Fix-build-when-configured-with-no-gui.patch
new file mode 100644
index 0000000..9c5cc25
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0007-examples-Fix-build-when-configured-with-no-gui.patch
@@ -0,0 +1,62 @@
+From 35d2c2018371099fc07fdf3ddda4d37783705411 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
+Date: Sat, 5 Oct 2013 22:57:41 +0300
+Subject: [PATCH] examples: Fix build when configured with -no-gui
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building of examples fails when configured with -no-gui. This patch adds gui
+dependency to the relevant .pro files.
+
+Reported-Upstream: https://bugreports.qt-project.org/browse/QTBUG-33910
+Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
+---
+ examples/gui/gui.pro                   | 2 ++
+ examples/qpa/qpa.pro                   | 2 ++
+ examples/qtconcurrent/qtconcurrent.pro | 1 +
+ examples/threads/threads.pro           | 2 ++
+ 4 files changed, 7 insertions(+)
+
+diff --git a/examples/gui/gui.pro b/examples/gui/gui.pro
+index 8758a1b..5fb4241 100644
+--- a/examples/gui/gui.pro
++++ b/examples/gui/gui.pro
+@@ -1,3 +1,5 @@
++requires(qtHaveModule(gui))
++
+ TEMPLATE     = subdirs
+ CONFIG += no_docs_target
+ 
+diff --git a/examples/qpa/qpa.pro b/examples/qpa/qpa.pro
+index 6f07e50..2729348 100644
+--- a/examples/qpa/qpa.pro
++++ b/examples/qpa/qpa.pro
+@@ -1,2 +1,4 @@
++requires(qtHaveModule(gui))
++
+ TEMPLATE      = subdirs
+ SUBDIRS       = windows
+diff --git a/examples/qtconcurrent/qtconcurrent.pro b/examples/qtconcurrent/qtconcurrent.pro
+index 1df6f2d..5e8c77f 100644
+--- a/examples/qtconcurrent/qtconcurrent.pro
++++ b/examples/qtconcurrent/qtconcurrent.pro
+@@ -1,4 +1,5 @@
+ requires(qtHaveModule(concurrent))
++requires(qtHaveModule(gui))
+ 
+ TEMPLATE      = subdirs
+ SUBDIRS       = imagescaling \
+diff --git a/examples/threads/threads.pro b/examples/threads/threads.pro
+index e47da84..b5cf12a 100644
+--- a/examples/threads/threads.pro
++++ b/examples/threads/threads.pro
+@@ -1,3 +1,5 @@
++requires(qtHaveModule(gui))
++
+ TEMPLATE      = subdirs
+ CONFIG += no_docs_target
+ 
+-- 
+1.8.4.rc3
+
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0106c2c..ebf51c4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -60,6 +60,12 @@ QT5BASE_LICENSE = Commercial license
 QT5BASE_REDISTRIBUTE = NO
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+QT5BASE_CONFIGURE_OPTS += -make examples -compile-examples
+else
+QT5BASE_CONFIGURE_OPTS += -nomake examples
+endif
+
 # Qt5 SQL Plugins
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
@@ -175,8 +181,9 @@ define QT5BASE_CONFIGURE_CMDS
 		-hostprefix $(HOST_DIR)/usr \
 		-sysroot $(STAGING_DIR) \
 		-plugindir /usr/lib/qt/plugins \
+		-examplesdir /usr/lib/qt/examples \
 		-no-rpath \
-		-nomake examples -nomake tests \
+		-nomake tests \
 		-device buildroot \
 		-no-c++11 \
 		$(QT5BASE_CONFIGURE_OPTS) \
@@ -212,15 +219,24 @@ define QT5BASE_INSTALL_TARGET_FONTS
 	fi
 endef
 
+define QT5BASE_INSTALL_TARGET_EXAMPLES
+	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
+		mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
+		cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(TARGET_DIR)/usr/lib/qt/examples ; \
+	fi
+endef
+
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_FONTS)
+	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 else
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_LIBS)
 	$(QT5BASE_INSTALL_TARGET_PLUGINS)
 	$(QT5BASE_INSTALL_TARGET_FONTS)
+	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 endif
 
-- 
1.8.4.rc3
