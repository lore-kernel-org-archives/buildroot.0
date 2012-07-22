From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 22 Jul 2012 15:28:39 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_11/11=5D_libecore=3A_fix_build_wit?=
	=?utf-8?q?h_glibc_=3E=3D2=2E16?=
In-Reply-To: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1342963719-1810-12-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch

diff --git a/package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch b/package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch
new file mode 100644
index 0000000..9d53dfd
--- /dev/null
+++ b/package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch
@@ -0,0 +1,62 @@
+This patch fix build with glibc-2.16, avoiding the following error occurs:
+
+Making all in ecore
+make[6]: Entering directory `/opt/buildroot/output/build/host-libecore-1.1.0/src/lib/ecore'
+  CC     ecore.lo
+  CC     ecore_anim.lo
+  CC     ecore_app.lo
+  CC     ecore_events.lo
+  CC     ecore_getopt.lo
+  CC     ecore_idle_enterer.lo
+  CC     ecore_idle_exiter.lo
+  CC     ecore_idler.lo
+  CC     ecore_job.lo
+  CC     ecore_main.lo
+  CC     ecore_pipe.lo
+  CC     ecore_poll.lo
+  CC     ecore_time.lo
+  CC     ecore_timer.lo
+  CC     ecore_thread.lo
+  CC     ecore_glib.lo
+  CC     ecore_throttle.lo
+  CC     ecore_signal.lo
+  CC     ecore_exe.lo
+ecore_exe.c: In function ?ecore_exe_pipe_run?:
+ecore_exe.c:486:15: warning: implicit declaration of function ?setpriority? [-Wimplicit-function-declaration]
+ecore_exe.c:486:27: error ?PRIO_PROCESS? undeclared (first use in this function)
+ecore_exe.c:486:27: note: each undeclared identifier is reported only once for each function it appears in
+make[6]: *** [ecore_exe.lo] Error 1
+
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+diff -purN host-libecore-1.1.0.orig/src/lib/ecore/ecore_exe.c host-libecore-1.1.0/src/lib/ecore/ecore_exe.c
+--- host-libecore-1.1.0.orig/src/lib/ecore/ecore_exe.c	2011-10-21 07:37:11.000000000 +0200
++++ host-libecore-1.1.0/src/lib/ecore/ecore_exe.c	2012-07-22 10:46:00.362956073 +0200
+@@ -2,11 +2,6 @@
+ # include <config.h>
+ #endif
+ 
+-#if defined (__FreeBSD__) || defined (__OpenBSD__) || defined (__NetBSD__)
+-# include <sys/time.h>
+-# include <sys/resource.h>
+-#endif
+-
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -15,6 +10,13 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ 
++#if defined (__FreeBSD__) || defined (__OpenBSD__) || defined (__NetBSD__) || ( defined(__linux__) && defined(__GLIBC__) && !defined(__UCLIBC__) && __GLIBC_PREREQ(2, 16) )
++# if !defined(__linux__)
++#  include <sys/time.h>
++# endif
++# include <sys/resource.h>
++#endif
++
+ #ifdef HAVE_SYS_PRCTL_H
+ # include <sys/prctl.h>
+ #endif
-- 
1.7.11.2
