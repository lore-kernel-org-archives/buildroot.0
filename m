From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 25 Apr 2013 10:19:01 +0100
Subject: [Buildroot] [PATCH 1/2] wvstreams: new package
In-Reply-To: <1366881542-15350-1-git-send-email-spdawson@gmail.com>
References: <1366881542-15350-1-git-send-email-spdawson@gmail.com>
Message-ID: <1366881542-15350-2-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/wvstreams/Config.in                        |   13 +
 ...treams-0001-fix-uClibc-compile-getcontext.patch |  273 ++++++++++++++++++++
 ...002-fix-uClibc-compile-execinfo-backtrace.patch |   31 +++
 .../wvstreams-0003-fix-uClibc-compile-misc.patch   |   16 ++
 package/wvstreams/wvstreams.mk                     |   51 ++++
 6 files changed, 385 insertions(+)
 create mode 100644 package/wvstreams/Config.in
 create mode 100644 package/wvstreams/wvstreams-0001-fix-uClibc-compile-getcontext.patch
 create mode 100644 package/wvstreams/wvstreams-0002-fix-uClibc-compile-execinfo-backtrace.patch
 create mode 100644 package/wvstreams/wvstreams-0003-fix-uClibc-compile-misc.patch
 create mode 100644 package/wvstreams/wvstreams.mk

diff --git a/package/Config.in b/package/Config.in
index ede0ba0..33d75a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -546,6 +546,7 @@ source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
 source "package/slirp/Config.in"
 source "package/usbredir/Config.in"
+source "package/wvstreams/Config.in"
 source "package/zeromq/Config.in"
 source "package/zmqpp/Config.in"
 source "package/zyre/Config.in"
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
new file mode 100644
index 0000000..c39ec33
--- /dev/null
+++ b/package/wvstreams/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_WVSTREAMS
+	bool "wvstreams"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  C++ Network Programming Library.
+
+	  http://wvstreams.googlecode.com/
+
+comment "wvstreams requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/wvstreams/wvstreams-0001-fix-uClibc-compile-getcontext.patch b/package/wvstreams/wvstreams-0001-fix-uClibc-compile-getcontext.patch
new file mode 100644
index 0000000..c78cc18
--- /dev/null
+++ b/package/wvstreams/wvstreams-0001-fix-uClibc-compile-getcontext.patch
@@ -0,0 +1,273 @@
+Fix wvstreams so that it builds with uClibc, which does not have the
+getcontext() and setcontext() functions.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/include/wvtask.h b/include/wvtask.h
+--- a/include/wvtask.h	2008-07-14 20:11:35.000000000 +0100
++++ b/include/wvtask.h	2012-07-28 12:29:53.559981240 +0100
+@@ -28,6 +28,13 @@
+ 
+ #define WVTASK_MAGIC 0x123678
+ 
++#undef HAVE_GETCONTEXT
++#ifdef HAVE_GETCONTEXT
++typedef ucontext_t TaskContext;
++#else
++typedef jmp_buf TaskContext;
++#endif
++
+ class WvTaskMan;
+ 
+ /** Represents a single thread of control. */
+@@ -54,8 +61,8 @@ class WvTask
+     bool running, recycled;
+     
+     WvTaskMan &man;
+-    ucontext_t mystate;	// used for resuming the task
+-    ucontext_t func_call, func_return;
++    TaskContext mystate;	// used for resuming the task
++    TaskContext func_call, func_return;
+     
+     TaskFunc *func;
+     void *userdata;
+@@ -94,13 +101,13 @@ class WvTaskMan
+     static void call_func(WvTask *task);
+ 
+     static char *stacktop;
+-    static ucontext_t stackmaster_task;
++    static TaskContext stackmaster_task;
+     
+     static WvTask *stack_target;
+-    static ucontext_t get_stack_return;
++    static TaskContext get_stack_return;
+     
+     static WvTask *current_task;
+-    static ucontext_t toplevel;
++    static TaskContext toplevel;
+     
+     WvTaskMan();
+     virtual ~WvTaskMan();
+diff -Nurp a/utils/wvtask.cc b/utils/wvtask.cc
+--- a/utils/wvtask.cc	2009-05-13 22:42:52.000000000 +0100
++++ b/utils/wvtask.cc	2012-07-28 12:32:23.855974538 +0100
+@@ -60,12 +60,14 @@ int WvTask::taskcount, WvTask::numtasks,
+ WvTaskMan *WvTaskMan::singleton;
+ int WvTaskMan::links, WvTaskMan::magic_number;
+ WvTaskList WvTaskMan::all_tasks, WvTaskMan::free_tasks;
+-ucontext_t WvTaskMan::stackmaster_task, WvTaskMan::get_stack_return,
++TaskContext WvTaskMan::stackmaster_task, WvTaskMan::get_stack_return,
+     WvTaskMan::toplevel;
+ WvTask *WvTaskMan::current_task, *WvTaskMan::stack_target;
+ char *WvTaskMan::stacktop;
+ 
++#ifdef HAVE_GETCONTEXT
+ static int context_return;
++#endif
+ 
+ 
+ static bool use_shared_stack()
+@@ -198,9 +200,13 @@ WvTaskMan::WvTaskMan()
+     
+     stacktop = (char *)alloca(0);
+     
++#ifdef HAVE_GETCONTEXT
+     context_return = 0;
+     assert(getcontext(&get_stack_return) == 0);
+     if (context_return == 0)
++#else
++    if (setjmp(get_stack_return) == 0)
++#endif
+     {
+ 	// initial setup - start the stackmaster() task (never returns!)
+ 	stackmaster();
+@@ -257,22 +263,30 @@ int WvTaskMan::run(WvTask &task, int val
+         
+     WvTask *old_task = current_task;
+     current_task = &task;
+-    ucontext_t *state;
++    TaskContext *state;
+     
+     if (!old_task)
+ 	state = &toplevel; // top-level call (not in an actual task yet)
+     else
+ 	state = &old_task->mystate;
+     
++#ifdef HAVE_GETCONTEXT
+     context_return = 0;
+     assert(getcontext(state) == 0);
+     int newval = context_return;
++#else
++    int newval = setjmp(*state);
++#endif
+     if (newval == 0)
+     {
+ 	// saved the state, now run the task.
++#ifdef HAVE_GETCONTEXT
+         context_return = val;
+         setcontext(&task.mystate);
+         return -1;
++#else
++        longjmp(task.mystate, val);
++#endif
+     }
+     else
+     {
+@@ -317,16 +331,24 @@ int WvTaskMan::yield(int val)
+                 (long)current_task->stacksize);
+     }
+ #endif
+-		
++
++#ifdef HAVE_GETCONTEXT		
+     context_return = 0;
+     assert(getcontext(&current_task->mystate) == 0);
+     int newval = context_return;
++#else
++    int newval = setjmp(current_task->mystate);
++#endif
+     if (newval == 0)
+     {
+ 	// saved the task state; now yield to the toplevel.
++#ifdef HAVE_GETCONTEXT
+         context_return = val;
+         setcontext(&toplevel);
+         return -1;
++#else
++        longjmp(toplevel, val);
++#endif
+     }
+     else
+     {
+@@ -340,9 +362,13 @@ int WvTaskMan::yield(int val)
+ 
+ void WvTaskMan::get_stack(WvTask &task, size_t size)
+ {
++#ifdef HAVE_GETCONTEXT
+     context_return = 0;
+     assert(getcontext(&get_stack_return) == 0);
+     if (context_return == 0)
++#else
++    if (setjmp(get_stack_return) == 0)
++#endif
+     {
+ 	assert(magic_number == -WVTASK_MAGIC);
+ 	assert(task.magic_number == WVTASK_MAGIC);
+@@ -358,6 +384,7 @@ void WvTaskMan::get_stack(WvTask &task,
+             static char *next_stack_addr = NULL;
+ #endif
+         
++#ifndef HAVE_GETCONTEXT
+             task.stack = mmap(next_stack_addr, task.stacksize,
+                 PROT_READ | PROT_WRITE,
+ #ifndef MACOS 
+@@ -366,12 +393,17 @@ void WvTaskMan::get_stack(WvTask &task,
+                 MAP_PRIVATE,
+ #endif
+                 -1, 0);
++#endif // !HAVE_GETCONTEXT
+         }
+ 	
+ 	// initial setup
+ 	stack_target = &task;
++#ifdef HAVE_GETCONTEXT
+ 	context_return = size/1024 + (size%1024 > 0);
+ 	setcontext(&stackmaster_task);
++#else
++	longjmp(stackmaster_task, size/1024 + (size%1024 > 0));
++#endif
+     }
+     else
+     {
+@@ -408,9 +440,13 @@ void WvTaskMan::_stackmaster()
+     {
+ 	assert(magic_number == -WVTASK_MAGIC);
+ 	
++#ifdef HAVE_GETCONTEXT
+         context_return = 0;
+         assert(getcontext(&stackmaster_task) == 0);
+         val = context_return;
++#else
++        val = setjmp(stackmaster_task);
++#endif
+ 	if (val == 0)
+ 	{
+ 	    assert(magic_number == -WVTASK_MAGIC);
+@@ -418,8 +454,12 @@ void WvTaskMan::_stackmaster()
+ 	    // just did setjmp; save stackmaster's current state (with
+ 	    // all current stack allocations) and go back to get_stack
+ 	    // (or the constructor, if that's what called us)
++#ifdef HAVE_GETCONTEXT
+             context_return = 1;
+             setcontext(&get_stack_return);
++#else
++            longjmp(get_stack_return, 1);
++#endif
+ 	}
+ 	else
+ 	{
+@@ -462,7 +502,9 @@ void WvTaskMan::call_func(WvTask *task)
+     task->func(task->userdata);
+     Dprintf("WvTaskMan: returning from task #%d (%s)\n",
+ 	    task->tid, (const char *)task->name);
++#ifdef HAVE_GETCONTEXT
+     context_return = 1;
++#endif
+ }
+ 
+ 
+@@ -473,9 +515,13 @@ void WvTaskMan::do_task()
+     assert(task->magic_number == WVTASK_MAGIC);
+ 	
+     // back here from longjmp; someone wants stack space.    
++#ifdef HAVE_GETCONTEXT
+     context_return = 0;
+     assert(getcontext(&task->mystate) == 0);
+     if (context_return == 0)
++#else
++    if (setjmp(task->mystate) == 0)
++#endif
+     {
+ 	// done the setjmp; that means the target task now has
+ 	// a working jmp_buf all set up.  Leave space on the stack
+@@ -510,6 +556,7 @@ void WvTaskMan::do_task()
+                 }
+                 else
+                 {
++#ifdef HAVE_GETCONTEXT
+                     assert(getcontext(&task->func_call) == 0);
+                     task->func_call.uc_stack.ss_size = task->stacksize;
+                     task->func_call.uc_stack.ss_sp = task->stack;
+@@ -519,11 +566,19 @@ void WvTaskMan::do_task()
+                             task->tid, (const char *)task->name);
+                     makecontext(&task->func_call,
+                             (void (*)(void))call_func, 1, task);
++#else
++                    assert(setjmp(task->func_call) == 0);
++#endif
+ 
++#ifdef HAVE_GETCONTEXT
+                     context_return = 0;
+                     assert(getcontext(&task->func_return) == 0);
+                     if (context_return == 0)
+                         setcontext(&task->func_call);
++#else
++                    if (setjmp(task->func_return) == 0)
++                        longjmp(task->func_call, 0);
++#endif
+                 }
+ 		
+ 		// the task's function terminated.
+@@ -544,8 +599,12 @@ const void *WvTaskMan::current_top_of_st
+     if (use_shared_stack() || current_task == NULL)
+         return __libc_stack_end;
+     else
++#ifdef HAVE_GETCONTEXT
+         return (const char *)current_task->stack + current_task->stacksize;
+ #else
++        return 0;
++#endif
++#else
+     return 0;
+ #endif
+ }
diff --git a/package/wvstreams/wvstreams-0002-fix-uClibc-compile-execinfo-backtrace.patch b/package/wvstreams/wvstreams-0002-fix-uClibc-compile-execinfo-backtrace.patch
new file mode 100644
index 0000000..c6317da
--- /dev/null
+++ b/package/wvstreams/wvstreams-0002-fix-uClibc-compile-execinfo-backtrace.patch
@@ -0,0 +1,31 @@
+Fix wvstreams so that it builds with uClibc: we don't have execinfo.h,
+so we can't do backtrace() stuff.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/utils/wvcrash.cc b/utils/wvcrash.cc
+--- a/utils/wvcrash.cc	2008-12-17 12:24:20.000000000 +0000
++++ b/utils/wvcrash.cc	2012-07-27 22:00:15.456502262 +0100
+@@ -28,7 +28,9 @@
+ // FIXME: this file mostly only works in Linux
+ #ifdef __linux
+ 
+-# include <execinfo.h>
++#ifdef HAVE_EXECINFO_H
++#include <execinfo.h>
++#endif
+ #include <unistd.h>
+ 
+ #ifdef __USE_GNU
+@@ -267,9 +269,11 @@ static void wvcrash_real(int sig, int fd
+ 	}
+     }
+ 
++#ifdef HAVE_EXECINFO_H
+     wr(fd, "\nBacktrace:\n");
+     backtrace_symbols_fd(trace,
+ 		 backtrace(trace, sizeof(trace)/sizeof(trace[0])), fd);
++#endif
+     
+     if (pid > 0)
+     {
diff --git a/package/wvstreams/wvstreams-0003-fix-uClibc-compile-misc.patch b/package/wvstreams/wvstreams-0003-fix-uClibc-compile-misc.patch
new file mode 100644
index 0000000..690a961
--- /dev/null
+++ b/package/wvstreams/wvstreams-0003-fix-uClibc-compile-misc.patch
@@ -0,0 +1,16 @@
+Fix wvstreams so that it builds with uClibc: const cast problem.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/crypto/wvx509.cc b/crypto/wvx509.cc
+--- a/crypto/wvx509.cc	2008-10-23 21:23:49.000000000 +0100
++++ b/crypto/wvx509.cc	2012-06-15 18:45:06.605899292 +0100
+@@ -1157,7 +1157,7 @@ WvString WvX509::get_extension(int nid)
+         
+         if (ext)
+         {
+-            X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
++          X509V3_EXT_METHOD *method = const_cast<X509V3_EXT_METHOD *>(X509V3_EXT_get(ext));
+             if (!method)
+             {
+                 WvDynBuf buf;
diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
new file mode 100644
index 0000000..341fc09
--- /dev/null
+++ b/package/wvstreams/wvstreams.mk
@@ -0,0 +1,51 @@
+#############################################################
+#
+# wvstreams
+#
+#############################################################
+
+WVSTREAMS_VERSION = 4.6.1
+WVSTREAMS_SITE = http://wvstreams.googlecode.com/files
+WVSTREAMS_DEPENDENCIES = openssl zlib
+WVSTREAMS_INSTALL_STAGING = YES
+
+WVSTREAMS_LICENSE = LGPLv2+
+WVSTREAMS_LICENSE_FILES = LICENSE
+
+# N.B. parallel make fails
+WVSTREAMS_MAKE = $(MAKE1)
+
+# Needed to work around problem with wvassert.h
+WVSTREAMS_CONF_OPT += CPPFLAGS=-DNDEBUG
+
+WVSTREAMS_CONF_OPT += --with-openssl --with-zlib --without-pam
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+	WVSTREAMS_DEPENDENCIES += dbus
+	WVSTREAMS_CONF_OPT += --with-dbus
+else
+	WVSTREAMS_CONF_OPT += --without-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_TCL),y)
+	WVSTREAMS_DEPENDENCIES += tcl
+	WVSTREAMS_CONF_OPT += --with-tcl
+else
+	WVSTREAMS_CONF_OPT += --without-tcl
+endif
+
+ifeq ($(BR2_PACKAGE_QT),y)
+	WVSTREAMS_DEPENDENCIES += qt
+	WVSTREAMS_CONF_OPT += --with-qt
+else
+	WVSTREAMS_CONF_OPT += --without-qt
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+	WVSTREAMS_DEPENDENCIES += valgrind
+	WVSTREAMS_CONF_OPT += --with-valgrind
+else
+	WVSTREAMS_CONF_OPT += --without-valgrind
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
