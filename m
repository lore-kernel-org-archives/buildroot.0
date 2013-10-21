From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Oct 2013 00:56:04 +0200
Subject: [Buildroot] [PATCH] add no-mmu support for libglib-2.36.3
In-Reply-To: <1382375763-4150-1-git-send-email-aaron.wu@analog.com>
References: <1382375763-4150-1-git-send-email-aaron.wu@analog.com>
Message-ID: <5265B104.9010209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Aaron,

On 21/10/13 19:16, Aaron Wu wrote:
> Signed-off-by: Aaron Wu <aaron.wu@analog.com>
>
> add no-mmu support for libglib-2.36.3
> ---
>   package/libglib2/glib2.36.3_nommu.patch |  354 +++++++++++++++++++++++++++++++
>   1 file changed, 354 insertions(+)
>   create mode 100644 package/libglib2/glib2.36.3_nommu.patch
>
> diff --git a/package/libglib2/glib2.36.3_nommu.patch b/package/libglib2/glib2.36.3_nommu.patch
> new file mode 100644
> index 0000000..192e8af
> --- /dev/null
> +++ b/package/libglib2/glib2.36.3_nommu.patch
> @@ -0,0 +1,354 @@
> +diff -Nur glib-2.36.3/configure.ac glib-2.36.3_new/configure.ac
> +--- glib-2.36.3/configure.ac	2013-06-10 06:53:13.000000000 +0800
> ++++ glib-2.36.3_new/configure.ac	2013-10-21 19:25:28.806513398 +0800
> +@@ -580,7 +580,7 @@
> + # Checks for library functions.
> + AC_FUNC_VPRINTF
> + AC_FUNC_ALLOCA
> +-AC_CHECK_FUNCS(mmap posix_memalign memalign valloc fsync pipe2 issetugid)
> ++AC_CHECK_FUNCS(mmap posix_memalign memalign valloc fsync pipe2 issetugid fork)
> + AC_CHECK_FUNCS(atexit on_exit timegm gmtime_r)
> +
> + AC_CACHE_CHECK([for __libc_enable_secure], glib_cv_have_libc_enable_secure,
> +diff -Nur glib-2.36.3/gio/gtestdbus.c glib-2.36.3_new/gio/gtestdbus.c
> +--- glib-2.36.3/gio/gtestdbus.c	2013-06-03 07:20:49.000000000 +0800
> ++++ glib-2.36.3_new/gio/gtestdbus.c	2013-10-21 21:23:04.350552212 +0800
> +@@ -245,7 +245,11 @@
> +           g_assert_not_reached ();
> +         }
> +
> ++#ifdef HAVE_FORK
> +       switch (fork ())
> ++#else
> ++      switch (vfork ())

  Have you checked if this still works? The child closes some fds, which 
is normally not allowed after vfork. Also, the child seems to wait for 
input for the parent, but with vfork the parent is suspended until the 
child exec's or exits.

> ++#endif
> +         {
> +         case -1:
> +           g_warning ("fork() failed: %m");
> +diff -Nur glib-2.36.3/gio/tests/gdbus-non-socket.c glib-2.36.3_new/gio/tests/gdbus-non-socket.c
> +--- glib-2.36.3/gio/tests/gdbus-non-socket.c	2013-06-10 06:03:17.000000000 +0800
> ++++ glib-2.36.3_new/gio/tests/gdbus-non-socket.c	2013-10-22 00:07:55.686606621 +0800

  For tests, we normally prefer to disable them rather than fixing fork 
calls.

> +@@ -151,7 +151,11 @@
> +   g_assert (G_IS_INPUT_STREAM (g_io_stream_get_input_stream (streams[1])));
> +   g_assert (G_IS_OUTPUT_STREAM (g_io_stream_get_output_stream (streams[1])));
> +
> ++#ifdef HAVE_FORK
> +   switch ((first_child = fork ()))
> ++#else
> ++  switch ((first_child = vfork ()))
> ++#endif
> +     {
> +     case -1:
> +       g_assert_not_reached ();
> +@@ -271,7 +275,11 @@
> +
> +   g_object_unref (connection);
> +   g_main_loop_unref (loop);
> ++#ifdef HAVE_FORK
> +   exit (0);
> ++#else
> ++  _exit (0);
> ++#endif
> + }
> +
> + #else /* G_OS_UNIX */
> +diff -Nur glib-2.36.3/gio/tests/socket.c glib-2.36.3_new/gio/tests/socket.c
> +--- glib-2.36.3/gio/tests/socket.c	2013-06-03 07:20:53.000000000 +0800
> ++++ glib-2.36.3_new/gio/tests/socket.c	2013-10-21 23:54:59.222602354 +0800
> +@@ -756,7 +756,11 @@
> +   status = socketpair (PF_UNIX, SOCK_STREAM, 0, sv);
> +   g_assert_cmpint (status, ==, 0);
> +
> ++#ifdef HAVE_FORK
> +   pid = fork ();
> ++#else
> ++  pid = vfork ();
> ++#endif
> +   g_assert_cmpint (pid, >=, 0);
> +
> +   /* Child: close its copy of the write end of the pipe, receive it
> +@@ -787,7 +791,11 @@
> + 	len = write (fd, TEST_DATA, sizeof (TEST_DATA));
> +       while (len == -1 && errno == EINTR);
> +       g_assert_cmpint (len, ==, sizeof (TEST_DATA));
> ++#ifdef HAVE_FORK
> +       exit (0);
> ++#else
> ++      _exit (0);
> ++#endif
> +     }
> +   else
> +     {
> +diff -Nur glib-2.36.3/glib/gbacktrace.c glib-2.36.3_new/glib/gbacktrace.c
> +--- glib-2.36.3/glib/gbacktrace.c	2013-06-03 07:20:49.000000000 +0800
> ++++ glib-2.36.3_new/glib/gbacktrace.c	2013-10-21 20:55:48.758543214 +0800
> +@@ -242,7 +242,11 @@
> +   args[1] = (gchar*) prg_name;
> +   args[2] = buf;
> +
> ++#ifdef HAVE_FORK
> +   pid = fork ();
> ++#else
> ++  pid = vfork ();

  This also looks like one that can't be replaced with vfork.

> ++#endif
> +   if (pid == 0)
> +     {
> +       stack_trace (args);
> +@@ -295,7 +299,11 @@
> +       _exit (0);
> +     }
> +
> ++#ifdef HAVE_FORK
> +   pid = fork ();
> ++#else
> ++  pid = vfork ();

  Same here.

> ++#endif
> +   if (pid == 0)
> +     {
> +       close (0); dup (in_fd[0]);   /* set the stdin to the in pipe */
> +diff -Nur glib-2.36.3/glib/gspawn.c glib-2.36.3_new/glib/gspawn.c
> +--- glib-2.36.3/glib/gspawn.c	2013-06-10 06:03:18.000000000 +0800
> ++++ glib-2.36.3_new/glib/gspawn.c	2013-10-21 19:39:13.410517935 +0800
> +@@ -1332,7 +1332,11 @@
> +   if (standard_error && !make_pipe (stderr_pipe, error))
> +     goto cleanup_and_fail;
> +
> ++#ifdef HAVE_FORK
> +   pid = fork ();
> ++#else
> ++  pid = vfork ();
> ++#endif
> +
> +   if (pid < 0)
> +     {
> +@@ -1382,7 +1386,11 @@
> +            */
> +           GPid grandchild_pid;
> +
> ++#ifdef HAVE_FORK
> +           grandchild_pid = fork ();
> ++#else
> ++          grandchild_pid = vfork ();

  This looks like one that may work, but it really should be tested 
extensively...

> ++#endif
> +
> +           if (grandchild_pid < 0)
> +             {
> +diff -Nur glib-2.36.3/glib/gtestutils.c glib-2.36.3_new/glib/gtestutils.c
> +--- glib-2.36.3/glib/gtestutils.c	2013-06-10 06:03:18.000000000 +0800
> ++++ glib-2.36.3_new/glib/gtestutils.c	2013-10-21 19:40:56.330518502 +0800
> +@@ -2204,7 +2204,11 @@
> +   if (pipe (stdout_pipe) < 0 || pipe (stderr_pipe) < 0 || pipe (stdtst_pipe) < 0)
> +     g_error ("failed to create pipes to fork test program: %s", g_strerror (errno));
> +   signal (SIGCHLD, SIG_DFL);
> ++#ifdef HAVE_FORK
> +   test_trap_last_pid = fork ();
> ++#else
> ++  test_trap_last_pid = vfork ();

  This one also does fd manipulation in the child so probably won't work.

> ++#endif
> +   if (test_trap_last_pid < 0)
> +     g_error ("failed to fork test program: %s", g_strerror (errno));
> +   if (test_trap_last_pid == 0)  /* child */
[snip]

  Bottom line: you're going to have to work with upstream to fix these 
things in a proper way. And I think it's going to take quite a bit of effort.

  One possible work-around would be to disable the functions that rely on 
fork, i.e. assert on entry. If possible, check with upstream what they 
think of such a scenario, but this is something that may be acceptable 
for us even if upstream doesn't like it.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
