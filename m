From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Jan 2014 12:06:26 -0300
Subject: [Buildroot] [PATCH] busybox: bump 1.22 series to 1.22.1
Message-ID: <1390230386-27716-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../busybox/1.22.0/0002-busybox-1.22.0-find.patch  | 40 -----------
 .../busybox/1.22.0/0003-busybox-1.22.0-grep.patch  | 80 ----------------------
 .../busybox/1.22.0/0004-busybox-1.22.0-ntpd.patch  | 11 ---
 .../1.22.0/0005-busybox-1.22.0-lineedit.patch      | 12 ----
 ...libiproute-use-linux-if_packet.h-instead-.patch |  0
 .../busybox/1.22.1/0002-busybox-1.22.1-ash.patch   | 20 ++++++
 package/busybox/Config.in                          |  2 +-
 7 files changed, 21 insertions(+), 144 deletions(-)
 delete mode 100644 package/busybox/1.22.0/0002-busybox-1.22.0-find.patch
 delete mode 100644 package/busybox/1.22.0/0003-busybox-1.22.0-grep.patch
 delete mode 100644 package/busybox/1.22.0/0004-busybox-1.22.0-ntpd.patch
 delete mode 100644 package/busybox/1.22.0/0005-busybox-1.22.0-lineedit.patch
 rename package/busybox/{1.22.0 => 1.22.1}/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch (100%)
 create mode 100644 package/busybox/1.22.1/0002-busybox-1.22.1-ash.patch

diff --git a/package/busybox/1.22.0/0002-busybox-1.22.0-find.patch b/package/busybox/1.22.0/0002-busybox-1.22.0-find.patch
deleted file mode 100644
index 75a06a8..0000000
--- a/package/busybox/1.22.0/0002-busybox-1.22.0-find.patch
+++ /dev/null
@@ -1,40 +0,0 @@
---- busybox-1.22.0/findutils/find.c
-+++ busybox-1.22.0-find/findutils/find.c
-@@ -1291,9 +1291,27 @@ int find_main(int argc, char **argv) MAI
- int find_main(int argc UNUSED_PARAM, char **argv)
- {
- 	int i, firstopt, status = EXIT_SUCCESS;
-+	char **past_HLP, *saved;
- 
- 	INIT_G();
- 
-+	/* "find -type f" + getopt("+HLP") => disaster.
-+	 * Need to avoid getopt running into a non-HLP option.
-+	 * Do this by temporarily storing NULL there:
-+	 */
-+	past_HLP = argv;
-+	for (;;) {
-+		saved = *++past_HLP;
-+		if (!saved)
-+			break;
-+		if (saved[0] != '-')
-+			break;
-+		if (!saved[1])
-+			break; /* it is "-" */
-+		if ((saved+1)[strspn(saved+1, "HLP")] != '\0')
-+			break;
-+	}
-+	*past_HLP = NULL;
- 	/* "+": stop on first non-option */
- 	i = getopt32(argv, "+HLP");
- 	if (i & (1<<0))
-@@ -1301,7 +1319,8 @@ int find_main(int argc UNUSED_PARAM, cha
- 	if (i & (1<<1))
- 		G.recurse_flags |= ACTION_FOLLOWLINKS | ACTION_DANGLING_OK;
- 	/* -P is default and is ignored */
--	argv += optind;
-+	argv = past_HLP; /* same result as "argv += optind;" */
-+	*past_HLP = saved;
- 
- 	for (firstopt = 0; argv[firstopt]; firstopt++) {
- 		if (argv[firstopt][0] == '-')
diff --git a/package/busybox/1.22.0/0003-busybox-1.22.0-grep.patch b/package/busybox/1.22.0/0003-busybox-1.22.0-grep.patch
deleted file mode 100644
index 053245d..0000000
--- a/package/busybox/1.22.0/0003-busybox-1.22.0-grep.patch
+++ /dev/null
@@ -1,80 +0,0 @@
---- busybox-1.22.0/findutils/grep.c
-+++ busybox-1.22.0-grep/findutils/grep.c
-@@ -373,6 +373,9 @@ static int grep_file(FILE *file)
-  opt_f_not_found: ;
- 				}
- 			} else {
-+#if ENABLE_EXTRA_COMPAT
-+				unsigned start_pos;
-+#endif
- 				char *match_at;
- 
- 				if (!(gl->flg_mem_alocated_compiled & COMPILED)) {
-@@ -389,15 +392,18 @@ static int grep_file(FILE *file)
- #if !ENABLE_EXTRA_COMPAT
- 				gl->matched_range.rm_so = 0;
- 				gl->matched_range.rm_eo = 0;
-+#else
-+				start_pos = 0;
- #endif
- 				match_at = line;
-  opt_w_again:
-+//bb_error_msg("'%s' start_pos:%d line_len:%d", match_at, start_pos, line_len);
- 				if (
- #if !ENABLE_EXTRA_COMPAT
- 					regexec(&gl->compiled_regex, match_at, 1, &gl->matched_range, 0) == 0
- #else
- 					re_search(&gl->compiled_regex, match_at, line_len,
--							/*start:*/ 0, /*range:*/ line_len,
-+							start_pos, /*range:*/ line_len,
- 							&gl->matched_range) >= 0
- #endif
- 				) {
-@@ -416,8 +422,24 @@ static int grep_file(FILE *file)
- 							if (!c || (!isalnum(c) && c != '_')) {
- 								found = 1;
- 							} else {
--								match_at += gl->matched_range.rm_eo;
--								goto opt_w_again;
-+			/*
-+			 * Why check gl->matched_range.rm_eo?
-+			 * Zero-length match makes -w skip the line:
-+			 * "echo foo | grep ^" prints "foo",
-+			 * "echo foo | grep -w ^" prints nothing.
-+			 * Without such check, we can loop forever.
-+			 */
-+#if !ENABLE_EXTRA_COMPAT
-+								if (gl->matched_range.rm_eo != 0) {
-+									match_at += gl->matched_range.rm_eo;
-+									goto opt_w_again;
-+								}
-+#else
-+								if (gl->matched_range.rm_eo > start_pos) {
-+									start_pos = gl->matched_range.rm_eo;
-+									goto opt_w_again;
-+								}
-+#endif
- 							}
- 						}
- 					}
---- busybox-1.22.0/testsuite/grep.tests
-+++ busybox-1.22.0-grep/testsuite/grep.tests
-@@ -147,6 +147,18 @@ testing "grep -w doesn't stop on 1st mis
- 	"foop foo\n" \
- 	""
- 
-+testing "grep -w ^str doesn't match str not at the beginning" \
-+	"grep -w ^str input" \
-+	"" \
-+	"strstr\n" \
-+	""
-+
-+testing "grep -w ^ doesn't hang" \
-+	"grep -w ^ input" \
-+	"" \
-+	"anything\n" \
-+	""
-+
- # testing "test name" "commands" "expected result" "file input" "stdin"
- #   file input will be file called "input"
- #   test can create a file "actual" instead of writing to stdout
diff --git a/package/busybox/1.22.0/0004-busybox-1.22.0-ntpd.patch b/package/busybox/1.22.0/0004-busybox-1.22.0-ntpd.patch
deleted file mode 100644
index 1334f57..0000000
--- a/package/busybox/1.22.0/0004-busybox-1.22.0-ntpd.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- busybox-1.22.0/networking/ntpd.c
-+++ busybox-1.22.0-ntpd/networking/ntpd.c
-@@ -1445,6 +1445,8 @@ update_local_clock(peer_t *p)
- 
- 		run_script("step", offset);
- 
-+		recv_time += offset;
-+
- #if USING_INITIAL_FREQ_ESTIMATION
- 		if (G.discipline_state == STATE_NSET) {
- 			set_new_values(STATE_FREQ, /*offset:*/ 0, recv_time);
diff --git a/package/busybox/1.22.0/0005-busybox-1.22.0-lineedit.patch b/package/busybox/1.22.0/0005-busybox-1.22.0-lineedit.patch
deleted file mode 100644
index e414314..0000000
--- a/package/busybox/1.22.0/0005-busybox-1.22.0-lineedit.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- busybox-1.22.0/libbb/lineedit.c
-+++ busybox-1.22.0-lineedit/libbb/lineedit.c
-@@ -1255,7 +1255,9 @@ line_input_t* FAST_FUNC new_line_input_t
- {
- 	line_input_t *n = xzalloc(sizeof(*n));
- 	n->flags = flags;
-+#if MAX_HISTORY > 0
- 	n->max_history = MAX_HISTORY;
-+#endif
- 	return n;
- }
- 
diff --git a/package/busybox/1.22.0/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch b/package/busybox/1.22.1/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
similarity index 100%
rename from package/busybox/1.22.0/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
rename to package/busybox/1.22.1/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
diff --git a/package/busybox/1.22.1/0002-busybox-1.22.1-ash.patch b/package/busybox/1.22.1/0002-busybox-1.22.1-ash.patch
new file mode 100644
index 0000000..767c3a8
--- /dev/null
+++ b/package/busybox/1.22.1/0002-busybox-1.22.1-ash.patch
@@ -0,0 +1,20 @@
+--- busybox-1.22.1/procps/top.c
++++ busybox-1.22.1-ash/procps/top.c
+@@ -917,17 +917,12 @@ enum {
+ #if ENABLE_FEATURE_USE_TERMIOS
+ static unsigned handle_input(unsigned scan_mask, unsigned interval)
+ {
+-	struct pollfd pfd[1];
+-
+ 	if (option_mask32 & OPT_EOF) {
+ 		/* EOF on stdin ("top </dev/null") */
+ 		sleep(interval);
+ 		return scan_mask;
+ 	}
+ 
+-	pfd[0].fd = 0;
+-	pfd[0].events = POLLIN;
+-
+ 	while (1) {
+ 		int32_t c;
+ 
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index d2d8fa0..a356863 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,7 +40,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.19.4"	if BR2_BUSYBOX_VERSION_1_19_X
 	default "1.20.2"	if BR2_BUSYBOX_VERSION_1_20_X
 	default "1.21.1"	if BR2_BUSYBOX_VERSION_1_21_X
-	default "1.22.0"	if BR2_BUSYBOX_VERSION_1_22_X
+	default "1.22.1"	if BR2_BUSYBOX_VERSION_1_22_X
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
-- 
1.8.3.2
