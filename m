From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:12:01 +0100
Subject: [Buildroot] [git commit] qt5: remove Qt Quick dependency on opengl
Message-ID: <20171201221830.7BA2580FBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eb43c83c10aa9cd5cdf2302af0682b3d9978ecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt Quick should no longer depend on opengl, and instead fallback to
the limited functionality software renderer as a replacement [1] when
not available.

[1] http://blog.qt.io/blog/2016/08/15/the-qt-quick-graphics-stack-in-qt-5-8/

Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Tested-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: drop qt5declarative patch, since we have bumped to 5.9.3,
which contains the patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch | 6 ++++++
 package/qt5/qt5declarative/Config.in                                | 6 +++---
 package/qt5/qt5multimedia/qt5multimedia.mk                          | 3 ++-
 package/qt5/qt5quickcontrols/Config.in                              | 4 ++--
 package/qt5/qt5quickcontrols2/Config.in                             | 4 ++--
 package/qt5/qt5virtualkeyboard/Config.in                            | 4 ++--
 6 files changed, 17 insertions(+), 10 deletions(-)

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
