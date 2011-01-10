From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Jan 2011 14:41:22 -0300
Subject: [Buildroot] [PATCH 1/4] busybox: add/update 1.18.1 fixes for hush,
	mkswap, modprobe, tftp and procps
Message-ID: <1294681285-1205-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../busybox-1.18.1/busybox-1.18.1-hush.patch       |   28 ++++++--
 .../busybox-1.18.1/busybox-1.18.1-mkswap.patch     |   12 +++
 .../busybox-1.18.1-modprobe-small.patch            |   21 ++++++
 .../busybox-1.18.1/busybox-1.18.1-tftp.patch       |   72 ++++++++++++++++++++
 .../busybox-1.18.1/busybox-1.18.1-warning.patch    |   28 ++++++++
 5 files changed, 156 insertions(+), 5 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
 create mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
 create mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch
 create mode 100644 package/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch

diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
index 3e189a9..5281a52 100644
--- a/package/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
+++ b/package/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
@@ -1,6 +1,6 @@
 diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
 --- busybox-1.18.1/shell/hush.c	2010-12-21 05:31:04.000000000 +0100
-+++ busybox-1.18.1-hush/shell/hush.c	2010-12-21 21:20:02.493651813 +0100
++++ busybox-1.18.1-hush/shell/hush.c	2011-01-07 14:59:19.649956156 +0100
 @@ -913,7 +913,7 @@ static const struct built_in_command blt
   */
  #if HUSH_DEBUG
@@ -177,7 +177,25 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
  			prn++;
  		}
  		pi = pi->next;
-@@ -7445,7 +7461,7 @@ int hush_main(int argc, char **argv)
+@@ -4106,7 +4122,16 @@ static struct pipe *parse_stream(char **
+ 				if (IS_NULL_CMD(ctx.command)
+ 				 && dest.length == 0 && !dest.has_quoted_part
+ 				) {
+-					continue;
++					/* This newline can be ignored. But...
++					 * without the below check, interactive shell
++					 * will ignore even lines with bare <newline>,
++					 * and show the continuation prompt:
++					 * ps1_prompt$ <enter>
++					 * ps2> _   <=== wrong prompt, should be ps1
++					 */
++					struct pipe *pi = ctx.list_head;
++					if (pi->num_cmds != 0)
++						continue;
+ 				}
+ 				/* Treat newline as a command separator. */
+ 				done_pipe(&ctx, PIPE_SEQ);
+@@ -7445,7 +7470,7 @@ int hush_main(int argc, char **argv)
  	unsigned builtin_argc;
  	char **e;
  	struct variable *cur_var;
@@ -186,7 +204,7 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
  
  	INIT_G();
  	if (EXIT_SUCCESS) /* if EXIT_SUCCESS == 0, it is already done */
-@@ -7454,17 +7470,17 @@ int hush_main(int argc, char **argv)
+@@ -7454,17 +7479,17 @@ int hush_main(int argc, char **argv)
  	G.argv0_for_re_execing = argv[0];
  #endif
  	/* Deal with HUSH_VERSION */
@@ -209,7 +227,7 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
  	cur_var = G.top_var;
  	e = environ;
  	if (e) while (*e) {
-@@ -7479,8 +7495,8 @@ int hush_main(int argc, char **argv)
+@@ -7479,8 +7504,8 @@ int hush_main(int argc, char **argv)
  		e++;
  	}
  	/* (Re)insert HUSH_VERSION into env (AFTER we scanned the env!) */
@@ -220,7 +238,7 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
  
  	/* Export PWD */
  	set_pwd_var(/*exp:*/ 1);
-@@ -7840,18 +7856,6 @@ int hush_main(int argc, char **argv)
+@@ -7840,18 +7865,6 @@ int hush_main(int argc, char **argv)
  	parse_and_run_file(stdin);
  
   final_return:
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
new file mode 100644
index 0000000..41dff57
--- /dev/null
+++ b/package/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.18.1/util-linux/mkswap.c busybox-1.18.1-mkswap/util-linux/mkswap.c
+--- busybox-1.18.1/util-linux/mkswap.c	2010-12-20 01:41:27.000000000 +0100
++++ busybox-1.18.1-mkswap/util-linux/mkswap.c	2011-01-05 11:41:24.455856773 +0100
+@@ -15,7 +15,7 @@ static void mkswap_selinux_setcontext(in
+ 	if (!is_selinux_enabled())
+ 		return;
+ 
+-	xfstat(fd, &stbuf, argv[0]);
++	xfstat(fd, &stbuf, path);
+ 	if (S_ISREG(stbuf.st_mode)) {
+ 		security_context_t newcon;
+ 		security_context_t oldcon = NULL;
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
new file mode 100644
index 0000000..c1d5615
--- /dev/null
+++ b/package/busybox/busybox-1.18.1/busybox-1.18.1-modprobe-small.patch
@@ -0,0 +1,21 @@
+diff -urpN busybox-1.18.1/modutils/modprobe-small.c busybox-1.18.1-modprobe-small/modutils/modprobe-small.c
+--- busybox-1.18.1/modutils/modprobe-small.c	2010-12-20 01:41:27.000000000 +0100
++++ busybox-1.18.1-modprobe-small/modutils/modprobe-small.c	2011-01-09 21:00:26.000000000 +0100
+@@ -844,13 +844,15 @@ int modprobe_main(int argc UNUSED_PARAM,
+ 		void *map;
+ 
+ 		len = MAXINT(ssize_t);
+-		map = xmalloc_xopen_read_close(*argv, &len);
++		map = xmalloc_open_zipped_read_close(*argv, &len);
+ 		if (init_module(map, len,
+ 			IF_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE(options ? options : "")
+ 			IF_NOT_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE("")
+-				) != 0)
++			) != 0
++		) {
+ 			bb_error_msg_and_die("can't insert '%s': %s",
+ 					*argv, moderror(errno));
++		}
+ 		return 0;
+ 	}
+ 
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch
new file mode 100644
index 0000000..b038ea8
--- /dev/null
+++ b/package/busybox/busybox-1.18.1/busybox-1.18.1-tftp.patch
@@ -0,0 +1,72 @@
+diff -urpN busybox-1.18.1/networking/tftp.c busybox-1.18.1-tftp/networking/tftp.c
+--- busybox-1.18.1/networking/tftp.c	2010-12-20 01:41:27.000000000 +0100
++++ busybox-1.18.1-tftp/networking/tftp.c	2011-01-10 12:50:02.687941194 +0100
+@@ -105,39 +105,22 @@ struct BUG_G_too_big {
+ #define error_pkt_str    (error_pkt + 4)
+ 
+ #if ENABLE_FEATURE_TFTP_PROGRESS_BAR
+-/* SIGALRM logic nicked from the wget applet */
+-static void progress_meter(int flag)
++static void tftp_progress_update(void)
+ {
+-	/* We can be called from signal handler */
+-	int save_errno = errno;
+-
+-	if (flag == -1) { /* first call to progress_meter */
+-		bb_progress_init(&G.pmt);
+-	}
+-
+ 	bb_progress_update(&G.pmt, G.file, 0, G.pos, G.size);
+-
+-	if (flag == 0) {
+-		/* last call to progress_meter */
+-		alarm(0);
+-		bb_putchar_stderr('\n');
+-	} else {
+-		if (flag == -1) { /* first call to progress_meter */
+-			signal_SA_RESTART_empty_mask(SIGALRM, progress_meter);
+-		}
+-		alarm(1);
+-	}
+-
+-	errno = save_errno;
+ }
+ static void tftp_progress_init(void)
+ {
+-	progress_meter(-1);
++	bb_progress_init(&G.pmt);
++	tftp_progress_update();
+ }
+ static void tftp_progress_done(void)
+ {
+-	if (G.pmt.inited)
+-		progress_meter(0);
++	if (G.pmt.inited) {
++		tftp_progress_update();
++		bb_putchar_stderr('\n');
++		G.pmt.inited = 0;
++	}
+ }
+ #else
+ # define tftp_progress_init() ((void)0)
+@@ -460,9 +443,10 @@ static int tftp_protocol(
+ 		xsendto(socket_fd, xbuf, send_len, &peer_lsa->u.sa, peer_lsa->len);
+ 
+ #if ENABLE_FEATURE_TFTP_PROGRESS_BAR
+-		if (ENABLE_TFTP && remote_file) { /* tftp */
++		if (ENABLE_TFTP && remote_file) /* tftp */
+ 			G.pos = (block_nr - 1) * (uoff_t)blksize;
+-		}
++		if (G.pmt.inited)
++			tftp_progress_update();
+ #endif
+ 		/* Was it final ACK? then exit */
+ 		if (finished && (opcode == TFTP_ACK))
+@@ -479,6 +463,7 @@ static int tftp_protocol(
+ 		case 0:
+ 			retries--;
+ 			if (retries == 0) {
++				tftp_progress_done();
+ 				bb_error_msg("timeout");
+ 				goto ret; /* no err packet sent */
+ 			}
diff --git a/package/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch b/package/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch
new file mode 100644
index 0000000..cda94bd
--- /dev/null
+++ b/package/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch
@@ -0,0 +1,28 @@
+diff -urpN busybox-1.18.1/libbb/procps.c busybox-1.18.1-warning/libbb/procps.c
+--- busybox-1.18.1/libbb/procps.c	2010-12-21 05:29:45.000000000 +0100
++++ busybox-1.18.1-warning/libbb/procps.c	2011-01-07 13:41:22.000000000 +0100
+@@ -154,6 +154,7 @@ static unsigned long fast_strtoul_10(cha
+ 	return n;
+ }
+ 
++# if ENABLE_FEATURE_FAST_TOP
+ static long fast_strtol_10(char **endptr)
+ {
+ 	if (**endptr != '-')
+@@ -162,6 +163,7 @@ static long fast_strtol_10(char **endptr
+ 	(*endptr)++;
+ 	return - (long)fast_strtoul_10(endptr);
+ }
++# endif
+ 
+ static char *skip_fields(char *str, int count)
+ {
+@@ -448,7 +450,7 @@ procps_status_t* FAST_FUNC procps_scan(p
+ //FIXME: is it safe to assume this field exists?
+ 			sp->last_seen_on_cpu = fast_strtoul_10(&cp);
+ # endif
+-#endif /* end of !ENABLE_FEATURE_TOP_SMP_PROCESS */
++#endif /* FEATURE_FAST_TOP */
+ 
+ #if ENABLE_FEATURE_PS_ADDITIONAL_COLUMNS
+ 			sp->niceness = tasknice;
-- 
1.7.3.4
