From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Feb 2012 22:52:02 +0100
Subject: [Buildroot] [git commit branch/next] qt: bump version
Message-ID: <20120225222047.C951590B6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24bc2ff8c1d55b13b11faa110dabfb45f73083da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Webkit support runs pkg-config at build time, so we need to ensure our
version gets picked up.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../qt/qt-4.7.4-pthread_getattr_np_webkit.patch    |   68 --------------------
 ...qt-4.7.4-configure.patch => qt-configure.patch} |    0
 ...etattr_np.patch => qt-pthread_getattr_np.patch} |    0
 ...-no-gui.patch => qt-script-qtdbus-no-gui.patch} |    0
 package/qt/qt.mk                                   |   14 ++--
 5 files changed, 6 insertions(+), 76 deletions(-)

diff --git a/package/qt/qt-4.7.4-pthread_getattr_np_webkit.patch b/package/qt/qt-4.7.4-pthread_getattr_np_webkit.patch
deleted file mode 100644
index 934c332..0000000
--- a/package/qt/qt-4.7.4-pthread_getattr_np_webkit.patch
+++ /dev/null
@@ -1,68 +0,0 @@
---- a/src/3rdparty/webkit/JavaScriptCore/runtime/Collector.cpp	2010-09-10 11:05:22.000000000 +0200
-+++ b/src/3rdparty/webkit/JavaScriptCore/runtime/Collector.cpp	2010-11-15 16:39:53.000000000 +0100
-@@ -70,6 +70,19 @@
- #endif
- #include <unistd.h>
-
-+#if defined(__UCLIBC__)
-+// versions of uClibc 0.9.32 with linuxthreads.old and below do not have
-+// pthread_getattr_np or pthread_attr_getstack.
-+#if __UCLIBC_MAJOR__ == 0 && \
-+    (__UCLIBC_MINOR__ < 9 || \
-+    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 32)) && \
-+    defined(__LINUXTHREADS_OLD__)
-+#define UCLIBC_USE_PROC_SELF_MAPS 1
-+#include <stdio_ext.h>
-+extern int* __libc_stack_end;
-+#endif
-+#endif
-+
- #if OS(SOLARIS)
- #include <thread.h>
- #else
-@@ -580,6 +592,37 @@
-     get_thread_info(find_thread(NULL), &threadInfo);
-     return threadInfo.stack_end;
- #elif OS(UNIX)
-+#ifdef UCLIBC_USE_PROC_SELF_MAPS
-+    // Read /proc/self/maps and locate the line whose address
-+    // range contains __libc_stack_end.
-+    FILE* file = fopen("/proc/self/maps", "r");
-+    if (!file)
-+        return 0;
-+    __fsetlocking(file, FSETLOCKING_BYCALLER);
-+    char* line = 0;
-+    size_t lineLen = 0;
-+    while (!feof_unlocked(file)) {
-+        if (getdelim(&line, &lineLen, '\n', file) <= 0)
-+            break;
-+
-+        long from;
-+        long to;
-+        if (sscanf (line, "%lx-%lx", &from, &to) != 2)
-+            continue;
-+        if (from <= (long)__libc_stack_end && (long)__libc_stack_end < to) {
-+            fclose(file);
-+            free(line);
-+#ifdef _STACK_GROWS_UP
-+            return (void *)from;
-+#else
-+            return (void *)to;
-+#endif
-+        }
-+    }
-+    fclose(file);
-+    free(line);
-+    return 0;
-+#else
-     AtomicallyInitializedStatic(Mutex&, mutex = *new Mutex);
-     MutexLocker locker(mutex);
-     static void* stackBase = 0;
-@@ -603,6 +646,7 @@
-         stackThread = thread;
-     }
-     return static_cast<char*>(stackBase) + stackSize;
-+#endif
- #elif OS(WINCE)
-     AtomicallyInitializedStatic(Mutex&, mutex = *new Mutex);
-     MutexLocker locker(mutex);
diff --git a/package/qt/qt-4.7.4-configure.patch b/package/qt/qt-configure.patch
similarity index 100%
rename from package/qt/qt-4.7.4-configure.patch
rename to package/qt/qt-configure.patch
diff --git a/package/qt/qt-4.7.4-pthread_getattr_np.patch b/package/qt/qt-pthread_getattr_np.patch
similarity index 100%
rename from package/qt/qt-4.7.4-pthread_getattr_np.patch
rename to package/qt/qt-pthread_getattr_np.patch
diff --git a/package/qt/qt-4.7.4-script-qtdbus-no-gui.patch b/package/qt/qt-script-qtdbus-no-gui.patch
similarity index 100%
rename from package/qt/qt-4.7.4-script-qtdbus-no-gui.patch
rename to package/qt/qt-script-qtdbus-no-gui.patch
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 34f05f9..fe85dae 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,7 +12,7 @@
 #
 ######################################################################
 
-QT_VERSION = 4.7.4
+QT_VERSION = 4.8.0
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://get.qt.nokia.com/qt/source
 QT_DEPENDENCIES = host-pkg-config
@@ -59,7 +59,10 @@ endif
 
 # ensure glib is built first if enabled for Qt's glib support
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+QT_CONFIGURE_OPTS += -glib
 QT_DEPENDENCIES += libglib2
+else
+QT_CONFIGURE_OPTS += -no-glib
 endif
 
 
@@ -222,9 +225,7 @@ ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 QT_CONFIGURE_OPTS += -no-gui
 endif
 
-ifeq ($(BR2_PACKAGE_QT_GIF),y)
-QT_CONFIGURE_OPTS += -qt-gif
-else
+ifneq ($(BR2_PACKAGE_QT_GIF),y)
 QT_CONFIGURE_OPTS += -no-gif
 endif
 
@@ -490,9 +491,6 @@ define QT_CONFIGURE_CMDS
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
 		$(QT_CONFIGURE_OPTS) \
-		-no-gfx-qnx \
-		-no-kbd-qnx \
-		-no-mouse-qnx \
 		-no-xinerama \
 		-no-cups \
 		-no-nis \
@@ -507,7 +505,7 @@ define QT_CONFIGURE_CMDS
 endef
 
 define QT_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 
