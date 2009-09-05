From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Sep 2009 15:24:12 +0200
Subject: [Buildroot] [git commit master] busybox: 1.15.0 inetd fix
Message-ID: <20090905132509.3D75377785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6538b1d1e719778d02830f4d3d2975c36e6555cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.15.0-inetd.patch |   58 ++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.15.0-inetd.patch

diff --git a/package/busybox/busybox-1.15.0-inetd.patch b/package/busybox/busybox-1.15.0-inetd.patch
new file mode 100644
index 0000000..c8d241c
--- /dev/null
+++ b/package/busybox/busybox-1.15.0-inetd.patch
@@ -0,0 +1,58 @@
+diff -urpN busybox-1.15.0/networking/inetd.c busybox-1.15.0-inetd/networking/inetd.c
+--- busybox-1.15.0/networking/inetd.c	2009-08-21 00:26:14.000000000 +0200
++++ busybox-1.15.0-inetd/networking/inetd.c	2009-09-04 03:50:03.000000000 +0200
+@@ -1031,10 +1031,10 @@ static void reap_child(int sig UNUSED_PA
+ 				continue;
+ 			/* One of our "wait" services */
+ 			if (WIFEXITED(status) && WEXITSTATUS(status))
+-				bb_error_msg("%s: exit status 0x%x",
++				bb_error_msg("%s: exit status %u",
+ 						sep->se_program, WEXITSTATUS(status));
+ 			else if (WIFSIGNALED(status))
+-				bb_error_msg("%s: exit signal 0x%x",
++				bb_error_msg("%s: exit signal %u",
+ 						sep->se_program, WTERMSIG(status));
+ 			sep->se_wait = 1;
+ 			add_fd_to_set(sep->se_fd);
+@@ -1119,7 +1119,12 @@ int inetd_main(int argc UNUSED_PARAM, ch
+ 	else
+ 		bb_sanitize_stdio();
+ 	if (!(opt & 4)) {
+-		openlog(applet_name, LOG_PID, LOG_DAEMON);
++		/* LOG_NDELAY: connect to syslog daemon NOW.
++		 * Otherwise, we may open syslog socket
++		 * in vforked child, making opened fds and syslog()
++		 * internal state inconsistent.
++		 * This was observed to leak file descriptors. */
++		openlog(applet_name, LOG_PID | LOG_NDELAY, LOG_DAEMON);
+ 		logmode = LOGMODE_SYSLOG;
+ 	}
+ 
+@@ -1355,17 +1360,23 @@ int inetd_main(int argc UNUSED_PARAM, ch
+ 			if (rlim_ofile.rlim_cur != rlim_ofile_cur)
+ 				if (setrlimit(RLIMIT_NOFILE, &rlim_ofile) < 0)
+ 					bb_perror_msg("setrlimit");
+-			closelog();
++
++			/* closelog(); - WRONG. we are after vfork,
++			 * this may confuse syslog() internal state.
++			 * Let's hope libc sets syslog fd to CLOEXEC...
++			 */
+ 			xmove_fd(ctrl, STDIN_FILENO);
+ 			xdup2(STDIN_FILENO, STDOUT_FILENO);
+ 			/* manpages of inetd I managed to find either say
+ 			 * that stderr is also redirected to the network,
+ 			 * or do not talk about redirection@all (!) */
+-			xdup2(STDIN_FILENO, STDERR_FILENO);
+-			/* NB: among others, this loop closes listening socket
++			if (!sep->se_wait) /* only for usual "tcp nowait" */
++				xdup2(STDIN_FILENO, STDERR_FILENO);
++			/* NB: among others, this loop closes listening sockets
+ 			 * for nowait stream children */
+ 			for (sep2 = serv_list; sep2; sep2 = sep2->se_next)
+-				maybe_close(sep2->se_fd);
++				if (sep2->se_fd != ctrl)
++					maybe_close(sep2->se_fd);
+ 			sigaction_set(SIGPIPE, &saved_pipe_handler);
+ 			restore_sigmask(&omask);
+ 			BB_EXECVP(sep->se_program, sep->se_argv);
-- 
1.6.3.3
