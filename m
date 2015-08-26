From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 17:06:18 +0200
Subject: [Buildroot] [PATCH] qt5: disable for static-only builds
Message-ID: <1440601578-6669-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though we have some specific code to support building Qt5 for
static-only configurations, it doesn't work. The first problem is that
our custom qmake.conf always passes -ldl, which makes a number of Qt5
config.tests fail at configure time. Once this problem is fixed by
removing -ldl from QMAKE_LIBS and adding it to QMAKE_LIBS_DYNLOAD
instead, the next problem is that the plugin infrastructure of Qt5
assumes that Linux has dynamic library support: the qlibrary_unix.cpp
file includes <dlfcn.h>, and the only condition for this file to not
be included is:

Until recently, building Qt5 statically was working because our C
library was not built static-only: it provided <dlfcn.h> and
libdl.so. But now that we have a really static only toolchain, Qt5 no
longer builds.

The easiest solution is to simply make Qt5 depend on dynamic library
support.

Fixes:

   http://autobuild.buildroot.net/results/538/538e0325adba9fabbe4ec8e550fbb6a7219f5e7a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in          |  5 +++--
 package/qt5/qt5base/qt5base.mk | 11 ++---------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 3fb65f7..22fd0c0 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -11,15 +11,16 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_ARM_CPU_ARMV4
 	default y
 
-comment "Qt5 needs a toolchain w/ wchar, NPTL, C++"
+comment "Qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
 	depends on !BR2_PACKAGE_QT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_STATIC_LIBS
 	depends on !BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5BASE
 	help
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e80c20c..e783b4d 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -26,7 +26,8 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-iconv \
 	-system-zlib \
 	-system-pcre \
-	-no-pch
+	-no-pch \
+	-shared
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
 QT5BASE_CONFIGURE_OPTS += -debug
@@ -34,14 +35,6 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-QT5BASE_CONFIGURE_OPTS += -static
-else
-# We apparently can't build both the shared and static variants of the
-# library.
-QT5BASE_CONFIGURE_OPTS += -shared
-endif
-
 QT5BASE_CONFIGURE_OPTS += -largefile
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-- 
2.5.0
