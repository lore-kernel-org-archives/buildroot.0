From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Nov 2010 09:48:31 +0100
Subject: [Buildroot] [git commit master 1/1] qt: bump version
Message-ID: <20101108084908.2F5198DC0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=61881e8d30ab4ca7cb7f0a55be31bdb5ecbe0d37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ..._np.patch => qt-4.7.0-pthread_getattr_np.patch} |   33 +++++++------------
 package/qt/qt.mk                                   |    4 +-
 2 files changed, 14 insertions(+), 23 deletions(-)
 rename package/qt/{qt-4.6.3-pthread_getattr_np.patch => qt-4.7.0-pthread_getattr_np.patch} (77%)

diff --git a/package/qt/qt-4.6.3-pthread_getattr_np.patch b/package/qt/qt-4.7.0-pthread_getattr_np.patch
similarity index 77%
rename from package/qt/qt-4.6.3-pthread_getattr_np.patch
rename to package/qt/qt-4.7.0-pthread_getattr_np.patch
index 7678185..5cbd7d2 100644
--- a/package/qt/qt-4.6.3-pthread_getattr_np.patch
+++ b/package/qt/qt-4.7.0-pthread_getattr_np.patch
@@ -5,7 +5,7 @@ Based on https://dev.openwrt.org/log/packages/Xorg/lib/qt4/patches/100-fix-webki
 Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
 --- qt-everywhere-opensource-src-4.6.2/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp	2010-02-11 16:55:20.000000000 +0100
 +++ qt-everywhere-opensource-src-4.6.2JS/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp	2010-05-23 10:49:29.000000000 +0200
-@@ -74,6 +74,22 @@
+@@ -75,6 +75,22 @@
  #endif
  #include <unistd.h>
  
@@ -25,13 +25,13 @@ Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
 +#endif
 +#endif
 +
- #if PLATFORM(SOLARIS)
+ #if OS(SOLARIS)
  #include <thread.h>
  #else
-@@ -667,16 +683,59 @@ static inline void* currentThreadStackBa
+@@ -667,18 +683,61 @@ static inline void* currentThreadStackBa
      get_thread_info(find_thread(NULL), &threadInfo);
      return threadInfo.stack_end;
- #elif PLATFORM(UNIX)
+ #elif OS(UNIX)
 +#ifdef UCLIBC_USE_PROC_SELF_MAPS
 +    // Read /proc/self/maps and locate the line whose address
 +    // range contains __libc_stack_end.
@@ -62,7 +62,9 @@ Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
 +    fclose(file);
 +    free(line);
 +    return 0;
-+	#else
++#else
+     AtomicallyInitializedStatic(Mutex&, mutex = *new Mutex);
+     MutexLocker locker(mutex);
      static void* stackBase = 0;
      static size_t stackSize = 0;
      static pthread_t stackThread;
@@ -79,7 +81,7 @@ Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
 +#endif
          pthread_attr_t sattr;
          pthread_attr_init(&sattr);
- #if HAVE(PTHREAD_NP_H) || PLATFORM(NETBSD)
+ #if HAVE(PTHREAD_NP_H) || OS(NETBSD)
          // e.g. on FreeBSD 5.4, neundorf at kde.org
          pthread_attr_get_np(thread, &sattr);
 +#elif defined(QT_LINUXBASE)
@@ -88,22 +90,11 @@ Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
  #else
          // FIXME: this function is non-portable; other POSIX systems may have different np alternatives
          pthread_getattr_np(thread, &sattr);
-@@ -688,6 +747,7 @@ static inline void* currentThreadStackBa
+@@ -690,6 +749,7 @@ static inline void* currentThreadStackBa
          stackThread = thread;
      }
      return static_cast<char*>(stackBase) + stackSize;
 +#endif
- #elif PLATFORM(WINCE)
-     if (g_stackBase)
-         return g_stackBase;
---- qt-everywhere-opensource-src-4.6.2/src/3rdparty/webkit/JavaScriptCore/runtime/Collector.cpp	2010-02-11 16:55:17.000000000 +0100
-+++ qt-everywhere-opensource-src-4.6.2JS/src/3rdparty/webkit/JavaScriptCore/runtime/Collector.cpp	2010-05-23 01:41:06.000000000 +0200
-@@ -83,7 +83,7 @@
- // pthread_getattr_np or pthread_attr_getstack.
- #if __UCLIBC_MAJOR__ == 0 && \
-     (__UCLIBC_MINOR__ < 9 || \
--    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 30))
-+    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 31))
- #define UCLIBC_USE_PROC_SELF_MAPS 1
- #include <stdio_ext.h>
- extern int *__libc_stack_end;
+ #elif OS(WINCE)
+     AtomicallyInitializedStatic(Mutex&, mutex = *new Mutex);
+     MutexLocker locker(mutex);
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 92f1253..a18ebd4 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -1,6 +1,6 @@
 ######################################################################
 #
-# Qt Embedded for Linux 4.6
+# Qt Embedded for Linux
 # http://www.qtsoftware.com/
 #
 # This makefile was originally composed by Thomas Lundquist <thomasez@zelow.no>
@@ -12,7 +12,7 @@
 #
 ######################################################################
 
-QT_VERSION:=4.6.3
+QT_VERSION:=4.7.0
 QT_SOURCE:=qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE:=http://get.qt.nokia.com/qt/source
 QT_CAT:=$(ZCAT)
-- 
1.7.1
