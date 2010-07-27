From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] webkit: Fix build failure on
	uClibc
Message-ID: <20100727210247.C5DCB83609@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=56151c6b938de8fe33b516992d71e02519783e8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc does not define pthread_getattr_np(), so we need to workaround
this using a patch.

Fixes bug #1405.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../webkit/webkit-1.2.3-pthread_getattr_np.patch   |   79 ++++++++++++++++++++
 1 files changed, 79 insertions(+), 0 deletions(-)
 create mode 100644 package/webkit/webkit-1.2.3-pthread_getattr_np.patch

diff --git a/package/webkit/webkit-1.2.3-pthread_getattr_np.patch b/package/webkit/webkit-1.2.3-pthread_getattr_np.patch
new file mode 100644
index 0000000..b71c878
--- /dev/null
+++ b/package/webkit/webkit-1.2.3-pthread_getattr_np.patch
@@ -0,0 +1,79 @@
+Patch WebKit because pthread_getattr_np is not implemented in uClibc
+
+Define UCLIBC_USE_PROC_SELF_MAPS etc. as a workaround for uClibc. This
+code was in the qtoipa webkit but appears to have been removed from
+more recent versions of webkit.
+
+See: http://bugreports.qt.nokia.com/browse/QTBUG-6551
+Credit for fix: http://www.avrfreaks.net/index.php?name=PNphpBB2&file=viewtopic&p=545066#545066
+
+Signed-off-by: Paul Jones <paul@pauljones.id.au>
+
+Index: webkit-1.2.3/JavaScriptCore/runtime/Collector.cpp
+===================================================================
+--- webkit-1.2.3.orig/JavaScriptCore/runtime/Collector.cpp	2010-07-22 17:16:19.000000000 +0200
++++ webkit-1.2.3/JavaScriptCore/runtime/Collector.cpp	2010-07-22 17:25:02.000000000 +0200
+@@ -75,6 +75,18 @@
+ #endif
+ #include <unistd.h>
+ 
++#if defined(__UCLIBC__)
++// versions of uClibc 0.9.31 and below do not have
++// pthread_getattr_np or pthread_attr_getstack.
++#if __UCLIBC_MAJOR__ == 0 &&					\
++  (__UCLIBC_MINOR__ < 9 ||					\
++   (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 31))
++#define UCLIBC_USE_PROC_SELF_MAPS 1
++#include <stdio_ext.h>
++extern int *__libc_stack_end;
++#endif
++#endif
++
+ #if OS(SOLARIS)
+ #include <thread.h>
+ #else
+@@ -610,6 +622,36 @@
+     get_thread_info(find_thread(NULL), &threadInfo);
+     return threadInfo.stack_end;
+ #elif OS(UNIX)
++#ifdef UCLIBC_USE_PROC_SELF_MAPS
++    // Read /proc/self/maps and locate the line whose address
++    // range contains __libc_stack_end.
++    FILE *file = fopen("/proc/self/maps", "r");
++    if (!file)
++      return 0;
++    __fsetlocking(file, FSETLOCKING_BYCALLER);
++    char *line = NULL;
++    size_t lineLen = 0;
++    while (!feof_unlocked(file)) {
++      if (getdelim(&line, &lineLen, '\n', file) <= 0)
++	break;
++      long from;
++      long to;
++      if (sscanf (line, "%lx-%lx", &from, &to) != 2)
++	continue;
++      if (from <= (long)__libc_stack_end && (long)__libc_stack_end < to) {
++	fclose(file);
++	free(line);
++#ifdef _STACK_GROWS_UP
++	return (void *)from;
++#else
++	return (void *)to;
++#endif
++      }
++    }
++    fclose(file);
++    free(line);
++    return 0;
++#else 
+     static void* stackBase = 0;
+     static size_t stackSize = 0;
+     static pthread_t stackThread;
+@@ -631,6 +673,7 @@
+         stackThread = thread;
+     }
+     return static_cast<char*>(stackBase) + stackSize;
++#endif
+ #elif OS(WINCE)
+     if (g_stackBase)
+         return g_stackBase;
-- 
1.7.1
