From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Jul 2008 06:37:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080701133713.1987B3C650@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-01 06:37:12 -0700 (Tue, 01 Jul 2008)
New Revision: 22591

Log:
busybox 1.11.0: additional fixes

Added:
   trunk/buildroot/package/busybox/busybox-1.11.0-awk.patch
   trunk/buildroot/package/busybox/busybox-1.11.0-ssd.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.11.0-awk.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.11.0-awk.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.11.0-awk.patch	2008-07-01 13:37:12 UTC (rev 22591)
@@ -0,0 +1,88 @@
+--- busybox-1.11.0/editors/awk.c	Wed Jun 25 14:51:37 2008
++++ busybox-1.11.0-awk/editors/awk.c	Tue Jul  1 14:03:37 2008
+@@ -681,11 +681,6 @@
+ 	return (isalnum(c) || c == '_');
+ }
+ 
+-static FILE *afopen(const char *path, const char *mode)
+-{
+-	return (*path == '-' && *(path+1) == '\0') ? stdin : xfopen(path, mode);
+-}
+-
+ /* -------- working with variables (set/get/copy/etc) -------- */
+ 
+ static xhash *iamarray(var *v)
+@@ -2740,7 +2735,7 @@
+ 			ind = getvar_s(incvar(intvar[ARGIND]));
+ 			fname = getvar_s(findvar(iamarray(intvar[ARGV]), ind));
+ 			if (fname && *fname && !is_assignment(fname))
+-				F = afopen(fname, "r");
++				F = xfopen_stdin(fname);
+ 		}
+ 	} while (!F);
+ 
+@@ -2757,8 +2752,9 @@
+ {
+ 	unsigned opt;
+ 	char *opt_F, *opt_W;
+-	llist_t *opt_v = NULL;
+-	int i, j, flen;
++	llist_t *list_v = NULL;
++	llist_t *list_f = NULL;
++	int i, j;
+ 	var *v;
+ 	var tv;
+ 	char **envp;
+@@ -2816,35 +2812,33 @@
+ 			*s1 = '=';
+ 		}
+ 	}
+-	opt_complementary = "v::";
+-	opt = getopt32(argv, "F:v:f:W:", &opt_F, &opt_v, &g_progname, &opt_W);
++	opt_complementary = "v::f::"; /* -v and -f can occur multiple times */
++	opt = getopt32(argv, "F:v:f:W:", &opt_F, &list_v, &list_f, &opt_W);
+ 	argv += optind;
+ 	argc -= optind;
+ 	if (opt & 0x1)
+ 		setvar_s(intvar[FS], opt_F); // -F
+-	while (opt_v) { /* -v */
+-		if (!is_assignment(llist_pop(&opt_v)))
++	while (list_v) { /* -v */
++		if (!is_assignment(llist_pop(&list_v)))
+ 			bb_show_usage();
+ 	}
+-	if (opt & 0x4) { // -f
+-		char *s = s; /* die, gcc, die */
+-		FILE *from_file = afopen(g_progname, "r");
+-		/* one byte is reserved for some trick in next_token */
+-		if (fseek(from_file, 0, SEEK_END) == 0) {
+-			flen = ftell(from_file);
+-			s = xmalloc(flen + 4);
+-			fseek(from_file, 0, SEEK_SET);
+-			i = 1 + fread(s + 1, 1, flen, from_file);
+-		} else {
++	if (list_f) { /* -f */
++		do {
++			char *s = NULL;
++			FILE *from_file;
++
++			g_progname = llist_pop(&list_f);
++			from_file = xfopen_stdin(g_progname);
++			/* one byte is reserved for some trick in next_token */
+ 			for (i = j = 1; j > 0; i += j) {
+ 				s = xrealloc(s, i + 4096);
+ 				j = fread(s + i, 1, 4094, from_file);
+ 			}
+-		}
+-		s[i] = '\0';
+-		fclose(from_file);
+-		parse_program(s + 1);
+-		free(s);
++			s[i] = '\0';
++			fclose(from_file);
++			parse_program(s + 1);
++			free(s);
++		} while (list_f);
+ 	} else { // no -f: take program from 1st parameter
+ 		if (!argc)
+ 			bb_show_usage();

Added: trunk/buildroot/package/busybox/busybox-1.11.0-ssd.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.11.0-ssd.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.11.0-ssd.patch	2008-07-01 13:37:12 UTC (rev 22591)
@@ -0,0 +1,99 @@
+--- busybox-1.11.0/debianutils/start_stop_daemon.c	Wed Jun 25 14:51:26 2008
++++ busybox-1.11.0-ssd/debianutils/start_stop_daemon.c	Tue Jul  1 14:05:05 2008
+@@ -326,7 +326,9 @@
+ 	char *signame;
+ 	char *startas;
+ 	char *chuid;
++#ifdef OLDER_VERSION_OF_X
+ 	struct stat execstat;
++#endif
+ #if ENABLE_FEATURE_START_STOP_DAEMON_FANCY
+ //	char *retry_arg = NULL;
+ //	int retries = -1;
+@@ -361,6 +363,8 @@
+ 
+ 	if (!(opt & OPT_a))
+ 		startas = execname;
++	if (!execname) /* in case -a is given and -x is not */
++		execname = startas;
+ 
+ //	USE_FEATURE_START_STOP_DAEMON_FANCY(
+ //		if (retry_arg)
+@@ -374,7 +378,8 @@
+ 		if (errno)
+ 			user_id = xuname2uid(userspec);
+ 	}
+-	do_procinit(); /* Both start and stop needs to know current processes */
++	/* Both start and stop need to know current processes */
++	do_procinit();
+ 
+ 	if (opt & CTX_STOP) {
+ 		int i = do_stop();
+@@ -383,17 +388,21 @@
+ 
+ 	if (found) {
+ 		if (!QUIET)
+-			printf("%s already running\n%d\n", execname, found->pid);
++			printf("%s is already running\n%u\n", execname, (unsigned)found->pid);
+ 		return !(opt & OPT_OKNODO);
+ 	}
+ 
++#ifdef OLDER_VERSION_OF_X
+ 	if (execname)
+ 		xstat(execname, &execstat);
++#endif
+ 
+ 	*--argv = startas;
+ 	if (opt & OPT_BACKGROUND) {
+ #if BB_MMU
+-		bb_daemonize(0);
++		bb_daemonize(DAEMON_DEVNULL_STDIO + DAEMON_CLOSE_EXTRA_FDS);
++		/* DAEMON_DEVNULL_STDIO is superfluous -
++		 * it's always done by bb_daemonize() */
+ #else
+ 		pid_t pid = vfork();
+ 		if (pid < 0) /* error */
+@@ -404,19 +413,18 @@
+ 			 * so "return 0" may do bad things */
+ 			_exit(EXIT_SUCCESS);
+ 		}
+-		/* child */
++		/* Child */
+ 		setsid(); /* detach from controlling tty */
+ 		/* Redirect stdio to /dev/null, close extra FDs.
+ 		 * We do not actually daemonize because of DAEMON_ONLY_SANITIZE */
+-		bb_daemonize_or_rexec(
+-			DAEMON_DEVNULL_STDIO
++		bb_daemonize_or_rexec(DAEMON_DEVNULL_STDIO
+ 			+ DAEMON_CLOSE_EXTRA_FDS
+ 			+ DAEMON_ONLY_SANITIZE,
+ 			NULL /* argv, unused */ );
+ #endif
+ 	}
+ 	if (opt & OPT_MAKEPID) {
+-		/* user wants _us_ to make the pidfile */
++		/* User wants _us_ to make the pidfile */
+ 		write_pidfile(pidfile);
+ 	}
+ 	if (opt & OPT_c) {
+@@ -434,6 +442,6 @@
+ 		}
+ 	}
+ #endif
+-	execv(startas, argv);
++	execvp(startas, argv);
+ 	bb_perror_msg_and_die("cannot start %s", startas);
+ }
+--- busybox-1.11.0/include/usage.h	Wed Jun 25 14:51:35 2008
++++ busybox-1.11.0-ssd/include/usage.h	Tue Jul  1 14:03:48 2008
+@@ -3637,9 +3637,7 @@
+        "$ cat TODO | split -a 2 -l 2 TODO_\n"
+ 
+ #define start_stop_daemon_trivial_usage \
+-       "[OPTIONS] [" \
+-	USE_GETOPT_LONG("--start|--stop") SKIP_GETOPT_LONG("-S|-K") \
+-       "] ... [-- arguments...]"
++       "[OPTIONS] [-S|-K] ... [-- arguments...]"
+ #define start_stop_daemon_full_usage "\n\n" \
+        "Search for matching processes, and then\n" \
+        "-S: stop all matching processes.\n" \
