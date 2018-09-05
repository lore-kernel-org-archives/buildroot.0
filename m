From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  5 Sep 2018 13:07:19 +0200
Subject: [Buildroot] [PATCH] qt5location: fix build failure due to GCC < 5.x
 bug in implicit casts
Message-ID: <20180905110719.31743-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC < 5.x has some bug in implicit casts, this leads to build failure.
In particular QPointer<QGeoMap> in m_map QDeclarativeGeoMap class, when
passed to connect(m_map, ...) should directly cast to m_map.data().

Add reworked patch referred on QTBUG-69512:
https://bugreports.qt.io/browse/QTBUG-69512

Fixes:
http://autobuild.buildroot.org/results/dc5/dc5c354f3aae54b77dad74ad44aca6d12425a457/
http://autobuild.buildroot.org/results/3ab/3ab6f79a36543fa677555bc9ec3500baa46ab0f8/
http://autobuild.buildroot.org/results/8b5/8b5531e44c4f4258c950902b2cd92d1ac8a8491e/
http://autobuild.buildroot.org/results/089/089d03ab14a7c70e465cce891506a082049f2998/
http://autobuild.buildroot.org/results/da8/da87ca470b22d599bb25998af8f25136921f35a7/
http://autobuild.buildroot.org/results/5fe/5fe91fd762c5d4eda01378947b13f7ffc084a8be/
http://autobuild.buildroot.org/results/a84/a84182145122935c8f10105818dbf0e3aa23fd11/
http://autobuild.buildroot.org/results/5b9/5b9106351a04646f42697215ed497e09c62c12fa/
http://autobuild.buildroot.org/results/397/397acc3f5d4998a8d632749ef7d21533c35d501a/
http://autobuild.buildroot.org/results/b18/b186ec0e297d6857a9e0a6a063e476b5049ccf93/
http://autobuild.buildroot.org/results/bf2/bf241beeb1ce10eec99d247cdd331870c08e0ac8/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...tivegeomap-fix-building-with-GCC-5.x.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/qt5/qt5location/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch

diff --git a/package/qt5/qt5location/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch b/package/qt5/qt5location/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
new file mode 100644
index 0000000000..f893c33d50
--- /dev/null
+++ b/package/qt5/qt5location/0001-qdeclarativegeomap-fix-building-with-GCC-5.x.patch
@@ -0,0 +1,48 @@
+From ad78b1a671edac369ede86bff376ec8af2cafbf2 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 5 Sep 2018 12:51:41 +0200
+Subject: [PATCH] qdeclarativegeomap: fix building with GCC < 5.x
+
+With GCC < 5.x implicit casts don't work as expected, in particular
+QPointer<QGeoMap> in m_map QDeclarativeGeoMap class when passed to
+connect(m_map, ...) should directly cast to m_map.data().
+
+Workaround this using connect(m_map.data(), ...).
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ src/location/declarativemaps/qdeclarativegeomap.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/location/declarativemaps/qdeclarativegeomap.cpp b/src/location/declarativemaps/qdeclarativegeomap.cpp
+index 09f9d01c..dc5a32ed 100644
+--- a/src/location/declarativemaps/qdeclarativegeomap.cpp
++++ b/src/location/declarativemaps/qdeclarativegeomap.cpp
+@@ -694,11 +694,11 @@ void QDeclarativeGeoMap::mappingManagerInitialized()
+     QImage copyrightImage;
+     if (!m_initialized && width() > 0 && height() > 0) {
+         QMetaObject::Connection copyrightStringCatcherConnection =
+-                connect(m_map,
++                connect(m_map.data(),
+                         QOverload<const QString &>::of(&QGeoMap::copyrightsChanged),
+                         [&copyrightString](const QString &copy){ copyrightString = copy; });
+         QMetaObject::Connection copyrightImageCatcherConnection =
+-                connect(m_map,
++                connect(m_map.data(),
+                         QOverload<const QImage &>::of(&QGeoMap::copyrightsChanged),
+                         [&copyrightImage](const QImage &copy){ copyrightImage = copy; });
+         m_map->setViewportSize(QSize(width(), height()));
+@@ -719,8 +719,8 @@ void QDeclarativeGeoMap::mappingManagerInitialized()
+         emit m_map->copyrightsChanged(copyrightImage);
+ 
+ 
+-    connect(m_map, &QGeoMap::sgNodeChanged, this, &QQuickItem::update);
+-    connect(m_map, &QGeoMap::cameraCapabilitiesChanged, this, &QDeclarativeGeoMap::onCameraCapabilitiesChanged);
++    connect(m_map.data(), &QGeoMap::sgNodeChanged, this, &QQuickItem::update);
++    connect(m_map.data(), &QGeoMap::cameraCapabilitiesChanged, this, &QDeclarativeGeoMap::onCameraCapabilitiesChanged);
+ 
+     // This prefetches a buffer around the map
+     m_map->prefetchData();
+-- 
+2.17.1
+
-- 
2.17.1
