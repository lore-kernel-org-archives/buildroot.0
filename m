From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 29 Nov 2008 12:12:18 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081129201218.6160A3C64D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-29 12:12:17 -0800 (Sat, 29 Nov 2008)
New Revision: 24185

Log:
busybox: bump 1.12.x / 1.13.x versions

Removed:
   trunk/buildroot/package/busybox/busybox-1.12.2-getopt.patch
   trunk/buildroot/package/busybox/busybox-1.12.2-lineedit.patch
   trunk/buildroot/package/busybox/busybox-1.13.0-ash.patch
   trunk/buildroot/package/busybox/busybox-1.13.0-getopt.patch
   trunk/buildroot/package/busybox/busybox-1.13.0-id.patch
   trunk/buildroot/package/busybox/busybox-1.13.0-inotify.patch
   trunk/buildroot/package/busybox/busybox-1.13.0-klogd.patch
   trunk/buildroot/package/busybox/busybox-1.13.0-lineedit.patch
   trunk/buildroot/package/busybox/busybox-1.13.0-modprobe.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/Config.in	2008-11-29 20:12:17 UTC (rev 24185)
@@ -65,8 +65,8 @@
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
 	default "1.10.4"	if BR2_BUSYBOX_VERSION_1_10_X
 	default "1.11.3"	if BR2_BUSYBOX_VERSION_1_11_X
-	default "1.12.2"	if BR2_BUSYBOX_VERSION_1_12_X
-	default "1.13.0"	if BR2_BUSYBOX_VERSION_1_13_X
+	default "1.12.3"	if BR2_BUSYBOX_VERSION_1_12_X
+	default "1.13.1"	if BR2_BUSYBOX_VERSION_1_13_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"

Deleted: trunk/buildroot/package/busybox/busybox-1.12.2-getopt.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.2-getopt.patch	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/busybox-1.12.2-getopt.patch	2008-11-29 20:12:17 UTC (rev 24185)
@@ -1,22 +0,0 @@
---- busybox-1.12.2/libbb/getopt32.c	Sun Nov  9 18:20:37 2008
-+++ busybox-1.12.2-getopt/libbb/getopt32.c	Wed Nov 12 23:03:33 2008
-@@ -515,6 +515,19 @@
- 		}
- 	}
- 
-+	/* In case getopt32 was already called:
-+	 * reset the libc getopt() function, which keeps internal state.
-+	 * run_nofork_applet_prime() does this, but we might end up here
-+	 * also via gunzip_main() -> gzip_main(). Play safe.
-+	 */
-+#ifdef __GLIBC__
-+	optind = 0;
-+#else /* BSD style */
-+	optind = 1;
-+	/* optreset = 1; */
-+#endif
-+	/* optarg = NULL; opterr = 0; optopt = 0; - do we need this?? */
-+
- 	pargv = NULL;
- 
- 	/* Note: just "getopt() <= 0" will not work well for

Deleted: trunk/buildroot/package/busybox/busybox-1.12.2-lineedit.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.2-lineedit.patch	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/busybox-1.12.2-lineedit.patch	2008-11-29 20:12:17 UTC (rev 24185)
@@ -1,13 +0,0 @@
---- busybox-1.12.2/libbb/lineedit.c	Sun Nov  9 18:20:16 2008
-+++ busybox-1.12.2-lineedit/libbb/lineedit.c	Tue Nov 11 21:02:04 2008
-@@ -1415,8 +1415,10 @@
- 	if ((state->flags & SAVE_HISTORY) && state->hist_file)
- 		load_history(state->hist_file);
- #endif
-+#if MAX_HISTORY > 0
- 	if (state->flags & DO_HISTORY)
- 		state->cur_history = state->cnt_history;
-+#endif
- 
- 	/* prepare before init handlers */
- 	cmdedit_y = 0;  /* quasireal y, not true if line > xt*yt */

Deleted: trunk/buildroot/package/busybox/busybox-1.13.0-ash.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-ash.patch	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-ash.patch	2008-11-29 20:12:17 UTC (rev 24185)
@@ -1,275 +0,0 @@
---- busybox-1.13.0/shell/ash.c	Thu Oct 30 08:41:32 2008
-+++ busybox-1.13.0-ash/shell/ash.c	Fri Nov 28 04:39:17 2008
-@@ -536,6 +536,7 @@
- #define NHERE    24
- #define NXHERE   25
- #define NNOT     26
-+#define N_NUMBER 27
- 
- union node;
- 
-@@ -7546,43 +7547,46 @@
- 
- /* ============ eval.c */
- 
--static int funcblocksize;          /* size of structures in function */
--static int funcstringsize;         /* size of strings in node */
--static void *funcblock;            /* block to allocate function from */
--static char *funcstring;           /* block to allocate strings from */
-+static int funcblocksize;       /* size of structures in function */
-+static int funcstringsize;      /* size of strings in node */
-+static void *funcblock;         /* block to allocate function from */
-+static char *funcstring;        /* block to allocate strings from */
- 
- /* flags in argument to evaltree */
--#define EV_EXIT 01              /* exit after evaluating tree */
--#define EV_TESTED 02            /* exit status is checked; ignore -e flag */
-+#define EV_EXIT    01           /* exit after evaluating tree */
-+#define EV_TESTED  02           /* exit status is checked; ignore -e flag */
- #define EV_BACKCMD 04           /* command executing within back quotes */
- 
--static const short nodesize[26] = {
--	SHELL_ALIGN(sizeof(struct ncmd)),
--	SHELL_ALIGN(sizeof(struct npipe)),
--	SHELL_ALIGN(sizeof(struct nredir)),
--	SHELL_ALIGN(sizeof(struct nredir)),
--	SHELL_ALIGN(sizeof(struct nredir)),
--	SHELL_ALIGN(sizeof(struct nbinary)),
--	SHELL_ALIGN(sizeof(struct nbinary)),
--	SHELL_ALIGN(sizeof(struct nbinary)),
--	SHELL_ALIGN(sizeof(struct nif)),
--	SHELL_ALIGN(sizeof(struct nbinary)),
--	SHELL_ALIGN(sizeof(struct nbinary)),
--	SHELL_ALIGN(sizeof(struct nfor)),
--	SHELL_ALIGN(sizeof(struct ncase)),
--	SHELL_ALIGN(sizeof(struct nclist)),
--	SHELL_ALIGN(sizeof(struct narg)),
--	SHELL_ALIGN(sizeof(struct narg)),
--	SHELL_ALIGN(sizeof(struct nfile)),
--	SHELL_ALIGN(sizeof(struct nfile)),
--	SHELL_ALIGN(sizeof(struct nfile)),
--	SHELL_ALIGN(sizeof(struct nfile)),
--	SHELL_ALIGN(sizeof(struct nfile)),
--	SHELL_ALIGN(sizeof(struct ndup)),
--	SHELL_ALIGN(sizeof(struct ndup)),
--	SHELL_ALIGN(sizeof(struct nhere)),
--	SHELL_ALIGN(sizeof(struct nhere)),
--	SHELL_ALIGN(sizeof(struct nnot)),
-+static const short nodesize[N_NUMBER] = {
-+	[NCMD     ] = SHELL_ALIGN(sizeof(struct ncmd)),
-+	[NPIPE    ] = SHELL_ALIGN(sizeof(struct npipe)),
-+	[NREDIR   ] = SHELL_ALIGN(sizeof(struct nredir)),
-+	[NBACKGND ] = SHELL_ALIGN(sizeof(struct nredir)),
-+	[NSUBSHELL] = SHELL_ALIGN(sizeof(struct nredir)),
-+	[NAND     ] = SHELL_ALIGN(sizeof(struct nbinary)),
-+	[NOR      ] = SHELL_ALIGN(sizeof(struct nbinary)),
-+	[NSEMI    ] = SHELL_ALIGN(sizeof(struct nbinary)),
-+	[NIF      ] = SHELL_ALIGN(sizeof(struct nif)),
-+	[NWHILE   ] = SHELL_ALIGN(sizeof(struct nbinary)),
-+	[NUNTIL   ] = SHELL_ALIGN(sizeof(struct nbinary)),
-+	[NFOR     ] = SHELL_ALIGN(sizeof(struct nfor)),
-+	[NCASE    ] = SHELL_ALIGN(sizeof(struct ncase)),
-+	[NCLIST   ] = SHELL_ALIGN(sizeof(struct nclist)),
-+	[NDEFUN   ] = SHELL_ALIGN(sizeof(struct narg)),
-+	[NARG     ] = SHELL_ALIGN(sizeof(struct narg)),
-+	[NTO      ] = SHELL_ALIGN(sizeof(struct nfile)),
-+#if ENABLE_ASH_BASH_COMPAT
-+	[NTO2     ] = SHELL_ALIGN(sizeof(struct nfile)),
-+#endif
-+	[NCLOBBER ] = SHELL_ALIGN(sizeof(struct nfile)),
-+	[NFROM    ] = SHELL_ALIGN(sizeof(struct nfile)),
-+	[NFROMTO  ] = SHELL_ALIGN(sizeof(struct nfile)),
-+	[NAPPEND  ] = SHELL_ALIGN(sizeof(struct nfile)),
-+	[NTOFD    ] = SHELL_ALIGN(sizeof(struct ndup)),
-+	[NFROMFD  ] = SHELL_ALIGN(sizeof(struct ndup)),
-+	[NHERE    ] = SHELL_ALIGN(sizeof(struct nhere)),
-+	[NXHERE   ] = SHELL_ALIGN(sizeof(struct nhere)),
-+	[NNOT     ] = SHELL_ALIGN(sizeof(struct nnot)),
- };
- 
- static void calcsize(union node *n);
-@@ -9065,8 +9069,6 @@
-  * This implements the input routines used by the parser.
-  */
- 
--#define EOF_NLEFT -99           /* value of parsenleft when EOF pushed back */
--
- enum {
- 	INPUT_PUSH_FILE = 1,
- 	INPUT_NOFILE_OK = 2,
-@@ -9107,7 +9109,6 @@
- #endif
- 	parsenextc = sp->prevstring;
- 	parsenleft = sp->prevnleft;
--/*dprintf("*** calling popstring: restoring to '%s'\n", parsenextc);*/
- 	g_parsefile->strpush = sp->prev;
- 	if (sp != &(g_parsefile->basestrpush))
- 		free(sp);
-@@ -9123,7 +9124,7 @@
- 
- #if ENABLE_FEATURE_EDITING
-  retry:
--	if (!iflag || g_parsefile->fd)
-+	if (!iflag || g_parsefile->fd != STDIN_FILENO)
- 		nr = nonblock_safe_read(g_parsefile->fd, buf, BUFSIZ - 1);
- 	else {
- #if ENABLE_FEATURE_TAB_COMPLETION
-@@ -9171,55 +9172,76 @@
-  * Refill the input buffer and return the next input character:
-  *
-  * 1) If a string was pushed back on the input, pop it;
-- * 2) If an EOF was pushed back (parsenleft == EOF_NLEFT) or we are reading
-+ * 2) If an EOF was pushed back (parsenleft < -BIGNUM) or we are reading
-  *    from a string so we can't refill the buffer, return EOF.
-  * 3) If the is more stuff in this buffer, use it else call read to fill it.
-  * 4) Process input up to the next newline, deleting nul characters.
-  */
-+//#define pgetc_debug(...) bb_error_msg(__VA_ARGS__)
-+#define pgetc_debug(...) ((void)0)
- static int
- preadbuffer(void)
- {
- 	char *q;
- 	int more;
--	char savec;
- 
- 	while (g_parsefile->strpush) {
- #if ENABLE_ASH_ALIAS
--		if (parsenleft == -1 && g_parsefile->strpush->ap &&
--			parsenextc[-1] != ' ' && parsenextc[-1] != '\t') {
-+		if (parsenleft == -1 && g_parsefile->strpush->ap
-+		 && parsenextc[-1] != ' ' && parsenextc[-1] != '\t'
-+		) {
-+			pgetc_debug("preadbuffer PEOA");
- 			return PEOA;
- 		}
- #endif
- 		popstring();
-+		/* try "pgetc" now: */
-+		pgetc_debug("internal pgetc at %d:%p'%s'", parsenleft, parsenextc, parsenextc);
- 		if (--parsenleft >= 0)
- 			return signed_char2int(*parsenextc++);
- 	}
--	if (parsenleft == EOF_NLEFT || g_parsefile->buf == NULL)
-+	/* on both branches above parsenleft < 0.
-+	 * "pgetc" needs refilling.
-+	 */
-+
-+	/* -90 is -BIGNUM. Below we use -99 to mark "EOF on read",
-+	 * pungetc() may decrement it a few times. -90 is enough.
-+	 */
-+	if (parsenleft < -90 || g_parsefile->buf == NULL) {
-+		pgetc_debug("preadbuffer PEOF1");
-+		/* even in failure keep them in lock step,
-+		 * for correct pungetc. */
-+		parsenextc++;
- 		return PEOF;
--	flush_stdout_stderr();
-+	}
- 
- 	more = parselleft;
- 	if (more <= 0) {
-+		flush_stdout_stderr();
-  again:
- 		more = preadfd();
- 		if (more <= 0) {
--			parselleft = parsenleft = EOF_NLEFT;
-+			parselleft = parsenleft = -99;
-+			pgetc_debug("preadbuffer PEOF2");
-+			parsenextc++;
- 			return PEOF;
- 		}
- 	}
- 
-+	/* Find out where's the end of line.
-+	 * Set parsenleft/parselleft acordingly.
-+	 * NUL chars are deleted.
-+	 */
- 	q = parsenextc;
--
--	/* delete nul characters */
- 	for (;;) {
--		int c;
-+		char c;
- 
- 		more--;
--		c = *q;
- 
--		if (!c)
-+		c = *q;
-+		if (c == '\0') {
- 			memmove(q, q + 1, more);
--		else {
-+		} else {
- 			q++;
- 			if (c == '\n') {
- 				parsenleft = q - parsenextc - 1;
-@@ -9236,22 +9258,23 @@
- 	}
- 	parselleft = more;
- 
--	savec = *q;
--	*q = '\0';
--
- 	if (vflag) {
-+		char save = *q;
-+		*q = '\0';
- 		out2str(parsenextc);
-+		*q = save;
- 	}
- 
--	*q = savec;
--
-+	pgetc_debug("preadbuffer@%d:%p'%s'", parsenleft, parsenextc, parsenextc);
- 	return signed_char2int(*parsenextc++);
- }
- 
- #define pgetc_as_macro() (--parsenleft >= 0 ? signed_char2int(*parsenextc++) : preadbuffer())
-+
- static int
- pgetc(void)
- {
-+	pgetc_debug("pgetc at %d:%p'%s'", parsenleft, parsenextc, parsenextc);
- 	return pgetc_as_macro();
- }
- 
-@@ -9312,6 +9335,7 @@
- {
- 	parsenleft++;
- 	parsenextc--;
-+	pgetc_debug("pushed back to %d:%p'%s'", parsenleft, parsenextc, parsenextc);
- }
- 
- /*
-@@ -9325,16 +9349,17 @@
- pushstring(char *s, struct alias *ap)
- {
- 	struct strpush *sp;
--	size_t len;
-+	int len;
- 
- 	len = strlen(s);
- 	INT_OFF;
- 	if (g_parsefile->strpush) {
--		sp = ckzalloc(sizeof(struct strpush));
-+		sp = ckzalloc(sizeof(*sp));
- 		sp->prev = g_parsefile->strpush;
--		g_parsefile->strpush = sp;
--	} else
--		sp = g_parsefile->strpush = &(g_parsefile->basestrpush);
-+	} else {
-+		sp = &(g_parsefile->basestrpush);
-+	}
-+	g_parsefile->strpush = sp;
- 	sp->prevstring = parsenextc;
- 	sp->prevnleft = parsenleft;
- #if ENABLE_ASH_ALIAS
-@@ -9424,7 +9449,7 @@
- 	close_on_exec_on(fd);
- 	if (push) {
- 		pushfile();
--		g_parsefile->buf = 0;
-+		g_parsefile->buf = NULL;
- 	}
- 	g_parsefile->fd = fd;
- 	if (g_parsefile->buf == NULL)

Deleted: trunk/buildroot/package/busybox/busybox-1.13.0-getopt.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-getopt.patch	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-getopt.patch	2008-11-29 20:12:17 UTC (rev 24185)
@@ -1,22 +0,0 @@
---- busybox-1.13.0/libbb/getopt32.c	Thu Oct 30 08:41:34 2008
-+++ busybox-1.13.0-getopt/libbb/getopt32.c	Wed Nov 12 23:04:01 2008
-@@ -515,6 +515,19 @@
- 		}
- 	}
- 
-+	/* In case getopt32 was already called:
-+	 * reset the libc getopt() function, which keeps internal state.
-+	 * run_nofork_applet_prime() does this, but we might end up here
-+	 * also via gunzip_main() -> gzip_main(). Play safe.
-+	 */
-+#ifdef __GLIBC__
-+	optind = 0;
-+#else /* BSD style */
-+	optind = 1;
-+	/* optreset = 1; */
-+#endif
-+	/* optarg = NULL; opterr = 0; optopt = 0; - do we need this?? */
-+
- 	pargv = NULL;
- 
- 	/* Note: just "getopt() <= 0" will not work well for

Deleted: trunk/buildroot/package/busybox/busybox-1.13.0-id.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-id.patch	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-id.patch	2008-11-29 20:12:17 UTC (rev 24185)
@@ -1,17 +0,0 @@
---- busybox-1.13.0/coreutils/id.c	Wed Nov  5 22:39:54 2008
-+++ busybox-1.13.0-id/coreutils/id.c	Mon Nov 17 01:10:04 2008
-@@ -17,6 +17,14 @@
- 
- #include "libbb.h"
- 
-+#if !ENABLE_USE_BB_PWD_GRP
-+#if defined(__UCLIBC_MAJOR__) && (__UCLIBC_MAJOR__ == 0)
-+#if (__UCLIBC_MINOR__ < 9) || (__UCLIBC_MINOR__ == 9 &&  __UCLIBC_SUBLEVEL__ < 30)
-+#error "Sorry, you need@least uClibc version 0.9.30 for id applet to build"
-+#endif
-+#endif
-+#endif
-+
- enum {
- 	PRINT_REAL      = (1 << 0),
- 	NAME_NOT_NUMBER = (1 << 1),

Deleted: trunk/buildroot/package/busybox/busybox-1.13.0-inotify.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-inotify.patch	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-inotify.patch	2008-11-29 20:12:17 UTC (rev 24185)
@@ -1,101 +0,0 @@
---- busybox-1.13.0/miscutils/inotifyd.c	Thu Oct 30 08:41:37 2008
-+++ busybox-1.13.0-inotify/miscutils/inotifyd.c	Fri Nov 14 22:33:27 2008
-@@ -51,6 +51,7 @@
- int inotifyd_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int inotifyd_main(int argc UNUSED_PARAM, char **argv)
- {
-+	int n;
- 	unsigned mask = IN_ALL_EVENTS; // assume we want all events
- 	struct pollfd pfd;
- 	char **watched = ++argv; // watched name list
-@@ -69,7 +70,6 @@
- 	while (*++argv) {
- 		char *path = *argv;
- 		char *masks = strchr(path, ':');
--		int wd; // watch descriptor
- 		// if mask is specified ->
- 		if (masks) {
- 			*masks = '\0'; // split path and mask
-@@ -83,32 +83,39 @@
- 			}
- 		}
- 		// add watch
--		wd = inotify_add_watch(pfd.fd, path, mask);
--		if (wd < 0) {
-+		n = inotify_add_watch(pfd.fd, path, mask);
-+		if (n < 0)
- 			bb_perror_msg_and_die("add watch (%s) failed", path);
--//		} else {
--//			bb_error_msg("added %d [%s]:%4X", wd, path, mask);
--		}
-+		//bb_error_msg("added %d [%s]:%4X", n, path, mask);
- 	}
- 
- 	// setup signals
--	bb_signals(0
--		+ (1 << SIGHUP)
--		+ (1 << SIGINT)
--		+ (1 << SIGTERM)
--		+ (1 << SIGPIPE)
--		, record_signo);
-+	bb_signals(BB_FATAL_SIGS, record_signo);
- 
- 	// do watch
--
--//	pfd.fd = fd;
- 	pfd.events = POLLIN;
--
--	while (!bb_got_signal && poll(&pfd, 1, -1) > 0) {
-+	while (1) {
- 		ssize_t len;
- 		void *buf;
- 		struct inotify_event *ie;
- 
-+ again:
-+		if (bb_got_signal)
-+			break;
-+		n = poll(&pfd, 1, -1);
-+		/* Signal interrupted us? */
-+		if (n < 0 && errno == EINTR)
-+			goto again;
-+		// Under Linux, above if() is not necessary.
-+		// Non-fatal signals, e.g. SIGCHLD, when set to SIG_DFL,
-+		// are not interrupting poll().
-+		// Thus we can just break if n <= 0 (see below),
-+		// because EINTR will happen only on SIGTERM et al.
-+		// But this might be not true under other Unixes,
-+		// and is generally way too subtle to depend on.
-+		if (n <= 0) // strange error?
-+			break;
-+
- 		// read out all pending events
- 		xioctl(pfd.fd, FIONREAD, &len);
- #define eventbuf bb_common_bufsiz1
-@@ -117,21 +124,21 @@
- 		// process events. N.B. events may vary in length
- 		while (len > 0) {
- 			int i;
--			char events[12];
-+			char events[sizeof(mask_names)];
- 			char *s = events;
- 			unsigned m = ie->mask;
- 
--			for (i = 0; i < 12; ++i, m >>= 1) {
--				if (m & 1) {
-+			for (i = 0; i < sizeof(mask_names)-1; ++i, m >>= 1) {
-+				if (m & 1)
- 					*s++ = mask_names[i];
--				}
- 			}
- 			*s = '\0';
--//			bb_error_msg("exec %s %08X\t%s\t%s\t%s", agent, ie->mask, events, watched[ie->wd], ie->len ? ie->name : "");
-+			//bb_error_msg("exec %s %08X\t%s\t%s\t%s", agent,
-+			// ie->mask, events, watched[ie->wd], ie->len ? ie->name : "");
- 			args[1] = events;
- 			args[2] = watched[ie->wd];
- 			args[3] = ie->len ? ie->name : NULL;
--			xspawn((char **)args);
-+			wait4pid(xspawn((char **)args));
- 			// next event
- 			i = sizeof(struct inotify_event) + ie->len;
- 			len -= i;

Deleted: trunk/buildroot/package/busybox/busybox-1.13.0-klogd.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-klogd.patch	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-klogd.patch	2008-11-29 20:12:17 UTC (rev 24185)
@@ -1,29 +0,0 @@
---- busybox-1.13.0/sysklogd/klogd.c	Thu Oct 30 08:41:28 2008
-+++ busybox-1.13.0-klogd/sysklogd/klogd.c	Thu Nov 20 00:46:00 2008
-@@ -73,9 +73,6 @@
- 
- 	syslog(LOG_NOTICE, "klogd started: %s", bb_banner);
- 
--	/* Initially null terminate the buffer in case of a very long line */
--	log_buffer[KLOGD_LOGBUF_SIZE - 1] = '\0';
--
- 	while (1) {
- 		int n;
- 		int priority;
-@@ -89,6 +86,7 @@
- 					errno);
- 			break;
- 		}
-+		log_buffer[used + n] = '\0';
- 
- 		/* klogctl buffer parsing modelled after code in dmesg.c */
- 		start = &log_buffer[0];
-@@ -101,7 +99,7 @@
- 				/* This line is incomplete... */
- 				if (start != log_buffer) {
- 					/* move it to the front of the buffer */
--					strcpy(log_buffer, start);
-+					overlapping_strcpy(log_buffer, start);
- 					/* don't log it yet */
- 					used = strlen(log_buffer);
- 					break;

Deleted: trunk/buildroot/package/busybox/busybox-1.13.0-lineedit.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-lineedit.patch	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-lineedit.patch	2008-11-29 20:12:17 UTC (rev 24185)
@@ -1,13 +0,0 @@
---- busybox-1.13.0/libbb/lineedit.c	Wed Nov  5 22:39:54 2008
-+++ busybox-1.13.0-lineedit/libbb/lineedit.c	Wed Nov 12 23:18:05 2008
-@@ -1415,8 +1415,10 @@
- 	if ((state->flags & SAVE_HISTORY) && state->hist_file)
- 		load_history(state->hist_file);
- #endif
-+#if MAX_HISTORY > 0
- 	if (state->flags & DO_HISTORY)
- 		state->cur_history = state->cnt_history;
-+#endif
- 
- 	/* prepare before init handlers */
- 	cmdedit_y = 0;  /* quasireal y, not true if line > xt*yt */

Deleted: trunk/buildroot/package/busybox/busybox-1.13.0-modprobe.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-modprobe.patch	2008-11-29 16:46:07 UTC (rev 24184)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-modprobe.patch	2008-11-29 20:12:17 UTC (rev 24185)
@@ -1,47 +0,0 @@
---- busybox-1.13.0/modutils/modprobe-small.c	Thu Oct 30 08:41:28 2008
-+++ busybox-1.13.0-modprobe/modutils/modprobe-small.c	Mon Nov 10 22:19:03 2008
-@@ -600,18 +600,22 @@
- 	free(deps);
- 
- 	/* modprobe -> load it */
--	if (!is_rmmod && (options && !strstr(options, "blacklist"))) {
--		errno = 0;
--		if (load_module(info->pathname, options) != 0) {
--			if (EEXIST != errno) {
--				bb_error_msg("'%s': %s",
-+	if (!is_rmmod) {
-+		if (!options || strstr(options, "blacklist") == NULL) {
-+			errno = 0;
-+			if (load_module(info->pathname, options) != 0) {
-+				if (EEXIST != errno) {
-+					bb_error_msg("'%s': %s",
- 						info->pathname,
- 						moderror(errno));
--			} else {
--				dbg1_error_msg("'%s': %s",
-+				} else {
-+					dbg1_error_msg("'%s': %s",
- 						info->pathname,
- 						moderror(errno));
-+				}
- 			}
-+		} else {
-+			dbg1_error_msg("'%s': blacklisted", info->pathname);
- 		}
- 	}
-  ret:
---- busybox-1.13.0/modutils/modutils-24.c	Thu Oct 30 08:41:28 2008
-+++ busybox-1.13.0-modprobe/modutils/modutils-24.c	Wed Nov 12 01:02:54 2008
-@@ -3236,8 +3236,10 @@
- 	}
- 
- 	shnum = f->header.e_shnum;
--	f->sections = xmalloc(sizeof(struct obj_section *) * shnum);
--	memset(f->sections, 0, sizeof(struct obj_section *) * shnum);
-+	/* Growth of ->sections vector will be done by
-+	 * xrealloc_vector(..., 2, ...), therefore we must allocate
-+	 * at least 2^2 = 4 extra elements here. */
-+	f->sections = xzalloc(sizeof(f->sections[0]) * (shnum + 4));
- 
- 	section_headers = alloca(sizeof(ElfW(Shdr)) * shnum);
- 	fseek(fp, f->header.e_shoff, SEEK_SET);
