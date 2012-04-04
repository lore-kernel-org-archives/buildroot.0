From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Apr 2012 20:53:26 +0200
Subject: [Buildroot] [git commit] qt: bump version
Message-ID: <20120404185408.CE14B969F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=738b0b055513f559811bf545cf26f539d1edf422
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt-configure.patch          |   16 ++++++++++------
 package/qt/qt-pthread_getattr_np.patch |   24 +++++++++++++++---------
 package/qt/qt.mk                       |    2 +-
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/package/qt/qt-configure.patch b/package/qt/qt-configure.patch
index cef53e3..07c9630 100644
--- a/package/qt/qt-configure.patch
+++ b/package/qt/qt-configure.patch
@@ -17,13 +17,17 @@ in the $(STAGING_DIR) and on the target remains the same.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: qt-4.7.2/configure
-===================================================================
---- qt-4.7.2.orig/configure	2011-03-31 22:28:16.530647168 +0200
-+++ qt-4.7.2/configure	2011-03-31 22:29:38.908081695 +0200
-@@ -4456,15 +4456,15 @@
-
+---
+ configure |   18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
 
+Index: qt-everywhere-opensource-src-4.8.1/configure
+===================================================================
+--- qt-everywhere-opensource-src-4.8.1.orig/configure
++++ qt-everywhere-opensource-src-4.8.1/configure
+@@ -4661,15 +4661,15 @@
+ 
+ 
  if [ ! -z "$QT_HOST_PREFIX" ]; then
 -    HOSTPREFIX_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_prfxpath=$QT_HOST_PREFIX"`
 -    HOSTDOCUMENTATION_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_docspath=$QT_HOST_PREFIX/doc"`
diff --git a/package/qt/qt-pthread_getattr_np.patch b/package/qt/qt-pthread_getattr_np.patch
index 4b20bb2..28f0c84 100644
--- a/package/qt/qt-pthread_getattr_np.patch
+++ b/package/qt/qt-pthread_getattr_np.patch
@@ -3,9 +3,15 @@ Add pthred_getattr_np / phread_attr_getstrack alternatives for uClibc
 Based on https://dev.openwrt.org/log/packages/Xorg/lib/qt4/patches/100-fix-webkit-for-uclibc.patch?rev=20371
 
 Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
---- qt-everywhere-opensource-src-4.6.2/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp	2010-02-11 16:55:20.000000000 +0100
-+++ qt-everywhere-opensource-src-4.6.2JS/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp	2010-05-23 10:49:29.000000000 +0200
-@@ -75,6 +75,23 @@
+---
+ src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp |   61 ++++++++++
+ 1 file changed, 61 insertions(+)
+
+Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp
+===================================================================
+--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp
++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp
+@@ -70,6 +70,23 @@
  #endif
  #include <unistd.h>
  
@@ -29,7 +35,7 @@ Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
  #if OS(SOLARIS)
  #include <thread.h>
  #else
-@@ -667,18 +683,61 @@ static inline void* currentThreadStackBa
+@@ -648,6 +665,37 @@
      get_thread_info(find_thread(NULL), &threadInfo);
      return threadInfo.stack_end;
  #elif OS(UNIX)
@@ -67,7 +73,7 @@ Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
      AtomicallyInitializedStatic(Mutex&, mutex = *new Mutex);
      MutexLocker locker(mutex);
      static void* stackBase = 0;
-     static size_t stackSize = 0;
+@@ -655,11 +703,23 @@
      static pthread_t stackThread;
      pthread_t thread = pthread_self();
      if (stackBase == 0 || thread != stackThread) {
@@ -91,11 +97,11 @@ Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
  #else
          // FIXME: this function is non-portable; other POSIX systems may have different np alternatives
          pthread_getattr_np(thread, &sattr);
-@@ -690,6 +749,7 @@ static inline void* currentThreadStackBa
+@@ -671,6 +731,7 @@
          stackThread = thread;
      }
      return static_cast<char*>(stackBase) + stackSize;
 +#endif
- #elif OS(WINCE)
-     AtomicallyInitializedStatic(Mutex&, mutex = *new Mutex);
-     MutexLocker locker(mutex);
+ #else
+ #error Need a way to get the stack base on this platform
+ #endif
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 776eb63..7e6c5dd 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,7 +12,7 @@
 #
 ######################################################################
 
-QT_VERSION = 4.8.0
+QT_VERSION = 4.8.1
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://get.qt.nokia.com/qt/source
 QT_DEPENDENCIES = host-pkg-config
