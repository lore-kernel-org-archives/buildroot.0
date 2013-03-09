From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Mar 2013 19:21:29 +0100
Subject: [Buildroot] [PATCH 4/5] libglib2: fix noMMU build
In-Reply-To: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362853290-15592-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2-nommu.patch |  109 +++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 package/libglib2/libglib2-nommu.patch

diff --git a/package/libglib2/libglib2-nommu.patch b/package/libglib2/libglib2-nommu.patch
new file mode 100644
index 0000000..364dbe9
--- /dev/null
+++ b/package/libglib2/libglib2-nommu.patch
@@ -0,0 +1,109 @@
+Fix build on noMMU platforms
+
+Use vfork() instead fork() on noMMU platforms.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: libglib2-2.30.3/configure.ac
+===================================================================
+--- libglib2-2.30.3.orig/configure.ac	2013-03-09 17:25:38.000000000 +0100
++++ libglib2-2.30.3/configure.ac	2013-03-09 17:30:55.000000000 +0100
+@@ -578,7 +578,7 @@
+ # Checks for library functions.
+ AC_FUNC_VPRINTF
+ AC_FUNC_ALLOCA
+-AC_CHECK_FUNCS(mmap posix_memalign memalign valloc fsync pipe2)
++AC_CHECK_FUNCS(mmap posix_memalign memalign valloc fsync pipe2 fork)
+ AC_CHECK_FUNCS(atexit on_exit timegm gmtime_r)
+ 
+ dnl don't use AC_CHECK_FUNCS here, otherwise HAVE_QSORT_R will
+Index: libglib2-2.30.3/gio/libasyncns/asyncns.c
+===================================================================
+--- libglib2-2.30.3.orig/gio/libasyncns/asyncns.c	2013-03-09 17:25:38.000000000 +0100
++++ libglib2-2.30.3/gio/libasyncns/asyncns.c	2013-03-09 17:30:55.000000000 +0100
+@@ -804,8 +804,13 @@
+     for (asyncns->valid_workers = 0; asyncns->valid_workers < n_proc; asyncns->valid_workers++) {
+ 
+ #ifndef HAVE_PTHREAD
++#ifdef HAVE_FORK
+         if ((asyncns->workers[asyncns->valid_workers] = fork()) < 0)
+             goto fail;
++#else
++        if ((asyncns->workers[asyncns->valid_workers] = vfork()) < 0)
++            goto fail;
++#endif
+         else if (asyncns->workers[asyncns->valid_workers] == 0) {
+             int ret;
+ 
+Index: libglib2-2.30.3/glib/gbacktrace.c
+===================================================================
+--- libglib2-2.30.3.orig/glib/gbacktrace.c	2013-03-09 17:25:38.000000000 +0100
++++ libglib2-2.30.3/glib/gbacktrace.c	2013-03-09 17:30:55.000000000 +0100
+@@ -240,7 +240,11 @@
+   args[1] = (gchar*) prg_name;
+   args[2] = buf;
+ 
++#ifdef HAVE_FORK
+   pid = fork ();
++#else
++  pid = vfork ();
++#endif
+   if (pid == 0)
+     {
+       stack_trace (args);
+@@ -293,7 +297,11 @@
+       _exit (0);
+     }
+ 
++#ifdef HAVE_FORK
+   pid = fork ();
++#else
++  pid = vfork ();
++#endif
+   if (pid == 0)
+     {
+       close (0); dup (in_fd[0]);   /* set the stdin to the in pipe */
+Index: libglib2-2.30.3/glib/gspawn.c
+===================================================================
+--- libglib2-2.30.3.orig/glib/gspawn.c	2013-03-09 17:25:38.000000000 +0100
++++ libglib2-2.30.3/glib/gspawn.c	2013-03-09 17:30:55.000000000 +0100
+@@ -1228,7 +1228,11 @@
+   if (standard_error && !make_pipe (stderr_pipe, error))
+     goto cleanup_and_fail;
+ 
++#ifdef HAVE_FORK
+   pid = fork ();
++#else
++  pid = vfork ();
++#endif
+ 
+   if (pid < 0)
+     {
+@@ -1278,7 +1282,11 @@
+            */
+           GPid grandchild_pid;
+ 
++#ifdef HAVE_FORK
+           grandchild_pid = fork ();
++#else
++	  grandchild_pid = vfork ();
++#endif
+ 
+           if (grandchild_pid < 0)
+             {
+Index: libglib2-2.30.3/glib/gtestutils.c
+===================================================================
+--- libglib2-2.30.3.orig/glib/gtestutils.c	2013-03-09 17:25:38.000000000 +0100
++++ libglib2-2.30.3/glib/gtestutils.c	2013-03-09 17:30:55.000000000 +0100
+@@ -1716,7 +1716,11 @@
+   if (pipe (stdout_pipe) < 0 || pipe (stderr_pipe) < 0 || pipe (stdtst_pipe) < 0)
+     g_error ("failed to create pipes to fork test program: %s", g_strerror (errno));
+   signal (SIGCHLD, SIG_DFL);
++#ifdef HAVE_FORK
+   test_trap_last_pid = fork ();
++#else
++  test_trap_last_pid = vfork ();
++#endif
+   if (test_trap_last_pid < 0)
+     g_error ("failed to fork test program: %s", g_strerror (errno));
+   if (test_trap_last_pid == 0)  /* child */
-- 
1.7.9.5
