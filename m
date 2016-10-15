From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 23:14:45 +0200
Subject: [Buildroot] [git commit] wvstreams: remove deprecated package
Message-ID: <20161015211550.A76B081F03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3534399db48cfd066ff45a2bfa2ee0998024a9ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will remove BR2_DEPRECATED, so remove this deprecated package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   7 +
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 .../0001-fix-uClibc-compile-getcontext.patch       | 273 ---------------------
 ...002-fix-uClibc-compile-execinfo-backtrace.patch |  31 ---
 .../wvstreams/0003-fix-uClibc-compile-misc.patch   |  16 --
 package/wvstreams/0004-build-fixes.patch           |  40 ---
 package/wvstreams/0005-getuid.patch                |  25 --
 package/wvstreams/Config.in                        |  19 --
 package/wvstreams/wvstreams.hash                   |   2 -
 package/wvstreams/wvstreams.mk                     |  62 -----
 11 files changed, 7 insertions(+), 470 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b5fb49f..f26f97f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_WVSTREAMS
+	bool "wvstreams removed"
+	select BR2_LEGACY
+	help
+	  wvstreams is not maintained anymore since about 2009. It also
+	  doesn't build anymore with recent compilers (GCC 5+).
+
 config BR2_PACKAGE_WVDIAL
 	bool "wvdial removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 00b853d..f3d175b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1348,7 +1348,6 @@ F:	package/sconeserver/
 F:	package/sound-theme-borealis/
 F:	package/sound-theme-freedesktop/
 F:	package/vlc/
-F:	package/wvstreams/
 F:	package/xscreensaver/
 F:	package/zmqpp/
 F:	package/zyre/
diff --git a/package/Config.in b/package/Config.in
index b7cb970..56813ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1260,7 +1260,6 @@ menu "Networking"
 	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
-	source "package/wvstreams/Config.in"
 	source "package/zeromq/Config.in"
 	source "package/zmqpp/Config.in"
 	source "package/zyre/Config.in"
diff --git a/package/wvstreams/0001-fix-uClibc-compile-getcontext.patch b/package/wvstreams/0001-fix-uClibc-compile-getcontext.patch
deleted file mode 100644
index c78cc18..0000000
--- a/package/wvstreams/0001-fix-uClibc-compile-getcontext.patch
+++ /dev/null
@@ -1,273 +0,0 @@
-Fix wvstreams so that it builds with uClibc, which does not have the
-getcontext() and setcontext() functions.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/include/wvtask.h b/include/wvtask.h
---- a/include/wvtask.h	2008-07-14 20:11:35.000000000 +0100
-+++ b/include/wvtask.h	2012-07-28 12:29:53.559981240 +0100
-@@ -28,6 +28,13 @@
- 
- #define WVTASK_MAGIC 0x123678
- 
-+#undef HAVE_GETCONTEXT
-+#ifdef HAVE_GETCONTEXT
-+typedef ucontext_t TaskContext;
-+#else
-+typedef jmp_buf TaskContext;
-+#endif
-+
- class WvTaskMan;
- 
- /** Represents a single thread of control. */
-@@ -54,8 +61,8 @@ class WvTask
-     bool running, recycled;
-     
-     WvTaskMan &man;
--    ucontext_t mystate;	// used for resuming the task
--    ucontext_t func_call, func_return;
-+    TaskContext mystate;	// used for resuming the task
-+    TaskContext func_call, func_return;
-     
-     TaskFunc *func;
-     void *userdata;
-@@ -94,13 +101,13 @@ class WvTaskMan
-     static void call_func(WvTask *task);
- 
-     static char *stacktop;
--    static ucontext_t stackmaster_task;
-+    static TaskContext stackmaster_task;
-     
-     static WvTask *stack_target;
--    static ucontext_t get_stack_return;
-+    static TaskContext get_stack_return;
-     
-     static WvTask *current_task;
--    static ucontext_t toplevel;
-+    static TaskContext toplevel;
-     
-     WvTaskMan();
-     virtual ~WvTaskMan();
-diff -Nurp a/utils/wvtask.cc b/utils/wvtask.cc
---- a/utils/wvtask.cc	2009-05-13 22:42:52.000000000 +0100
-+++ b/utils/wvtask.cc	2012-07-28 12:32:23.855974538 +0100
-@@ -60,12 +60,14 @@ int WvTask::taskcount, WvTask::numtasks,
- WvTaskMan *WvTaskMan::singleton;
- int WvTaskMan::links, WvTaskMan::magic_number;
- WvTaskList WvTaskMan::all_tasks, WvTaskMan::free_tasks;
--ucontext_t WvTaskMan::stackmaster_task, WvTaskMan::get_stack_return,
-+TaskContext WvTaskMan::stackmaster_task, WvTaskMan::get_stack_return,
-     WvTaskMan::toplevel;
- WvTask *WvTaskMan::current_task, *WvTaskMan::stack_target;
- char *WvTaskMan::stacktop;
- 
-+#ifdef HAVE_GETCONTEXT
- static int context_return;
-+#endif
- 
- 
- static bool use_shared_stack()
-@@ -198,9 +200,13 @@ WvTaskMan::WvTaskMan()
-     
-     stacktop = (char *)alloca(0);
-     
-+#ifdef HAVE_GETCONTEXT
-     context_return = 0;
-     assert(getcontext(&get_stack_return) == 0);
-     if (context_return == 0)
-+#else
-+    if (setjmp(get_stack_return) == 0)
-+#endif
-     {
- 	// initial setup - start the stackmaster() task (never returns!)
- 	stackmaster();
-@@ -257,22 +263,30 @@ int WvTaskMan::run(WvTask &task, int val
-         
-     WvTask *old_task = current_task;
-     current_task = &task;
--    ucontext_t *state;
-+    TaskContext *state;
-     
-     if (!old_task)
- 	state = &toplevel; // top-level call (not in an actual task yet)
-     else
- 	state = &old_task->mystate;
-     
-+#ifdef HAVE_GETCONTEXT
-     context_return = 0;
-     assert(getcontext(state) == 0);
-     int newval = context_return;
-+#else
-+    int newval = setjmp(*state);
-+#endif
-     if (newval == 0)
-     {
- 	// saved the state, now run the task.
-+#ifdef HAVE_GETCONTEXT
-         context_return = val;
-         setcontext(&task.mystate);
-         return -1;
-+#else
-+        longjmp(task.mystate, val);
-+#endif
-     }
-     else
-     {
-@@ -317,16 +331,24 @@ int WvTaskMan::yield(int val)
-                 (long)current_task->stacksize);
-     }
- #endif
--		
-+
-+#ifdef HAVE_GETCONTEXT		
-     context_return = 0;
-     assert(getcontext(&current_task->mystate) == 0);
-     int newval = context_return;
-+#else
-+    int newval = setjmp(current_task->mystate);
-+#endif
-     if (newval == 0)
-     {
- 	// saved the task state; now yield to the toplevel.
-+#ifdef HAVE_GETCONTEXT
-         context_return = val;
-         setcontext(&toplevel);
-         return -1;
-+#else
-+        longjmp(toplevel, val);
-+#endif
-     }
-     else
-     {
-@@ -340,9 +362,13 @@ int WvTaskMan::yield(int val)
- 
- void WvTaskMan::get_stack(WvTask &task, size_t size)
- {
-+#ifdef HAVE_GETCONTEXT
-     context_return = 0;
-     assert(getcontext(&get_stack_return) == 0);
-     if (context_return == 0)
-+#else
-+    if (setjmp(get_stack_return) == 0)
-+#endif
-     {
- 	assert(magic_number == -WVTASK_MAGIC);
- 	assert(task.magic_number == WVTASK_MAGIC);
-@@ -358,6 +384,7 @@ void WvTaskMan::get_stack(WvTask &task,
-             static char *next_stack_addr = NULL;
- #endif
-         
-+#ifndef HAVE_GETCONTEXT
-             task.stack = mmap(next_stack_addr, task.stacksize,
-                 PROT_READ | PROT_WRITE,
- #ifndef MACOS 
-@@ -366,12 +393,17 @@ void WvTaskMan::get_stack(WvTask &task,
-                 MAP_PRIVATE,
- #endif
-                 -1, 0);
-+#endif // !HAVE_GETCONTEXT
-         }
- 	
- 	// initial setup
- 	stack_target = &task;
-+#ifdef HAVE_GETCONTEXT
- 	context_return = size/1024 + (size%1024 > 0);
- 	setcontext(&stackmaster_task);
-+#else
-+	longjmp(stackmaster_task, size/1024 + (size%1024 > 0));
-+#endif
-     }
-     else
-     {
-@@ -408,9 +440,13 @@ void WvTaskMan::_stackmaster()
-     {
- 	assert(magic_number == -WVTASK_MAGIC);
- 	
-+#ifdef HAVE_GETCONTEXT
-         context_return = 0;
-         assert(getcontext(&stackmaster_task) == 0);
-         val = context_return;
-+#else
-+        val = setjmp(stackmaster_task);
-+#endif
- 	if (val == 0)
- 	{
- 	    assert(magic_number == -WVTASK_MAGIC);
-@@ -418,8 +454,12 @@ void WvTaskMan::_stackmaster()
- 	    // just did setjmp; save stackmaster's current state (with
- 	    // all current stack allocations) and go back to get_stack
- 	    // (or the constructor, if that's what called us)
-+#ifdef HAVE_GETCONTEXT
-             context_return = 1;
-             setcontext(&get_stack_return);
-+#else
-+            longjmp(get_stack_return, 1);
-+#endif
- 	}
- 	else
- 	{
-@@ -462,7 +502,9 @@ void WvTaskMan::call_func(WvTask *task)
-     task->func(task->userdata);
-     Dprintf("WvTaskMan: returning from task #%d (%s)\n",
- 	    task->tid, (const char *)task->name);
-+#ifdef HAVE_GETCONTEXT
-     context_return = 1;
-+#endif
- }
- 
- 
-@@ -473,9 +515,13 @@ void WvTaskMan::do_task()
-     assert(task->magic_number == WVTASK_MAGIC);
- 	
-     // back here from longjmp; someone wants stack space.    
-+#ifdef HAVE_GETCONTEXT
-     context_return = 0;
-     assert(getcontext(&task->mystate) == 0);
-     if (context_return == 0)
-+#else
-+    if (setjmp(task->mystate) == 0)
-+#endif
-     {
- 	// done the setjmp; that means the target task now has
- 	// a working jmp_buf all set up.  Leave space on the stack
-@@ -510,6 +556,7 @@ void WvTaskMan::do_task()
-                 }
-                 else
-                 {
-+#ifdef HAVE_GETCONTEXT
-                     assert(getcontext(&task->func_call) == 0);
-                     task->func_call.uc_stack.ss_size = task->stacksize;
-                     task->func_call.uc_stack.ss_sp = task->stack;
-@@ -519,11 +566,19 @@ void WvTaskMan::do_task()
-                             task->tid, (const char *)task->name);
-                     makecontext(&task->func_call,
-                             (void (*)(void))call_func, 1, task);
-+#else
-+                    assert(setjmp(task->func_call) == 0);
-+#endif
- 
-+#ifdef HAVE_GETCONTEXT
-                     context_return = 0;
-                     assert(getcontext(&task->func_return) == 0);
-                     if (context_return == 0)
-                         setcontext(&task->func_call);
-+#else
-+                    if (setjmp(task->func_return) == 0)
-+                        longjmp(task->func_call, 0);
-+#endif
-                 }
- 		
- 		// the task's function terminated.
-@@ -544,8 +599,12 @@ const void *WvTaskMan::current_top_of_st
-     if (use_shared_stack() || current_task == NULL)
-         return __libc_stack_end;
-     else
-+#ifdef HAVE_GETCONTEXT
-         return (const char *)current_task->stack + current_task->stacksize;
- #else
-+        return 0;
-+#endif
-+#else
-     return 0;
- #endif
- }
diff --git a/package/wvstreams/0002-fix-uClibc-compile-execinfo-backtrace.patch b/package/wvstreams/0002-fix-uClibc-compile-execinfo-backtrace.patch
deleted file mode 100644
index c6317da..0000000
--- a/package/wvstreams/0002-fix-uClibc-compile-execinfo-backtrace.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fix wvstreams so that it builds with uClibc: we don't have execinfo.h,
-so we can't do backtrace() stuff.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/utils/wvcrash.cc b/utils/wvcrash.cc
---- a/utils/wvcrash.cc	2008-12-17 12:24:20.000000000 +0000
-+++ b/utils/wvcrash.cc	2012-07-27 22:00:15.456502262 +0100
-@@ -28,7 +28,9 @@
- // FIXME: this file mostly only works in Linux
- #ifdef __linux
- 
--# include <execinfo.h>
-+#ifdef HAVE_EXECINFO_H
-+#include <execinfo.h>
-+#endif
- #include <unistd.h>
- 
- #ifdef __USE_GNU
-@@ -267,9 +269,11 @@ static void wvcrash_real(int sig, int fd
- 	}
-     }
- 
-+#ifdef HAVE_EXECINFO_H
-     wr(fd, "\nBacktrace:\n");
-     backtrace_symbols_fd(trace,
- 		 backtrace(trace, sizeof(trace)/sizeof(trace[0])), fd);
-+#endif
-     
-     if (pid > 0)
-     {
diff --git a/package/wvstreams/0003-fix-uClibc-compile-misc.patch b/package/wvstreams/0003-fix-uClibc-compile-misc.patch
deleted file mode 100644
index 690a961..0000000
--- a/package/wvstreams/0003-fix-uClibc-compile-misc.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix wvstreams so that it builds with uClibc: const cast problem.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/crypto/wvx509.cc b/crypto/wvx509.cc
---- a/crypto/wvx509.cc	2008-10-23 21:23:49.000000000 +0100
-+++ b/crypto/wvx509.cc	2012-06-15 18:45:06.605899292 +0100
-@@ -1157,7 +1157,7 @@ WvString WvX509::get_extension(int nid)
-         
-         if (ext)
-         {
--            X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
-+          X509V3_EXT_METHOD *method = const_cast<X509V3_EXT_METHOD *>(X509V3_EXT_get(ext));
-             if (!method)
-             {
-                 WvDynBuf buf;
diff --git a/package/wvstreams/0004-build-fixes.patch b/package/wvstreams/0004-build-fixes.patch
deleted file mode 100644
index 21792d7..0000000
--- a/package/wvstreams/0004-build-fixes.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Add missing includes for proper build on Linux/glibc
-
-The current wvstreams code doesn't build on Linux/glibc, with error
-about chmod() not being available (for wvunixdgsocket.cc) or umask()
-not being available (for wvatomicfile.cc). Those errors turn out to be
-missing includes. Those includes were in fact already done, but
-conditionally for MacOS. We make them unconditional (it probably
-breaks other platforms, but since Buildroot is Linux only, we don't
-care).
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/ipstreams/wvunixdgsocket.cc
-===================================================================
---- a/ipstreams/wvunixdgsocket.cc
-+++ b/ipstreams/wvunixdgsocket.cc
-@@ -1,8 +1,6 @@
- #include "wvunixdgsocket.h"
--#ifdef MACOS
- #include <sys/types.h>
- #include <sys/stat.h>
--#endif
- 
- WvUnixDGSocket::WvUnixDGSocket(WvStringParm filename, bool _server, int perms)
-     : socketfile(filename)
-Index: b/streams/wvatomicfile.cc
-===================================================================
---- a/streams/wvatomicfile.cc
-+++ b/streams/wvatomicfile.cc
-@@ -10,10 +10,7 @@
- #include "wvatomicfile.h"
- #include "wvfileutils.h"
- #include "wvstrutils.h"
--
--#ifdef MACOS
- #include <sys/stat.h>
--#endif
- 
- WvAtomicFile::WvAtomicFile(WvStringParm filename, int flags, mode_t create_mode)
-     : tmp_file(WvString::null)
diff --git a/package/wvstreams/0005-getuid.patch b/package/wvstreams/0005-getuid.patch
deleted file mode 100644
index 6015066..0000000
--- a/package/wvstreams/0005-getuid.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-[PATCH] wvuid.cc: getuid needs sys/types.h + unistd.h
-
-Otherwise the build fails with:
-
-utils/wvuid.cc: In function 'wvuid_t wvgetuid()':
-utils/wvuid.cc:63:19: error: 'getuid' was not declared in this scope
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- utils/wvuid.cc |    2 ++
- 1 file changed, 2 insertions(+)
-
-Index: wvstreams-4.6.1/utils/wvuid.cc
-===================================================================
---- wvstreams-4.6.1.orig/utils/wvuid.cc
-+++ wvstreams-4.6.1/utils/wvuid.cc
-@@ -33,6 +33,8 @@
- 
- #else // not WIN32
- 
-+#include <unistd.h>
-+#include <sys/types.h>
- 
- WvString wv_username_from_uid(wvuid_t uid)
- {
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
deleted file mode 100644
index a550c57..0000000
--- a/package/wvstreams/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_WVSTREAMS
-	bool "wvstreams"
-	depends on BR2_DEPRECATED_SINCE_2016_08
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_MMU # fork()
-	# musl not supported and no upstream activity since 2011.
-	depends on !BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_ZLIB
-	help
-	  C++ Network Programming Library.
-
-	  http://wvstreams.googlecode.com/
-
-comment "wvstreams needs a glibc or uClibc toolchain w/ C++, dynamic library"
-	depends on BR2_DEPRECATED_SINCE_2016_08
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/wvstreams/wvstreams.hash b/package/wvstreams/wvstreams.hash
deleted file mode 100644
index 17cad6d..0000000
--- a/package/wvstreams/wvstreams.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633  wvstreams-4.6.1.tar.gz
diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
deleted file mode 100644
index 4d344e2..0000000
--- a/package/wvstreams/wvstreams.mk
+++ /dev/null
@@ -1,62 +0,0 @@
-################################################################################
-#
-# wvstreams
-#
-################################################################################
-
-WVSTREAMS_VERSION = 4.6.1
-WVSTREAMS_SITE = http://wvstreams.googlecode.com/files
-WVSTREAMS_DEPENDENCIES = openssl zlib host-pkgconf
-WVSTREAMS_INSTALL_STAGING = YES
-
-WVSTREAMS_LICENSE = LGPLv2+
-WVSTREAMS_LICENSE_FILES = LICENSE
-
-# N.B. parallel make fails
-WVSTREAMS_MAKE = $(MAKE1)
-
-# Needed to work around problem with wvassert.h
-WVSTREAMS_CONF_OPTS += CPPFLAGS=-DNDEBUG
-
-WVSTREAMS_CONF_OPTS += \
-	--with-openssl \
-	--with-zlib \
-	--without-pam \
-	--disable-warnings \
-	--without-tcl
-
-# needed for openssl detection when statically linking (as ssl needs lz)
-WVSTREAMS_CONF_ENV += LIBS=-lz
-
-ifneq ($(BR2_STATIC_LIBS),y)
-WVSTREAMS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
-endif
-
-# wvstreams uses argp.h which can be provided by the argp-standalone
-# package
-ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-WVSTREAMS_DEPENDENCIES += argp-standalone
-endif
-
-ifeq ($(BR2_PACKAGE_DBUS),y)
-WVSTREAMS_DEPENDENCIES += dbus
-WVSTREAMS_CONF_OPTS += --with-dbus
-else
-WVSTREAMS_CONF_OPTS += --without-dbus
-endif
-
-ifeq ($(BR2_PACKAGE_QT),y)
-WVSTREAMS_DEPENDENCIES += qt
-WVSTREAMS_CONF_OPTS += --with-qt
-else
-WVSTREAMS_CONF_OPTS += --without-qt
-endif
-
-ifeq ($(BR2_PACKAGE_VALGRIND),y)
-WVSTREAMS_DEPENDENCIES += valgrind
-WVSTREAMS_CONF_OPTS += --with-valgrind
-else
-WVSTREAMS_CONF_OPTS += --without-valgrind
-endif
-
-$(eval $(autotools-package))
