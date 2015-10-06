From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue,  6 Oct 2015 13:56:15 +0300
Subject: [Buildroot] [PATCH 1/1] qt: fix build for arm with BR2_STATIC_LIBS
Message-ID: <1444128975-17943-1-git-send-email-alexander.lukichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some Buildroot-generated static toolchains for ARM do not have
dlfcn.h header, which breaks builds of qt-4.8.7 because its
QtCore's plugin loader expects this header to be present (and
dynamic libraries to be supported). For certain platforms without
dynamic libraries, there is a QT_NO_DYNAMIC_LIBRARY constant
defined in plugin loader's source. This patch puts that constant
into Qt's build environment if Buildroot is configured without
shared library support, and prevents plugin loader from defining
it if it has already been defined.

Fixes:
- http://autobuild.buildroot.net/results/11a4c19638ca211bd2a424fd92602166235c9433
- http://autobuild.buildroot.net/results/c056e8781558267f6971a5f017f47e90dcf24e07
- http://autobuild.buildroot.net/results/b8f34afa8686e890a1a3882a52081bb6a3b9c13b
and several others.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
 package/qt/0009-no-dynamic-library-plugins.patch | 27 ++++++++++++++++++++++++
 package/qt/qt.mk                                 |  4 ++++
 2 files changed, 31 insertions(+)
 create mode 100644 package/qt/0009-no-dynamic-library-plugins.patch

diff --git a/package/qt/0009-no-dynamic-library-plugins.patch b/package/qt/0009-no-dynamic-library-plugins.patch
new file mode 100644
index 0000000..3836677
--- /dev/null
+++ b/package/qt/0009-no-dynamic-library-plugins.patch
@@ -0,0 +1,27 @@
+Do not define QT_NO_DYNAMIC_LIBRARY if it is already defined
+
+QtCore plugin loader behaves correctly on platforms that do not support
+dynamic libraries. This is implemented by QT_NO_DYNAMIC_LIBRARY constant
+defined at compile time in the loader's source for specific platforms.
+Since Buildroot does not have a separate platform defined for it in
+mkspecs, if shared libraries are not supported by its configuration, the
+constant is specified in Qt's build environment. This patch prevents
+compilation error in such cases.
+
+Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
+
+diff -uNrp qt-4.8.7.orig/src/corelib/plugin/qlibrary_unix.cpp qt-4.8.7/src/corelib/plugin/qlibrary_unix.cpp
+--- qt-4.8.7.orig/src/corelib/plugin/qlibrary_unix.cpp	2015-05-07 17:14:48.000000000 +0300
++++ qt-4.8.7/src/corelib/plugin/qlibrary_unix.cpp	2015-10-06 08:53:27.189232642 +0300
+@@ -56,9 +56,11 @@
+ #include <string.h>
+ #endif
+ 
++#ifndef QT_NO_DYNAMIC_LIBRARY
+ #if (defined(Q_OS_VXWORKS) && !defined(VXWORKS_RTP)) || defined (Q_OS_NACL)
+ #define QT_NO_DYNAMIC_LIBRARY
+ #endif
++#endif
+ 
+ QT_BEGIN_NAMESPACE
+ 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e0e5d22..a64d32f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -203,6 +203,10 @@ else
 QT_CONFIGURE_OPTS += -static
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+QT_CONFIGURE_OPTS += -D QT_NO_DYNAMIC_LIBRARY
+endif
+
 ifeq ($(BR2_ENDIAN),"LITTLE")
 QT_CONFIGURE_OPTS += -little-endian
 else
-- 
1.8.0.1
