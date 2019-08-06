From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  6 Aug 2019 07:04:45 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/stellarium: new package
Message-ID: <20190806050445.23088-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: do not select optional dependencies (Thomas)
    added third upstream patch to fix gpsd-3.19 build
    added note about opengl dependency (Thomas)
    - opengl es build is broken:
      stellarium-0.19.1/src/core/Dithering.hpp:48:36:
        error: 'GL_RED' was not declared in this scope

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...iling-with-GPSD-3.19-API-8.0-fix-733.patch | 36 +++++++++++++++++
 .../0002-A-tiny-fix-for-previous-commit.patch | 29 ++++++++++++++
 ...-get-Spherical-Position-Error-issue-.patch | 39 +++++++++++++++++++
 package/stellarium/Config.in                  | 25 ++++++++++++
 package/stellarium/stellarium.hash            |  6 +++
 package/stellarium/stellarium.mk              | 38 ++++++++++++++++++
 8 files changed, 175 insertions(+)
 create mode 100644 package/stellarium/0001-Fixed-compiling-with-GPSD-3.19-API-8.0-fix-733.patch
 create mode 100644 package/stellarium/0002-A-tiny-fix-for-previous-commit.patch
 create mode 100644 package/stellarium/0003-Comment-code-for-get-Spherical-Position-Error-issue-.patch
 create mode 100644 package/stellarium/Config.in
 create mode 100644 package/stellarium/stellarium.hash
 create mode 100644 package/stellarium/stellarium.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ca0ef2cafe..acdb3bc2da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -410,6 +410,7 @@ F:	package/samba4/
 F:	package/softether/
 F:	package/spandsp/
 F:	package/sqlite/
+F:	package/stellarium/
 F:	package/taglib/
 F:	package/tinyxml2/
 F:	package/tor/
diff --git a/package/Config.in b/package/Config.in
index cd40e8fba2..4b7796d9c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -284,6 +284,7 @@ comment "Graphic applications"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/stellarium/Config.in"
 	source "package/tesseract-ocr/Config.in"
 
 comment "Graphic libraries"
diff --git a/package/stellarium/0001-Fixed-compiling-with-GPSD-3.19-API-8.0-fix-733.patch b/package/stellarium/0001-Fixed-compiling-with-GPSD-3.19-API-8.0-fix-733.patch
new file mode 100644
index 0000000000..55c40ea2f4
--- /dev/null
+++ b/package/stellarium/0001-Fixed-compiling-with-GPSD-3.19-API-8.0-fix-733.patch
@@ -0,0 +1,36 @@
+From ce26d740db94a2ee4e88595cba0ea9c4cbde2dcb Mon Sep 17 00:00:00 2001
+From: Alexander Wolf <alex.v.wolf@gmail.com>
+Date: Sun, 4 Aug 2019 22:33:46 +0700
+Subject: [PATCH] Fixed compiling with GPSD 3.19 (API 8.0; fix #733)
+
+Downloaded from upstream commit
+https://github.com/Stellarium/stellarium/commit/ce26d740db94a2ee4e88595cba0ea9c4cbde2dcb
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/core/StelLocationMgr.cpp | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/core/StelLocationMgr.cpp b/src/core/StelLocationMgr.cpp
+index c62bd868cd..20eddc8a61 100644
+--- a/src/core/StelLocationMgr.cpp
++++ b/src/core/StelLocationMgr.cpp
+@@ -163,7 +163,15 @@ void LibGPSLookupHelper::query()
+ 				qDebug() << " - xdop:" << dop.xdop << "ydop:" << dop.ydop;
+ 				qDebug() << " - pdop:" << dop.pdop << "hdop:" << dop.hdop;
+ 				qDebug() << " - vdop:" << dop.vdop << "tdop:" << dop.tdop << "gdop:" << dop.gdop;
++				// GPSD API 8.0:
++				// * Remove epe from gps_data_t, it duplicates gps_fix_t eph
++				// * Added sep (estimated spherical error, 3D)
++				// Details: https://github.com/Stellarium/stellarium/issues/733
++				#if GPSD_API_MAJOR_VERSION >= 8
++				qDebug() << "Spherical Position Error (sep):" << newdata->sep;
++				#else
+ 				qDebug() << "Spherical Position Error (epe):" << newdata->epe;
++				#endif
+ 			}
+ 			loc.longitude=newdata->fix.longitude;
+ 			loc.latitude=newdata->fix.latitude;
+-- 
+2.20.1
+
diff --git a/package/stellarium/0002-A-tiny-fix-for-previous-commit.patch b/package/stellarium/0002-A-tiny-fix-for-previous-commit.patch
new file mode 100644
index 0000000000..c4ed7785a9
--- /dev/null
+++ b/package/stellarium/0002-A-tiny-fix-for-previous-commit.patch
@@ -0,0 +1,29 @@
+From 29336f899dec12d7583efb513e1477d4cfc9a621 Mon Sep 17 00:00:00 2001
+From: Alexander Wolf <alex.v.wolf@gmail.com>
+Date: Sun, 4 Aug 2019 22:51:52 +0700
+Subject: [PATCH] A tiny fix for previous commit
+
+Downloaded from upstream commit
+https://github.com/Stellarium/stellarium/commit/29336f899dec12d7583efb513e1477d4cfc9a621
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/core/StelLocationMgr.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/StelLocationMgr.cpp b/src/core/StelLocationMgr.cpp
+index 20eddc8a61..3c1b5fe4e4 100644
+--- a/src/core/StelLocationMgr.cpp
++++ b/src/core/StelLocationMgr.cpp
+@@ -168,7 +168,7 @@ void LibGPSLookupHelper::query()
+ 				// * Added sep (estimated spherical error, 3D)
+ 				// Details: https://github.com/Stellarium/stellarium/issues/733
+ 				#if GPSD_API_MAJOR_VERSION >= 8
+-				qDebug() << "Spherical Position Error (sep):" << newdata->sep;
++				qDebug() << "Spherical Position Error (sep):" << newdata->fix.sep;
+ 				#else
+ 				qDebug() << "Spherical Position Error (epe):" << newdata->epe;
+ 				#endif
+-- 
+2.20.1
+
diff --git a/package/stellarium/0003-Comment-code-for-get-Spherical-Position-Error-issue-.patch b/package/stellarium/0003-Comment-code-for-get-Spherical-Position-Error-issue-.patch
new file mode 100644
index 0000000000..10e57cd836
--- /dev/null
+++ b/package/stellarium/0003-Comment-code-for-get-Spherical-Position-Error-issue-.patch
@@ -0,0 +1,39 @@
+From 4b6c37bc4631244ecf4126d256d3c33e81bde656 Mon Sep 17 00:00:00 2001
+From: Alexander Wolf <alex.v.wolf@gmail.com>
+Date: Sun, 4 Aug 2019 23:19:54 +0700
+Subject: [PATCH] Comment code for get Spherical Position Error (issue
+ #733)
+
+Downloaded from upstream commit
+https://github.com/Stellarium/stellarium/commit/4b6c37bc4631244ecf4126d256d3c33e81bde656
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/core/StelLocationMgr.cpp | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/core/StelLocationMgr.cpp b/src/core/StelLocationMgr.cpp
+index 3c1b5fe4e4..72d27b897f 100644
+--- a/src/core/StelLocationMgr.cpp
++++ b/src/core/StelLocationMgr.cpp
+@@ -167,11 +167,12 @@ void LibGPSLookupHelper::query()
+ 				// * Remove epe from gps_data_t, it duplicates gps_fix_t eph
+ 				// * Added sep (estimated spherical error, 3D)
+ 				// Details: https://github.com/Stellarium/stellarium/issues/733
+-				#if GPSD_API_MAJOR_VERSION >= 8
+-				qDebug() << "Spherical Position Error (sep):" << newdata->fix.sep;
+-				#else
+-				qDebug() << "Spherical Position Error (epe):" << newdata->epe;
+-				#endif
++				// #if GPSD_API_MAJOR_VERSION >= 8
++				// qDebug() << "Spherical Position Error (sep):" << newdata->fix.sep;
++				// #else
++				// qDebug() << "Spherical Position Error (epe):" << newdata->epe;
++				// #endif
++
+ 			}
+ 			loc.longitude=newdata->fix.longitude;
+ 			loc.latitude=newdata->fix.latitude;
+-- 
+2.20.1
+
diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
new file mode 100644
index 0000000000..782976cb1a
--- /dev/null
+++ b/package/stellarium/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_STELLARIUM
+	bool "stellarium"
+	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_HAS_LIBGL # does not support OpenGL ES
+	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_OPENGL
+	select BR2_PACKAGE_QT5BASE_PRINTSUPPORT
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5LOCATION
+	select BR2_PACKAGE_QT5MULTIMEDIA
+	select BR2_PACKAGE_ZLIB
+	help
+	  Stellarium is a free open source planetarium for your
+	  computer. It shows a realistic sky in 3D, just like what
+	  you see with the naked eye, binoculars or a telescope.
+
+	  https://stellarium.org
+
+comment "stellarium needs an OpenGL provider"
+	depends on BR2_PACKAGE_QT5
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || \
+		!BR2_PACKAGE_HAS_LIBGL
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
new file mode 100644
index 0000000000..f016463d1a
--- /dev/null
+++ b/package/stellarium/stellarium.hash
@@ -0,0 +1,6 @@
+# From https://github.com/Stellarium/stellarium/releases
+md5 a1a81b600822c5d85661b4dbe9d9bbcb  stellarium-0.19.1.tar.gz
+sha1 ff344208d71e9f66bb3b893acf7d92358bed1760  stellarium-0.19.1.tar.gz
+# Locally computed
+sha256 0f25ad2acb59b75a49568c82123219aed5a14252c2ef39d0444540057d2cfb68  stellarium-0.19.1.tar.gz
+sha256 3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
new file mode 100644
index 0000000000..779355520c
--- /dev/null
+++ b/package/stellarium/stellarium.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# stellarium
+#
+################################################################################
+
+STELLARIUM_VERSION = 0.19.1
+STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
+STELLARIUM_LICENSE = GPL-2.0+
+STELLARIUM_LICENSE_FILES = COPYING
+STELLARIUM_DEPENDENCIES = \
+	qt5base \
+	qt5location \
+	qt5multimedia \
+	zlib
+STELLARIUM_CONF_OPTS = \
+	-DENABLE_MEDIA=ON \
+	-DENABLE_NLS=OFF \
+	-DUSE_SYSTEM_ZLIB=ON
+
+ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
+STELLARIUM_DEPENDENCIES += qt5script
+STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=ON
+else
+STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
+STELLARIUM_DEPENDENCIES += qt5serialport
+ifeq ($(BR2_PACKAGE_GPSD),y)
+STELLARIUM_DEPENDENCIES += gpsd
+endif
+STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
+else
+STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.20.1
