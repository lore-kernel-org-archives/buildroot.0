From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 2 Nov 2017 17:01:24 -0700
Subject: [Buildroot] [PATCH v5] qt5: remove Qt Quick dependency on opengl
Message-ID: <1509667284-13771-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt Quick should no longer depend on opengl, and instead fallback to the limited
functionality software renderer as a replacement [1] when not available. This
also pulls in an upstream qt5declarative 5.10 patch [2], replacing an existing
one, to qt5 5.9.2 to fix no-opengl builds.

[1] http://blog.qt.io/blog/2016/08/15/the-qt-quick-graphics-stack-in-qt-5-8/
[2] http://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=fa52bb665d6b

Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

---

v5:
- Add missing signed-off-by and status to backported patch.

v4:
- Don't backport upstream patch to 5.6.3, and instead note in existing patch why.

v3:
- Prefer upstream patch for qt5declarative for 5.9.2 and 5.6.3

v2:
- remove opengl dependency on qt5virtualkeyboard
- move qt5declarative patch from 5.9.1 to 5.9.2
---
 ...uickviewcomparison-and-quickwidget-needs-.patch |  6 +++++
 .../5.9.2/0001-Fix-no-opengl-builds.patch          | 31 ++++++++++++++++++++++
 package/qt5/qt5declarative/Config.in               |  6 ++---
 package/qt5/qt5multimedia/qt5multimedia.mk         |  3 ++-
 package/qt5/qt5quickcontrols/Config.in             |  4 +--
 package/qt5/qt5quickcontrols2/Config.in            |  4 +--
 package/qt5/qt5virtualkeyboard/Config.in           |  4 +--
 7 files changed, 48 insertions(+), 10 deletions(-)
 create mode 100644 package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch

diff --git a/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch b/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
index 875634f..7959d38 100644
--- a/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
+++ b/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
@@ -34,6 +34,12 @@ Fixes:
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
+
+Note:
+An equivalent patch is upstream for qt5declarative 5.10, but it is not suitable for
+backporting to this version due to license differences.
+
+---
  examples/quick/quick.pro | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
diff --git a/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
new file mode 100644
index 0000000..82b6231
--- /dev/null
+++ b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
@@ -0,0 +1,31 @@
+From fa52bb665d6beb77a951c14c8edcba3541850afc Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@qt.io>
+Date: Mon, 25 Sep 2017 16:53:24 +0200
+Subject: [PATCH] Fix no-opengl builds
+
+The qquickwidgets examples uses OpenGL directly
+
+Change-Id: I1cc8cfbcf249abc98473287a9d499032232828c7
+Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
+Upstream-Status: Backport
+Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
+---
+ examples/quick/quick.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
+index 445dfb0..7da255e 100644
+--- a/examples/quick/quick.pro
++++ b/examples/quick/quick.pro
+@@ -36,7 +36,7 @@ qtConfig(opengl(es1|es2)?) {
+ # Widget dependent examples
+ qtHaveModule(widgets) {
+     SUBDIRS += embeddedinwidgets
+-    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
++    qtHaveModule(quickwidgets):qtConfig(opengl(es1|es2)?): SUBDIRS += quickwidgets
+ }
+ 
+ EXAMPLE_FILES = \
+-- 
+2.7.4
+
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 5384b5f..3a353a8 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -17,11 +17,11 @@ config BR2_PACKAGE_QT5DECLARATIVE
 if BR2_PACKAGE_QT5DECLARATIVE
 
 comment "quick module needs an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
 
 config BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	bool "quick module"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
-	select BR2_PACKAGE_QT5BASE_OPENGL
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
 
 endif
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 835142e..6df96bc 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -61,7 +61,8 @@ define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+# this is only built with quick/opengl support enabled
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5_GL_AVAILABLE),yy)
 define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
 endef
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index 3cc5821..59f6ca4 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QT5QUICKCONTROLS
 	bool "qt5quickcontrols"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
@@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	  http://doc.qt.io/qt-5/qtquickcontrols-index.html
 
 comment "qt5quickcontrols needs an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
index 1066b17..d036f74 100644
--- a/package/qt5/qt5quickcontrols2/Config.in
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QT5QUICKCONTROLS2
 	bool "qt5quickcontrols2"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative/quick
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative/quick
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
@@ -16,5 +16,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
 	  https://doc.qt.io/qt-5/qtquickcontrols2-index.html
 
 comment "qt5quickcontrols2 needs an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
index a685815..f0e4f03 100644
--- a/package/qt5/qt5virtualkeyboard/Config.in
+++ b/package/qt5/qt5virtualkeyboard/Config.in
@@ -1,13 +1,13 @@
 comment "qt5virtualkeyboard needs at least qt-5.7 and an OpenGL backend"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_QT5_VERSION_LATEST || !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
 
 config BR2_PACKAGE_QT5VIRTUALKEYBOARD
 	bool "qt5virtualkeyboard"
 	# needs at least Qt 5.7
 	depends on BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative quick
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative/quick
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	select BR2_PACKAGE_QT5SVG
-- 
2.7.4
