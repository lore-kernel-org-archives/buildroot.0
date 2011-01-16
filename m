From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Jan 2011 20:12:38 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: bump 1.18.x version
Message-ID: <20110116191253.EF06E8A2FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7f298dcba1f442300e92d528498988b8efa7d41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                          |    2 +-
 .../busybox-1.18.1/busybox-1.18.1-bzip2.patch      |   40 ---
 .../busybox-1.18.1/busybox-1.18.1-cpio.patch       |   20 --
 .../busybox-1.18.1/busybox-1.18.1-hush.patch       |  259 --------------------
 .../busybox-1.18.1/busybox-1.18.1-mkswap.patch     |   12 -
 .../busybox-1.18.1-modprobe-small.patch            |   21 --
 .../busybox-1.18.1/busybox-1.18.1-tftp.patch       |   72 ------
 .../busybox-1.18.1/busybox-1.18.1-warning.patch    |   28 --
 8 files changed, 1 insertions(+), 453 deletions(-)
 delete mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
 delete mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch
 delete mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
 delete mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
 delete mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
 delete mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch
 delete mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 79a6341..e56ef00 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,7 +40,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.15.3"	if BR2_BUSYBOX_VERSION_1_15_X
 	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
 	default "1.17.4"	if BR2_BUSYBOX_VERSION_1_17_X
-	default "1.18.1"	if BR2_BUSYBOX_VERSION_1_18_X
+	default "1.18.2"	if BR2_BUSYBOX_VERSION_1_18_X
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
deleted file mode 100644
index cffa194..0000000
--- a/package/busybox/busybox-1.18.1/busybox-1.18.1-bzip2.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-diff -urpN busybox-1.18.1/archival/bzip2.c busybox-1.18.1-bzip2/archival/bzip2.c
---- busybox-1.18.1/archival/bzip2.c	2010-12-20 01:41:26.000000000 +0100
-+++ busybox-1.18.1-bzip2/archival/bzip2.c	2010-12-30 04:43:11.000000000 +0100
-@@ -128,10 +128,12 @@ IF_DESKTOP(long long) int FAST_FUNC comp
- 			break;
- 	}
- 
--#if ENABLE_FEATURE_CLEAN_UP
-+	/* Can't be conditional on ENABLE_FEATURE_CLEAN_UP -
-+	 * we are called repeatedly
-+	 */
- 	BZ2_bzCompressEnd(strm);
- 	free(iobuf);
--#endif
-+
- 	return total;
- }
- 
-diff -urpN busybox-1.18.1/archival/libarchive/bz/bzlib.c busybox-1.18.1-bzip2/archival/libarchive/bz/bzlib.c
---- busybox-1.18.1/archival/libarchive/bz/bzlib.c	2010-12-20 01:41:26.000000000 +0100
-+++ busybox-1.18.1-bzip2/archival/libarchive/bz/bzlib.c	2010-12-30 04:43:11.000000000 +0100
-@@ -361,7 +361,6 @@ int BZ2_bzCompress(bz_stream *strm, int 
- 
- 
- /*---------------------------------------------------*/
--#if ENABLE_FEATURE_CLEAN_UP
- static
- void BZ2_bzCompressEnd(bz_stream *strm)
- {
-@@ -372,9 +371,8 @@ void BZ2_bzCompressEnd(bz_stream *strm)
- 	free(s->arr2);
- 	free(s->ftab);
- 	free(s->crc32table);
--	free(strm->state);
-+	free(s);
- }
--#endif
- 
- 
- /*---------------------------------------------------*/
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch
deleted file mode 100644
index 135f809..0000000
--- a/package/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff -urpN busybox-1.18.1/archival/cpio.c busybox-1.18.1-cpio/archival/cpio.c
---- busybox-1.18.1/archival/cpio.c	2010-12-20 01:41:26.000000000 +0100
-+++ busybox-1.18.1-cpio/archival/cpio.c	2010-12-26 02:26:38.000000000 +0100
-@@ -308,16 +308,12 @@ int cpio_main(int argc UNUSED_PARAM, cha
- 	/* -L makes sense only with -o or -p */
- 
- #if !ENABLE_FEATURE_CPIO_O
--	/* no parameters */
--	opt_complementary = "=0";
- 	opt = getopt32(argv, OPTION_STR, &cpio_filename);
- 	argv += optind;
- 	if (opt & CPIO_OPT_FILE) { /* -F */
- 		xmove_fd(xopen(cpio_filename, O_RDONLY), STDIN_FILENO);
- 	}
- #else
--	/* _exactly_ one parameter for -p, thus <= 1 param if -p is allowed */
--	opt_complementary = ENABLE_FEATURE_CPIO_P ? "?1" : "=0";
- 	opt = getopt32(argv, OPTION_STR "oH:" IF_FEATURE_CPIO_P("p"), &cpio_filename, &cpio_fmt);
- 	argv += optind;
- 	if ((opt & (CPIO_OPT_FILE|CPIO_OPT_CREATE)) == CPIO_OPT_FILE) { /* -F without -o */
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
deleted file mode 100644
index 5281a52..0000000
--- a/package/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
+++ /dev/null
@@ -1,259 +0,0 @@
-diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
---- busybox-1.18.1/shell/hush.c	2010-12-21 05:31:04.000000000 +0100
-+++ busybox-1.18.1-hush/shell/hush.c	2011-01-07 14:59:19.649956156 +0100
-@@ -913,7 +913,7 @@ static const struct built_in_command blt
-  */
- #if HUSH_DEBUG
- /* prevent disasters with G.debug_indent < 0 */
--# define indent() fprintf(stderr, "%*s", (G.debug_indent * 2) & 0xff, "")
-+# define indent() fdprintf(2, "%*s", (G.debug_indent * 2) & 0xff, "")
- # define debug_enter() (G.debug_indent++)
- # define debug_leave() (G.debug_indent--)
- #else
-@@ -923,56 +923,56 @@ static const struct built_in_command blt
- #endif
- 
- #ifndef debug_printf
--# define debug_printf(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf(...) (indent(), fdprintf(2, __VA_ARGS__))
- #endif
- 
- #ifndef debug_printf_parse
--# define debug_printf_parse(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf_parse(...) (indent(), fdprintf(2, __VA_ARGS__))
- #endif
- 
- #ifndef debug_printf_exec
--#define debug_printf_exec(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+#define debug_printf_exec(...) (indent(), fdprintf(2, __VA_ARGS__))
- #endif
- 
- #ifndef debug_printf_env
--# define debug_printf_env(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf_env(...) (indent(), fdprintf(2, __VA_ARGS__))
- #endif
- 
- #ifndef debug_printf_jobs
--# define debug_printf_jobs(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf_jobs(...) (indent(), fdprintf(2, __VA_ARGS__))
- # define DEBUG_JOBS 1
- #else
- # define DEBUG_JOBS 0
- #endif
- 
- #ifndef debug_printf_expand
--# define debug_printf_expand(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf_expand(...) (indent(), fdprintf(2, __VA_ARGS__))
- # define DEBUG_EXPAND 1
- #else
- # define DEBUG_EXPAND 0
- #endif
- 
- #ifndef debug_printf_varexp
--# define debug_printf_varexp(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf_varexp(...) (indent(), fdprintf(2, __VA_ARGS__))
- #endif
- 
- #ifndef debug_printf_glob
--# define debug_printf_glob(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf_glob(...) (indent(), fdprintf(2, __VA_ARGS__))
- # define DEBUG_GLOB 1
- #else
- # define DEBUG_GLOB 0
- #endif
- 
- #ifndef debug_printf_list
--# define debug_printf_list(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf_list(...) (indent(), fdprintf(2, __VA_ARGS__))
- #endif
- 
- #ifndef debug_printf_subst
--# define debug_printf_subst(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf_subst(...) (indent(), fdprintf(2, __VA_ARGS__))
- #endif
- 
- #ifndef debug_printf_clean
--# define debug_printf_clean(...) (indent(), fprintf(stderr, __VA_ARGS__))
-+# define debug_printf_clean(...) (indent(), fdprintf(2, __VA_ARGS__))
- # define DEBUG_CLEAN 1
- #else
- # define DEBUG_CLEAN 0
-@@ -982,9 +982,9 @@ static const struct built_in_command blt
- static void debug_print_strings(const char *prefix, char **vv)
- {
- 	indent();
--	fprintf(stderr, "%s:\n", prefix);
-+	fdprintf(2, "%s:\n", prefix);
- 	while (*vv)
--		fprintf(stderr, " '%s'\n", *vv++);
-+		fdprintf(2, " '%s'\n", *vv++);
- }
- #else
- # define debug_print_strings(prefix, vv) ((void)0)
-@@ -1416,6 +1416,22 @@ static void hush_exit(int exitcode)
- 		builtin_eval(argv);
- 	}
- 
-+#if ENABLE_FEATURE_CLEAN_UP
-+	{
-+		struct variable *cur_var;
-+		if (G.cwd != bb_msg_unknown)
-+			free((char*)G.cwd);
-+		cur_var = G.top_var;
-+		while (cur_var) {
-+			struct variable *tmp = cur_var;
-+			if (!cur_var->max_len)
-+				free(cur_var->varstr);
-+			cur_var = cur_var->next;
-+			free(tmp);
-+		}
-+	}
-+#endif
-+
- #if ENABLE_HUSH_JOB
- 	fflush_all();
- 	sigexit(- (exitcode & 0xff));
-@@ -2158,22 +2174,22 @@ static void debug_print_list(const char 
- 	int i = 0;
- 
- 	indent();
--	fprintf(stderr, "%s: list:%p n:%d string_start:%d length:%d maxlen:%d glob:%d quoted:%d escape:%d\n",
-+	fdprintf(2, "%s: list:%p n:%d string_start:%d length:%d maxlen:%d glob:%d quoted:%d escape:%d\n",
- 			prefix, list, n, string_start, o->length, o->maxlen,
- 			!!(o->o_expflags & EXP_FLAG_GLOB),
- 			o->has_quoted_part,
- 			!!(o->o_expflags & EXP_FLAG_ESC_GLOB_CHARS));
- 	while (i < n) {
- 		indent();
--		fprintf(stderr, " list[%d]=%d '%s' %p\n", i, (int)list[i],
--				o->data + (int)list[i] + string_start,
--				o->data + (int)list[i] + string_start);
-+		fdprintf(2, " list[%d]=%d '%s' %p\n", i, (int)(uintptr_t)list[i],
-+				o->data + (int)(uintptr_t)list[i] + string_start,
-+				o->data + (int)(uintptr_t)list[i] + string_start);
- 		i++;
- 	}
- 	if (n) {
--		const char *p = o->data + (int)list[n - 1] + string_start;
-+		const char *p = o->data + (int)(uintptr_t)list[n - 1] + string_start;
- 		indent();
--		fprintf(stderr, " total_sz:%ld\n", (long)((p + strlen(p) + 1) - o->data));
-+		fdprintf(2, " total_sz:%ld\n", (long)((p + strlen(p) + 1) - o->data));
- 	}
- }
- #else
-@@ -2672,18 +2688,18 @@ static void debug_print_tree(struct pipe
- 
- 	pin = 0;
- 	while (pi) {
--		fprintf(stderr, "%*spipe %d res_word=%s followup=%d %s\n", lvl*2, "",
-+		fdprintf(2, "%*spipe %d res_word=%s followup=%d %s\n", lvl*2, "",
- 				pin, RES[pi->res_word], pi->followup, PIPE[pi->followup]);
- 		prn = 0;
- 		while (prn < pi->num_cmds) {
- 			struct command *command = &pi->cmds[prn];
- 			char **argv = command->argv;
- 
--			fprintf(stderr, "%*s cmd %d assignment_cnt:%d",
-+			fdprintf(2, "%*s cmd %d assignment_cnt:%d",
- 					lvl*2, "", prn,
- 					command->assignment_cnt);
- 			if (command->group) {
--				fprintf(stderr, " group %s: (argv=%p)%s%s\n",
-+				fdprintf(2, " group %s: (argv=%p)%s%s\n",
- 						CMDTYPE[command->cmd_type],
- 						argv
- # if !BB_MMU
-@@ -2697,10 +2713,10 @@ static void debug_print_tree(struct pipe
- 				continue;
- 			}
- 			if (argv) while (*argv) {
--				fprintf(stderr, " '%s'", *argv);
-+				fdprintf(2, " '%s'", *argv);
- 				argv++;
- 			}
--			fprintf(stderr, "\n");
-+			fdprintf(2, "\n");
- 			prn++;
- 		}
- 		pi = pi->next;
-@@ -4106,7 +4122,16 @@ static struct pipe *parse_stream(char **
- 				if (IS_NULL_CMD(ctx.command)
- 				 && dest.length == 0 && !dest.has_quoted_part
- 				) {
--					continue;
-+					/* This newline can be ignored. But...
-+					 * without the below check, interactive shell
-+					 * will ignore even lines with bare <newline>,
-+					 * and show the continuation prompt:
-+					 * ps1_prompt$ <enter>
-+					 * ps2> _   <=== wrong prompt, should be ps1
-+					 */
-+					struct pipe *pi = ctx.list_head;
-+					if (pi->num_cmds != 0)
-+						continue;
- 				}
- 				/* Treat newline as a command separator. */
- 				done_pipe(&ctx, PIPE_SEQ);
-@@ -7445,7 +7470,7 @@ int hush_main(int argc, char **argv)
- 	unsigned builtin_argc;
- 	char **e;
- 	struct variable *cur_var;
--	struct variable shell_ver;
-+	struct variable *shell_ver;
- 
- 	INIT_G();
- 	if (EXIT_SUCCESS) /* if EXIT_SUCCESS == 0, it is already done */
-@@ -7454,17 +7479,17 @@ int hush_main(int argc, char **argv)
- 	G.argv0_for_re_execing = argv[0];
- #endif
- 	/* Deal with HUSH_VERSION */
--	memset(&shell_ver, 0, sizeof(shell_ver));
--	shell_ver.flg_export = 1;
--	shell_ver.flg_read_only = 1;
-+	shell_ver = xzalloc(sizeof(*shell_ver));
-+	shell_ver->flg_export = 1;
-+	shell_ver->flg_read_only = 1;
- 	/* Code which handles ${var<op>...} needs writable values for all variables,
- 	 * therefore we xstrdup: */
--	shell_ver.varstr = xstrdup(hush_version_str),
--	G.top_var = &shell_ver;
-+	shell_ver->varstr = xstrdup(hush_version_str);
- 	/* Create shell local variables from the values
- 	 * currently living in the environment */
- 	debug_printf_env("unsetenv '%s'\n", "HUSH_VERSION");
- 	unsetenv("HUSH_VERSION"); /* in case it exists in initial env */
-+	G.top_var = shell_ver;
- 	cur_var = G.top_var;
- 	e = environ;
- 	if (e) while (*e) {
-@@ -7479,8 +7504,8 @@ int hush_main(int argc, char **argv)
- 		e++;
- 	}
- 	/* (Re)insert HUSH_VERSION into env (AFTER we scanned the env!) */
--	debug_printf_env("putenv '%s'\n", shell_ver.varstr);
--	putenv(shell_ver.varstr);
-+	debug_printf_env("putenv '%s'\n", shell_ver->varstr);
-+	putenv(shell_ver->varstr);
- 
- 	/* Export PWD */
- 	set_pwd_var(/*exp:*/ 1);
-@@ -7840,18 +7865,6 @@ int hush_main(int argc, char **argv)
- 	parse_and_run_file(stdin);
- 
-  final_return:
--#if ENABLE_FEATURE_CLEAN_UP
--	if (G.cwd != bb_msg_unknown)
--		free((char*)G.cwd);
--	cur_var = G.top_var->next;
--	while (cur_var) {
--		struct variable *tmp = cur_var;
--		if (!cur_var->max_len)
--			free(cur_var->varstr);
--		cur_var = cur_var->next;
--		free(tmp);
--	}
--#endif
- 	hush_exit(G.last_exitcode);
- }
- 
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
deleted file mode 100644
index 41dff57..0000000
--- a/package/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urpN busybox-1.18.1/util-linux/mkswap.c busybox-1.18.1-mkswap/util-linux/mkswap.c
---- busybox-1.18.1/util-linux/mkswap.c	2010-12-20 01:41:27.000000000 +0100
-+++ busybox-1.18.1-mkswap/util-linux/mkswap.c	2011-01-05 11:41:24.455856773 +0100
-@@ -15,7 +15,7 @@ static void mkswap_selinux_setcontext(in
- 	if (!is_selinux_enabled())
- 		return;
- 
--	xfstat(fd, &stbuf, argv[0]);
-+	xfstat(fd, &stbuf, path);
- 	if (S_ISREG(stbuf.st_mode)) {
- 		security_context_t newcon;
- 		security_context_t oldcon = NULL;
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
deleted file mode 100644
index c1d5615..0000000
--- a/package/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -urpN busybox-1.18.1/modutils/modprobe-small.c busybox-1.18.1-modprobe-small/modutils/modprobe-small.c
---- busybox-1.18.1/modutils/modprobe-small.c	2010-12-20 01:41:27.000000000 +0100
-+++ busybox-1.18.1-modprobe-small/modutils/modprobe-small.c	2011-01-09 21:00:26.000000000 +0100
-@@ -844,13 +844,15 @@ int modprobe_main(int argc UNUSED_PARAM,
- 		void *map;
- 
- 		len = MAXINT(ssize_t);
--		map = xmalloc_xopen_read_close(*argv, &len);
-+		map = xmalloc_open_zipped_read_close(*argv, &len);
- 		if (init_module(map, len,
- 			IF_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE(options ? options : "")
- 			IF_NOT_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE("")
--				) != 0)
-+			) != 0
-+		) {
- 			bb_error_msg_and_die("can't insert '%s': %s",
- 					*argv, moderror(errno));
-+		}
- 		return 0;
- 	}
- 
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch
deleted file mode 100644
index b038ea8..0000000
--- a/package/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-diff -urpN busybox-1.18.1/networking/tftp.c busybox-1.18.1-tftp/networking/tftp.c
---- busybox-1.18.1/networking/tftp.c	2010-12-20 01:41:27.000000000 +0100
-+++ busybox-1.18.1-tftp/networking/tftp.c	2011-01-10 12:50:02.687941194 +0100
-@@ -105,39 +105,22 @@ struct BUG_G_too_big {
- #define error_pkt_str    (error_pkt + 4)
- 
- #if ENABLE_FEATURE_TFTP_PROGRESS_BAR
--/* SIGALRM logic nicked from the wget applet */
--static void progress_meter(int flag)
-+static void tftp_progress_update(void)
- {
--	/* We can be called from signal handler */
--	int save_errno = errno;
--
--	if (flag == -1) { /* first call to progress_meter */
--		bb_progress_init(&G.pmt);
--	}
--
- 	bb_progress_update(&G.pmt, G.file, 0, G.pos, G.size);
--
--	if (flag == 0) {
--		/* last call to progress_meter */
--		alarm(0);
--		bb_putchar_stderr('\n');
--	} else {
--		if (flag == -1) { /* first call to progress_meter */
--			signal_SA_RESTART_empty_mask(SIGALRM, progress_meter);
--		}
--		alarm(1);
--	}
--
--	errno = save_errno;
- }
- static void tftp_progress_init(void)
- {
--	progress_meter(-1);
-+	bb_progress_init(&G.pmt);
-+	tftp_progress_update();
- }
- static void tftp_progress_done(void)
- {
--	if (G.pmt.inited)
--		progress_meter(0);
-+	if (G.pmt.inited) {
-+		tftp_progress_update();
-+		bb_putchar_stderr('\n');
-+		G.pmt.inited = 0;
-+	}
- }
- #else
- # define tftp_progress_init() ((void)0)
-@@ -460,9 +443,10 @@ static int tftp_protocol(
- 		xsendto(socket_fd, xbuf, send_len, &peer_lsa->u.sa, peer_lsa->len);
- 
- #if ENABLE_FEATURE_TFTP_PROGRESS_BAR
--		if (ENABLE_TFTP && remote_file) { /* tftp */
-+		if (ENABLE_TFTP && remote_file) /* tftp */
- 			G.pos = (block_nr - 1) * (uoff_t)blksize;
--		}
-+		if (G.pmt.inited)
-+			tftp_progress_update();
- #endif
- 		/* Was it final ACK? then exit */
- 		if (finished && (opcode == TFTP_ACK))
-@@ -479,6 +463,7 @@ static int tftp_protocol(
- 		case 0:
- 			retries--;
- 			if (retries == 0) {
-+				tftp_progress_done();
- 				bb_error_msg("timeout");
- 				goto ret; /* no err packet sent */
- 			}
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch
deleted file mode 100644
index cda94bd..0000000
--- a/package/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-diff -urpN busybox-1.18.1/libbb/procps.c busybox-1.18.1-warning/libbb/procps.c
---- busybox-1.18.1/libbb/procps.c	2010-12-21 05:29:45.000000000 +0100
-+++ busybox-1.18.1-warning/libbb/procps.c	2011-01-07 13:41:22.000000000 +0100
-@@ -154,6 +154,7 @@ static unsigned long fast_strtoul_10(cha
- 	return n;
- }
- 
-+# if ENABLE_FEATURE_FAST_TOP
- static long fast_strtol_10(char **endptr)
- {
- 	if (**endptr != '-')
-@@ -162,6 +163,7 @@ static long fast_strtol_10(char **endptr
- 	(*endptr)++;
- 	return - (long)fast_strtoul_10(endptr);
- }
-+# endif
- 
- static char *skip_fields(char *str, int count)
- {
-@@ -448,7 +450,7 @@ procps_status_t* FAST_FUNC procps_scan(p
- //FIXME: is it safe to assume this field exists?
- 			sp->last_seen_on_cpu = fast_strtoul_10(&cp);
- # endif
--#endif /* end of !ENABLE_FEATURE_TOP_SMP_PROCESS */
-+#endif /* FEATURE_FAST_TOP */
- 
- #if ENABLE_FEATURE_PS_ADDITIONAL_COLUMNS
- 			sp->niceness = tasknice;
-- 
1.7.3.4
