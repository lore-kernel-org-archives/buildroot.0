From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Oct 2009 21:22:16 +0200
Subject: [Buildroot] [git commit master] busybox: bump 1.15.x stable version
Message-ID: <20091008202855.DB6A677667@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6ef1705c422255301007ec126aa786b8a8b82b86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                          |    2 +-
 package/busybox/busybox-1.15.1-ash.patch           |   29 ---
 package/busybox/busybox-1.15.1-buildsys.patch      |   34 ---
 package/busybox/busybox-1.15.1-dd.patch            |   35 ---
 package/busybox/busybox-1.15.1-find.patch          |  230 ------------------
 package/busybox/busybox-1.15.1-hush.patch          |   61 -----
 package/busybox/busybox-1.15.1-lineedit.patch      |  156 ------------
 package/busybox/busybox-1.15.1-pidof_killall.patch |  250 --------------------
 package/busybox/busybox-1.15.1-sed.patch           |   15 --
 package/busybox/busybox-1.15.1-uniq.patch          |   11 -
 10 files changed, 1 insertions(+), 822 deletions(-)
 delete mode 100644 package/busybox/busybox-1.15.1-ash.patch
 delete mode 100644 package/busybox/busybox-1.15.1-buildsys.patch
 delete mode 100644 package/busybox/busybox-1.15.1-dd.patch
 delete mode 100644 package/busybox/busybox-1.15.1-find.patch
 delete mode 100644 package/busybox/busybox-1.15.1-hush.patch
 delete mode 100644 package/busybox/busybox-1.15.1-lineedit.patch
 delete mode 100644 package/busybox/busybox-1.15.1-pidof_killall.patch
 delete mode 100644 package/busybox/busybox-1.15.1-sed.patch
 delete mode 100644 package/busybox/busybox-1.15.1-uniq.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 132e271..4961a8d 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -41,7 +41,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.12.4"	if BR2_BUSYBOX_VERSION_1_12_X
 	default "1.13.4"	if BR2_BUSYBOX_VERSION_1_13_X
 	default "1.14.4"	if BR2_BUSYBOX_VERSION_1_14_X
-	default "1.15.1"	if BR2_BUSYBOX_VERSION_1_15_X
+	default "1.15.2"	if BR2_BUSYBOX_VERSION_1_15_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
diff --git a/package/busybox/busybox-1.15.1-ash.patch b/package/busybox/busybox-1.15.1-ash.patch
deleted file mode 100644
index b77e45f..0000000
--- a/package/busybox/busybox-1.15.1-ash.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-diff -urpN busybox-1.15.1/shell/ash.c busybox-1.15.1-ash/shell/ash.c
---- busybox-1.15.1/shell/ash.c	2009-09-12 17:56:11.000000000 +0200
-+++ busybox-1.15.1-ash/shell/ash.c	2009-09-16 16:29:09.609276492 +0200
-@@ -5553,7 +5553,7 @@ exptilde(char *startp, char *p, int flag
- 	char *name;
- 	struct passwd *pw;
- 	const char *home;
--	int quotes = flag & (EXP_FULL | EXP_CASE);
-+	int quotes = flag & (EXP_FULL | EXP_CASE | EXP_REDIR);
- 	int startloc;
- 
- 	name = p + 1;
-@@ -6321,7 +6321,7 @@ varvalue(char *name, int varflags, int f
- 	int syntax;
- 	int quoted = varflags & VSQUOTE;
- 	int subtype = varflags & VSTYPE;
--	int quotes = flags & (EXP_FULL | EXP_CASE);
-+	int quotes = flags & (EXP_FULL | EXP_CASE | EXP_REDIR);
- 
- 	if (quoted && (flags & EXP_FULL))
- 		sep = 1 << CHAR_BIT;
-@@ -6558,6 +6558,7 @@ evalvar(char *p, int flag, struct strlis
- 		patloc = expdest - (char *)stackblock();
- 		if (0 == subevalvar(p, /* str: */ NULL, patloc, subtype,
- 				startloc, varflags,
-+//TODO: | EXP_REDIR too? All other such places do it too
- 				/* quotes: */ flag & (EXP_FULL | EXP_CASE),
- 				var_str_list)
- 		) {
diff --git a/package/busybox/busybox-1.15.1-buildsys.patch b/package/busybox/busybox-1.15.1-buildsys.patch
deleted file mode 100644
index e63f8f8..0000000
--- a/package/busybox/busybox-1.15.1-buildsys.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-diff -urpN busybox-1.15.1/miscutils/hdparm.c busybox-1.15.1-buildsys/miscutils/hdparm.c
---- busybox-1.15.1/miscutils/hdparm.c	2009-09-12 17:55:36.000000000 +0200
-+++ busybox-1.15.1-buildsys/miscutils/hdparm.c	2009-09-22 23:13:25.000000000 +0200
-@@ -15,6 +15,9 @@
- /* must be _after_ libbb.h: */
- #include <linux/hdreg.h>
- #include <sys/mount.h>
-+#if !defined(BLKGETSIZE64)
-+# define BLKGETSIZE64 _IOR(0x12,114,size_t)
-+#endif
- 
- /* device types */
- /* ------------ */
-diff -urpN busybox-1.15.1/util-linux/fdisk.c busybox-1.15.1-buildsys/util-linux/fdisk.c
---- busybox-1.15.1/util-linux/fdisk.c	2009-09-12 17:55:37.000000000 +0200
-+++ busybox-1.15.1-buildsys/util-linux/fdisk.c	2009-09-22 23:13:25.000000000 +0200
-@@ -9,13 +9,16 @@
- 
- #ifndef _LARGEFILE64_SOURCE
- /* For lseek64 */
--#define _LARGEFILE64_SOURCE
-+# define _LARGEFILE64_SOURCE
- #endif
- #include <assert.h>             /* assert */
- #include <sys/mount.h>
- #if !defined(BLKSSZGET)
- # define BLKSSZGET _IO(0x12, 104)
- #endif
-+#if !defined(BLKGETSIZE64)
-+# define BLKGETSIZE64 _IOR(0x12,114,size_t)
-+#endif
- #include "libbb.h"
- 
- /* Looks like someone forgot to add this to config system */
diff --git a/package/busybox/busybox-1.15.1-dd.patch b/package/busybox/busybox-1.15.1-dd.patch
deleted file mode 100644
index a3e2676..0000000
--- a/package/busybox/busybox-1.15.1-dd.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-diff -urpN busybox-1.15.1/coreutils/dd.c busybox-1.15.1-dd/coreutils/dd.c
---- busybox-1.15.1/coreutils/dd.c	2009-09-12 17:55:58.000000000 +0200
-+++ busybox-1.15.1-dd/coreutils/dd.c	2009-09-18 20:48:22.000000000 +0200
-@@ -286,25 +286,26 @@ int dd_main(int argc UNUSED_PARAM, char 
- 	}
- 
- 	while (!(flags & FLAG_COUNT) || (G.in_full + G.in_part != count)) {
--		if (flags & FLAG_NOERROR) /* Pre-zero the buffer if conv=noerror */
--			memset(ibuf, 0, ibs);
- 		n = safe_read(ifd, ibuf, ibs);
- 		if (n == 0)
- 			break;
- 		if (n < 0) {
-+			/* "Bad block" */
- 			if (!(flags & FLAG_NOERROR))
- 				goto die_infile;
--			n = ibs;
- 			bb_simple_perror_msg(infile);
--			/* GNU dd with conv=noerror skips over "bad blocks" */
-+			/* GNU dd with conv=noerror skips over bad blocks */
- 			xlseek(ifd, ibs, SEEK_CUR);
-+			/* conv=noerror,sync writes NULs,
-+			 * conv=noerror just ignores input bad blocks */
-+			n = 0;
- 		}
- 		if ((size_t)n == ibs)
- 			G.in_full++;
- 		else {
- 			G.in_part++;
- 			if (flags & FLAG_SYNC) {
--				memset(ibuf + n, '\0', ibs - n);
-+				memset(ibuf + n, 0, ibs - n);
- 				n = ibs;
- 			}
- 		}
diff --git a/package/busybox/busybox-1.15.1-find.patch b/package/busybox/busybox-1.15.1-find.patch
deleted file mode 100644
index da2700a..0000000
--- a/package/busybox/busybox-1.15.1-find.patch
+++ /dev/null
@@ -1,230 +0,0 @@
-diff -urpN busybox-1.15.1/findutils/find.c busybox-1.15.1-find/findutils/find.c
---- busybox-1.15.1/findutils/find.c	2009-09-12 17:55:58.000000000 +0200
-+++ busybox-1.15.1-find/findutils/find.c	2009-09-30 02:23:54.000000000 +0200
-@@ -62,9 +62,6 @@
- /* This is a NOEXEC applet. Be very careful! */
- 
- 
--IF_FEATURE_FIND_XDEV(static dev_t *xdev_dev;)
--IF_FEATURE_FIND_XDEV(static int xdev_count;)
--
- typedef int (*action_fp)(const char *fileName, struct stat *statbuf, void *) FAST_FUNC;
- 
- typedef struct {
-@@ -100,9 +97,24 @@ IF_FEATURE_FIND_DELETE( ACTS(delete))
- IF_FEATURE_FIND_EXEC(   ACTS(exec,  char **exec_argv; unsigned *subst_count; int exec_argc;))
- IF_FEATURE_FIND_GROUP(  ACTS(group, gid_t gid;))
- 
--static action ***actions;
--static bool need_print = 1;
--static int recurse_flags = ACTION_RECURSE;
-+struct globals {
-+	IF_FEATURE_FIND_XDEV(dev_t *xdev_dev;)
-+	IF_FEATURE_FIND_XDEV(int xdev_count;)
-+	action ***actions;
-+	bool need_print;
-+	recurse_flags_t recurse_flags;
-+};
-+#define G (*(struct globals*)&bb_common_bufsiz1)
-+#define INIT_G() do { \
-+	struct G_sizecheck { \
-+		char G_sizecheck[sizeof(G) > COMMON_BUFSIZE ? -1 : 1]; \
-+	}; \
-+	G.xdev_dev = NULL; \
-+	G.xdev_count = 0; \
-+	G.actions = NULL; \
-+	G.need_print = 1; \
-+	G.recurse_flags = ACTION_RECURSE; \
-+} while (0)
- 
- #if ENABLE_FEATURE_FIND_EXEC
- static unsigned count_subst(const char *str)
-@@ -363,7 +375,7 @@ ACTF(context)
- 	security_context_t con;
- 	int rc;
- 
--	if (recurse_flags & ACTION_FOLLOWLINKS) {
-+	if (G.recurse_flags & ACTION_FOLLOWLINKS) {
- 		rc = getfilecon(fileName, &con);
- 	} else {
- 		rc = lgetfilecon(fileName, &con);
-@@ -392,18 +404,18 @@ static int FAST_FUNC fileAction(const ch
- #endif
- 
- #if ENABLE_FEATURE_FIND_XDEV
--	if (S_ISDIR(statbuf->st_mode) && xdev_count) {
--		for (i = 0; i < xdev_count; i++) {
--			if (xdev_dev[i] == statbuf->st_dev)
-+	if (S_ISDIR(statbuf->st_mode) && G.xdev_count) {
-+		for (i = 0; i < G.xdev_count; i++) {
-+			if (G.xdev_dev[i] == statbuf->st_dev)
- 				break;
- 		}
--		if (i == xdev_count)
-+		if (i == G.xdev_count)
- 			return SKIP;
- 	}
- #endif
--	i = exec_actions(actions, fileName, statbuf);
-+	i = exec_actions(G.actions, fileName, statbuf);
- 	/* Had no explicit -print[0] or -exec? then print */
--	if ((i & TRUE) && need_print)
-+	if ((i & TRUE) && G.need_print)
- 		puts(fileName);
- 	/* Cannot return 0: our caller, recursive_action(),
- 	 * will perror() and skip dirs (if called on dir) */
-@@ -431,7 +443,7 @@ static int find_type(const char *type)
- 	else if (*type == 's')
- 		mask = S_IFSOCK;
- 
--	if (mask == 0 || *(type + 1) != '\0')
-+	if (mask == 0 || type[1] != '\0')
- 		bb_error_msg_and_die(bb_msg_invalid_arg, type, "-type");
- 
- 	return mask;
-@@ -592,21 +604,21 @@ static action*** parse_params(char **arg
- 
- 	/* --- Tests and actions --- */
- 		else if (parm == PARM_print) {
--			need_print = 0;
-+			G.need_print = 0;
- 			/* GNU find ignores '!' here: "find ! -print" */
- 			IF_FEATURE_FIND_NOT( invert_flag = 0; )
- 			(void) ALLOC_ACTION(print);
- 		}
- #if ENABLE_FEATURE_FIND_PRINT0
- 		else if (parm == PARM_print0) {
--			need_print = 0;
-+			G.need_print = 0;
- 			IF_FEATURE_FIND_NOT( invert_flag = 0; )
- 			(void) ALLOC_ACTION(print0);
- 		}
- #endif
- #if ENABLE_FEATURE_FIND_DEPTH
- 		else if (parm == PARM_depth) {
--			recurse_flags |= ACTION_DEPTHFIRST;
-+			G.recurse_flags |= ACTION_DEPTHFIRST;
- 		}
- #endif
- #if ENABLE_FEATURE_FIND_PRUNE
-@@ -617,8 +629,8 @@ static action*** parse_params(char **arg
- #endif
- #if ENABLE_FEATURE_FIND_DELETE
- 		else if (parm == PARM_delete) {
--			need_print = 0;
--			recurse_flags |= ACTION_DEPTHFIRST;
-+			G.need_print = 0;
-+			G.recurse_flags |= ACTION_DEPTHFIRST;
- 			(void) ALLOC_ACTION(delete);
- 		}
- #endif
-@@ -626,7 +638,7 @@ static action*** parse_params(char **arg
- 		else if (parm == PARM_exec) {
- 			int i;
- 			action_exec *ap;
--			need_print = 0;
-+			G.need_print = 0;
- 			IF_FEATURE_FIND_NOT( invert_flag = 0; )
- 			ap = ALLOC_ACTION(exec);
- 			ap->exec_argv = ++argv; /* first arg after -exec */
-@@ -834,6 +846,8 @@ IF_FEATURE_FIND_MAXDEPTH(OPT_MINDEPTH,)
- #define minmaxdepth NULL
- #endif
- 
-+	INIT_G();
-+
- 	for (firstopt = 1; firstopt < argc; firstopt++) {
- 		if (argv[firstopt][0] == '-')
- 			break;
-@@ -861,21 +875,21 @@ IF_FEATURE_FIND_MAXDEPTH(OPT_MINDEPTH,)
- 	while ((arg = argp[0])) {
- 		int opt = index_in_strings(options, arg);
- 		if (opt == OPT_FOLLOW) {
--			recurse_flags |= ACTION_FOLLOWLINKS;
-+			G.recurse_flags |= ACTION_FOLLOWLINKS | ACTION_DANGLING_OK;
- 			argp[0] = (char*)"-a";
- 		}
- #if ENABLE_FEATURE_FIND_XDEV
- 		if (opt == OPT_XDEV) {
- 			struct stat stbuf;
--			if (!xdev_count) {
--				xdev_count = firstopt - 1;
--				xdev_dev = xmalloc(xdev_count * sizeof(dev_t));
-+			if (!G.xdev_count) {
-+				G.xdev_count = firstopt - 1;
-+				G.xdev_dev = xmalloc(G.xdev_count * sizeof(dev_t));
- 				for (i = 1; i < firstopt; i++) {
- 					/* not xstat(): shouldn't bomb out on
- 					 * "find not_exist exist -xdev" */
- 					if (stat(argv[i], &stbuf))
- 						stbuf.st_dev = -1L;
--					xdev_dev[i-1] = stbuf.st_dev;
-+					G.xdev_dev[i-1] = stbuf.st_dev;
- 				}
- 			}
- 			argp[0] = (char*)"-a";
-@@ -894,11 +908,11 @@ IF_FEATURE_FIND_MAXDEPTH(OPT_MINDEPTH,)
- 		argp++;
- 	}
- 
--	actions = parse_params(&argv[firstopt]);
-+	G.actions = parse_params(&argv[firstopt]);
- 
- 	for (i = 1; i < firstopt; i++) {
- 		if (!recursive_action(argv[i],
--				recurse_flags,  /* flags */
-+				G.recurse_flags,/* flags */
- 				fileAction,     /* file action */
- 				fileAction,     /* dir action */
- #if ENABLE_FEATURE_FIND_MAXDEPTH
-diff -urpN busybox-1.15.1/include/libbb.h busybox-1.15.1-find/include/libbb.h
---- busybox-1.15.1/include/libbb.h	2009-09-12 17:55:58.000000000 +0200
-+++ busybox-1.15.1-find/include/libbb.h	2009-09-30 02:20:21.000000000 +0200
-@@ -286,7 +286,9 @@ enum {
- 	ACTION_DEPTHFIRST     = (1 << 3),
- 	/*ACTION_REVERSE      = (1 << 4), - unused */
- 	ACTION_QUIET          = (1 << 5),
-+	ACTION_DANGLING_OK    = (1 << 6),
- };
-+typedef uint8_t recurse_flags_t;
- extern int recursive_action(const char *fileName, unsigned flags,
- 	int FAST_FUNC (*fileAction)(const char *fileName, struct stat* statbuf, void* userData, int depth),
- 	int FAST_FUNC (*dirAction)(const char *fileName, struct stat* statbuf, void* userData, int depth),
-diff -urpN busybox-1.15.1/libbb/recursive_action.c busybox-1.15.1-find/libbb/recursive_action.c
---- busybox-1.15.1/libbb/recursive_action.c	2009-09-12 17:55:36.000000000 +0200
-+++ busybox-1.15.1-find/libbb/recursive_action.c	2009-09-30 02:20:21.000000000 +0200
-@@ -61,6 +61,7 @@ int FAST_FUNC recursive_action(const cha
- 		unsigned depth)
- {
- 	struct stat statbuf;
-+	unsigned follow;
- 	int status;
- 	DIR *dir;
- 	struct dirent *next;
-@@ -68,14 +69,22 @@ int FAST_FUNC recursive_action(const cha
- 	if (!fileAction) fileAction = true_action;
- 	if (!dirAction) dirAction = true_action;
- 
--	status = ACTION_FOLLOWLINKS; /* hijack a variable for bitmask... */
--	if (!depth)
--		status = ACTION_FOLLOWLINKS | ACTION_FOLLOWLINKS_L0;
--	status = ((flags & status) ? stat : lstat)(fileName, &statbuf);
-+	follow = ACTION_FOLLOWLINKS;
-+	if (depth == 0)
-+		follow = ACTION_FOLLOWLINKS | ACTION_FOLLOWLINKS_L0;
-+	follow &= flags;
-+	status = (follow ? stat : lstat)(fileName, &statbuf);
- 	if (status < 0) {
- #ifdef DEBUG_RECURS_ACTION
- 		bb_error_msg("status=%d flags=%x", status, flags);
- #endif
-+		if ((flags & ACTION_DANGLING_OK)
-+		 && errno == ENOENT
-+		 && lstat(fileName, &statbuf) == 0
-+		) {
-+			/* Dangling link */
-+			return fileAction(fileName, &statbuf, userData, depth);
-+		}
- 		goto done_nak_warn;
- 	}
- 
diff --git a/package/busybox/busybox-1.15.1-hush.patch b/package/busybox/busybox-1.15.1-hush.patch
deleted file mode 100644
index 9ba6614..0000000
--- a/package/busybox/busybox-1.15.1-hush.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-diff -urpN busybox-1.15.1/shell/hush.c busybox-1.15.1-hush/shell/hush.c
---- busybox-1.15.1/shell/hush.c	2009-09-12 17:56:20.000000000 +0200
-+++ busybox-1.15.1-hush/shell/hush.c	2009-09-23 03:27:27.000000000 +0200
-@@ -5183,6 +5183,47 @@ static FILE *generate_stream_from_string
- 		xmove_fd(channel[1], 1);
- 		/* Prevent it from trying to handle ctrl-z etc */
- 		IF_HUSH_JOB(G.run_list_level = 1;)
-+		/* Awful hack for `trap` or $(trap).
-+		 *
-+		 * http://www.opengroup.org/onlinepubs/009695399/utilities/trap.html
-+		 * contains an example where "trap" is executed in a subshell:
-+		 *
-+		 * save_traps=$(trap)
-+		 * ...
-+		 * eval "$save_traps"
-+		 *
-+		 * Standard does not say that "trap" in subshell shall print
-+		 * parent shell's traps. It only says that its output
-+		 * must have suitable form, but then, in the above example
-+		 * (which is not supposed to be normative), it implies that.
-+		 *
-+		 * bash (and probably other shell) does implement it
-+		 * (traps are reset to defaults, but "trap" still shows them),
-+		 * but as a result, "trap" logic is hopelessly messed up:
-+		 *
-+		 * # trap
-+		 * trap -- 'echo Ho' SIGWINCH  <--- we have a handler
-+		 * # (trap)        <--- trap is in subshell - no output (correct, traps are reset)
-+		 * # true | trap   <--- trap is in subshell - no output (ditto)
-+		 * # echo `true | trap`    <--- in subshell - output (but traps are reset!)
-+		 * trap -- 'echo Ho' SIGWINCH
-+		 * # echo `(trap)`         <--- in subshell in subshell - output
-+		 * trap -- 'echo Ho' SIGWINCH
-+		 * # echo `true | (trap)`  <--- in subshell in subshell in subshell - output!
-+		 * trap -- 'echo Ho' SIGWINCH
-+		 *
-+		 * The rules when to forget and when to not forget traps
-+		 * get really complex and nonsensical.
-+		 *
-+		 * Our solution: ONLY bare $(trap) or `trap` is special.
-+		 */
-+		s = skip_whitespace(s);
-+		if (strncmp(s, "trap", 4) == 0 && (*skip_whitespace(s + 4) == '\0'))
-+		{
-+			static const char *const argv[] = { NULL, NULL };
-+			builtin_trap((char**)argv);
-+			exit(0); /* not _exit() - we need to fflush */
-+		}
- #if BB_MMU
- 		reset_traps_to_defaults();
- 		parse_and_run_string(s);
-@@ -7057,7 +7098,8 @@ static int FAST_FUNC builtin_trap(char *
- 			if (G.traps[i]) {
- 				printf("trap -- ");
- 				print_escaped(G.traps[i]);
--				printf(" %s\n", get_signame(i));
-+				/* bash compat: it says SIGxxx, not just xxx */
-+				printf(" SIG%s\n", get_signame(i));
- 			}
- 		}
- 		/*fflush(stdout); - done after each builtin anyway */
diff --git a/package/busybox/busybox-1.15.1-lineedit.patch b/package/busybox/busybox-1.15.1-lineedit.patch
deleted file mode 100644
index 20a7a8f..0000000
--- a/package/busybox/busybox-1.15.1-lineedit.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-diff -urpN busybox-1.15.1/libbb/lineedit.c busybox-1.15.1-lineedit/libbb/lineedit.c
---- busybox-1.15.1/libbb/lineedit.c	2009-09-12 17:55:58.000000000 +0200
-+++ busybox-1.15.1-lineedit/libbb/lineedit.c	2009-09-28 23:56:03.000000000 +0200
-@@ -114,8 +114,8 @@ struct lineedit_statics {
- 	unsigned cmdedit_prmt_len; /* length of prompt (without colors etc) */
- 
- 	unsigned cursor;
--	unsigned command_len;
--	/* *int* maxsize: we want x in "if (x > S.maxsize)"
-+	int command_len; /* must be signed (^D returns -1 len) */
-+	/* signed maxsize: we want x in "if (x > S.maxsize)"
- 	 * to _not_ be promoted to unsigned */
- 	int maxsize;
- 	CHAR_T *command_ps;
-@@ -1095,15 +1095,15 @@ static void save_command_ps_at_cur_histo
- 		int cur = state->cur_history;
- 		free(state->history[cur]);
- 
--#if ENABLE_FEATURE_ASSUME_UNICODE
-+# if ENABLE_FEATURE_ASSUME_UNICODE
- 		{
- 			char tbuf[MAX_LINELEN];
- 			save_string(tbuf, sizeof(tbuf));
- 			state->history[cur] = xstrdup(tbuf);
- 		}
--#else
-+# else
- 		state->history[cur] = xstrdup(command_ps);
--#endif
-+# endif
- 	}
- }
- 
-@@ -1131,7 +1131,7 @@ static int get_next_history(void)
- 	return 0;
- }
- 
--#if ENABLE_FEATURE_EDITING_SAVEHISTORY
-+# if ENABLE_FEATURE_EDITING_SAVEHISTORY
- /* We try to ensure that concurrent additions to the history
-  * do not overwrite each other.
-  * Otherwise shell users get unhappy.
-@@ -1256,10 +1256,10 @@ static void save_history(char *str)
- 		free_line_input_t(st_temp);
- 	}
- }
--#else
--#define load_history(a) ((void)0)
--#define save_history(a) ((void)0)
--#endif /* FEATURE_COMMAND_SAVEHISTORY */
-+# else
-+#  define load_history(a) ((void)0)
-+#  define save_history(a) ((void)0)
-+# endif /* FEATURE_COMMAND_SAVEHISTORY */
- 
- static void remember_in_history(char *str)
- {
-@@ -1290,15 +1290,15 @@ static void remember_in_history(char *st
- 	/* i <= MAX_HISTORY */
- 	state->cur_history = i;
- 	state->cnt_history = i;
--#if ENABLE_FEATURE_EDITING_SAVEHISTORY
-+# if MAX_HISTORY > 0 && ENABLE_FEATURE_EDITING_SAVEHISTORY
- 	if ((state->flags & SAVE_HISTORY) && state->hist_file)
- 		save_history(str);
--#endif
-+# endif
- 	IF_FEATURE_EDITING_FANCY_PROMPT(num_ok_lines++;)
- }
- 
- #else /* MAX_HISTORY == 0 */
--#define remember_in_history(a) ((void)0)
-+# define remember_in_history(a) ((void)0)
- #endif /* MAX_HISTORY */
- 
- 
-@@ -1476,11 +1476,11 @@ static void parse_and_put_prompt(const c
- 				c = *prmt_ptr++;
- 
- 				switch (c) {
--#if ENABLE_FEATURE_GETUSERNAME_AND_HOMEDIR
-+# if ENABLE_FEATURE_GETUSERNAME_AND_HOMEDIR
- 				case 'u':
- 					pbuf = user_buf ? user_buf : (char*)"";
- 					break;
--#endif
-+# endif
- 				case 'h':
- 					pbuf = free_me = safe_gethostname();
- 					*strchrnul(pbuf, '.') = '\0';
-@@ -1488,7 +1488,7 @@ static void parse_and_put_prompt(const c
- 				case '$':
- 					c = (geteuid() == 0 ? '#' : '$');
- 					break;
--#if ENABLE_FEATURE_GETUSERNAME_AND_HOMEDIR
-+# if ENABLE_FEATURE_GETUSERNAME_AND_HOMEDIR
- 				case 'w':
- 					/* /home/user[/something] -> ~[/something] */
- 					pbuf = cwd_buf;
-@@ -1501,7 +1501,7 @@ static void parse_and_put_prompt(const c
- 						pbuf = free_me = xasprintf("~%s", cwd_buf + l);
- 					}
- 					break;
--#endif
-+# endif
- 				case 'W':
- 					pbuf = cwd_buf;
- 					cp = strrchr(pbuf, '/');
-@@ -1688,13 +1688,15 @@ int FAST_FUNC read_line_input(const char
- 
- 	/* With null flags, no other fields are ever used */
- 	state = st ? st : (line_input_t*) &const_int_0;
--#if ENABLE_FEATURE_EDITING_SAVEHISTORY
-+#if MAX_HISTORY > 0
-+# if ENABLE_FEATURE_EDITING_SAVEHISTORY
- 	if ((state->flags & SAVE_HISTORY) && state->hist_file)
- 		if (state->cnt_history == 0)
- 			load_history(state);
--#endif
-+# endif
- 	if (state->flags & DO_HISTORY)
- 		state->cur_history = state->cnt_history;
-+#endif
- 
- 	/* prepare before init handlers */
- 	cmdedit_y = 0;  /* quasireal y, not true if line > xt*yt */
-@@ -1716,7 +1718,7 @@ int FAST_FUNC read_line_input(const char
- 	new_settings.c_cc[VTIME] = 0;
- 	/* Turn off CTRL-C, so we can trap it */
- #ifndef _POSIX_VDISABLE
--#define _POSIX_VDISABLE '\0'
-+# define _POSIX_VDISABLE '\0'
- #endif
- 	new_settings.c_cc[VINTR] = _POSIX_VDISABLE;
- 	tcsetattr_stdin_TCSANOW(&new_settings);
-@@ -2037,7 +2039,8 @@ int FAST_FUNC read_line_input(const char
-  rewrite_line:
- 			/* Rewrite the line with the selected history item */
- 			/* change command */
--			command_len = load_string(state->history[state->cur_history] ? : "", maxsize);
-+			command_len = load_string(state->history[state->cur_history] ?
-+					state->history[state->cur_history] : "", maxsize);
- 			/* redraw and go to eol (bol, in vi) */
- 			redraw(cmdedit_y, (state->flags & VI_MODE) ? 9999 : 0);
- 			break;
-@@ -2121,7 +2124,9 @@ int FAST_FUNC read_line_input(const char
- #undef command
- 
- #if ENABLE_FEATURE_ASSUME_UNICODE
--	command_len = save_string(command, maxsize - 1);
-+	command[0] = '\0';
-+	if (command_len > 0)
-+		command_len = save_string(command, maxsize - 1);
- 	free(command_ps);
- #endif
- 
diff --git a/package/busybox/busybox-1.15.1-pidof_killall.patch b/package/busybox/busybox-1.15.1-pidof_killall.patch
deleted file mode 100644
index 43c0c80..0000000
--- a/package/busybox/busybox-1.15.1-pidof_killall.patch
+++ /dev/null
@@ -1,250 +0,0 @@
-diff -urpN busybox-1.15.1/libbb/procps.c busybox-1.15.1-pidof_killall/libbb/procps.c
---- busybox-1.15.1/libbb/procps.c	2009-09-12 17:55:58.000000000 +0200
-+++ busybox-1.15.1-pidof_killall/libbb/procps.c	2009-09-22 23:03:59.000000000 +0200
-@@ -134,8 +134,8 @@ static unsigned long fast_strtoul_16(cha
- 	return n;
- }
- /* TOPMEM uses fast_strtoul_10, so... */
--#undef ENABLE_FEATURE_FAST_TOP
--#define ENABLE_FEATURE_FAST_TOP 1
-+# undef ENABLE_FEATURE_FAST_TOP
-+# define ENABLE_FEATURE_FAST_TOP 1
- #endif
- 
- #if ENABLE_FEATURE_FAST_TOP
-@@ -198,14 +198,16 @@ procps_status_t* FAST_FUNC procps_scan(p
- 		if (errno)
- 			continue;
- 
--		/* After this point we have to break, not continue
--		 * ("continue" would mean that current /proc/NNN
--		 * is not a valid process info) */
-+		/* After this point we can:
-+		 * "break": stop parsing, return the data
-+		 * "continue": try next /proc/XXX
-+		 */
- 
- 		memset(&sp->vsz, 0, sizeof(*sp) - offsetof(procps_status_t, vsz));
- 
- 		sp->pid = pid;
--		if (!(flags & ~PSSCAN_PID)) break;
-+		if (!(flags & ~PSSCAN_PID))
-+			break; /* we needed only pid, we got it */
- 
- #if ENABLE_SELINUX
- 		if (flags & PSSCAN_CONTEXT) {
-@@ -218,7 +220,7 @@ procps_status_t* FAST_FUNC procps_scan(p
- 
- 		if (flags & PSSCAN_UIDGID) {
- 			if (stat(filename, &sb))
--				break;
-+				continue; /* process probably exited */
- 			/* Effective UID/GID, not real */
- 			sp->uid = sb.st_uid;
- 			sp->gid = sb.st_gid;
-@@ -234,10 +236,10 @@ procps_status_t* FAST_FUNC procps_scan(p
- 			strcpy(filename_tail, "stat");
- 			n = read_to_buf(filename, buf);
- 			if (n < 0)
--				break;
-+				continue; /* process probably exited */
- 			cp = strrchr(buf, ')'); /* split into "PID (cmd" and "<rest>" */
- 			/*if (!cp || cp[1] != ' ')
--				break;*/
-+				continue;*/
- 			cp[0] = '\0';
- 			if (sizeof(sp->comm) < 16)
- 				BUG_comm_size();
-@@ -257,12 +259,12 @@ procps_status_t* FAST_FUNC procps_scan(p
- 				"%lu "                 /* start_time */
- 				"%lu "                 /* vsize */
- 				"%lu "                 /* rss */
--#if ENABLE_FEATURE_TOP_SMP_PROCESS
-+# if ENABLE_FEATURE_TOP_SMP_PROCESS
- 				"%*s %*s %*s %*s %*s %*s " /*rss_rlim, start_code, end_code, start_stack, kstk_esp, kstk_eip */
- 				"%*s %*s %*s %*s "         /*signal, blocked, sigignore, sigcatch */
- 				"%*s %*s %*s %*s "         /*wchan, nswap, cnswap, exit_signal */
- 				"%d"                       /*cpu last seen on*/
--#endif
-+# endif
- 				,
- 				sp->state, &sp->ppid,
- 				&sp->pgid, &sp->sid, &tty,
-@@ -271,17 +273,17 @@ procps_status_t* FAST_FUNC procps_scan(p
- 				&sp->start_time,
- 				&vsz,
- 				&rss
--#if ENABLE_FEATURE_TOP_SMP_PROCESS
-+# if ENABLE_FEATURE_TOP_SMP_PROCESS
- 				, &sp->last_seen_on_cpu
--#endif
-+# endif
- 				);
- 
- 			if (n < 11)
--				break;
--#if ENABLE_FEATURE_TOP_SMP_PROCESS
-+				continue; /* bogus data, get next /proc/XXX */
-+# if ENABLE_FEATURE_TOP_SMP_PROCESS
- 			if (n < 11+15)
- 				sp->last_seen_on_cpu = 0;
--#endif
-+# endif
- 
- 			/* vsz is in bytes and we want kb */
- 			sp->vsz = vsz >> 10;
-@@ -311,14 +313,14 @@ procps_status_t* FAST_FUNC procps_scan(p
- 			sp->vsz = fast_strtoul_10(&cp) >> 10;
- 			/* vsz is in bytes but rss is in *PAGES*! Can you believe that? */
- 			sp->rss = fast_strtoul_10(&cp) << sp->shift_pages_to_kb;
--#if ENABLE_FEATURE_TOP_SMP_PROCESS
-+# if ENABLE_FEATURE_TOP_SMP_PROCESS
- 			/* (6): rss_rlim, start_code, end_code, start_stack, kstk_esp, kstk_eip */
- 			/* (4): signal, blocked, sigignore, sigcatch */
- 			/* (4): wchan, nswap, cnswap, exit_signal */
- 			cp = skip_fields(cp, 14);
- //FIXME: is it safe to assume this field exists?
- 			sp->last_seen_on_cpu = fast_strtoul_10(&cp);
--#endif
-+# endif
- #endif /* end of !ENABLE_FEATURE_TOP_SMP_PROCESS */
- 
- #if ENABLE_FEATURE_PS_ADDITIONAL_COLUMNS
-@@ -343,48 +345,48 @@ procps_status_t* FAST_FUNC procps_scan(p
- 
- 			strcpy(filename_tail, "smaps");
- 			file = fopen_for_read(filename);
--			if (!file)
--				break;
--			while (fgets(buf, sizeof(buf), file)) {
--				unsigned long sz;
--				char *tp;
--				char w;
-+			if (file) {
-+				while (fgets(buf, sizeof(buf), file)) {
-+					unsigned long sz;
-+					char *tp;
-+					char w;
- #define SCAN(str, name) \
- 	if (strncmp(buf, str, sizeof(str)-1) == 0) { \
- 		tp = skip_whitespace(buf + sizeof(str)-1); \
- 		sp->name += fast_strtoul_10(&tp); \
- 		continue; \
- 	}
--				SCAN("Shared_Clean:" , shared_clean );
--				SCAN("Shared_Dirty:" , shared_dirty );
--				SCAN("Private_Clean:", private_clean);
--				SCAN("Private_Dirty:", private_dirty);
-+					SCAN("Shared_Clean:" , shared_clean );
-+					SCAN("Shared_Dirty:" , shared_dirty );
-+					SCAN("Private_Clean:", private_clean);
-+					SCAN("Private_Dirty:", private_dirty);
- #undef SCAN
--				// f7d29000-f7d39000 rw-s ADR M:m OFS FILE
--				tp = strchr(buf, '-');
--				if (tp) {
--					*tp = ' ';
--					tp = buf;
--					sz = fast_strtoul_16(&tp); /* start */
--					sz = (fast_strtoul_16(&tp) - sz) >> 10; /* end - start */
--					// tp -> "rw-s" string
--					w = tp[1];
--					// skipping "rw-s ADR M:m OFS "
--					tp = skip_whitespace(skip_fields(tp, 4));
--					// filter out /dev/something (something != zero)
--					if (strncmp(tp, "/dev/", 5) != 0 || strcmp(tp, "/dev/zero\n") == 0) {
--						if (w == 'w') {
--							sp->mapped_rw += sz;
--						} else if (w == '-') {
--							sp->mapped_ro += sz;
-+					// f7d29000-f7d39000 rw-s ADR M:m OFS FILE
-+					tp = strchr(buf, '-');
-+					if (tp) {
-+						*tp = ' ';
-+						tp = buf;
-+						sz = fast_strtoul_16(&tp); /* start */
-+						sz = (fast_strtoul_16(&tp) - sz) >> 10; /* end - start */
-+						// tp -> "rw-s" string
-+						w = tp[1];
-+						// skipping "rw-s ADR M:m OFS "
-+						tp = skip_whitespace(skip_fields(tp, 4));
-+						// filter out /dev/something (something != zero)
-+						if (strncmp(tp, "/dev/", 5) != 0 || strcmp(tp, "/dev/zero\n") == 0) {
-+							if (w == 'w') {
-+								sp->mapped_rw += sz;
-+							} else if (w == '-') {
-+								sp->mapped_ro += sz;
-+							}
- 						}
--					}
- //else printf("DROPPING %s (%s)\n", buf, tp);
--					if (strcmp(tp, "[stack]\n") == 0)
--						sp->stack += sz;
-+						if (strcmp(tp, "[stack]\n") == 0)
-+							sp->stack += sz;
-+					}
- 				}
-+				fclose(file);
- 			}
--			fclose(file);
- 		}
- #endif /* TOPMEM */
- #if ENABLE_FEATURE_PS_ADDITIONAL_COLUMNS
-@@ -393,23 +395,34 @@ procps_status_t* FAST_FUNC procps_scan(p
- 
- 			strcpy(filename_tail, "status");
- 			file = fopen_for_read(filename);
--			if (!file)
--				break;
--			while (fgets(buf, sizeof(buf), file)) {
--				char *tp;
-+			if (file) {
-+				while (fgets(buf, sizeof(buf), file)) {
-+					char *tp;
- #define SCAN_TWO(str, name, statement) \
- 	if (strncmp(buf, str, sizeof(str)-1) == 0) { \
- 		tp = skip_whitespace(buf + sizeof(str)-1); \
- 		sscanf(tp, "%u", &sp->name); \
- 		statement; \
- 	}
--				SCAN_TWO("Uid:", ruid, continue);
--				SCAN_TWO("Gid:", rgid, break);
-+					SCAN_TWO("Uid:", ruid, continue);
-+					SCAN_TWO("Gid:", rgid, break);
- #undef SCAN_TWO
-+				}
-+				fclose(file);
- 			}
--			fclose(file);
- 		}
- #endif /* PS_ADDITIONAL_COLUMNS */
-+		if (flags & PSSCAN_EXE) {
-+			strcpy(filename_tail, "exe");
-+			free(sp->exe);
-+			sp->exe = xmalloc_readlink(filename);
-+		}
-+		/* Note: if /proc/PID/cmdline is empty,
-+		 * code below "breaks". Therefore it must be
-+		 * the last code to parse /proc/PID/xxx data
-+		 * (we used to have /proc/PID/exe parsing after it
-+		 * and were getting stale sp->exe).
-+		 */
- #if 0 /* PSSCAN_CMD is not used */
- 		if (flags & (PSSCAN_CMD|PSSCAN_ARGV0)) {
- 			free(sp->argv0);
-@@ -452,13 +465,9 @@ procps_status_t* FAST_FUNC procps_scan(p
- 			}
- 		}
- #endif
--		if (flags & PSSCAN_EXE) {
--			strcpy(filename_tail, "exe");
--			free(sp->exe);
--			sp->exe = xmalloc_readlink(filename);
--		}
- 		break;
--	}
-+	} /* for (;;) */
-+
- 	return sp;
- }
- 
diff --git a/package/busybox/busybox-1.15.1-sed.patch b/package/busybox/busybox-1.15.1-sed.patch
deleted file mode 100644
index 7042bf0..0000000
--- a/package/busybox/busybox-1.15.1-sed.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff -urpN busybox-1.15.1/editors/sed.c busybox-1.15.1-sed/editors/sed.c
---- busybox-1.15.1/editors/sed.c	2009-09-12 17:55:58.000000000 +0200
-+++ busybox-1.15.1-sed/editors/sed.c	2009-09-22 03:01:59.000000000 +0200
-@@ -690,10 +690,8 @@ static int do_subst_command(sed_cmd_t *s
- 		if (sed_cmd->which_match)
- 			break;
- 
--		if (*line == '\0')
--			break;
- //maybe (G.regmatch[0].rm_eo ? REG_NOTBOL : 0) instead of unconditional REG_NOTBOL?
--	} while (regexec(current_regex, line, 10, G.regmatch, REG_NOTBOL) != REG_NOMATCH);
-+	} while (*line && regexec(current_regex, line, 10, G.regmatch, REG_NOTBOL) != REG_NOMATCH);
- 
- 	/* Copy rest of string into output pipeline */
- 	while (1) {
diff --git a/package/busybox/busybox-1.15.1-uniq.patch b/package/busybox/busybox-1.15.1-uniq.patch
deleted file mode 100644
index 0055544..0000000
--- a/package/busybox/busybox-1.15.1-uniq.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -urpN busybox-1.15.1/coreutils/uniq.c busybox-1.15.1-uniq/coreutils/uniq.c
---- busybox-1.15.1/coreutils/uniq.c	2009-09-12 17:55:58.000000000 +0200
-+++ busybox-1.15.1-uniq/coreutils/uniq.c	2009-09-23 12:56:09.132695142 +0200
-@@ -84,6 +84,7 @@ int uniq_main(int argc UNUSED_PARAM, cha
- 				break;
- 			}
- 
-+			free(s1);
- 			++dups;	 /* note: testing for overflow seems excessive. */
- 		}
- 
-- 
1.6.3.3
