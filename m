From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Sep 2009 15:56:34 +0200
Subject: [Buildroot] [git commit master] busybox: bump 1.15.x version
Message-ID: <20090914135703.2C7C97776D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f76d8a3fd445bf82c648924392f760603cad5f1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                     |    2 +-
 package/busybox/busybox-1.15.0-httpd.patch    |   61 -----
 package/busybox/busybox-1.15.0-hush.patch     |  100 --------
 package/busybox/busybox-1.15.0-inetd.patch    |   58 -----
 package/busybox/busybox-1.15.0-modprobe.patch |   11 -
 package/busybox/busybox-1.15.0-unlzma.patch   |  323 -------------------------
 package/busybox/busybox-1.15.0-unpack.patch   |   12 -
 7 files changed, 1 insertions(+), 566 deletions(-)
 delete mode 100644 package/busybox/busybox-1.15.0-httpd.patch
 delete mode 100644 package/busybox/busybox-1.15.0-hush.patch
 delete mode 100644 package/busybox/busybox-1.15.0-inetd.patch
 delete mode 100644 package/busybox/busybox-1.15.0-modprobe.patch
 delete mode 100644 package/busybox/busybox-1.15.0-unlzma.patch
 delete mode 100644 package/busybox/busybox-1.15.0-unpack.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index a6a35e7..72cbd12 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -41,7 +41,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.12.4"	if BR2_BUSYBOX_VERSION_1_12_X
 	default "1.13.4"	if BR2_BUSYBOX_VERSION_1_13_X
 	default "1.14.3"	if BR2_BUSYBOX_VERSION_1_14_X
-	default "1.15.0"	if BR2_BUSYBOX_VERSION_1_15_X
+	default "1.15.1"	if BR2_BUSYBOX_VERSION_1_15_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
diff --git a/package/busybox/busybox-1.15.0-httpd.patch b/package/busybox/busybox-1.15.0-httpd.patch
deleted file mode 100644
index 3d6ebad..0000000
--- a/package/busybox/busybox-1.15.0-httpd.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-diff -urpN busybox-1.15.0/networking/httpd.c busybox-1.15.0-httpd/networking/httpd.c
---- busybox-1.15.0/networking/httpd.c	2009-08-21 00:26:14.000000000 +0200
-+++ busybox-1.15.0-httpd/networking/httpd.c	2009-09-08 22:33:09.000000000 +0200
-@@ -2101,8 +2101,12 @@ static void handle_incoming_and_exit(con
- 		}
- 		send_cgi_and_exit(urlcopy, prequest, length, cookie, content_type);
- 	}
-+#endif
-+
-+	if (urlp[-1] == '/')
-+		strcpy(urlp, index_page);
-+	if (stat(tptr, &sb) == 0) {
- #if ENABLE_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR
--	{
- 		char *suffix = strrchr(tptr, '.');
- 		if (suffix) {
- 			Htaccess *cur;
-@@ -2112,16 +2116,7 @@ static void handle_incoming_and_exit(con
- 				}
- 			}
- 		}
--	}
- #endif
--	if (prequest != request_GET && prequest != request_HEAD) {
--		send_headers_and_exit(HTTP_NOT_IMPLEMENTED);
--	}
--#endif  /* FEATURE_HTTPD_CGI */
--
--	if (urlp[-1] == '/')
--		strcpy(urlp, index_page);
--	if (stat(tptr, &sb) == 0) {
- 		file_size = sb.st_size;
- 		last_mod = sb.st_mtime;
- 	}
-@@ -2135,19 +2130,18 @@ static void handle_incoming_and_exit(con
- 			send_cgi_and_exit("/cgi-bin/index.cgi", prequest, length, cookie, content_type);
- 		}
- 	}
--#endif
--	/* else {
--	 *	fall through to send_file, it errors out if open fails
--	 * }
--	 */
-+	/* else fall through to send_file, it errors out if open fails: */
- 
-+	if (prequest != request_GET && prequest != request_HEAD) {
-+		/* POST for files does not make sense */
-+		send_headers_and_exit(HTTP_NOT_IMPLEMENTED);
-+	}
- 	send_file_and_exit(tptr,
--#if ENABLE_FEATURE_HTTPD_CGI
- 		(prequest != request_HEAD ? SEND_HEADERS_AND_BODY : SEND_HEADERS)
-+	);
- #else
--		SEND_HEADERS_AND_BODY
-+	send_file_and_exit(tptr, SEND_HEADERS_AND_BODY);
- #endif
--	);
- }
- 
- /*
diff --git a/package/busybox/busybox-1.15.0-hush.patch b/package/busybox/busybox-1.15.0-hush.patch
deleted file mode 100644
index 2cf8064..0000000
--- a/package/busybox/busybox-1.15.0-hush.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-diff -urpN busybox-1.15.0/shell/hush.c busybox-1.15.0-hush/shell/hush.c
---- busybox-1.15.0/shell/hush.c	2009-08-21 00:26:14.000000000 +0200
-+++ busybox-1.15.0-hush/shell/hush.c	2009-09-05 20:08:50.000000000 +0200
-@@ -58,7 +58,7 @@
-  * TODOs:
-  *      grep for "TODO" and fix (some of them are easy)
-  *      builtins: ulimit
-- *      special variables (PWD etc)
-+ *      special variables (done: PWD)
-  *      follow IFS rules more precisely, including update semantics
-  *      export builtin should be special, its arguments are assignments
-  *          and therefore expansion of them should be "one-word" expansion:
-@@ -1432,6 +1432,13 @@ static int set_local_var(char *str, int 
- 	return 0;
- }
- 
-+/* Used at startup and after each cd */
-+static void set_pwd_var(int exp)
-+{
-+	set_local_var(xasprintf("PWD=%s", get_cwd(/*force:*/ 1)),
-+		/*exp:*/ exp, /*lvl:*/ 0, /*ro:*/ 0);
-+}
-+
- static int unset_local_var_len(const char *name, int name_len)
- {
- 	struct variable *cur;
-@@ -1604,6 +1611,9 @@ static const char* setup_prompt_string(i
- 		/* Set up the prompt */
- 		if (promptmode == 0) { /* PS1 */
- 			free((char*)G.PS1);
-+			/* bash uses $PWD value, even if it is set by user.
-+			 * It uses current dir only if PWD is unset.
-+			 * We always use current dir. */
- 			G.PS1 = xasprintf("%s %c ", get_cwd(0), (geteuid() != 0) ? '$' : '#');
- 			prompt_str = G.PS1;
- 		} else
-@@ -6432,8 +6442,49 @@ int hush_main(int argc, char **argv)
- 		}
- 		e++;
- 	}
-+	/* reinstate HUSH_VERSION */
- 	debug_printf_env("putenv '%s'\n", hush_version_str);
--	putenv((char *)hush_version_str); /* reinstate HUSH_VERSION */
-+	putenv((char *)hush_version_str);
-+
-+	/* Export PWD */
-+	set_pwd_var(/*exp:*/ 1);
-+	/* bash also exports SHLVL and _,
-+	 * and sets (but doesn't export) the following variables:
-+	 * BASH=/bin/bash
-+	 * BASH_VERSINFO=([0]="3" [1]="2" [2]="0" [3]="1" [4]="release" [5]="i386-pc-linux-gnu")
-+	 * BASH_VERSION='3.2.0(1)-release'
-+	 * HOSTTYPE=i386
-+	 * MACHTYPE=i386-pc-linux-gnu
-+	 * OSTYPE=linux-gnu
-+	 * HOSTNAME=<xxxxxxxxxx>
-+	 * PPID=<NNNNN>
-+	 * EUID=<NNNNN>
-+	 * UID=<NNNNN>
-+	 * GROUPS=()
-+	 * LINES=<NNN>
-+	 * COLUMNS=<NNN>
-+	 * BASH_ARGC=()
-+	 * BASH_ARGV=()
-+	 * BASH_LINENO=()
-+	 * BASH_SOURCE=()
-+	 * DIRSTACK=()
-+	 * PIPESTATUS=([0]="0")
-+	 * HISTFILE=/<xxx>/.bash_history
-+	 * HISTFILESIZE=500
-+	 * HISTSIZE=500
-+	 * MAILCHECK=60
-+	 * PATH=/usr/gnu/bin:/usr/local/bin:/bin:/usr/bin:.
-+	 * SHELL=/bin/bash
-+	 * SHELLOPTS=braceexpand:emacs:hashall:histexpand:history:interactive-comments:monitor
-+	 * TERM=dumb
-+	 * OPTERR=1
-+	 * OPTIND=1
-+	 * IFS=$' \t\n'
-+	 * PS1='\s-\v\$ '
-+	 * PS2='> '
-+	 * PS4='+ '
-+	 */
-+
- #if ENABLE_FEATURE_EDITING
- 	G.line_input_state = new_line_input_t(FOR_SHELL);
- #endif
-@@ -6816,7 +6867,11 @@ static int FAST_FUNC builtin_cd(char **a
- 		bb_perror_msg("cd: %s", newdir);
- 		return EXIT_FAILURE;
- 	}
--	get_cwd(1);
-+	/* Read current dir (get_cwd(1) is inside) and set PWD.
-+	 * Note: do not enforce exporting. If PWD was unset or unexported,
-+	 * set it again, but do not export. bash does the same.
-+	 */
-+	set_pwd_var(/*exp:*/ 0);
- 	return EXIT_SUCCESS;
- }
- 
diff --git a/package/busybox/busybox-1.15.0-inetd.patch b/package/busybox/busybox-1.15.0-inetd.patch
deleted file mode 100644
index c8d241c..0000000
--- a/package/busybox/busybox-1.15.0-inetd.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-diff -urpN busybox-1.15.0/networking/inetd.c busybox-1.15.0-inetd/networking/inetd.c
---- busybox-1.15.0/networking/inetd.c	2009-08-21 00:26:14.000000000 +0200
-+++ busybox-1.15.0-inetd/networking/inetd.c	2009-09-04 03:50:03.000000000 +0200
-@@ -1031,10 +1031,10 @@ static void reap_child(int sig UNUSED_PA
- 				continue;
- 			/* One of our "wait" services */
- 			if (WIFEXITED(status) && WEXITSTATUS(status))
--				bb_error_msg("%s: exit status 0x%x",
-+				bb_error_msg("%s: exit status %u",
- 						sep->se_program, WEXITSTATUS(status));
- 			else if (WIFSIGNALED(status))
--				bb_error_msg("%s: exit signal 0x%x",
-+				bb_error_msg("%s: exit signal %u",
- 						sep->se_program, WTERMSIG(status));
- 			sep->se_wait = 1;
- 			add_fd_to_set(sep->se_fd);
-@@ -1119,7 +1119,12 @@ int inetd_main(int argc UNUSED_PARAM, ch
- 	else
- 		bb_sanitize_stdio();
- 	if (!(opt & 4)) {
--		openlog(applet_name, LOG_PID, LOG_DAEMON);
-+		/* LOG_NDELAY: connect to syslog daemon NOW.
-+		 * Otherwise, we may open syslog socket
-+		 * in vforked child, making opened fds and syslog()
-+		 * internal state inconsistent.
-+		 * This was observed to leak file descriptors. */
-+		openlog(applet_name, LOG_PID | LOG_NDELAY, LOG_DAEMON);
- 		logmode = LOGMODE_SYSLOG;
- 	}
- 
-@@ -1355,17 +1360,23 @@ int inetd_main(int argc UNUSED_PARAM, ch
- 			if (rlim_ofile.rlim_cur != rlim_ofile_cur)
- 				if (setrlimit(RLIMIT_NOFILE, &rlim_ofile) < 0)
- 					bb_perror_msg("setrlimit");
--			closelog();
-+
-+			/* closelog(); - WRONG. we are after vfork,
-+			 * this may confuse syslog() internal state.
-+			 * Let's hope libc sets syslog fd to CLOEXEC...
-+			 */
- 			xmove_fd(ctrl, STDIN_FILENO);
- 			xdup2(STDIN_FILENO, STDOUT_FILENO);
- 			/* manpages of inetd I managed to find either say
- 			 * that stderr is also redirected to the network,
- 			 * or do not talk about redirection@all (!) */
--			xdup2(STDIN_FILENO, STDERR_FILENO);
--			/* NB: among others, this loop closes listening socket
-+			if (!sep->se_wait) /* only for usual "tcp nowait" */
-+				xdup2(STDIN_FILENO, STDERR_FILENO);
-+			/* NB: among others, this loop closes listening sockets
- 			 * for nowait stream children */
- 			for (sep2 = serv_list; sep2; sep2 = sep2->se_next)
--				maybe_close(sep2->se_fd);
-+				if (sep2->se_fd != ctrl)
-+					maybe_close(sep2->se_fd);
- 			sigaction_set(SIGPIPE, &saved_pipe_handler);
- 			restore_sigmask(&omask);
- 			BB_EXECVP(sep->se_program, sep->se_argv);
diff --git a/package/busybox/busybox-1.15.0-modprobe.patch b/package/busybox/busybox-1.15.0-modprobe.patch
deleted file mode 100644
index ca1201a..0000000
--- a/package/busybox/busybox-1.15.0-modprobe.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -urpN busybox-1.15.0/modutils/modprobe-small.c busybox-1.15.0-modprobe/modutils/modprobe-small.c
---- busybox-1.15.0/modutils/modprobe-small.c	2009-08-21 00:26:14.000000000 +0200
-+++ busybox-1.15.0-modprobe/modutils/modprobe-small.c	2009-09-07 02:43:01.000000000 +0200
-@@ -218,6 +218,7 @@ static void parse_module(module_info *in
- 	bksp(); /* remove last ' ' */
- 	appendc('\0');
- 	info->aliases = copy_stringbuf();
-+	replace(info->aliases, '-', '_');
- 
- 	/* "dependency1 depandency2" */
- 	reset_stringbuf();
diff --git a/package/busybox/busybox-1.15.0-unlzma.patch b/package/busybox/busybox-1.15.0-unlzma.patch
deleted file mode 100644
index 83ecd5a..0000000
--- a/package/busybox/busybox-1.15.0-unlzma.patch
+++ /dev/null
@@ -1,323 +0,0 @@
-diff -urpN busybox-1.15.0/archival/Config.in busybox-1.15.0-unlzma/archival/Config.in
---- busybox-1.15.0/archival/Config.in	2009-08-21 00:26:13.000000000 +0200
-+++ busybox-1.15.0-unlzma/archival/Config.in	2009-09-06 15:10:58.000000000 +0200
-@@ -298,8 +298,8 @@ config FEATURE_LZMA_FAST
- 	default n
- 	depends on UNLZMA
- 	help
--	  This option reduces decompression time by about 25% at the cost of
--	  a 1K bigger binary.
-+	  This option reduces decompression time by about 33% at the cost of
-+	  a 2K bigger binary.
- 
- config UNZIP
- 	bool "unzip"
-diff -urpN busybox-1.15.0/archival/libunarchive/decompress_unlzma.c busybox-1.15.0-unlzma/archival/libunarchive/decompress_unlzma.c
---- busybox-1.15.0/archival/libunarchive/decompress_unlzma.c	2009-08-21 00:26:13.000000000 +0200
-+++ busybox-1.15.0-unlzma/archival/libunarchive/decompress_unlzma.c	2009-09-06 15:10:58.000000000 +0200
-@@ -8,15 +8,14 @@
-  *
-  * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
-  */
-+
- #include "libbb.h"
- #include "unarchive.h"
- 
- #if ENABLE_FEATURE_LZMA_FAST
- #  define speed_inline ALWAYS_INLINE
--#  define size_inline
- #else
- #  define speed_inline
--#  define size_inline ALWAYS_INLINE
- #endif
- 
- 
-@@ -45,8 +44,8 @@ typedef struct {
- #define RC_MODEL_TOTAL_BITS 11
- 
- 
--/* Called twice: once at startup (LZMA_FAST only) and once in rc_normalize() */
--static size_inline void rc_read(rc_t *rc)
-+/* Called twice: once at startup and once in rc_normalize() */
-+static void rc_read(rc_t *rc)
- {
- 	int buffer_size = safe_read(rc->fd, RC_BUFFER, RC_BUFFER_SIZE);
- 	if (buffer_size <= 0)
-@@ -55,17 +54,8 @@ static size_inline void rc_read(rc_t *rc
- 	rc->buffer_end = RC_BUFFER + buffer_size;
- }
- 
--/* Called twice, but one callsite is in speed_inline'd rc_is_bit_1() */
--static void rc_do_normalize(rc_t *rc)
--{
--	if (rc->ptr >= rc->buffer_end)
--		rc_read(rc);
--	rc->range <<= 8;
--	rc->code = (rc->code << 8) | *rc->ptr++;
--}
--
- /* Called once */
--static ALWAYS_INLINE rc_t* rc_init(int fd) /*, int buffer_size) */
-+static rc_t* rc_init(int fd) /*, int buffer_size) */
- {
- 	int i;
- 	rc_t *rc;
-@@ -73,18 +63,17 @@ static ALWAYS_INLINE rc_t* rc_init(int f
- 	rc = xmalloc(sizeof(*rc) + RC_BUFFER_SIZE);
- 
- 	rc->fd = fd;
-+	/* rc->buffer_size = buffer_size; */
-+	rc->buffer_end = RC_BUFFER + RC_BUFFER_SIZE;
- 	rc->ptr = rc->buffer_end;
- 
-+	rc->code = 0;
-+	rc->range = 0xFFFFFFFF;
- 	for (i = 0; i < 5; i++) {
--#if ENABLE_FEATURE_LZMA_FAST
- 		if (rc->ptr >= rc->buffer_end)
- 			rc_read(rc);
- 		rc->code = (rc->code << 8) | *rc->ptr++;
--#else
--		rc_do_normalize(rc);
--#endif
- 	}
--	rc->range = 0xFFFFFFFF;
- 	return rc;
- }
- 
-@@ -94,6 +83,14 @@ static ALWAYS_INLINE void rc_free(rc_t *
- 	free(rc);
- }
- 
-+/* Called twice, but one callsite is in speed_inline'd rc_is_bit_0_helper() */
-+static void rc_do_normalize(rc_t *rc)
-+{
-+	if (rc->ptr >= rc->buffer_end)
-+		rc_read(rc);
-+	rc->range <<= 8;
-+	rc->code = (rc->code << 8) | *rc->ptr++;
-+}
- static ALWAYS_INLINE void rc_normalize(rc_t *rc)
- {
- 	if (rc->range < (1 << RC_TOP_BITS)) {
-@@ -101,28 +98,49 @@ static ALWAYS_INLINE void rc_normalize(r
- 	}
- }
- 
--/* rc_is_bit_1 is called 9 times */
--static speed_inline int rc_is_bit_1(rc_t *rc, uint16_t *p)
-+/* rc_is_bit_0 is called 9 times */
-+/* Why rc_is_bit_0_helper exists?
-+ * Because we want to always expose (rc->code < rc->bound) to optimizer.
-+ * Thus rc_is_bit_0 is always inlined, and rc_is_bit_0_helper is inlined
-+ * only if we compile for speed.
-+ */
-+static speed_inline uint32_t rc_is_bit_0_helper(rc_t *rc, uint16_t *p)
- {
- 	rc_normalize(rc);
- 	rc->bound = *p * (rc->range >> RC_MODEL_TOTAL_BITS);
--	if (rc->code < rc->bound) {
--		rc->range = rc->bound;
--		*p += ((1 << RC_MODEL_TOTAL_BITS) - *p) >> RC_MOVE_BITS;
--		return 0;
--	}
-+	return rc->bound;
-+}
-+static ALWAYS_INLINE int rc_is_bit_0(rc_t *rc, uint16_t *p)
-+{
-+	uint32_t t = rc_is_bit_0_helper(rc, p);
-+	return rc->code < t;
-+}
-+
-+/* Called ~10 times, but very small, thus inlined */
-+static speed_inline void rc_update_bit_0(rc_t *rc, uint16_t *p)
-+{
-+	rc->range = rc->bound;
-+	*p += ((1 << RC_MODEL_TOTAL_BITS) - *p) >> RC_MOVE_BITS;
-+}
-+static speed_inline void rc_update_bit_1(rc_t *rc, uint16_t *p)
-+{
- 	rc->range -= rc->bound;
- 	rc->code -= rc->bound;
- 	*p -= *p >> RC_MOVE_BITS;
--	return 1;
- }
- 
- /* Called 4 times in unlzma loop */
--static speed_inline int rc_get_bit(rc_t *rc, uint16_t *p, int *symbol)
-+static int rc_get_bit(rc_t *rc, uint16_t *p, int *symbol)
- {
--	int ret = rc_is_bit_1(rc, p);
--	*symbol = *symbol * 2 + ret;
--	return ret;
-+	if (rc_is_bit_0(rc, p)) {
-+		rc_update_bit_0(rc, p);
-+		*symbol *= 2;
-+		return 0;
-+	} else {
-+		rc_update_bit_1(rc, p);
-+		*symbol = *symbol * 2 + 1;
-+		return 1;
-+	}
- }
- 
- /* Called once */
-@@ -248,13 +266,13 @@ unpack_lzma_stream(int src_fd, int dst_f
- 	header.dst_size = SWAP_LE64(header.dst_size);
- 
- 	if (header.dict_size == 0)
--		header.dict_size++;
-+		header.dict_size = 1;
- 
- 	buffer = xmalloc(MIN(header.dst_size, header.dict_size));
- 
- 	num_probs = LZMA_BASE_SIZE + (LZMA_LIT_SIZE << (lc + lp));
- 	p = xmalloc(num_probs * sizeof(*p));
--	num_probs += LZMA_LITERAL - LZMA_BASE_SIZE;
-+	num_probs = LZMA_LITERAL + (LZMA_LIT_SIZE << (lc + lp));
- 	for (i = 0; i < num_probs; i++)
- 		p[i] = (1 << RC_MODEL_TOTAL_BITS) >> 1;
- 
-@@ -264,8 +282,9 @@ unpack_lzma_stream(int src_fd, int dst_f
- 		int pos_state = (buffer_pos + global_pos) & pos_state_mask;
- 
- 		prob = p + LZMA_IS_MATCH + (state << LZMA_NUM_POS_BITS_MAX) + pos_state;
--		if (!rc_is_bit_1(rc, prob)) {
-+		if (rc_is_bit_0(rc, prob)) {
- 			mi = 1;
-+			rc_update_bit_0(rc, prob);
- 			prob = (p + LZMA_LITERAL
- 			        + (LZMA_LIT_SIZE * ((((buffer_pos + global_pos) & literal_pos_mask) << lc)
- 			                            + (previous_byte >> (8 - lc))
-@@ -321,21 +340,27 @@ unpack_lzma_stream(int src_fd, int dst_f
- 			int offset;
- 			uint16_t *prob_len;
- 
-+			rc_update_bit_1(rc, prob);
- 			prob = p + LZMA_IS_REP + state;
--			if (!rc_is_bit_1(rc, prob)) {
-+			if (rc_is_bit_0(rc, prob)) {
-+				rc_update_bit_0(rc, prob);
- 				rep3 = rep2;
- 				rep2 = rep1;
- 				rep1 = rep0;
- 				state = state < LZMA_NUM_LIT_STATES ? 0 : 3;
- 				prob = p + LZMA_LEN_CODER;
- 			} else {
--				prob += LZMA_IS_REP_G0 - LZMA_IS_REP;
--				if (!rc_is_bit_1(rc, prob)) {
-+				rc_update_bit_1(rc, prob);
-+				prob = p + LZMA_IS_REP_G0 + state;
-+				if (rc_is_bit_0(rc, prob)) {
-+					rc_update_bit_0(rc, prob);
- 					prob = (p + LZMA_IS_REP_0_LONG
- 					        + (state << LZMA_NUM_POS_BITS_MAX)
- 					        + pos_state
- 					);
--					if (!rc_is_bit_1(rc, prob)) {
-+					if (rc_is_bit_0(rc, prob)) {
-+						rc_update_bit_0(rc, prob);
-+
- 						state = state < LZMA_NUM_LIT_STATES ? 9 : 11;
- #if ENABLE_FEATURE_LZMA_FAST
- 						pos = buffer_pos - rep0;
-@@ -347,16 +372,25 @@ unpack_lzma_stream(int src_fd, int dst_f
- 						len = 1;
- 						goto string;
- #endif
-+					} else {
-+						rc_update_bit_1(rc, prob);
- 					}
- 				} else {
- 					uint32_t distance;
- 
--					prob += LZMA_IS_REP_G1 - LZMA_IS_REP_G0;
--					distance = rep1;
--					if (rc_is_bit_1(rc, prob)) {
--						prob += LZMA_IS_REP_G2 - LZMA_IS_REP_G1;
--						distance = rep2;
--						if (rc_is_bit_1(rc, prob)) {
-+					rc_update_bit_1(rc, prob);
-+					prob = p + LZMA_IS_REP_G1 + state;
-+					if (rc_is_bit_0(rc, prob)) {
-+						rc_update_bit_0(rc, prob);
-+						distance = rep1;
-+					} else {
-+						rc_update_bit_1(rc, prob);
-+						prob = p + LZMA_IS_REP_G2 + state;
-+						if (rc_is_bit_0(rc, prob)) {
-+							rc_update_bit_0(rc, prob);
-+							distance = rep2;
-+						} else {
-+							rc_update_bit_1(rc, prob);
- 							distance = rep3;
- 							rep3 = rep2;
- 						}
-@@ -370,20 +404,24 @@ unpack_lzma_stream(int src_fd, int dst_f
- 			}
- 
- 			prob_len = prob + LZMA_LEN_CHOICE;
--			if (!rc_is_bit_1(rc, prob_len)) {
--				prob_len += LZMA_LEN_LOW - LZMA_LEN_CHOICE
--				            + (pos_state << LZMA_LEN_NUM_LOW_BITS);
-+			if (rc_is_bit_0(rc, prob_len)) {
-+				rc_update_bit_0(rc, prob_len);
-+				prob_len = (prob + LZMA_LEN_LOW
-+				            + (pos_state << LZMA_LEN_NUM_LOW_BITS));
- 				offset = 0;
- 				num_bits = LZMA_LEN_NUM_LOW_BITS;
- 			} else {
--				prob_len += LZMA_LEN_CHOICE_2 - LZMA_LEN_CHOICE;
--				if (!rc_is_bit_1(rc, prob_len)) {
--					prob_len += LZMA_LEN_MID - LZMA_LEN_CHOICE_2
--					            + (pos_state << LZMA_LEN_NUM_MID_BITS);
-+				rc_update_bit_1(rc, prob_len);
-+				prob_len = prob + LZMA_LEN_CHOICE_2;
-+				if (rc_is_bit_0(rc, prob_len)) {
-+					rc_update_bit_0(rc, prob_len);
-+					prob_len = (prob + LZMA_LEN_MID
-+					            + (pos_state << LZMA_LEN_NUM_MID_BITS));
- 					offset = 1 << LZMA_LEN_NUM_LOW_BITS;
- 					num_bits = LZMA_LEN_NUM_MID_BITS;
- 				} else {
--					prob_len += LZMA_LEN_HIGH - LZMA_LEN_CHOICE_2;
-+					rc_update_bit_1(rc, prob_len);
-+					prob_len = prob + LZMA_LEN_HIGH;
- 					offset = ((1 << LZMA_LEN_NUM_LOW_BITS)
- 					          + (1 << LZMA_LEN_NUM_MID_BITS));
- 					num_bits = LZMA_LEN_NUM_HIGH_BITS;
-@@ -400,20 +438,19 @@ unpack_lzma_stream(int src_fd, int dst_f
- 				       ((len < LZMA_NUM_LEN_TO_POS_STATES ? len :
- 				         LZMA_NUM_LEN_TO_POS_STATES - 1)
- 				         << LZMA_NUM_POS_SLOT_BITS);
--				rc_bit_tree_decode(rc, prob,
--					LZMA_NUM_POS_SLOT_BITS, &pos_slot);
--				rep0 = pos_slot;
-+				rc_bit_tree_decode(rc, prob, LZMA_NUM_POS_SLOT_BITS,
-+								   &pos_slot);
- 				if (pos_slot >= LZMA_START_POS_MODEL_INDEX) {
- 					num_bits = (pos_slot >> 1) - 1;
- 					rep0 = 2 | (pos_slot & 1);
--					prob = p + LZMA_ALIGN;
- 					if (pos_slot < LZMA_END_POS_MODEL_INDEX) {
- 						rep0 <<= num_bits;
--						prob += LZMA_SPEC_POS - LZMA_ALIGN - 1 + rep0 - pos_slot;
-+						prob = p + LZMA_SPEC_POS + rep0 - pos_slot - 1;
- 					} else {
- 						num_bits -= LZMA_NUM_ALIGN_BITS;
- 						while (num_bits--)
- 							rep0 = (rep0 << 1) | rc_direct_bit(rc);
-+						prob = p + LZMA_ALIGN;
- 						rep0 <<= LZMA_NUM_ALIGN_BITS;
- 						num_bits = LZMA_NUM_ALIGN_BITS;
- 					}
-@@ -424,7 +461,8 @@ unpack_lzma_stream(int src_fd, int dst_f
- 							rep0 |= i;
- 						i <<= 1;
- 					}
--				}
-+				} else
-+					rep0 = pos_slot;
- 				if (++rep0 == 0)
- 					break;
- 			}
diff --git a/package/busybox/busybox-1.15.0-unpack.patch b/package/busybox/busybox-1.15.0-unpack.patch
deleted file mode 100644
index 954618b..0000000
--- a/package/busybox/busybox-1.15.0-unpack.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urpN busybox-1.15.0/archival/libunarchive/data_extract_all.c busybox-1.15.0-unpack/archival/libunarchive/data_extract_all.c
---- busybox-1.15.0/archival/libunarchive/data_extract_all.c	2009-08-21 00:26:13.000000000 +0200
-+++ busybox-1.15.0-unpack/archival/libunarchive/data_extract_all.c	2009-08-30 01:05:39.000000000 +0200
-@@ -132,7 +132,7 @@ void FAST_FUNC data_extract_all(archive_
- #endif
- 			lchown(file_header->name, file_header->uid, file_header->gid);
- 	}
--	if (S_ISLNK(file_header->mode)) {
-+	if (!S_ISLNK(file_header->mode)) {
- 		/* uclibc has no lchmod, glibc is even stranger -
- 		 * it has lchmod which seems to do nothing!
- 		 * so we use chmod... */
-- 
1.6.3.3
