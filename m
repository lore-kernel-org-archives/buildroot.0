From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 15:45:38 +0100
Subject: [Buildroot] [PATCH v2 07/37] package/qt5declarative: drop 5.6
 support
In-Reply-To: <20200226144608.12529-1-peter@korsgaard.com>
References: <20200226144608.12529-1-peter@korsgaard.com>
Message-ID: <20200226144608.12529-7-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And get rid of the 5.12.7 subdir now that the version selection is gone.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...gtexture-fix-debug-build-with-uclibc.patch |  0
 ...es-photoviewer-needs-widgets-support.patch | 32 ----------
 ...iewcomparison-and-quickwidget-needs-.patch | 64 -------------------
 package/qt5/qt5declarative/Config.in          |  4 --
 .../qt5/qt5declarative/qt5declarative.hash    |  7 --
 package/qt5/qt5declarative/qt5declarative.mk  |  5 --
 6 files changed, 112 deletions(-)
 rename package/qt5/qt5declarative/{5.12.7 => }/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
 delete mode 100644 package/qt5/qt5declarative/5.6.3/0001-examples-photoviewer-needs-widgets-support.patch
 delete mode 100644 package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch

diff --git a/package/qt5/qt5declarative/5.12.7/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.12.7/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/5.6.3/0001-examples-photoviewer-needs-widgets-support.patch b/package/qt5/qt5declarative/5.6.3/0001-examples-photoviewer-needs-widgets-support.patch
deleted file mode 100644
index aeaaa91770..0000000000
--- a/package/qt5/qt5declarative/5.6.3/0001-examples-photoviewer-needs-widgets-support.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b616a7e2a7e03e2eb189dca3dc428c0e19e1652b Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 6 Apr 2017 21:53:40 +0200
-Subject: [PATCH] examples: photoviewer needs widgets support
-
-Fixes:
-
-  .../qt5declarative-5.8.0/examples/quick/demos/photoviewer/photoviewer.pro
-  Project ERROR: Unknown module(s) in QT: widgets
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- examples/quick/demos/demos.pro | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/examples/quick/demos/demos.pro b/examples/quick/demos/demos.pro
-index 0644b81a2..5a6fd52ba 100644
---- a/examples/quick/demos/demos.pro
-+++ b/examples/quick/demos/demos.pro
-@@ -7,5 +7,7 @@ SUBDIRS = samegame \
-             photosurface \
-             stocqt
- 
--qtHaveModule(xmlpatterns): SUBDIRS += rssnews photoviewer
--
-+qtHaveModule(xmlpatterns) {
-+    SUBDIRS += rssnews
-+    qtHaveModule(widgets): SUBDIRS += photoviewer
-+}
--- 
-2.11.0
-
diff --git a/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch b/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
deleted file mode 100644
index 7959d38946..0000000000
--- a/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b4db5c6cef877b33b5e7cd5a07fe4a7e6797dcfc Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 16 May 2017 19:47:19 +0200
-Subject: [PATCH] examples: qquickviewcomparison and quickwidget needs OpenGL
- support
-
-Fixes:
-
-  main.cpp:(.text._ZN11QQmlPrivate10createIntoI6FbItemEEvPv[_ZN11QQmlPrivate10createIntoI6FbItemEEvPv]+0x18): undefined reference to `QQuickFramebufferObject::QQuickFramebufferObject(QQuickItem*)'
-  .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
-  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED2Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED5Ev]+0x5c): undefined reference to `vtable for QQuickFramebufferObject'
-  .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
-  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev]+0x64): undefined reference to `vtable for QQuickFramebufferObject'
-  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x48): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
-  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x4c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
-  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
-  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
-  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xbc): undefined reference to `QQuickFramebufferObject::releaseResources()'
-  .obj/moc_fbitem.o: In function `FbItem::qt_metacast(char const*)':
-  moc_fbitem.cpp:(.text+0x70): undefined reference to `QQuickFramebufferObject::qt_metacast(char const*)'
-  .obj/moc_fbitem.o: In function `FbItem::qt_metacall(QMetaObject::Call, int, void**)':
-  moc_fbitem.cpp:(.text+0x80): undefined reference to `QQuickFramebufferObject::qt_metacall(QMetaObject::Call, int, void**)'
-  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
-  moc_fbitem.cpp:(.text._ZN6FbItemD2Ev[_ZN6FbItemD5Ev]+0x38): undefined reference to `vtable for QQuickFramebufferObject'
-  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
-  moc_fbitem.cpp:(.text._ZN6FbItemD0Ev[_ZN6FbItemD0Ev]+0x40): undefined reference to `vtable for QQuickFramebufferObject'
-  .obj/moc_fbitem.o:(.data.rel.ro+0x8): undefined reference to `typeinfo for QQuickFramebufferObject'
-  .obj/moc_fbitem.o:(.data.rel.ro+0x58): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
-  .obj/moc_fbitem.o:(.data.rel.ro+0x5c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
-  .obj/moc_fbitem.o:(.data.rel.ro+0xc4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
-  .obj/moc_fbitem.o:(.data.rel.ro+0xc8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
-  .obj/moc_fbitem.o:(.data.rel.ro+0xcc): undefined reference to `QQuickFramebufferObject::releaseResources()'
-  .obj/moc_fbitem.o:(.data.rel.ro+0xf0): undefined reference to `QQuickFramebufferObject::staticMetaObject'
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
-
-Note:
-An equivalent patch is upstream for qt5declarative 5.10, but it is not suitable for
-backporting to this version due to license differences.
-
----
- examples/quick/quick.pro | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
-index 445dfb0fa..26ca0138e 100644
---- a/examples/quick/quick.pro
-+++ b/examples/quick/quick.pro
-@@ -36,7 +36,10 @@ qtConfig(opengl(es1|es2)?) {
- # Widget dependent examples
- qtHaveModule(widgets) {
-     SUBDIRS += embeddedinwidgets
--    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
-+    # OpenGL Support Required
-+    qtConfig(opengl(es1|es2)?) {
-+        qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
-+    }
- }
- 
- EXAMPLE_FILES = \
--- 
-2.11.0
-
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 3a353a8326..32ea8f0d0c 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -16,12 +16,8 @@ config BR2_PACKAGE_QT5DECLARATIVE
 
 if BR2_PACKAGE_QT5DECLARATIVE
 
-comment "quick module needs an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
-
 config BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	bool "quick module"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST
 	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
 
 endif
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 71e9cb2118..85e99082f3 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtdeclarative-everywhere-src-5.12.7.tar.xz.sha256
 sha256 5cdc05a035f240ab73b6b37dd3831c1350cd80e5799da47929974085f6eae9bd qtdeclarative-everywhere-src-5.12.7.tar.xz
 
@@ -10,7 +7,3 @@ sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.
 sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 6210611961..e9b86701bb 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -10,13 +10,8 @@ QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5DECLARAT
 QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
-else
-QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 define QT5DECLARATIVE_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-- 
2.20.1
