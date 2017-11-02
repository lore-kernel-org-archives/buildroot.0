From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Nov 2017 22:01:37 +0100
Subject: [Buildroot] [PATCH v3] qt5: remove Qt Quick dependency on opengl
In-Reply-To: <1509655079-27158-1-git-send-email-joshua.henderson@microchip.com>
References: <1509655079-27158-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20171102210137.GD30054@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua, All,

On 2017-11-02 13:37 -0700, Joshua Henderson spake thusly:
> Qt Quick should no longer depend on opengl, and instead fallback to the limited
> functionality software renderer as a replacement [1] when not available. This
> also pulls in an upstream qt5declarative 5.10 patch [2], replacing an existing
> one, to qt5 5.6.3 and 5.9.2 to fix no-opengl builds.

Arg, no, we do not want to backport the upstream patch to the 5.6.3
branch, because they are not under the same license.

Please keep the one we have for 5.6.3. To avoid this issue in the
future, you may add a comment in its commit log that explains why it is
not an upstream backport.

Regards,
Yann E. MORIN.

> [1] http://blog.qt.io/blog/2016/08/15/the-qt-quick-graphics-stack-in-qt-5-8/
> [2] http://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=fa52bb665d6b
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> ---
> 
> v3:
> - Prefer upstream patch for qt5declarative for 5.9.2 and 5.6.3
> 
> v2:
> - remove opengl dependency on qt5virtualkeyboard
> - move qt5declarative patch from 5.9.1 to 5.9.2
> ---
>  .../5.6.3/0002-Fix-no-opengl-builds.patch          | 29 +++++++++++
>  ...uickviewcomparison-and-quickwidget-needs-.patch | 58 ----------------------
>  .../5.9.2/0001-Fix-no-opengl-builds.patch          | 29 +++++++++++
>  package/qt5/qt5declarative/Config.in               |  6 +--
>  package/qt5/qt5multimedia/qt5multimedia.mk         |  3 +-
>  package/qt5/qt5quickcontrols/Config.in             |  4 +-
>  package/qt5/qt5quickcontrols2/Config.in            |  4 +-
>  package/qt5/qt5virtualkeyboard/Config.in           |  4 +-
>  8 files changed, 69 insertions(+), 68 deletions(-)
>  create mode 100644 package/qt5/qt5declarative/5.6.3/0002-Fix-no-opengl-builds.patch
>  delete mode 100644 package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
>  create mode 100644 package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
> 
> diff --git a/package/qt5/qt5declarative/5.6.3/0002-Fix-no-opengl-builds.patch b/package/qt5/qt5declarative/5.6.3/0002-Fix-no-opengl-builds.patch
> new file mode 100644
> index 0000000..aca93be
> --- /dev/null
> +++ b/package/qt5/qt5declarative/5.6.3/0002-Fix-no-opengl-builds.patch
> @@ -0,0 +1,29 @@
> +From fa52bb665d6beb77a951c14c8edcba3541850afc Mon Sep 17 00:00:00 2001
> +From: Allan Sandfeld Jensen <allan.jensen@qt.io>
> +Date: Mon, 25 Sep 2017 16:53:24 +0200
> +Subject: [PATCH] Fix no-opengl builds
> +
> +The qquickwidgets examples uses OpenGL directly
> +
> +Change-Id: I1cc8cfbcf249abc98473287a9d499032232828c7
> +Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
> +---
> + examples/quick/quick.pro | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
> +index 445dfb0..7da255e 100644
> +--- a/examples/quick/quick.pro
> ++++ b/examples/quick/quick.pro
> +@@ -36,7 +36,7 @@ qtConfig(opengl(es1|es2)?) {
> + # Widget dependent examples
> + qtHaveModule(widgets) {
> +     SUBDIRS += embeddedinwidgets
> +-    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
> ++    qtHaveModule(quickwidgets):qtConfig(opengl(es1|es2)?): SUBDIRS += quickwidgets
> + }
> + 
> + EXAMPLE_FILES = \
> +-- 
> +2.7.4
> +
> diff --git a/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch b/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
> deleted file mode 100644
> index 875634f..0000000
> --- a/package/qt5/qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From b4db5c6cef877b33b5e7cd5a07fe4a7e6797dcfc Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Tue, 16 May 2017 19:47:19 +0200
> -Subject: [PATCH] examples: qquickviewcomparison and quickwidget needs OpenGL
> - support
> -
> -Fixes:
> -
> -  main.cpp:(.text._ZN11QQmlPrivate10createIntoI6FbItemEEvPv[_ZN11QQmlPrivate10createIntoI6FbItemEEvPv]+0x18): undefined reference to `QQuickFramebufferObject::QQuickFramebufferObject(QQuickItem*)'
> -  .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
> -  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED2Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED5Ev]+0x5c): undefined reference to `vtable for QQuickFramebufferObject'
> -  .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
> -  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev]+0x64): undefined reference to `vtable for QQuickFramebufferObject'
> -  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x48): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
> -  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x4c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
> -  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
> -  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
> -  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xbc): undefined reference to `QQuickFramebufferObject::releaseResources()'
> -  .obj/moc_fbitem.o: In function `FbItem::qt_metacast(char const*)':
> -  moc_fbitem.cpp:(.text+0x70): undefined reference to `QQuickFramebufferObject::qt_metacast(char const*)'
> -  .obj/moc_fbitem.o: In function `FbItem::qt_metacall(QMetaObject::Call, int, void**)':
> -  moc_fbitem.cpp:(.text+0x80): undefined reference to `QQuickFramebufferObject::qt_metacall(QMetaObject::Call, int, void**)'
> -  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
> -  moc_fbitem.cpp:(.text._ZN6FbItemD2Ev[_ZN6FbItemD5Ev]+0x38): undefined reference to `vtable for QQuickFramebufferObject'
> -  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
> -  moc_fbitem.cpp:(.text._ZN6FbItemD0Ev[_ZN6FbItemD0Ev]+0x40): undefined reference to `vtable for QQuickFramebufferObject'
> -  .obj/moc_fbitem.o:(.data.rel.ro+0x8): undefined reference to `typeinfo for QQuickFramebufferObject'
> -  .obj/moc_fbitem.o:(.data.rel.ro+0x58): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
> -  .obj/moc_fbitem.o:(.data.rel.ro+0x5c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
> -  .obj/moc_fbitem.o:(.data.rel.ro+0xc4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
> -  .obj/moc_fbitem.o:(.data.rel.ro+0xc8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
> -  .obj/moc_fbitem.o:(.data.rel.ro+0xcc): undefined reference to `QQuickFramebufferObject::releaseResources()'
> -  .obj/moc_fbitem.o:(.data.rel.ro+0xf0): undefined reference to `QQuickFramebufferObject::staticMetaObject'
> -
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - examples/quick/quick.pro | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
> -index 445dfb0fa..26ca0138e 100644
> ---- a/examples/quick/quick.pro
> -+++ b/examples/quick/quick.pro
> -@@ -36,7 +36,10 @@ qtConfig(opengl(es1|es2)?) {
> - # Widget dependent examples
> - qtHaveModule(widgets) {
> -     SUBDIRS += embeddedinwidgets
> --    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
> -+    # OpenGL Support Required
> -+    qtConfig(opengl(es1|es2)?) {
> -+        qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
> -+    }
> - }
> - 
> - EXAMPLE_FILES = \
> --- 
> -2.11.0
> -
> diff --git a/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
> new file mode 100644
> index 0000000..aca93be
> --- /dev/null
> +++ b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
> @@ -0,0 +1,29 @@
> +From fa52bb665d6beb77a951c14c8edcba3541850afc Mon Sep 17 00:00:00 2001
> +From: Allan Sandfeld Jensen <allan.jensen@qt.io>
> +Date: Mon, 25 Sep 2017 16:53:24 +0200
> +Subject: [PATCH] Fix no-opengl builds
> +
> +The qquickwidgets examples uses OpenGL directly
> +
> +Change-Id: I1cc8cfbcf249abc98473287a9d499032232828c7
> +Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
> +---
> + examples/quick/quick.pro | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
> +index 445dfb0..7da255e 100644
> +--- a/examples/quick/quick.pro
> ++++ b/examples/quick/quick.pro
> +@@ -36,7 +36,7 @@ qtConfig(opengl(es1|es2)?) {
> + # Widget dependent examples
> + qtHaveModule(widgets) {
> +     SUBDIRS += embeddedinwidgets
> +-    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
> ++    qtHaveModule(quickwidgets):qtConfig(opengl(es1|es2)?): SUBDIRS += quickwidgets
> + }
> + 
> + EXAMPLE_FILES = \
> +-- 
> +2.7.4
> +
> diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
> index 5384b5f..3a353a8 100644
> --- a/package/qt5/qt5declarative/Config.in
> +++ b/package/qt5/qt5declarative/Config.in
> @@ -17,11 +17,11 @@ config BR2_PACKAGE_QT5DECLARATIVE
>  if BR2_PACKAGE_QT5DECLARATIVE
>  
>  comment "quick module needs an OpenGL-capable backend"
> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
>  
>  config BR2_PACKAGE_QT5DECLARATIVE_QUICK
>  	bool "quick module"
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> -	select BR2_PACKAGE_QT5BASE_OPENGL
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST
> +	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
>  
>  endif
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index 835142e..6df96bc 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -61,7 +61,8 @@ define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
>  endef
>  endif
>  
> -ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
> +# this is only built with quick/opengl support enabled
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5_GL_AVAILABLE),yy)
>  define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
>  	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
>  endef
> diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
> index 3cc5821..59f6ca4 100644
> --- a/package/qt5/qt5quickcontrols/Config.in
> +++ b/package/qt5/qt5quickcontrols/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_QT5QUICKCONTROLS
>  	bool "qt5quickcontrols"
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	select BR2_PACKAGE_QT5DECLARATIVE
>  	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> @@ -14,5 +14,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
>  	  http://doc.qt.io/qt-5/qtquickcontrols-index.html
>  
>  comment "qt5quickcontrols needs an OpenGL-capable backend"
> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
> index 1066b17..d036f74 100644
> --- a/package/qt5/qt5quickcontrols2/Config.in
> +++ b/package/qt5/qt5quickcontrols2/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_QT5QUICKCONTROLS2
>  	bool "qt5quickcontrols2"
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative/quick
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative/quick
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
>  	select BR2_PACKAGE_QT5DECLARATIVE
>  	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
> @@ -16,5 +16,5 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
>  	  https://doc.qt.io/qt-5/qtquickcontrols2-index.html
>  
>  comment "qt5quickcontrols2 needs an OpenGL-capable backend"
> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
> index a685815..f0e4f03 100644
> --- a/package/qt5/qt5virtualkeyboard/Config.in
> +++ b/package/qt5/qt5virtualkeyboard/Config.in
> @@ -1,13 +1,13 @@
>  comment "qt5virtualkeyboard needs at least qt-5.7 and an OpenGL backend"
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> -	depends on !BR2_PACKAGE_QT5_VERSION_LATEST || !BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
>  
>  config BR2_PACKAGE_QT5VIRTUALKEYBOARD
>  	bool "qt5virtualkeyboard"
>  	# needs at least Qt 5.7
>  	depends on BR2_PACKAGE_QT5_VERSION_LATEST
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative quick
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative/quick
>  	select BR2_PACKAGE_QT5DECLARATIVE
>  	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
>  	select BR2_PACKAGE_QT5SVG
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
