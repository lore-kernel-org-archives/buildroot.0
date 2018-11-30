From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 30 Nov 2018 01:20:16 +0100
Subject: [Buildroot] [PATCH 1/1] qt5declarative: fix debug build with uclibc
Message-ID: <20181130002016.7440-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Debug build of qsgtexture fails on uclibc since version 5.11 and
https://github.com/qt/qtdeclarative/commit/7c507eaac3f848f92f2ebdafe8ded4a064d68351:

scenegraph/util/qsgtexture.cpp:69:22: fatal error: execinfo.h: No such file or directory
 #include <execinfo.h>

Indeed, !defined(__UCLIBC__) has been replaced by defined(__GBLIBC__) to
fix build on musl but as a result, build fails on uclibc because uclibc
also defines __GLIBC__ (and it does not have execinfo like musl)

This error is raised only when building in debug mode because
CAN_BACKTRACE_EXECINFO is undefined if QT_NO_DEBUG is set

So keep defined(__GLIBC__), but put back !defined(__UCLIBC__)

Fixes:
 - http://autobuild.buildroot.org/results/6fce0ce5aea943e097532efbbc8d1e28f41e5866

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-qsgtexture-fix-debug-build-with-uclibc.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/qt5/qt5declarative/5.11.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch

diff --git a/package/qt5/qt5declarative/5.11.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.11.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
new file mode 100644
index 0000000000..1c0f6eccc5
--- /dev/null
+++ b/package/qt5/qt5declarative/5.11.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
@@ -0,0 +1,45 @@
+From 2a5711651bee9d021733da19126a71aeda45e646 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 29 Nov 2018 23:33:10 +0100
+Subject: [PATCH] qsgtexture: fix debug build with uclibc
+
+Debug build of gsgtexture fails on uclibc since version 5.11 and
+https://github.com/qt/qtdeclarative/commit/7c507eaac3f848f92f2ebdafe8ded4a064d68351:
+
+scenegraph/util/qsgtexture.cpp:69:22: fatal error: execinfo.h: No such file or directory
+ #include <execinfo.h>
+
+Indeed, !defined(__UCLIBC__) has been replaced by defined(__GBLIBC__) to
+fix build on musl but as a result, build fails on uclibc because uclibc
+also defines __GLIBC__ (and it does not have execinfo like musl)
+
+This error is raised only when building in debug mode because
+CAN_BACKTRACE_EXECINFO is undefined if QT_NO_DEBUG is set
+
+So keep defined(__GLIBC__), but put back !defined(__UCLIBC__)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6fce0ce5aea943e097532efbbc8d1e28f41e5866
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/qt/qtdeclarative/pull/4]
+---
+ src/quick/scenegraph/util/qsgtexture.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/quick/scenegraph/util/qsgtexture.cpp b/src/quick/scenegraph/util/qsgtexture.cpp
+index fea92a512..a26191006 100644
+--- a/src/quick/scenegraph/util/qsgtexture.cpp
++++ b/src/quick/scenegraph/util/qsgtexture.cpp
+@@ -53,7 +53,7 @@
+ #endif
+ #include <private/qsgmaterialshader_p.h>
+ 
+-#if defined(Q_OS_LINUX) && !defined(Q_OS_ANDROID) && defined(__GLIBC__)
++#if defined(Q_OS_LINUX) && !defined(Q_OS_ANDROID) && defined(__GLIBC__) && !defined(__UCLIBC__)
+ #define CAN_BACKTRACE_EXECINFO
+ #endif
+ 
+-- 
+2.14.1
+
-- 
2.14.1
