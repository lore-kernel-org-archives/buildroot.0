From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 13 Nov 2008 08:32:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081113163253.A43193C877@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-13 08:32:52 -0800 (Thu, 13 Nov 2008)
New Revision: 24030

Log:
busybox: bump 1.12.x version

Added:
   trunk/buildroot/package/busybox/busybox-1.12.2-getopt.patch
   trunk/buildroot/package/busybox/busybox-1.12.2-lineedit.patch

Removed:
   trunk/buildroot/package/busybox/busybox-1.12.1-basename.patch
   trunk/buildroot/package/busybox/busybox-1.12.1-grep.patch
   trunk/buildroot/package/busybox/busybox-1.12.1-lineedit.patch
   trunk/buildroot/package/busybox/busybox-1.12.1-login.patch
   trunk/buildroot/package/busybox/busybox-1.12.1-modprobe.patch
   trunk/buildroot/package/busybox/busybox-1.12.1-standalone.patch
   trunk/buildroot/package/busybox/busybox-1.12.1-vi.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-11-13 14:07:50 UTC (rev 24029)
+++ trunk/buildroot/package/busybox/Config.in	2008-11-13 16:32:52 UTC (rev 24030)
@@ -60,7 +60,7 @@
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
 	default "1.10.4"	if BR2_BUSYBOX_VERSION_1_10_X
 	default "1.11.3"	if BR2_BUSYBOX_VERSION_1_11_X
-	default "1.12.1"	if BR2_BUSYBOX_VERSION_1_12_X
+	default "1.12.2"	if BR2_BUSYBOX_VERSION_1_12_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"

Deleted: trunk/buildroot/package/busybox/busybox-1.12.1-basename.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-basename.patch	2008-11-13 14:07:50 UTC (rev 24029)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-basename.patch	2008-11-13 16:32:52 UTC (rev 24030)
@@ -1,10 +0,0 @@
-diff -urpN busybox-1.12.1/coreutils/basename.c busybox-1.12.1-basename/coreutils/basename.c
---- busybox-1.12.1/coreutils/basename.c	2008-09-28 20:04:18.000000000 +0200
-+++ busybox-1.12.1-basename/coreutils/basename.c	2008-11-06 16:10:54.000000000 +0100
-@@ -48,5 +48,5 @@ int basename_main(int argc, char **argv)
- 
- 	/* puts(s) will do, but we can do without stdio this way: */
- 	s[m++] = '\n';
--	return full_write(STDOUT_FILENO, s, m) == (ssize_t)m;
-+	return full_write(STDOUT_FILENO, s, m) != (ssize_t)m;
- }

Deleted: trunk/buildroot/package/busybox/busybox-1.12.1-grep.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-grep.patch	2008-11-13 14:07:50 UTC (rev 24029)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-grep.patch	2008-11-13 16:32:52 UTC (rev 24030)
@@ -1,27 +0,0 @@
---- busybox-1.12.1/findutils/grep.c	Sun Sep 28 20:04:28 2008
-+++ busybox-1.12.1-grep/findutils/grep.c	Wed Oct  1 00:45:49 2008
-@@ -363,12 +363,22 @@
- 						 * (unless -v: -Fov doesnt print anything at all) */
- 						if (found)
- 							print_line(gl->pattern, strlen(gl->pattern), linenum, ':');
--					} else {
-+					} else while (1) {
-+						char old = line[gl->matched_range.rm_eo];
- 						line[gl->matched_range.rm_eo] = '\0';
- 						print_line(line + gl->matched_range.rm_so,
- 								gl->matched_range.rm_eo - gl->matched_range.rm_so,
- 								linenum, ':');
--					}
-+						line[gl->matched_range.rm_eo] = old;
-+#if !ENABLE_EXTRA_COMPAT
-+						break;
-+#else
-+						if (re_search(&gl->compiled_regex, line, line_len,
-+								gl->matched_range.rm_eo, line_len - gl->matched_range.rm_eo, 
-+								&gl->matched_range) < 0)
-+							break;
-+#endif
-+					} 
- 				} else {
- 					print_line(line, line_len, linenum, ':');
- 				}

Deleted: trunk/buildroot/package/busybox/busybox-1.12.1-lineedit.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-lineedit.patch	2008-11-13 14:07:50 UTC (rev 24029)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-lineedit.patch	2008-11-13 16:32:52 UTC (rev 24030)
@@ -1,12 +0,0 @@
---- busybox-1.12.1/libbb/lineedit.c	Sun Sep 28 20:04:20 2008
-+++ busybox-1.12.1-lineedit/libbb/lineedit.c	Sun Nov  2 01:39:52 2008
-@@ -1415,7 +1415,8 @@
- 	if ((state->flags & SAVE_HISTORY) && state->hist_file)
- 		load_history(state->hist_file);
- #endif
--	state->cur_history = state->cnt_history;
-+	if (state->flags & DO_HISTORY)
-+		state->cur_history = state->cnt_history;
- 
- 	/* prepare before init handlers */
- 	cmdedit_y = 0;  /* quasireal y, not true if line > xt*yt */

Deleted: trunk/buildroot/package/busybox/busybox-1.12.1-login.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-login.patch	2008-11-13 14:07:50 UTC (rev 24029)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-login.patch	2008-11-13 16:32:52 UTC (rev 24030)
@@ -1,25 +0,0 @@
---- busybox-1.12.1/libbb/setup_environment.c	Sun Sep 28 20:04:20 2008
-+++ busybox-1.12.1-login/libbb/setup_environment.c	Fri Oct 31 00:56:51 2008
-@@ -32,15 +32,15 @@
- 
- void FAST_FUNC setup_environment(const char *shell, int clear_env, int change_env, const struct passwd *pw)
- {
-+	/* Change the current working directory to be the home directory
-+	 * of the user */
-+	if (chdir(pw->pw_dir)) {
-+		xchdir("/");
-+		bb_error_msg("can't chdir to home directory '%s'", pw->pw_dir);
-+	}
-+
- 	if (clear_env) {
- 		const char *term;
--
--		/* Change the current working directory to be the home directory
--		 * of the user */
--		if (chdir(pw->pw_dir)) {
--			xchdir("/");
--			bb_error_msg("can't chdir to home directory '%s'", pw->pw_dir);
--		}
- 
- 		/* Leave TERM unchanged. Set HOME, SHELL, USER, LOGNAME, PATH.
- 		   Unset all other environment variables.  */

Deleted: trunk/buildroot/package/busybox/busybox-1.12.1-modprobe.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-modprobe.patch	2008-11-13 14:07:50 UTC (rev 24029)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-modprobe.patch	2008-11-13 16:32:52 UTC (rev 24030)
@@ -1,33 +0,0 @@
-diff -urpN busybox-1.12.1/modutils/modprobe.c busybox-1.12.1-modprobe/modutils/modprobe.c
---- busybox-1.12.1/modutils/modprobe.c	2008-09-28 20:04:15.000000000 +0200
-+++ busybox-1.12.1-modprobe/modutils/modprobe.c	2008-10-10 14:36:58.000000000 +0200
-@@ -263,9 +263,9 @@ static int FAST_FUNC include_conf_dir_ac
- 	return TRUE;
- }
- 
--static int include_conf_recursive(struct include_conf_t *conf, const char *filename)
-+static int include_conf_recursive(struct include_conf_t *conf, const char *filename, int flags)
- {
--	return recursive_action(filename, ACTION_RECURSE,
-+	return recursive_action(filename, ACTION_RECURSE | flags,
- 				include_conf_file_act,
- 				include_conf_dir_act,
- 				conf, 1);
-@@ -362,7 +362,7 @@ static int FAST_FUNC include_conf_file_a
- 			char *includefile;
- 
- 			includefile = skip_whitespace(line_buffer + 8);
--			include_conf_recursive(conf, includefile);
-+			include_conf_recursive(conf, includefile, 0);
- 		} else if (ENABLE_FEATURE_MODPROBE_BLACKLIST &&
- 				(is_conf_command(line_buffer, "blacklist"))) {
- 			char *mod;
-@@ -559,7 +559,7 @@ static struct dep_t *build_dep(void)
- 		if (ENABLE_FEATURE_2_6_MODULES) {
- 			if (include_conf_file(&conf, "/etc/modprobe.conf"))
- 				r = TRUE;
--			if (include_conf_recursive(&conf, "/etc/modprobe.d"))
-+			if (include_conf_recursive(&conf, "/etc/modprobe.d", ACTION_QUIET))
- 				r = TRUE;
- 		}
- 		if (ENABLE_FEATURE_2_4_MODULES && !r)

Deleted: trunk/buildroot/package/busybox/busybox-1.12.1-standalone.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-standalone.patch	2008-11-13 14:07:50 UTC (rev 24029)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-standalone.patch	2008-11-13 16:32:52 UTC (rev 24030)
@@ -1,185 +0,0 @@
-diff -urpN busybox-1.12.1/coreutils/env.c busybox-1.12.1-standalone/coreutils/env.c
---- busybox-1.12.1/coreutils/env.c	2008-09-28 20:04:18.000000000 +0200
-+++ busybox-1.12.1-standalone/coreutils/env.c	2008-10-20 10:21:54.000000000 +0200
-@@ -29,6 +29,8 @@
-  * - use xfunc_error_retval
-  */
- 
-+/* This is a NOEXEC applet. Be very careful! */
-+
- #include "libbb.h"
- 
- #if ENABLE_FEATURE_ENV_LONG_OPTIONS
-@@ -119,5 +121,3 @@ int env_main(int argc UNUSED_PARAM, char
-  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-  * SUCH DAMAGE.
-  */
--
--
-diff -urpN busybox-1.12.1/include/applets.h busybox-1.12.1-standalone/include/applets.h
---- busybox-1.12.1/include/applets.h	2008-09-28 20:04:26.000000000 +0200
-+++ busybox-1.12.1-standalone/include/applets.h	2008-10-20 10:21:54.000000000 +0200
-@@ -136,7 +136,7 @@ USE_ECHO(APPLET_NOFORK(echo, echo, _BB_D
- USE_ED(APPLET(ed, _BB_DIR_BIN, _BB_SUID_NEVER))
- USE_FEATURE_GREP_EGREP_ALIAS(APPLET_ODDNAME(egrep, grep, _BB_DIR_BIN, _BB_SUID_NEVER, egrep))
- USE_EJECT(APPLET(eject, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
--USE_ENV(APPLET(env, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
-+USE_ENV(APPLET_NOEXEC(env, env, _BB_DIR_USR_BIN, _BB_SUID_NEVER, env))
- USE_ENVDIR(APPLET_ODDNAME(envdir, chpst, _BB_DIR_USR_BIN, _BB_SUID_NEVER, envdir))
- USE_ENVUIDGID(APPLET_ODDNAME(envuidgid, chpst, _BB_DIR_USR_BIN, _BB_SUID_NEVER, envuidgid))
- USE_ETHER_WAKE(APPLET_ODDNAME(ether-wake, ether_wake, _BB_DIR_USR_BIN, _BB_SUID_NEVER, ether_wake))
-@@ -171,7 +171,7 @@ USE_GREP(APPLET(grep, _BB_DIR_BIN, _BB_S
- USE_GUNZIP(APPLET(gunzip, _BB_DIR_BIN, _BB_SUID_NEVER))
- USE_GZIP(APPLET(gzip, _BB_DIR_BIN, _BB_SUID_NEVER))
- USE_HALT(APPLET(halt, _BB_DIR_SBIN, _BB_SUID_NEVER))
--USE_HD(APPLET_ODDNAME(hd, hexdump, _BB_DIR_USR_BIN, _BB_SUID_NEVER, hd))
-+USE_HD(APPLET_NOEXEC(hd, hexdump, _BB_DIR_USR_BIN, _BB_SUID_NEVER, hd))
- USE_HDPARM(APPLET(hdparm, _BB_DIR_SBIN, _BB_SUID_NEVER))
- USE_HEAD(APPLET(head, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
- USE_HEXDUMP(APPLET_NOEXEC(hexdump, hexdump, _BB_DIR_USR_BIN, _BB_SUID_NEVER, hexdump))
-diff -urpN busybox-1.12.1/libbb/getopt32.c busybox-1.12.1-standalone/libbb/getopt32.c
---- busybox-1.12.1/libbb/getopt32.c	2008-09-28 20:04:20.000000000 +0200
-+++ busybox-1.12.1-standalone/libbb/getopt32.c	2008-10-20 10:21:34.000000000 +0200
-@@ -515,28 +515,6 @@ getopt32(char **argv, const char *applet
- 		}
- 	}
- 
--	/* In case getopt32 was already called:
--	 * reset the libc getopt() function, which keeps internal state.
--	 *
--	 * BSD-derived getopt() functions require that optind be set to 1 in
--	 * order to reset getopt() state.  This used to be generally accepted
--	 * way of resetting getopt().  However, glibc's getopt()
--	 * has additional getopt() state beyond optind, and requires that
--	 * optind be set to zero to reset its state.  So the unfortunate state of
--	 * affairs is that BSD-derived versions of getopt() misbehave if
--	 * optind is set to 0 in order to reset getopt(), and glibc's getopt()
--	 * will core dump if optind is set 1 in order to reset getopt().
--	 *
--	 * More modern versions of BSD require that optreset be set to 1 in
--	 * order to reset getopt().   Sigh.  Standards, anyone?
--	 */
--#ifdef __GLIBC__
--	optind = 0;
--#else /* BSD style */
--	optind = 1;
--	/* optreset = 1; */
--#endif
--	/* optarg = NULL; opterr = 0; optopt = 0; - do we need this?? */
- 	pargv = NULL;
- 
- 	/* Note: just "getopt() <= 0" will not work well for
-diff -urpN busybox-1.12.1/libbb/vfork_daemon_rexec.c busybox-1.12.1-standalone/libbb/vfork_daemon_rexec.c
---- busybox-1.12.1/libbb/vfork_daemon_rexec.c	2008-09-28 20:04:20.000000000 +0200
-+++ busybox-1.12.1-standalone/libbb/vfork_daemon_rexec.c	2008-10-20 10:21:34.000000000 +0200
-@@ -125,6 +125,7 @@ int FAST_FUNC run_nofork_applet_prime(st
- 	int rc, argc;
- 
- 	applet_name = APPLET_NAME(applet_no);
-+
- 	xfunc_error_retval = EXIT_FAILURE;
- 
- 	/* Special flag for xfunc_die(). If xfunc will "die"
-@@ -132,7 +133,30 @@ int FAST_FUNC run_nofork_applet_prime(st
- 	 * die_sleep and longjmp here instead. */
- 	die_sleep = -1;
- 
--	/* option_mask32 = 0; - not needed */
-+	/* In case getopt() or getopt32() was already called:
-+	 * reset the libc getopt() function, which keeps internal state.
-+	 *
-+	 * BSD-derived getopt() functions require that optind be set to 1 in
-+	 * order to reset getopt() state.  This used to be generally accepted
-+	 * way of resetting getopt().  However, glibc's getopt()
-+	 * has additional getopt() state beyond optind, and requires that
-+	 * optind be set to zero to reset its state.  So the unfortunate state of
-+	 * affairs is that BSD-derived versions of getopt() misbehave if
-+	 * optind is set to 0 in order to reset getopt(), and glibc's getopt()
-+	 * will core dump if optind is set 1 in order to reset getopt().
-+	 *
-+	 * More modern versions of BSD require that optreset be set to 1 in
-+	 * order to reset getopt().  Sigh.  Standards, anyone?
-+	 */
-+#ifdef __GLIBC__
-+	optind = 0;
-+#else /* BSD style */
-+	optind = 1;
-+	/* optreset = 1; */
-+#endif
-+	/* optarg = NULL; opterr = 1; optopt = 63; - do we need this too? */
-+	/* (values above are what they initialized to in glibc and uclibc) */
-+	/* option_mask32 = 0; - not needed, no applet depends on it being 0 */
- 
- 	argc = 1;
- 	while (argv[argc])
-@@ -161,8 +185,16 @@ int FAST_FUNC run_nofork_applet_prime(st
- 			rc = 0;
- 	}
- 
--	/* Restoring globals */
-+	/* Restoring some globals */
- 	restore_nofork_data(old);
-+
-+	/* Other globals can be simply reset to defaults */
-+#ifdef __GLIBC__
-+	optind = 0;
-+#else /* BSD style */
-+	optind = 1;
-+#endif
-+
- 	return rc & 0xff; /* don't confuse people with "exitcodes" >255 */
- }
- 
-diff -urpN busybox-1.12.1/shell/ash.c busybox-1.12.1-standalone/shell/ash.c
---- busybox-1.12.1/shell/ash.c	2008-09-28 20:04:18.000000000 +0200
-+++ busybox-1.12.1-standalone/shell/ash.c	2008-10-20 10:21:54.000000000 +0200
-@@ -6964,8 +6964,11 @@ tryexec(USE_FEATURE_SH_STANDALONE(int ap
- 
- #if ENABLE_FEATURE_SH_STANDALONE
- 	if (applet_no >= 0) {
--		if (APPLET_IS_NOEXEC(applet_no))
-+		if (APPLET_IS_NOEXEC(applet_no)) {
-+			while (*envp)
-+				putenv(*envp++);
- 			run_applet_no_and_exit(applet_no, argv);
-+		}
- 		/* re-exec ourselves with the new arguments */
- 		execve(bb_busybox_exec_path, argv, envp);
- 		/* If they called chroot or otherwise made the binary no longer
-@@ -12014,7 +12017,7 @@ exportcmd(int argc UNUSED_PARAM, char **
- 	char *name;
- 	const char *p;
- 	char **aptr;
--	int flag = argv[0][0] == 'r'? VREADONLY : VEXPORT;
-+	int flag = argv[0][0] == 'r' ? VREADONLY : VEXPORT;
- 
- 	if (nextopt("p") != 'p') {
- 		aptr = argptr;
-diff -urpN busybox-1.12.1/util-linux/getopt.c busybox-1.12.1-standalone/util-linux/getopt.c
---- busybox-1.12.1/util-linux/getopt.c	2008-09-28 20:04:30.000000000 +0200
-+++ busybox-1.12.1-standalone/util-linux/getopt.c	2008-10-20 10:21:34.000000000 +0200
-@@ -142,7 +142,8 @@ static const char *normalize(const char 
-  * Other settings are found in global variables.
-  */
- #if !ENABLE_GETOPT_LONG
--#define generate_output(argv,argc,optstr,longopts) generate_output(argv,argc,optstr)
-+#define generate_output(argv,argc,optstr,longopts) \
-+	generate_output(argv,argc,optstr)
- #endif
- static int generate_output(char **argv, int argc, const char *optstr, const struct option *longopts)
- {
-@@ -156,14 +157,6 @@ static int generate_output(char **argv, 
- 	if (quiet_errors) /* No error reporting from getopt(3) */
- 		opterr = 0;
- 
--	/* Reset getopt(3) (see libbb/getopt32.c for long rant) */
--#ifdef __GLIBC__
--	optind = 0;
--#else /* BSD style */
--	optind = 1;
--	/* optreset = 1; */
--#endif
--
- 	while (1) {
- 		opt =
- #if ENABLE_GETOPT_LONG

Deleted: trunk/buildroot/package/busybox/busybox-1.12.1-vi.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-vi.patch	2008-11-13 14:07:50 UTC (rev 24029)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-vi.patch	2008-11-13 16:32:52 UTC (rev 24030)
@@ -1,46 +0,0 @@
---- busybox-1.12.1/editors/vi.c	Sun Sep 28 20:04:29 2008
-+++ busybox-1.12.1-vi/editors/vi.c	Thu Oct 30 23:54:30 2008
-@@ -291,6 +291,8 @@
- #define INIT_G() do { \
- 	SET_PTR_TO_GLOBALS(xzalloc(sizeof(G))); \
- 	last_file_modified = -1; \
-+	/* "" but has space for 2 chars */ \
-+	USE_FEATURE_VI_SEARCH(last_search_pattern = xzalloc(2);) \
- } while (0)
- 
- 
-@@ -2974,7 +2976,7 @@
- 	const char *msg = msg; // for compiler
- 	char c1, *p, *q, *save_dot;
- 	char buf[12];
--	int dir = dir; // for compiler
-+	int dir;
- 	int cnt, i, j;
- 
- //	c1 = c; // quiet the compiler
-@@ -3316,7 +3318,7 @@
- 		q = get_input_line(buf);	// get input line- use "status line"
- 		if (q[0] && !q[1]) {
- 			if (last_search_pattern[0])
--			    last_search_pattern[0] = c;
-+				last_search_pattern[0] = c;
- 			goto dc3; // if no pat re-use old pat
- 		}
- 		if (q[0]) {       // strlen(q) > 1: new pat- save it and find
-@@ -3346,14 +3348,8 @@
- 			do_cmd(c);
- 		}				// repeat cnt
-  dc3:
--		if (last_search_pattern == 0) {
--			msg = "No previous regular expression";
--			goto dc2;
--		}
--		if (last_search_pattern[0] == '/') {
--			dir = FORWARD;	// assume FORWARD search
--			p = dot + 1;
--		}
-+		dir = FORWARD;	// assume FORWARD search
-+		p = dot + 1;
- 		if (last_search_pattern[0] == '?') {
- 			dir = BACK;
- 			p = dot - 1;

Added: trunk/buildroot/package/busybox/busybox-1.12.2-getopt.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.2-getopt.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.2-getopt.patch	2008-11-13 16:32:52 UTC (rev 24030)
@@ -0,0 +1,22 @@
+--- busybox-1.12.2/libbb/getopt32.c	Sun Nov  9 18:20:37 2008
++++ busybox-1.12.2-getopt/libbb/getopt32.c	Wed Nov 12 23:03:33 2008
+@@ -515,6 +515,19 @@
+ 		}
+ 	}
+ 
++	/* In case getopt32 was already called:
++	 * reset the libc getopt() function, which keeps internal state.
++	 * run_nofork_applet_prime() does this, but we might end up here
++	 * also via gunzip_main() -> gzip_main(). Play safe.
++	 */
++#ifdef __GLIBC__
++	optind = 0;
++#else /* BSD style */
++	optind = 1;
++	/* optreset = 1; */
++#endif
++	/* optarg = NULL; opterr = 0; optopt = 0; - do we need this?? */
++
+ 	pargv = NULL;
+ 
+ 	/* Note: just "getopt() <= 0" will not work well for

Added: trunk/buildroot/package/busybox/busybox-1.12.2-lineedit.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.2-lineedit.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.2-lineedit.patch	2008-11-13 16:32:52 UTC (rev 24030)
@@ -0,0 +1,13 @@
+--- busybox-1.12.2/libbb/lineedit.c	Sun Nov  9 18:20:16 2008
++++ busybox-1.12.2-lineedit/libbb/lineedit.c	Tue Nov 11 21:02:04 2008
+@@ -1415,8 +1415,10 @@
+ 	if ((state->flags & SAVE_HISTORY) && state->hist_file)
+ 		load_history(state->hist_file);
+ #endif
++#if MAX_HISTORY > 0
+ 	if (state->flags & DO_HISTORY)
+ 		state->cur_history = state->cnt_history;
++#endif
+ 
+ 	/* prepare before init handlers */
+ 	cmdedit_y = 0;  /* quasireal y, not true if line > xt*yt */
