From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Nov 2010 22:00:29 +0100
Subject: [Buildroot] [git commit master 1/1] qt: also patch webkit instance
	of javascriptcore
Message-ID: <20101117210124.02F9F8E97E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e25fe7239fcc7375996ffb92519ad1981e5872b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2821, #2827

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    4 +-
 .../qt/qt-4.7.0-pthread_getattr_np_webkit.patch    |   67 ++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletions(-)
 create mode 100644 package/qt/qt-4.7.0-pthread_getattr_np_webkit.patch

diff --git a/CHANGES b/CHANGES
index bee6f33..39b7cd3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,11 +2,13 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: libglib2
+	Updated/fixed packages: libglib2, qt
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#2809: failed to compile libglib2
+	#2821: [PATCH] Patch for JavaScriptCore in QtWebKit module
+	#2827: qt-4.7.0-pthread_getattr_np.patch invalid for qt 4.6...
 
 2010.11-rc1, Released November 8th, 2010:
 
diff --git a/package/qt/qt-4.7.0-pthread_getattr_np_webkit.patch b/package/qt/qt-4.7.0-pthread_getattr_np_webkit.patch
new file mode 100644
index 0000000..e2bc188
--- /dev/null
+++ b/package/qt/qt-4.7.0-pthread_getattr_np_webkit.patch
@@ -0,0 +1,67 @@
+--- a/src/3rdparty/webkit/JavaScriptCore/runtime/Collector.cpp	2010-09-10 11:05:22.000000000 +0200
++++ b/src/3rdparty/webkit/JavaScriptCore/runtime/Collector.cpp	2010-11-15 16:39:53.000000000 +0100
+@@ -70,6 +70,18 @@
+ #endif
+ #include <unistd.h>
+
++#if defined(__UCLIBC__)
++// versions of uClibc 0.9.31 and below do not have
++// pthread_getattr_np or pthread_attr_getstack.
++#if __UCLIBC_MAJOR__ == 0 && \
++    (__UCLIBC_MINOR__ < 9 || \
++    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 31))
++#define UCLIBC_USE_PROC_SELF_MAPS 1
++#include <stdio_ext.h>
++extern int* __libc_stack_end;
++#endif
++#endif
++
+ #if OS(SOLARIS)
+ #include <thread.h>
+ #else
+@@ -580,6 +592,37 @@
+     get_thread_info(find_thread(NULL), &threadInfo);
+     return threadInfo.stack_end;
+ #elif OS(UNIX)
++#ifdef UCLIBC_USE_PROC_SELF_MAPS
++    // Read /proc/self/maps and locate the line whose address
++    // range contains __libc_stack_end.
++    FILE* file = fopen("/proc/self/maps", "r");
++    if (!file)
++        return 0;
++    __fsetlocking(file, FSETLOCKING_BYCALLER);
++    char* line = 0;
++    size_t lineLen = 0;
++    while (!feof_unlocked(file)) {
++        if (getdelim(&line, &lineLen, '\n', file) <= 0)
++            break;
++
++        long from;
++        long to;
++        if (sscanf (line, "%lx-%lx", &from, &to) != 2)
++            continue;
++        if (from <= (long)__libc_stack_end && (long)__libc_stack_end < to) {
++            fclose(file);
++            free(line);
++#ifdef _STACK_GROWS_UP
++            return (void *)from;
++#else
++            return (void *)to;
++#endif
++        }
++    }
++    fclose(file);
++    free(line);
++    return 0;
++#else
+     AtomicallyInitializedStatic(Mutex&, mutex = *new Mutex);
+     MutexLocker locker(mutex);
+     static void* stackBase = 0;
+@@ -603,6 +646,7 @@
+         stackThread = thread;
+     }
+     return static_cast<char*>(stackBase) + stackSize;
++#endif
+ #elif OS(WINCE)
+     AtomicallyInitializedStatic(Mutex&, mutex = *new Mutex);
+     MutexLocker locker(mutex);
-- 
1.7.1
