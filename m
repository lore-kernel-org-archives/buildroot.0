From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 26 Dec 2014 14:06:42 +0200
Subject: [Buildroot] [PATCH 3/4] qt5: bump to version 5.4.0
In-Reply-To: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
References: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1419595603-15591-3-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5base:
  - Add patches to fix uClibc build.
  - Remove -no-c++11 option since qt5connectivity needs some C++11
    features.

qt5declarative:
  - Remove the line that installs accessible plugin. The functionality
    is moved into the qtquick library.

qt5webkit:
  - Remove egl patch. This should be fixed with CONFIG += egl option.

qt5websockets:
  - Remove upstreamed patch.

Changelogs: https://qt-project.org/wiki/Change-files-in-Qt-5.4.0
Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5.mk                                 |  4 +-
 ...lify-use-of-__has_include-in-qlogging.cpp.patch | 54 ++++++++++++++++++++++
 .../0002-logging-Fix-build-with-uClibc.patch       | 30 ++++++++++++
 package/qt5/qt5base/Config.in                      |  5 +-
 package/qt5/qt5base/qt5base.hash                   |  8 ++--
 package/qt5/qt5base/qt5base.mk                     |  5 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |  8 ++--
 package/qt5/qt5connectivity/qt5connectivity.mk     |  4 +-
 package/qt5/qt5declarative/qt5declarative.hash     |  8 ++--
 package/qt5/qt5declarative/qt5declarative.mk       |  5 +-
 package/qt5/qt5enginio/qt5enginio.hash             |  8 ++--
 package/qt5/qt5enginio/qt5enginio.mk               |  4 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  8 ++--
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  8 ++--
 package/qt5/qt5imageformats/qt5imageformats.mk     |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  8 ++--
 package/qt5/qt5multimedia/qt5multimedia.mk         |  4 +-
 package/qt5/qt5quick1/qt5quick1.hash               |  8 ++--
 package/qt5/qt5quick1/qt5quick1.mk                 |  4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  8 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  4 +-
 package/qt5/qt5script/qt5script.hash               |  8 ++--
 package/qt5/qt5script/qt5script.mk                 |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  8 ++--
 package/qt5/qt5sensors/qt5sensors.mk               |  4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |  8 ++--
 package/qt5/qt5serialport/qt5serialport.mk         |  4 +-
 package/qt5/qt5svg/qt5svg.hash                     |  8 ++--
 package/qt5/qt5svg/qt5svg.mk                       |  4 +-
 .../qt5/qt5webkit-examples/qt5webkit-examples.hash |  8 ++--
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   |  8 ++--
 package/qt5/qt5webkit/0001-egl-includepath.patch   | 40 ----------------
 package/qt5/qt5webkit/qt5webkit.hash               |  8 ++--
 package/qt5/qt5webkit/qt5webkit.mk                 | 10 ++--
 ...01-Remove-dependency-on-unused-sql-module.patch | 28 -----------
 package/qt5/qt5websockets/qt5websockets.hash       |  8 ++--
 package/qt5/qt5websockets/qt5websockets.mk         |  6 ++-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  8 ++--
 package/qt5/qt5x11extras/qt5x11extras.mk           |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  8 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  4 +-
 42 files changed, 205 insertions(+), 186 deletions(-)
 create mode 100644 package/qt5/qt5base/0001-Simplify-use-of-__has_include-in-qlogging.cpp.patch
 create mode 100644 package/qt5/qt5base/0002-logging-Fix-build-with-uClibc.patch
 delete mode 100644 package/qt5/qt5webkit/0001-egl-includepath.patch
 delete mode 100644 package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 2a3e274..72aca14 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
-QT5_VERSION_MAJOR = 5.3
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
+QT5_VERSION_MAJOR = 5.4
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
 QT5_SITE = http://download.qt-project.org/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt5base/0001-Simplify-use-of-__has_include-in-qlogging.cpp.patch b/package/qt5/qt5base/0001-Simplify-use-of-__has_include-in-qlogging.cpp.patch
new file mode 100644
index 0000000..d54ef79
--- /dev/null
+++ b/package/qt5/qt5base/0001-Simplify-use-of-__has_include-in-qlogging.cpp.patch
@@ -0,0 +1,54 @@
+0002-logging-Fix-build-with-uClibc.patch depends on this upstream patch.
+
+Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
+
+From d1d3c36e876464a9bae42565f086ded268ab5118 Mon Sep 17 00:00:00 2001
+From: Thiago Macieira <thiago.macieira@intel.com>
+Date: Wed, 17 Dec 2014 20:24:04 -0800
+Subject: [PATCH] Simplify use of __has_include in qlogging.cpp
+
+Easier to just #define it to 0
+
+Change-Id: Ife99fdca6564077762fa67c6d7a5becaf48655d8
+Reviewed-by: Olivier Goffart <ogoffart@woboq.com>
+---
+ src/corelib/global/qlogging.cpp | 21 +++++++++------------
+ 1 file changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/src/corelib/global/qlogging.cpp b/src/corelib/global/qlogging.cpp
+index 0271573..50d35a6 100644
+--- a/src/corelib/global/qlogging.cpp
++++ b/src/corelib/global/qlogging.cpp
+@@ -72,20 +72,17 @@
+ # include "private/qcore_unix_p.h"
+ #endif
+ 
+-#if !defined QT_NO_REGULAREXPRESSION && !defined(QT_BOOTSTRAPPED)
+-#ifdef __has_include
+-#if __has_include(<cxxabi.h>) && __has_include(<execinfo.h>)
+-#define QLOGGING_HAVE_BACKTRACE
+-#endif
+-#elif defined(__GLIBCXX__) && defined(__GLIBC__) // (because older version of gcc don't have __has_include)
+-#define QLOGGING_HAVE_BACKTRACE
++#ifndef __has_include
++#  define __has_include(x) 0
+ #endif
+ 
+-#ifdef QLOGGING_HAVE_BACKTRACE
+-#include <qregularexpression.h>
+-#include <cxxabi.h>
+-#include <execinfo.h>
+-#endif
++#if !defined QT_NO_REGULAREXPRESSION && !defined(QT_BOOTSTRAPPED)
++#  if (defined(__GLIBC__) && defined(__GLIBCXX__)) || (__has_include(<cxxabi.h>) && __has_include(<execinfo.h>))
++#    define QLOGGING_HAVE_BACKTRACE
++#    include <qregularexpression.h>
++#    include <cxxabi.h>
++#    include <execinfo.h>
++#  endif
+ #endif
+ 
+ #include <stdio.h>
+-- 
+1.9.1
+
diff --git a/package/qt5/qt5base/0002-logging-Fix-build-with-uClibc.patch b/package/qt5/qt5base/0002-logging-Fix-build-with-uClibc.patch
new file mode 100644
index 0000000..e9df8ee
--- /dev/null
+++ b/package/qt5/qt5base/0002-logging-Fix-build-with-uClibc.patch
@@ -0,0 +1,30 @@
+From b6f994133e8d98884f43f336cb4a2525aeade0af Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
+Date: Wed, 24 Dec 2014 17:29:11 +0200
+Subject: [PATCH 2/2] logging: Fix build with uClibc
+
+execinfo.h is not provided by uClibc.
+
+Change-Id: Ie28be85b0b70472df1fc4a208581bb66ad34229e
+Sent-Upstream: https://codereview.qt-project.org/#/c/102628/
+Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
+---
+ src/corelib/global/qlogging.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/corelib/global/qlogging.cpp b/src/corelib/global/qlogging.cpp
+index 50d35a6..70d0c88 100644
+--- a/src/corelib/global/qlogging.cpp
++++ b/src/corelib/global/qlogging.cpp
+@@ -77,7 +77,7 @@
+ #endif
+ 
+ #if !defined QT_NO_REGULAREXPRESSION && !defined(QT_BOOTSTRAPPED)
+-#  if (defined(__GLIBC__) && defined(__GLIBCXX__)) || (__has_include(<cxxabi.h>) && __has_include(<execinfo.h>))
++#  if (defined(__GLIBC__) && defined(__GLIBCXX__) && !defined(__UCLIBC__)) || (__has_include(<cxxabi.h>) && __has_include(<execinfo.h>))
+ #    define QLOGGING_HAVE_BACKTRACE
+ #    include <qregularexpression.h>
+ #    include <cxxabi.h>
+-- 
+1.9.1
+
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 30f9a49..59fc4e0 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -24,10 +24,9 @@ config BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
 	  By doing this you will not be asked while the library is compiled.
 	  Please read and understand the license terms before approving this.
 
-	  LGPL v2.1: http://qt-project.org/doc/qt-5.0/qtdoc/lgpl.html
-	  GPL  v3.0: http://qt-project.org/doc/qt-5.0/qtdoc/gpl.html
+	  LGPL: http://doc.qt.io/qt-5/lgpl.html
 
-	  See also http://qt-project.org/doc/qt-5.0/qtdoc/licensing.html
+	  See also http://doc.qt.io/qt-5/licensing.html
 
 config BR2_PACKAGE_QT5BASE_EXAMPLES
 	bool "Compile and install examples (with code)"
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 9aad1a9..b91b0a9 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtbase-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8 qtbase-opensource-src-5.3.2.tar.xz
-sha1   faf4f33aa7e8dabcdcdf5f10824263beebbccd96                         qtbase-opensource-src-5.3.2.tar.xz
-md5    563e2b10274171f1184b3fd7260b4991                                 qtbase-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtbase-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 daea240ba5e77bc2d78ec21a2cb664eed83b3d4ad409b6277a6f7d4c0c8e91d1 qtbase-opensource-src-5.4.0.tar.xz
+sha1   2e3d32f32e36a92782ca66c260940824746900bd                         qtbase-opensource-src-5.4.0.tar.xz
+md5    eaaa72a5cb25713ca8d17f3a8d149765                                 qtbase-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a36359d..aaf4da0 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -50,8 +50,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
-QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0
-QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5BASE_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5BASE_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5BASE_LICENSE = Commercial license
 QT5BASE_REDISTRIBUTE = NO
@@ -195,7 +195,6 @@ define QT5BASE_CONFIGURE_CMDS
 		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
 		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
-		-no-c++11 \
 		$(QT5BASE_CONFIGURE_OPTS) \
 	)
 endef
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 652e92c..c165b8c 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtconnectivity-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 2eb972b85697e9752ed2f2f7e194393650743737a9fe5f48177734c4dbd9096f qtconnectivity-opensource-src-5.3.2.tar.xz
-sha1   a8c4a48078fd0137a0d00c01e11eb356db20e1bb                         qtconnectivity-opensource-src-5.3.2.tar.xz
-md5    e496963407bb0c7b2e6c07133715a9cf                                 qtconnectivity-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtconnectivity-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 636685bbcccac28f6c8c2d1bee7c9b06a74bc5c11d9c87a424d80093f19b1038 qtconnectivity-opensource-src-5.4.0.tar.xz
+sha1   08b1e365195cf0ed2d35d5f7fb3d6bda9a9e1dbe                         qtconnectivity-opensource-src-5.4.0.tar.xz
+md5    c1fc247771a2fd1d238db8ffc4e65bbf                                 qtconnectivity-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index e601270..fa07d93 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -11,8 +11,8 @@ QT5CONNECTIVITY_DEPENDENCIES = bluez_utils qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5CONNECTIVITY_LICENSE = LGPLv2.1 or GPLv3.0
-QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5CONNECTIVITY_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5CONNECTIVITY_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5CONNECTIVITY_LICENSE = Commercial license
 QT5CONNECTIVITY_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 38e1d51..23dfb59 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtdeclarative-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 04108193b9642c0394c157e98b5c1d81f555f9f495289e07ebfb6f03448b2382 qtdeclarative-opensource-src-5.3.2.tar.xz
-sha1   595ce2eabd771ae2ead968220f9d8e1ff14fafa8                         qtdeclarative-opensource-src-5.3.2.tar.xz
-md5    72ae60527ebb15f4b85cfbadc4c174de                                 qtdeclarative-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtdeclarative-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 e67c9275b0f6869a7c1e8023ad7c0a23fb19f8a8d2f350371e954ead0cfad7b6 qtdeclarative-opensource-src-5.4.0.tar.xz
+sha1   12c12d50c71cfb1f18c7fabfabe4ad4b364b09fe                         qtdeclarative-opensource-src-5.4.0.tar.xz
+md5    4f928e52e72b5e867b50b4d409d5e99b                                 qtdeclarative-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 1928801..30c0813 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -11,8 +11,8 @@ QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5DECLARATIVE_LICENSE = LGPLv2.1 or GPLv3.0
-QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5DECLARATIVE_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5DECLARATIVE_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5DECLARATIVE_LICENSE = Commercial license
 QT5DECLARATIVE_REDISTRIBUTE = NO
@@ -39,7 +39,6 @@ ifeq ($(BR2_STATIC_LIBS),)
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5DECLARATIVE_INSTALL_TARGET_QUICK_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/accessible $(TARGET_DIR)/usr/lib/qt/plugins
 endef
 endif
 
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index fa0864e..a9d4ab8 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtenginio-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 d5b84656dc6a349db380e42690a18137e562dbaba1930216bb3e3815df6af708 qtenginio-opensource-src-5.3.2.tar.xz
-sha1   78e9c8ea929365449364a613b06ad066d243b80b                         qtenginio-opensource-src-5.3.2.tar.xz
-md5    53b67cf5470dfa9bcfc59aa5b8bfd66d                                 qtenginio-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtenginio-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 fa0954e5f100d38291fd3b3c8c92ade11710b25ae48018af7451c631982d924c qtenginio-opensource-src-5.4.0.tar.xz
+sha1   ec754e21ee461f9a41d66343fb24dcaa358a4a05                         qtenginio-opensource-src-5.4.0.tar.xz
+md5    959a9ebac4faa0464368a318fa677ab6                                 qtenginio-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 36b499b..2a6aa3c 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -11,8 +11,8 @@ QT5ENGINIO_DEPENDENCIES = openssl qt5base
 QT5ENGINIO_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5ENGINIO_LICENSE = LGPLv2.1 or GPLv3.0
-QT5ENGINIO_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5ENGINIO_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5ENGINIO_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5ENGINIO_LICENSE = Commercial license
 QT5ENGINIO_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index b37e6fc..1d4f338 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtgraphicaleffects-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 688f2658a13d2919487d3f5acacb037364ee5c8fe0319f524a7d0a4987ba7ffc qtgraphicaleffects-opensource-src-5.3.2.tar.xz
-sha1   08929b31a8c70e465d7f10f80e6004b29c275cc0                         qtgraphicaleffects-opensource-src-5.3.2.tar.xz
-md5    6dd8dd6906bbfb52a292cd25927bb9a8                                 qtgraphicaleffects-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtgraphicaleffects-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 a43f10e532180eb8400fec65752b36c1adaa9aaf672146035ef630d324a38b19 qtgraphicaleffects-opensource-src-5.4.0.tar.xz
+sha1   b83755ae9457d7a43691e6668a7f7330ff373bdf                         qtgraphicaleffects-opensource-src-5.4.0.tar.xz
+md5    4d26d56c55b0117c37d96e85755da6a4                                 qtgraphicaleffects-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 2c3f66a..2dc2e71 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -11,8 +11,8 @@ QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5GRAPHICALEFFECTS_LICENSE = LGPLv2.1 or GPLv3.0
-QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5GRAPHICALEFFECTS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5GRAPHICALEFFECTS_LICENSE = Commercial license
 QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 8465b6b..9ab0106 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtimageformats-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 d303cbceb73774edc0cfdbde6b97b0e41077e242ff6520710890f81bea40e2d4 qtimageformats-opensource-src-5.3.2.tar.xz
-sha1   4b8068f4f958d0c637b86638219c006990ae0efa                         qtimageformats-opensource-src-5.3.2.tar.xz
-md5    255bb7f28c667ab91303e6af271753b5                                 qtimageformats-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtimageformats-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 c89b678df71e44f8cff7b5f8362b7d61430a7aa7cd70147be1267d87ac8fe046 qtimageformats-opensource-src-5.4.0.tar.xz
+sha1   6590b61c51a186837c3d2058d8192886d970f92a                         qtimageformats-opensource-src-5.4.0.tar.xz
+md5    608dbe53d5d3a0872eb20025b681d1dc                                 qtimageformats-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 4126f9f..0703db0 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -11,8 +11,8 @@ QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5IMAGEFORMATS_LICENSE = LGPLv2.1 or GPLv3.0
-QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5IMAGEFORMATS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5IMAGEFORMATS_LICENSE = Commercial license
 QT5IMAGEFORMATS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 51fe0a0..6193492 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtmultimedia-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 255fac66c93f33743c707da3d41d95c7c562924fe4eb829cbb7b21b2274a0e0b qtmultimedia-opensource-src-5.3.2.tar.xz
-sha1   9cd5936d1c0d6768bc0af1ad766f2aa02efe1865                         qtmultimedia-opensource-src-5.3.2.tar.xz
-md5    5ef68e85b9d32865a4bf7f491ff31f96                                 qtmultimedia-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtmultimedia-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 5ab9dba27ae64123f2d0124b6884da276d8982aa959d65aa44125f758ef9af51 qtmultimedia-opensource-src-5.4.0.tar.xz
+sha1   a66fe5538f554957f60fc160121a3b0e7e72753b                         qtmultimedia-opensource-src-5.4.0.tar.xz
+md5    3a6a415813b54a54cf283a5e2906e012                                 qtmultimedia-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 4588f48..0c8d2ec 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -11,8 +11,8 @@ QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5MULTIMEDIA_LICENSE = LGPLv2.1 or GPLv3.0
-QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5MULTIMEDIA_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5MULTIMEDIA_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5quick1/qt5quick1.hash b/package/qt5/qt5quick1/qt5quick1.hash
index d6c6e0c..a51b7ec 100644
--- a/package/qt5/qt5quick1/qt5quick1.hash
+++ b/package/qt5/qt5quick1/qt5quick1.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtquick1-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 9b7b2e895180e4e3e1ed4e7b5ad049b7d021a05c96be6edc5fc433c6de6273fb qtquick1-opensource-src-5.3.2.tar.xz
-sha1   9da9b39fc391e52ab7061607f53e7b8cbc99050b                         qtquick1-opensource-src-5.3.2.tar.xz
-md5    3a57c52d6d4d6632d67a4ebd35abe0c5                                 qtquick1-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtquick1-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 d5a8b77c1c4832383f3c5a39c6dc60e992e61e684e7fbbdf9a208c31d9d032dc qtquick1-opensource-src-5.4.0.tar.xz
+sha1   d4af107f1227f111b7a65924d2ce5e3c08c7ee20                         qtquick1-opensource-src-5.4.0.tar.xz
+md5    c1c5b1072137773d308c8b498cf35d05                                 qtquick1-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index e9d7a64..7ccf644 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -12,8 +12,8 @@ QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script \
 QT5QUICK1_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5QUICK1_LICENSE = LGPLv2.1 or GPLv3.0
-QT5QUICK1_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5QUICK1_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5QUICK1_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5QUICK1_LICENSE = Commercial license
 QT5QUICK1_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 07f4e2b..ad81f7e 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtquickcontrols-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 5f890f014d087141b0aaa8954b21b1f85740233b60a556e0e9624227bff6d94e qtquickcontrols-opensource-src-5.3.2.tar.xz
-sha1   db761fa235253f4eac3d2c0fce734ffa667d739a                         qtquickcontrols-opensource-src-5.3.2.tar.xz
-md5    05f490fd6a7d3bca0c4d4a59989daef0                                 qtquickcontrols-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtquickcontrols-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 b59f43333291c3e73f9a9f92706a4c98d4d810b4efd6803a4edd3f1658fae61e qtquickcontrols-opensource-src-5.4.0.tar.xz
+sha1   1d8dd4a0b1c69e14805c59d4676c8406c65a4114                         qtquickcontrols-opensource-src-5.4.0.tar.xz
+md5    6d2b408526b6197ff2edc32ac3238252                                 qtquickcontrols-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 5f284fb..4aeca5b 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -11,8 +11,8 @@ QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5QUICKCONTROLS_LICENSE = LGPLv2.1 or GPLv3.0
-QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5QUICKCONTROLS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5QUICKCONTROLS_LICENSE = Commercial license
 QT5QUICKCONTROLS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index a98877c..ae2aea6 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtscript-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 6e18002c8c993402c7d28b3c0705092e41c18769b6d3ff741e9a3b3ce9d6d7be qtscript-opensource-src-5.3.2.tar.xz
-sha1   a5c8167a4de3b5765d75692755009839a9f0c218                         qtscript-opensource-src-5.3.2.tar.xz
-md5    d0e70adf7c993f33bad27290dae778d5                                 qtscript-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtscript-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 f5f35702ec36f24b17878348af1aa1ecf93056a9ddf475097b3fdd52c3330ed0 qtscript-opensource-src-5.4.0.tar.xz
+sha1   7ca8d6ccbc97fb24a9e76b69eeaa5e7e9c321955                         qtscript-opensource-src-5.4.0.tar.xz
+md5    b38b35643d85aea25ff1cbea84f76a82                                 qtscript-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 18067fd..7f0efbb 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -11,8 +11,8 @@ QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SCRIPT_LICENSE = LGPLv2.1 or GPLv3.0
-QT5SCRIPT_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5SCRIPT_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5SCRIPT_LICENSE = Commercial license
 QT5SCRIPT_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index c8ea98b..e703945 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtsensors-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 f9359dc42fbd7105eec7a1fb866e90aa772fd694075e5a5691d1a31d08953ae4 qtsensors-opensource-src-5.3.2.tar.xz
-sha1   de5099d494b6f898831f316eee90654f5e96ba22                         qtsensors-opensource-src-5.3.2.tar.xz
-md5    d0a8dc3173bfc9dc9f2632d509a76e6f                                 qtsensors-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtsensors-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 8a0f33ccf572b9fbcdc46fca602d75270979a2f851b6a1f399d039b1f7aae159 qtsensors-opensource-src-5.4.0.tar.xz
+sha1   5fe798541707acfe7a4955076a0d27d8d58f4d15                         qtsensors-opensource-src-5.4.0.tar.xz
+md5    044f7d3f92c45dd76072077826ca4a07                                 qtsensors-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 2f6e567..522dd8a 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -11,8 +11,8 @@ QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SENSORS_LICENSE = LGPLv2.1 or GPLv3.0
-QT5SENSORS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5SENSORS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5SENSORS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5SENSORS_LICENSE = Commercial license
 QT5SENSORS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 1713b17..c99670d 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtserialport-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 a886e0cb08be60e57958676dc91c6f649468184a03c89c2aeabc904d36fd5a4b qtserialport-opensource-src-5.3.2.tar.xz
-sha1   f886713b9471846508680531d4bb9c392d21d317                         qtserialport-opensource-src-5.3.2.tar.xz
-md5    0a38cfe5c81364f2b93d0d38b94d375f                                 qtserialport-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtserialport-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 0fc619ef714f5b920ff19ec811b6459c849fafcc697ef4091dbb74e45bd058c3 qtserialport-opensource-src-5.4.0.tar.xz
+sha1   ccfc39045d803405ec36bcfdbf281417dd96663a                         qtserialport-opensource-src-5.4.0.tar.xz
+md5    691b0b71e4ad791a37e288b41979662c                                 qtserialport-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 9648ee2..14cbf32 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -11,8 +11,8 @@ QT5SERIALPORT_DEPENDENCIES = qt5base
 QT5SERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SERIALPORT_LICENSE = LGPLv2.1 or GPLv3.0
-QT5SERIALPORT_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5SERIALPORT_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5SERIALPORT_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5SERIALPORT_LICENSE = Commercial license
 QT5SERIALPORT_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index e735ff4..f5412be 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtsvg-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 1ec5c2f307ee55740cc8c82dc2ca4037dbc0ca398b4e32abbd967535e71ae30f qtsvg-opensource-src-5.3.2.tar.xz
-sha1   11740b39d22842214c7b4c555faee5a7da84575e                         qtsvg-opensource-src-5.3.2.tar.xz
-md5    f7972e80970ff26a908c43defb3d10e6                                 qtsvg-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtsvg-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 68ee762bacc7b63aea29f446549ee6daae46e6fe2120e2460f30d47accc2b789 qtsvg-opensource-src-5.4.0.tar.xz
+sha1   b49d9974dd83c82887a076f9093250cb9fcceea7                         qtsvg-opensource-src-5.4.0.tar.xz
+md5    1c9921a44060bd98096b105c97556e68                                 qtsvg-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 8f28540..8aaa517 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -11,8 +11,8 @@ QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SVG_LICENSE = LGPLv2.1 or GPLv3.0
-QT5SVG_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5SVG_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5SVG_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5SVG_LICENSE = Commercial license
 QT5SVG_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
index 4f38903..9061b4e 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtwebkit-examples-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 c8081a0863b7d8e2e39ec0e2fe288331ddab093a682959ba7378392512296482 qtwebkit-examples-opensource-src-5.3.2.tar.xz
-sha1   18272c83652dcadbce5b75999bbadc64cbad7691                         qtwebkit-examples-opensource-src-5.3.2.tar.xz
-md5    6f88c2a99002801a1943483331f8b4f0                                 qtwebkit-examples-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtwebkit-examples-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 b02a2f3d381e66e83fbf972416ad376e2a03ccfa8b4371867c83970bf0f0e9f6 qtwebkit-examples-opensource-src-5.4.0.tar.xz
+sha1   5c03fb53826f22891739b8d537257070aef7e07a                         qtwebkit-examples-opensource-src-5.4.0.tar.xz
+md5    369617a40e64b93686cebd12a99916c0                                 qtwebkit-examples-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index b3b9fbe..b687ac7 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -10,10 +10,10 @@ QT5WEBKIT_EXAMPLES_SOURCE = qtwebkit-examples-opensource-src-$(QT5WEBKIT_EXAMPLE
 QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5webkit
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBKIT_EXAMPLES_LICENSE = LGPLv2.1 or GPLv3.0
-# Here we would like to get license files from qt5base, but qt5base
-# may not be extracted at the time we get the legal-info for
-# qt5webkit-examples.
+QT5WEBKIT_EXAMPLES_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+# Source files contain references to LGPL_EXCEPTION.txt but it is not included
+# in the archive.
+QT5WEBKIT_EXAMPLES_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5WEBKIT_EXAMPLES_LICENSE = Commercial license
 QT5WEBKIT_EXAMPLES_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5webkit/0001-egl-includepath.patch b/package/qt5/qt5webkit/0001-egl-includepath.patch
deleted file mode 100644
index de5bcff..0000000
--- a/package/qt5/qt5webkit/0001-egl-includepath.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d6b1b33a12c0cf6c52667afafe34e58a7b00d0d8 Mon Sep 17 00:00:00 2001
-From: Floris Bos <bos@je-eigen-domein.nl>
-Date: Thu, 7 Mar 2013 19:25:17 +0100
-Subject: [PATCH] Webcore: add EGL and OpenGL (ES) INCDIR to INCLUDEPATH
-
-When building with 3D graphics support enabled, add the
-OpenGL (ES) and EGL include directories to the include path.
-
-Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
----
- Source/WebCore/Target.pri |    4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Source/WebCore/Target.pri b/Source/WebCore/Target.pri
-index 2669748..421a849 100644
---- a/Source/WebCore/Target.pri
-+++ b/Source/WebCore/Target.pri
-@@ -3992,15 +3992,19 @@ use?(3D_GRAPHICS) {
- 
-     contains(QT_CONFIG, opengl) | contains(QT_CONFIG, opengles2) {
-         !contains(QT_CONFIG, opengles2) {
-+            INCLUDEPATH += $$QMAKE_INCDIR_OPENGL
-             SOURCES += \
-                platform/graphics/opengl/GraphicsContext3DOpenGL.cpp \
-                platform/graphics/opengl/Extensions3DOpenGL.cpp
-         } else {
-+            INCLUDEPATH += $$QMAKE_INCDIR_OPENGL_ES2
-             SOURCES += \
-                platform/graphics/opengl/GraphicsContext3DOpenGLES.cpp \
-                platform/graphics/opengl/Extensions3DOpenGLES.cpp
-         }
- 
-+        !isEmpty(QMAKE_INCDIR_EGL): INCLUDEPATH += $$QMAKE_INCDIR_EGL
-+
-         HEADERS += platform/graphics/opengl/Extensions3DOpenGL.h
- 
-         SOURCES += \
--- 
-1.7.10.4
-
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 6aeda9e..ac5c444 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtwebkit-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 e47122ed15e8e1cc32e11b3cd89bacc056437215134a204899f2fddb4fd92e5b qtwebkit-opensource-src-5.3.2.tar.xz
-sha1   5ac040cd1fbf953ff9abc0502489bff8f4aa5ac2                         qtwebkit-opensource-src-5.3.2.tar.xz
-md5    0497b5b46540848e0db6a9e219d756fb                                 qtwebkit-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtwebkit-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 6c672207765d5d2e88aa14b72b3876ad7bce453397a02e1a3d6e4670a8d188c1 qtwebkit-opensource-src-5.4.0.tar.xz
+sha1   e5e92e126bb673dadc329bc726c21bf4f994d829                         qtwebkit-opensource-src-5.4.0.tar.xz
+md5    e62d72c410dffe5129043f80f624c896                                 qtwebkit-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index c103a9c..75ad1bf 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -10,13 +10,17 @@ QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison host-flex
 QT5WEBKIT_INSTALL_STAGING = YES
 
+QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
+
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBKIT_LICENSE = LGPLv2+, MIT
+QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), LGPLv2.1 with exception or LGPLv3 or GPLv2
+# Source files contain references to LGPL_EXCEPTION.txt but it is not included
+# in the archive.
+QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
 else
-QT5WEBKIT_LICENSE = LGPLv2+, MIT, Commercial license
+QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), Commercial license
 QT5WEBKIT_REDISTRIBUTE = NO
 endif
-QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1 Source/WebKit/LICENSE
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
diff --git a/package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch b/package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch
deleted file mode 100644
index 34a0649..0000000
--- a/package/qt5/qt5websockets/qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c6b4e9f6609b91e56301bde39be48fc65fcfb916 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
-Date: Tue, 20 May 2014 16:15:43 +0300
-Subject: [PATCH] Remove dependency on unused sql module
-
-Sent-Upstream: https://codereview.qt-project.org/85844
-Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
-Change-Id: I102bcb81ec53d022480e81a3632b93d42bf33403
----
- src/websockets/websockets.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/websockets/websockets.pro b/src/websockets/websockets.pro
-index 99e84b6..5b5ff78 100644
---- a/src/websockets/websockets.pro
-+++ b/src/websockets/websockets.pro
-@@ -1,7 +1,7 @@
- load(qt_build_config)
- TARGET = QtWebSockets
- 
--QT = core network core-private sql
-+QT = core network core-private
- 
- TEMPLATE = lib
- 
--- 
-1.9.1
-
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 6402567..352be50 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtwebsockets-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 60533d413b0fa27b1e08642ae77bcaa76a845fa39ddc3d49af573a77e73a38c2 qtwebsockets-opensource-src-5.3.2.tar.xz
-sha1   8c043ee895a4f7bb1f3e6e35c3e835e803f8385f                         qtwebsockets-opensource-src-5.3.2.tar.xz
-md5    093ddc113952e47bd0e251986e03f1e4                                 qtwebsockets-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtwebsockets-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 2acd274a4a983cdd2288678d9005429fded51b5277d0621c4a953fa4f4f4cbdf qtwebsockets-opensource-src-5.4.0.tar.xz
+sha1   d0b7e62bbdd634de01d5321f94a4bdff8b228cf5                         qtwebsockets-opensource-src-5.4.0.tar.xz
+md5    0c406bca48296d0d99cc93b00f40aca7                                 qtwebsockets-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index e3c4cf3..2b257e1 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -11,8 +11,10 @@ QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBSOCKETS_LICENSE = LGPLv2.1
-QT5WEBSOCKETS_LICENSE_FILES = LICENSE
+QT5WEBSOCKETS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+# Source files contain references to LGPL_EXCEPTION.txt but it is not included
+# in the archive.
+QT5WEBSOCKETS_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5WEBSOCKETS_LICENSE = Commercial license
 QT5WEBSOCKETS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 64f50e7..a6de3e7 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtx11extras-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 ca6a28c95be0bf18080b4a20ae9e2c24a77a45aaf557f06047e65b1280c17251 qtx11extras-opensource-src-5.3.2.tar.xz
-sha1   f019cc60b226a45f50d07bb7c3a753620d62e2b4                         qtx11extras-opensource-src-5.3.2.tar.xz
-md5    59f6cbbdf2ad48c6b95b65f8b333df2d                                 qtx11extras-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtx11extras-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 a3c66bc9e2b877109073f27bbc7865489fa1ed548584f5fc87c371380dc1474c qtx11extras-opensource-src-5.4.0.tar.xz
+sha1   999026cf8389c66af22ffb29767b87b1a793595b                         qtx11extras-opensource-src-5.4.0.tar.xz
+md5    f3a7b9b20dd5f19fc5ed12ef030c59b7                                 qtx11extras-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 1528e88..280379a 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -11,8 +11,8 @@ QT5X11EXTRAS_DEPENDENCIES = qt5base
 QT5X11EXTRAS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5X11EXTRAS_LICENSE = LGPLv2.1 or GPLv3.0
-QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5X11EXTRAS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5X11EXTRAS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5X11EXTRAS_LICENSE = Commercial license
 QT5X11EXTRAS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 68cd9f7..0ca8dac 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtxmlpatterns-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 acab0307039e117475caf2c95e425ead09ab5ee08ce15205fb3c0af7d7ec1abb qtxmlpatterns-opensource-src-5.3.2.tar.xz
-sha1   d7c5f3dee97d68ec7274ba349d0a9e531aaf111f                         qtxmlpatterns-opensource-src-5.3.2.tar.xz
-md5    857e8040b2bf45c114a7d75ec6ef94ee                                 qtxmlpatterns-opensource-src-5.3.2.tar.xz
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtxmlpatterns-opensource-src-5.4.0.tar.xz.mirrorlist
+sha256 791c697b9bc7a5384e3d0dbec56af7f2194fe7dc91f8b1e0fd502089135e5425 qtxmlpatterns-opensource-src-5.4.0.tar.xz
+sha1   e6d08bca4186b8c10e669836e5f6133ad59c9cce                         qtxmlpatterns-opensource-src-5.4.0.tar.xz
+md5    5ad30d6b478d4e5d71e9c5bef3f3fbf7                                 qtxmlpatterns-opensource-src-5.4.0.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 9f29aa2..b69cac7 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -11,8 +11,8 @@ QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5XMLPATTERNS_LICENSE = LGPLv2.1 or GPLv3.0
-QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5XMLPATTERNS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5XMLPATTERNS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
 else
 QT5XMLPATTERNS_LICENSE = Commercial license
 QT5XMLPATTERNS_REDISTRIBUTE = NO
-- 
1.9.1
