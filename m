From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Jun 2011 21:58:46 +0200
Subject: [Buildroot] [git commit] qt: update pthread_getattr_np patches for
	uClibc 0.9.32
Message-ID: <20110622221121.624CB82595@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=417df559ad1781829d5d57405d7379059e158f04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And only when linuxthreads.old is used, as the other thread implementations
don't need it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt-4.7.3-pthread_getattr_np.patch       |    7 ++++---
 .../qt/qt-4.7.3-pthread_getattr_np_webkit.patch    |    7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/qt/qt-4.7.3-pthread_getattr_np.patch b/package/qt/qt-4.7.3-pthread_getattr_np.patch
index 5cbd7d2..4b20bb2 100644
--- a/package/qt/qt-4.7.3-pthread_getattr_np.patch
+++ b/package/qt/qt-4.7.3-pthread_getattr_np.patch
@@ -5,7 +5,7 @@ Based on https://dev.openwrt.org/log/packages/Xorg/lib/qt4/patches/100-fix-webki
 Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
 --- qt-everywhere-opensource-src-4.6.2/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp	2010-02-11 16:55:20.000000000 +0100
 +++ qt-everywhere-opensource-src-4.6.2JS/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp	2010-05-23 10:49:29.000000000 +0200
-@@ -75,6 +75,22 @@
+@@ -75,6 +75,23 @@
  #endif
  #include <unistd.h>
  
@@ -14,11 +14,12 @@ Signed-off-by: Johan Sagaert <sagaert.johan@skynet.be>
 +#endif
 +
 +#if defined(__UCLIBC__)
-+// versions of uClibc 0.9.31 and below do not have
++// versions of uClibc 0.9.32 and below with linuxthreads.old do not have
 +// pthread_getattr_np or pthread_attr_getstack.
 +#if __UCLIBC_MAJOR__ == 0 && \
 +    (__UCLIBC_MINOR__ < 9 || \
-+    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 31))
++    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 32)) && \
++    defined(__LINUXTHREADS_OLD__)
 +#define UCLIBC_USE_PROC_SELF_MAPS 1
 +#include <stdio_ext.h>
 +extern int *__libc_stack_end;
diff --git a/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch b/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch
index e2bc188..dc078ad 100644
--- a/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch
+++ b/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch
@@ -1,15 +1,16 @@
 --- a/src/3rdparty/webkit/JavaScriptCore/runtime/Collector.cpp	2010-09-10 11:05:22.000000000 +0200
 +++ b/src/3rdparty/webkit/JavaScriptCore/runtime/Collector.cpp	2010-11-15 16:39:53.000000000 +0100
-@@ -70,6 +70,18 @@
+@@ -70,6 +70,19 @@
  #endif
  #include <unistd.h>
 
 +#if defined(__UCLIBC__)
-+// versions of uClibc 0.9.31 and below do not have
++// versions of uClibc 0.9.32 with linuxthreads.old and below do not have
 +// pthread_getattr_np or pthread_attr_getstack.
 +#if __UCLIBC_MAJOR__ == 0 && \
 +    (__UCLIBC_MINOR__ < 9 || \
-+    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 31))
++    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 32)) &&
++    defined(__LINUXTHREADS_OLD__)
 +#define UCLIBC_USE_PROC_SELF_MAPS 1
 +#include <stdio_ext.h>
 +extern int* __libc_stack_end;
-- 
1.7.3.4
