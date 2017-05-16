From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 23:47:10 +0200
Subject: [Buildroot] [git commit] qt5declarative: fix examples compile
	without OpenGL support
Message-ID: <20170516215233.EC95A802CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b4fc27e1a719d1fa0688e81760531979fb4cb73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

   main.cpp:(.text._ZN11QQmlPrivate10createIntoI6FbItemEEvPv[_ZN11QQmlPrivate10createIntoI6FbItemEEvPv]+0x18): undefined reference to `QQuickFramebufferObject::QQuickFramebufferObject(QQuickItem*)'
   .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
   main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED2Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED5Ev]+0x5c): undefined reference to `vtable for QQuickFramebufferObject'
   .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
   main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev]+0x64): undefined reference to `vtable for QQuickFramebufferObject'
   .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x48): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
   .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x4c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
   .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
   .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
   .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xbc): undefined reference to `QQuickFramebufferObject::releaseResources()'
   .obj/moc_fbitem.o: In function `FbItem::qt_metacast(char const*)':
   moc_fbitem.cpp:(.text+0x70): undefined reference to `QQuickFramebufferObject::qt_metacast(char const*)'
   .obj/moc_fbitem.o: In function `FbItem::qt_metacall(QMetaObject::Call, int, void**)':
   moc_fbitem.cpp:(.text+0x80): undefined reference to `QQuickFramebufferObject::qt_metacall(QMetaObject::Call, int, void**)'
   .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
   moc_fbitem.cpp:(.text._ZN6FbItemD2Ev[_ZN6FbItemD5Ev]+0x38): undefined reference to `vtable for QQuickFramebufferObject'
   .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
   moc_fbitem.cpp:(.text._ZN6FbItemD0Ev[_ZN6FbItemD0Ev]+0x40): undefined reference to `vtable for QQuickFramebufferObject'
   .obj/moc_fbitem.o:(.data.rel.ro+0x8): undefined reference to `typeinfo for QQuickFramebufferObject'
   .obj/moc_fbitem.o:(.data.rel.ro+0x58): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
   .obj/moc_fbitem.o:(.data.rel.ro+0x5c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
   .obj/moc_fbitem.o:(.data.rel.ro+0xc4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
   .obj/moc_fbitem.o:(.data.rel.ro+0xc8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
   .obj/moc_fbitem.o:(.data.rel.ro+0xcc): undefined reference to `QQuickFramebufferObject::releaseResources()'
   .obj/moc_fbitem.o:(.data.rel.ro+0xf0): undefined reference to `QQuickFramebufferObject::staticMetaObject'

[1] http://autobuild.buildroot.net/results/64a/64a198397736db12b73c1f693dbe1c47d73b53da

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uickviewcomparison-and-quickwidget-needs-.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/qt5/qt5declarative/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch b/package/qt5/qt5declarative/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
new file mode 100644
index 0000000..875634f
--- /dev/null
+++ b/package/qt5/qt5declarative/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
@@ -0,0 +1,58 @@
+From b4db5c6cef877b33b5e7cd5a07fe4a7e6797dcfc Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 16 May 2017 19:47:19 +0200
+Subject: [PATCH] examples: qquickviewcomparison and quickwidget needs OpenGL
+ support
+
+Fixes:
+
+  main.cpp:(.text._ZN11QQmlPrivate10createIntoI6FbItemEEvPv[_ZN11QQmlPrivate10createIntoI6FbItemEEvPv]+0x18): undefined reference to `QQuickFramebufferObject::QQuickFramebufferObject(QQuickItem*)'
+  .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
+  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED2Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED5Ev]+0x5c): undefined reference to `vtable for QQuickFramebufferObject'
+  .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
+  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev]+0x64): undefined reference to `vtable for QQuickFramebufferObject'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x48): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x4c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xbc): undefined reference to `QQuickFramebufferObject::releaseResources()'
+  .obj/moc_fbitem.o: In function `FbItem::qt_metacast(char const*)':
+  moc_fbitem.cpp:(.text+0x70): undefined reference to `QQuickFramebufferObject::qt_metacast(char const*)'
+  .obj/moc_fbitem.o: In function `FbItem::qt_metacall(QMetaObject::Call, int, void**)':
+  moc_fbitem.cpp:(.text+0x80): undefined reference to `QQuickFramebufferObject::qt_metacall(QMetaObject::Call, int, void**)'
+  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
+  moc_fbitem.cpp:(.text._ZN6FbItemD2Ev[_ZN6FbItemD5Ev]+0x38): undefined reference to `vtable for QQuickFramebufferObject'
+  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
+  moc_fbitem.cpp:(.text._ZN6FbItemD0Ev[_ZN6FbItemD0Ev]+0x40): undefined reference to `vtable for QQuickFramebufferObject'
+  .obj/moc_fbitem.o:(.data.rel.ro+0x8): undefined reference to `typeinfo for QQuickFramebufferObject'
+  .obj/moc_fbitem.o:(.data.rel.ro+0x58): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
+  .obj/moc_fbitem.o:(.data.rel.ro+0x5c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
+  .obj/moc_fbitem.o:(.data.rel.ro+0xc4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
+  .obj/moc_fbitem.o:(.data.rel.ro+0xc8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
+  .obj/moc_fbitem.o:(.data.rel.ro+0xcc): undefined reference to `QQuickFramebufferObject::releaseResources()'
+  .obj/moc_fbitem.o:(.data.rel.ro+0xf0): undefined reference to `QQuickFramebufferObject::staticMetaObject'
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/quick/quick.pro | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
+index 445dfb0fa..26ca0138e 100644
+--- a/examples/quick/quick.pro
++++ b/examples/quick/quick.pro
+@@ -36,7 +36,10 @@ qtConfig(opengl(es1|es2)?) {
+ # Widget dependent examples
+ qtHaveModule(widgets) {
+     SUBDIRS += embeddedinwidgets
+-    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
++    # OpenGL Support Required
++    qtConfig(opengl(es1|es2)?) {
++        qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
++    }
+ }
+ 
+ EXAMPLE_FILES = \
+-- 
+2.11.0
+
