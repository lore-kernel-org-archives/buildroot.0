From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  1 Apr 2009 13:01:54 +0000 (UTC)
Subject: [Buildroot] svn commit: [25917] trunk/buildroot/package/busybox
Message-ID: <20090401130154.D187477669@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-01 13:01:54 +0000 (Wed, 01 Apr 2009)
New Revision: 25917

Log:
busybox: additional 1.13.3 fixes

Added:
   trunk/buildroot/package/busybox/busybox-1.13.3-tar.patch
   trunk/buildroot/package/busybox/busybox-1.13.3-volumeid.patch

Modified:
   trunk/buildroot/package/busybox/busybox-1.13.3-ash.patch


Changeset:
Modified: trunk/buildroot/package/busybox/busybox-1.13.3-ash.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.3-ash.patch	2009-04-01 12:36:09 UTC (rev 25916)
+++ trunk/buildroot/package/busybox/busybox-1.13.3-ash.patch	2009-04-01 13:01:54 UTC (rev 25917)
@@ -1,6 +1,152 @@
---- busybox-1.13.3/shell/ash.c	Thu Feb 26 12:46:55 2009
-+++ busybox-1.13.3-ash/shell/ash.c	Thu Mar 19 04:34:01 2009
-@@ -376,7 +376,6 @@
+diff -urpN busybox-1.13.3/shell/ash.c busybox-1.13.3-ash/shell/ash.c
+--- busybox-1.13.3/shell/ash.c	2009-02-26 12:46:55.000000000 +0100
++++ busybox-1.13.3-ash/shell/ash.c	2009-04-01 01:16:44.000000000 +0200
+@@ -30,7 +30,7 @@
+  */
+ 
+ /*
+- * The follow should be set to reflect the type of system you have:
++ * The following should be set to reflect the type of system you have:
+  *      JOBS -> 1 if you have Berkeley job control, 0 otherwise.
+  *      define SYSV if you are running under System V.
+  *      define DEBUG=1 to compile in debugging ('set -o debug' to turn on)
+@@ -40,6 +40,11 @@
+  * a quit signal will generate a core dump.
+  */
+ #define DEBUG 0
++/* Tweak debug output verbosity here */
++#define DEBUG_TIME 0
++#define DEBUG_PID 1
++#define DEBUG_SIG 1
++
+ #define PROFILE 0
+ 
+ #define IFS_BROKEN
+@@ -47,9 +52,9 @@
+ #define JOBS ENABLE_ASH_JOB_CONTROL
+ 
+ #if DEBUG
+-#ifndef _GNU_SOURCE
+-#define _GNU_SOURCE
+-#endif
++# ifndef _GNU_SOURCE
++#  define _GNU_SOURCE
++# endif
+ #endif
+ 
+ #include "busybox.h" /* for applet_names */
+@@ -57,15 +62,15 @@
+ #include <setjmp.h>
+ #include <fnmatch.h>
+ #if JOBS || ENABLE_ASH_READ_NCHARS
+-#include <termios.h>
++# include <termios.h>
+ #endif
+ 
+ #ifndef PIPE_BUF
+-#define PIPE_BUF 4096           /* amount of buffering in a pipe */
++# define PIPE_BUF 4096           /* amount of buffering in a pipe */
+ #endif
+ 
+ #if defined(__uClinux__)
+-#error "Do not even bother, ash will not run on uClinux"
++# error "Do not even bother, ash will not run on uClinux"
+ #endif
+ 
+ 
+@@ -76,14 +81,6 @@
+ #define CMDTABLESIZE 31         /* should be prime */
+ 
+ 
+-/* ============ Misc helpers */
+-
+-#define xbarrier() do { __asm__ __volatile__ ("": : :"memory"); } while (0)
+-
+-/* C99 say: "char" declaration may be signed or unsigned default */
+-#define signed_char2int(sc) ((int)((signed char)sc))
+-
+-
+ /* ============ Shell options */
+ 
+ static const char *const optletters_optnames[] = {
+@@ -245,7 +242,30 @@ extern struct globals_misc *const ash_pt
+ } while (0)
+ 
+ 
++/* ============ DEBUG */
++#if DEBUG
++static void trace_printf(const char *fmt, ...);
++static void trace_vprintf(const char *fmt, va_list va);
++# define TRACE(param)    trace_printf param
++# define TRACEV(param)   trace_vprintf param
++# define close(f) do { \
++	int dfd = (f); \
++	if (close(dfd) < 0) \
++		bb_error_msg("bug on %d: closing %d(%x)", \
++			__LINE__, dfd, dfd); \
++} while (0)
++#else
++# define TRACE(param)
++# define TRACEV(param)
++#endif
++
++
+ /* ============ Utility functions */
++#define xbarrier() do { __asm__ __volatile__ ("": : :"memory"); } while (0)
++
++/* C99 say: "char" declaration may be signed or unsigned by default */
++#define signed_char2int(sc) ((int)(signed char)(sc))
++
+ static int isdigit_str9(const char *str)
+ {
+ 	int maxlen = 9 + 1; /* max 9 digits: 999999999 */
+@@ -284,6 +304,12 @@ raise_exception(int e)
+ 	exception = e;
+ 	longjmp(exception_handler->loc, 1);
+ }
++#if DEBUG
++#define raise_exception(e) do { \
++	TRACE(("raising exception %d on line %d\n", (e), __LINE__)); \
++	raise_exception(e); \
++} while (0)
++#endif
+ 
+ /*
+  * Called from trap.c when a SIGINT is received.  (If the user specifies
+@@ -316,6 +342,12 @@ raise_interrupt(void)
+ 	raise_exception(i);
+ 	/* NOTREACHED */
+ }
++#if DEBUG
++#define raise_interrupt() do { \
++	TRACE(("raising interrupt on line %d\n", __LINE__)); \
++	raise_interrupt(); \
++} while (0)
++#endif
+ 
+ #if ENABLE_ASH_OPTIMIZE_FOR_SIZE
+ static void
+@@ -334,7 +366,9 @@ force_int_on(void)
+ 		raise_interrupt();
+ }
+ #define FORCE_INT_ON force_int_on()
+-#else
++
++#else /* !ASH_OPTIMIZE_FOR_SIZE */
++
+ #define INT_ON do { \
+ 	xbarrier(); \
+ 	if (--suppressint == 0 && intpending) \
+@@ -346,7 +380,7 @@ force_int_on(void)
+ 	if (intpending) \
+ 		raise_interrupt(); \
+ } while (0)
+-#endif /* ASH_OPTIMIZE_FOR_SIZE */
++#endif /* !ASH_OPTIMIZE_FOR_SIZE */
+ 
+ #define SAVE_INT(v) ((v) = suppressint)
+ 
+@@ -376,7 +410,6 @@ static void
  onsig(int signo)
  {
  	gotsig[signo - 1] = 1;
@@ -8,7 +154,7 @@
  
  	if (/* exsig || */ (signo == SIGINT && !trap[SIGINT])) {
  		if (!suppressint) {
-@@ -384,6 +383,8 @@
+@@ -384,6 +417,8 @@ onsig(int signo)
  			raise_interrupt(); /* does not return */
  		}
  		intpending = 1;
@@ -17,8 +163,269 @@
  	}
  }
  
-@@ -13692,15 +13693,20 @@
+@@ -684,6 +719,12 @@ trace_printf(const char *fmt, ...)
+ 
+ 	if (debug != 1)
+ 		return;
++	if (DEBUG_TIME)
++		fprintf(tracefile, "%u ", (int) time(NULL));
++	if (DEBUG_PID)
++		fprintf(tracefile, "[%u] ", (int) getpid());
++	if (DEBUG_SIG)
++		fprintf(tracefile, "pending s:%d i:%d(supp:%d) ", pendingsig, intpending, suppressint);
+ 	va_start(va, fmt);
+ 	vfprintf(tracefile, fmt, va);
+ 	va_end(va);
+@@ -694,6 +735,12 @@ trace_vprintf(const char *fmt, va_list v
+ {
+ 	if (debug != 1)
+ 		return;
++	if (DEBUG_TIME)
++		fprintf(tracefile, "%u ", (int) time(NULL));
++	if (DEBUG_PID)
++		fprintf(tracefile, "[%u] ", (int) getpid());
++	if (DEBUG_SIG)
++		fprintf(tracefile, "pending s:%d i:%d(supp:%d) ", pendingsig, intpending, suppressint);
+ 	vfprintf(tracefile, fmt, va);
+ }
+ 
+@@ -998,14 +1045,6 @@ showtree(union node *n)
+ 	shtree(n, 1, NULL, stdout);
+ }
+ 
+-#define TRACE(param)    trace_printf param
+-#define TRACEV(param)   trace_vprintf param
+-
+-#else
+-
+-#define TRACE(param)
+-#define TRACEV(param)
+-
+ #endif /* DEBUG */
+ 
+ 
+@@ -3779,7 +3818,7 @@ dowait(int wait_flags, struct job *job)
+ 	 * NB: _not_ safe_waitpid, we need to detect EINTR */
+ 	pid = waitpid(-1, &status,
+ 			(doing_jobctl ? (wait_flags | WUNTRACED) : wait_flags));
+-	TRACE(("wait returns pid=%d, status=0x%x\n", pid, status));
++	TRACE(("wait returns pid=%d, status=0x%x, errno=%d(%s)\n", pid, status, errno, strerror(errno)));
+ 
+ 	if (pid <= 0) {
+ 		/* If we were doing blocking wait and (probably) got EINTR,
+@@ -5031,7 +5070,9 @@ redirect(union node *redir, int flags)
+ 		if (newfd < 0) {
+ 			/* NTOFD/NFROMFD: copy redir->ndup.dupfd to fd */
+ 			if (redir->ndup.dupfd < 0) { /* "fd>&-" */
+-				close(fd);
++				/* Don't want to trigger debugging */
++				if (fd != -1)
++					close(fd);
+ 			} else {
+ 				copyfd(redir->ndup.dupfd, fd | COPYFD_EXACT);
+ 			}
+@@ -5084,7 +5125,7 @@ popredir(int drop, int restore)
+ 				/*close(fd);*/
+ 				copyfd(copy, fd | COPYFD_EXACT);
+ 			}
+-			close(copy);
++			close(copy & ~COPYFD_RESTORE);
+ 		}
  	}
+ 	redirlist = rp->next;
+@@ -7871,20 +7912,30 @@ dotrap(void)
+ 	pendingsig = 0;
+ 	xbarrier();
+ 
++	TRACE(("dotrap entered\n"));
+ 	for (i = 1, q = gotsig; i < NSIG; i++, q++) {
+ 		if (!*q)
+ 			continue;
+-		*q = '\0';
+ 
+ 		p = trap[i];
++		/* non-trapped SIGINT is handled separately by raise_interrupt,
++		 * don't upset it by resetting gotsig[SIGINT-1] */
++		if (i == SIGINT && !p)
++			continue;
++
++		TRACE(("sig %d is active, will run handler '%s'\n", i, p));
++		*q = '\0';
+ 		if (!p)
+ 			continue;
+ 		skip = evalstring(p, SKIPEVAL);
+ 		exitstatus = savestatus;
+-		if (skip)
++		if (skip) {
++			TRACE(("dotrap returns %d\n", skip));
+ 			return skip;
++		}
+ 	}
+ 
++	TRACE(("dotrap returns 0\n"));
+ 	return 0;
+ }
+ 
+@@ -7906,28 +7957,32 @@ static void prehash(union node *);
+ static void
+ evaltree(union node *n, int flags)
+ {
+-
+ 	struct jmploc *volatile savehandler = exception_handler;
+ 	struct jmploc jmploc;
+ 	int checkexit = 0;
+ 	void (*evalfn)(union node *, int);
+ 	int status;
++	int int_level;
++
++	SAVE_INT(int_level);
+ 
+ 	if (n == NULL) {
+ 		TRACE(("evaltree(NULL) called\n"));
+ 		goto out1;
+ 	}
+-	TRACE(("pid %d, evaltree(%p: %d, %d) called\n",
+-			getpid(), n, n->type, flags));
++	TRACE(("evaltree(%p: %d, %d) called\n",	n, n->type, flags));
+ 
+ 	exception_handler = &jmploc;
+ 	{
+ 		int err = setjmp(jmploc.loc);
+ 		if (err) {
+ 			/* if it was a signal, check for trap handlers */
+-			if (exception == EXSIG)
++			if (exception == EXSIG) {
++				TRACE(("exception %d (EXSIG) in evaltree, err=%d\n", exception, err));
+ 				goto out;
++			}
+ 			/* continue on the way out */
++			TRACE(("exception %d in evaltree, propagating err=%d\n", exception, err));
+ 			exception_handler = savehandler;
+ 			longjmp(exception_handler->loc, err);
+ 		}
+@@ -8010,7 +8065,8 @@ evaltree(union node *n, int flags)
+ 		if (exitstatus == 0) {
+ 			n = n->nif.ifpart;
+ 			goto evaln;
+-		} else if (n->nif.elsepart) {
++		}
++		if (n->nif.elsepart) {
+ 			n = n->nif.elsepart;
+ 			goto evaln;
+ 		}
+@@ -8036,6 +8092,9 @@ evaltree(union node *n, int flags)
+  exexit:
+ 		raise_exception(EXEXIT);
+ 	}
++
++	RESTORE_INT(int_level);
++	TRACE(("leaving evaltree (no interrupts)\n"));
+ }
+ 
+ #if !defined(__alpha__) || (defined(__GNUC__) && __GNUC__ >= 3)
+@@ -8281,7 +8340,9 @@ evalpipe(union node *n, int flags)
+ 		if (prevfd >= 0)
+ 			close(prevfd);
+ 		prevfd = pip[0];
+-		close(pip[1]);
++		/* Don't want to trigger debugging */
++		if (pip[1] != -1)
++			close(pip[1]);
+ 	}
+ 	if (n->npipe.pipe_backgnd == 0) {
+ 		exitstatus = waitforjob(jp);
+@@ -8913,6 +8974,7 @@ evalcommand(union node *cmd, int flags)
+ 			if (forkshell(jp, cmd, FORK_FG) != 0) {
+ 				exitstatus = waitforjob(jp);
+ 				INT_ON;
++				TRACE(("forked child exited with %d\n", exitstatus));
+ 				break;
+ 			}
+ 			FORCE_INT_ON;
+@@ -12391,7 +12453,7 @@ readcmd(int argc UNUSED_PARAM, char **ar
+ #endif
+ 
+ 	status = 0;
+-	startword = 1;
++	startword = 2;
+ 	backslash = 0;
+ #if ENABLE_ASH_READ_TIMEOUT
+ 	if (timeout) /* NB: ensuring end_ms is nonzero */
+@@ -12399,6 +12461,8 @@ readcmd(int argc UNUSED_PARAM, char **ar
+ #endif
+ 	STARTSTACKSTR(p);
+ 	do {
++		const char *is_ifs;
++
+ #if ENABLE_ASH_READ_TIMEOUT
+ 		if (end_ms) {
+ 			struct pollfd pfd[1];
+@@ -12428,25 +12492,34 @@ readcmd(int argc UNUSED_PARAM, char **ar
+ 			continue;
+ 		}
+ 		if (!rflag && c == '\\') {
+-			backslash++;
++			backslash = 1;
+ 			continue;
+ 		}
+ 		if (c == '\n')
+ 			break;
+-		if (startword && *ifs == ' ' && strchr(ifs, c)) {
+-			continue;
++		is_ifs = strchr(ifs, c);
++		if (startword && is_ifs) {
++			if (isspace(c))
++				continue;
++			/* non-space ifs char */
++			startword--;
++			if (startword == 1) /* first one? */
++				continue;
+ 		}
+ 		startword = 0;
+-		if (ap[1] != NULL && strchr(ifs, c) != NULL) {
++		if (ap[1] != NULL && is_ifs) {
++			const char *beg;
+ 			STACKSTRNUL(p);
+-			setvar(*ap, stackblock(), 0);
++			beg = stackblock();
++			setvar(*ap, beg, 0);
+ 			ap++;
+-			startword = 1;
++			/* can we skip one non-space ifs? (2: yes) */
++			startword = isspace(c) ? 2 : 1;
+ 			STARTSTACKSTR(p);
+-		} else {
+- put:
+-			STPUTC(c, p);
++			continue;
+ 		}
++ put:
++		STPUTC(c, p);
+ 	}
+ /* end of do {} while: */
+ #if ENABLE_ASH_READ_NCHARS
+@@ -12460,8 +12533,8 @@ readcmd(int argc UNUSED_PARAM, char **ar
+ #endif
+ 
+ 	STACKSTRNUL(p);
+-	/* Remove trailing blanks */
+-	while ((char *)stackblock() <= --p && strchr(ifs, *p) != NULL)
++	/* Remove trailing space ifs chars */
++	while ((char *)stackblock() <= --p && isspace(*p) && strchr(ifs, *p) != NULL)
+ 		*p = '\0';
+ 	setvar(*ap, stackblock(), 0);
+ 	while (*++ap != NULL)
+@@ -13640,7 +13713,7 @@ int ash_main(int argc UNUSED_PARAM, char
+ 	exception_handler = &jmploc;
+ #if DEBUG
+ 	opentrace();
+-	trace_puts("Shell args: ");
++	TRACE(("Shell args: "));
+ 	trace_puts_args(argv);
+ #endif
+ 	rootpid = getpid();
+@@ -13692,8 +13765,14 @@ int ash_main(int argc UNUSED_PARAM, char
+ 	}
   state3:
  	state = 4;
 -	if (minusc)
@@ -33,11 +440,40 @@
  
  	if (sflag || minusc == NULL) {
  #if ENABLE_FEATURE_EDITING_SAVEHISTORY
- 		if (iflag) {
- 			const char *hp = lookupvar("HISTFILE");
+@@ -13720,14 +13799,6 @@ int ash_main(int argc UNUSED_PARAM, char
+ 	/* NOTREACHED */
+ }
+ 
+-#if DEBUG
+-const char *applet_name = "debug stuff usage";
+-int main(int argc, char **argv)
+-{
+-	return ash_main(argc, argv);
+-}
+-#endif
 -
--			if (hp != NULL)
-+			if (hp)
- 				line_input_state->hist_file = hp;
- 		}
- #endif
+ 
+ /*-
+  * Copyright (c) 1989, 1991, 1993, 1994
+diff -urpN busybox-1.13.3/shell/ash_test/ash-read/read_ifs.right busybox-1.13.3-ash/shell/ash_test/ash-read/read_ifs.right
+--- busybox-1.13.3/shell/ash_test/ash-read/read_ifs.right	1970-01-01 01:00:00.000000000 +0100
++++ busybox-1.13.3-ash/shell/ash_test/ash-read/read_ifs.right	2009-04-01 01:16:44.000000000 +0200
+@@ -0,0 +1,7 @@
++.a. .b. .c.
++.a. .b. .c.
++.a. .. .b,c.
++.a. .. .b,c.
++.a. .. .c.
++.a. .. .c. .d.
++.a. .. .b,c,d  ,  ,.
+diff -urpN busybox-1.13.3/shell/ash_test/ash-read/read_ifs.tests busybox-1.13.3-ash/shell/ash_test/ash-read/read_ifs.tests
+--- busybox-1.13.3/shell/ash_test/ash-read/read_ifs.tests	1970-01-01 01:00:00.000000000 +0100
++++ busybox-1.13.3-ash/shell/ash_test/ash-read/read_ifs.tests	2009-04-01 01:16:44.000000000 +0200
+@@ -0,0 +1,7 @@
++printf 'a\t\tb\tc\n' | ( IFS=$(printf "\t") read a b c; echo ".$a. .$b. .$c." )
++printf 'a\t\tb\tc\n' | ( IFS=$(printf " \t") read a b c; echo ".$a. .$b. .$c." )
++printf 'a,,b,c\n'    | ( IFS="," read a b c; echo ".$a. .$b. .$c." )
++printf 'a,,b,c\n'    | ( IFS=" ," read a b c; echo ".$a. .$b. .$c." )
++printf 'a ,, c\n'    | ( IFS=" ," read a b c; echo ".$a. .$b. .$c." )
++printf 'a ,, c d\n'  | ( IFS=" ," read a b c d; echo ".$a. .$b. .$c. .$d." )
++printf ' a,,b,c,d  ,  ,\n' | ( IFS=" ," read a b c; echo ".$a. .$b. .$c." )

Added: trunk/buildroot/package/busybox/busybox-1.13.3-tar.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.3-tar.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.3-tar.patch	2009-04-01 13:01:54 UTC (rev 25917)
@@ -0,0 +1,37 @@
+diff -urpN busybox-1.13.3/archival/libunarchive/get_header_tar.c busybox-1.13.3-tar/archival/libunarchive/get_header_tar.c
+--- busybox-1.13.3/archival/libunarchive/get_header_tar.c	2009-02-26 12:46:40.000000000 +0100
++++ busybox-1.13.3-tar/archival/libunarchive/get_header_tar.c	2009-04-01 01:15:26.000000000 +0200
+@@ -91,7 +91,7 @@ char FAST_FUNC get_header_tar(archive_ha
+ 
+  again_after_align:
+ 
+-#if ENABLE_DESKTOP
++#if ENABLE_DESKTOP || ENABLE_FEATURE_TAR_AUTODETECT
+ 	/* to prevent misdetection of bz2 sig */
+ 	*(uint32_t*)(&tar) = 0;
+ 	i = full_read(archive_handle->src_fd, &tar, 512);
+@@ -142,7 +142,7 @@ char FAST_FUNC get_header_tar(archive_ha
+ #if ENABLE_FEATURE_TAR_AUTODETECT
+ 		char FAST_FUNC (*get_header_ptr)(archive_handle_t *);
+ 
+- USE_DESKTOP(autodetect:)
++ autodetect:
+ 		/* tar gz/bz autodetect: check for gz/bz2 magic.
+ 		 * If we see the magic, and it is the very first block,
+ 		 * we can switch to get_header_tar_gz/bz2/lzma().
+diff -urpN busybox-1.13.3/archival/tar.c busybox-1.13.3-tar/archival/tar.c
+--- busybox-1.13.3/archival/tar.c	2009-02-26 12:56:00.000000000 +0100
++++ busybox-1.13.3-tar/archival/tar.c	2009-04-01 01:15:39.000000000 +0200
+@@ -934,8 +934,10 @@ int tar_main(int argc UNUSED_PARAM, char
+ 			tar_handle->src_fd = fileno(tar_stream);
+ 			tar_handle->seek = seek_by_read;
+ 		} else {
+-			if (ENABLE_FEATURE_TAR_AUTODETECT && flags == O_RDONLY) {
+-				get_header_ptr = get_header_tar;
++			if (ENABLE_FEATURE_TAR_AUTODETECT
++			 && get_header_ptr == get_header_tar
++			 && flags == O_RDONLY
++			) {
+ 				tar_handle->src_fd = open_zipped(tar_filename);
+ 				if (tar_handle->src_fd < 0)
+ 					bb_perror_msg_and_die("can't open '%s'", tar_filename);

Added: trunk/buildroot/package/busybox/busybox-1.13.3-volumeid.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.3-volumeid.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.3-volumeid.patch	2009-04-01 13:01:54 UTC (rev 25917)
@@ -0,0 +1,18 @@
+diff -urpN busybox-1.13.3/util-linux/volume_id/get_devname.c busybox-1.13.3-volumeid/util-linux/volume_id/get_devname.c
+--- busybox-1.13.3/util-linux/volume_id/get_devname.c	2009-02-26 12:47:41.000000000 +0100
++++ busybox-1.13.3-volumeid/util-linux/volume_id/get_devname.c	2009-03-31 21:46:37.000000000 +0200
+@@ -223,13 +223,11 @@ void display_uuid_cache(void)
+ char *get_devname_from_label(const char *spec)
+ {
+ 	struct uuidCache_s *uc;
+-	int spec_len = strlen(spec);
+ 
+ 	uuidcache_init();
+ 	uc = uuidCache;
+ 	while (uc) {
+-// FIXME: empty label ("LABEL=") matches anything??!
+-		if (uc->label[0] && strncmp(spec, uc->label, spec_len) == 0) {
++		if (uc->label[0] && strcmp(spec, uc->label) == 0) {
+ 			return xstrdup(uc->device);
+ 		}
+ 		uc = uc->next;
