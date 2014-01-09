From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 16:26:03 +0100
Subject: [Buildroot] [git commit] busybox: add upstream 1.22.0 fixes
Message-ID: <20140109152751.3B9719C3D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49cfa71e41e8d401cb4616c7f6bab2deafb5072e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../busybox/1.22.0/0002-busybox-1.22.0-find.patch  |   40 ++++++++++
 .../busybox/1.22.0/0003-busybox-1.22.0-grep.patch  |   80 ++++++++++++++++++++
 .../busybox/1.22.0/0004-busybox-1.22.0-ntpd.patch  |   11 +++
 3 files changed, 131 insertions(+), 0 deletions(-)

diff --git a/package/busybox/1.22.0/0002-busybox-1.22.0-find.patch b/package/busybox/1.22.0/0002-busybox-1.22.0-find.patch
new file mode 100644
index 0000000..75a06a8
--- /dev/null
+++ b/package/busybox/1.22.0/0002-busybox-1.22.0-find.patch
@@ -0,0 +1,40 @@
+--- busybox-1.22.0/findutils/find.c
++++ busybox-1.22.0-find/findutils/find.c
+@@ -1291,9 +1291,27 @@ int find_main(int argc, char **argv) MAI
+ int find_main(int argc UNUSED_PARAM, char **argv)
+ {
+ 	int i, firstopt, status = EXIT_SUCCESS;
++	char **past_HLP, *saved;
+ 
+ 	INIT_G();
+ 
++	/* "find -type f" + getopt("+HLP") => disaster.
++	 * Need to avoid getopt running into a non-HLP option.
++	 * Do this by temporarily storing NULL there:
++	 */
++	past_HLP = argv;
++	for (;;) {
++		saved = *++past_HLP;
++		if (!saved)
++			break;
++		if (saved[0] != '-')
++			break;
++		if (!saved[1])
++			break; /* it is "-" */
++		if ((saved+1)[strspn(saved+1, "HLP")] != '\0')
++			break;
++	}
++	*past_HLP = NULL;
+ 	/* "+": stop on first non-option */
+ 	i = getopt32(argv, "+HLP");
+ 	if (i & (1<<0))
+@@ -1301,7 +1319,8 @@ int find_main(int argc UNUSED_PARAM, cha
+ 	if (i & (1<<1))
+ 		G.recurse_flags |= ACTION_FOLLOWLINKS | ACTION_DANGLING_OK;
+ 	/* -P is default and is ignored */
+-	argv += optind;
++	argv = past_HLP; /* same result as "argv += optind;" */
++	*past_HLP = saved;
+ 
+ 	for (firstopt = 0; argv[firstopt]; firstopt++) {
+ 		if (argv[firstopt][0] == '-')
diff --git a/package/busybox/1.22.0/0003-busybox-1.22.0-grep.patch b/package/busybox/1.22.0/0003-busybox-1.22.0-grep.patch
new file mode 100644
index 0000000..053245d
--- /dev/null
+++ b/package/busybox/1.22.0/0003-busybox-1.22.0-grep.patch
@@ -0,0 +1,80 @@
+--- busybox-1.22.0/findutils/grep.c
++++ busybox-1.22.0-grep/findutils/grep.c
+@@ -373,6 +373,9 @@ static int grep_file(FILE *file)
+  opt_f_not_found: ;
+ 				}
+ 			} else {
++#if ENABLE_EXTRA_COMPAT
++				unsigned start_pos;
++#endif
+ 				char *match_at;
+ 
+ 				if (!(gl->flg_mem_alocated_compiled & COMPILED)) {
+@@ -389,15 +392,18 @@ static int grep_file(FILE *file)
+ #if !ENABLE_EXTRA_COMPAT
+ 				gl->matched_range.rm_so = 0;
+ 				gl->matched_range.rm_eo = 0;
++#else
++				start_pos = 0;
+ #endif
+ 				match_at = line;
+  opt_w_again:
++//bb_error_msg("'%s' start_pos:%d line_len:%d", match_at, start_pos, line_len);
+ 				if (
+ #if !ENABLE_EXTRA_COMPAT
+ 					regexec(&gl->compiled_regex, match_at, 1, &gl->matched_range, 0) == 0
+ #else
+ 					re_search(&gl->compiled_regex, match_at, line_len,
+-							/*start:*/ 0, /*range:*/ line_len,
++							start_pos, /*range:*/ line_len,
+ 							&gl->matched_range) >= 0
+ #endif
+ 				) {
+@@ -416,8 +422,24 @@ static int grep_file(FILE *file)
+ 							if (!c || (!isalnum(c) && c != '_')) {
+ 								found = 1;
+ 							} else {
+-								match_at += gl->matched_range.rm_eo;
+-								goto opt_w_again;
++			/*
++			 * Why check gl->matched_range.rm_eo?
++			 * Zero-length match makes -w skip the line:
++			 * "echo foo | grep ^" prints "foo",
++			 * "echo foo | grep -w ^" prints nothing.
++			 * Without such check, we can loop forever.
++			 */
++#if !ENABLE_EXTRA_COMPAT
++								if (gl->matched_range.rm_eo != 0) {
++									match_at += gl->matched_range.rm_eo;
++									goto opt_w_again;
++								}
++#else
++								if (gl->matched_range.rm_eo > start_pos) {
++									start_pos = gl->matched_range.rm_eo;
++									goto opt_w_again;
++								}
++#endif
+ 							}
+ 						}
+ 					}
+--- busybox-1.22.0/testsuite/grep.tests
++++ busybox-1.22.0-grep/testsuite/grep.tests
+@@ -147,6 +147,18 @@ testing "grep -w doesn't stop on 1st mis
+ 	"foop foo\n" \
+ 	""
+ 
++testing "grep -w ^str doesn't match str not at the beginning" \
++	"grep -w ^str input" \
++	"" \
++	"strstr\n" \
++	""
++
++testing "grep -w ^ doesn't hang" \
++	"grep -w ^ input" \
++	"" \
++	"anything\n" \
++	""
++
+ # testing "test name" "commands" "expected result" "file input" "stdin"
+ #   file input will be file called "input"
+ #   test can create a file "actual" instead of writing to stdout
diff --git a/package/busybox/1.22.0/0004-busybox-1.22.0-ntpd.patch b/package/busybox/1.22.0/0004-busybox-1.22.0-ntpd.patch
new file mode 100644
index 0000000..1334f57
--- /dev/null
+++ b/package/busybox/1.22.0/0004-busybox-1.22.0-ntpd.patch
@@ -0,0 +1,11 @@
+--- busybox-1.22.0/networking/ntpd.c
++++ busybox-1.22.0-ntpd/networking/ntpd.c
+@@ -1445,6 +1445,8 @@ update_local_clock(peer_t *p)
+ 
+ 		run_script("step", offset);
+ 
++		recv_time += offset;
++
+ #if USING_INITIAL_FREQ_ESTIMATION
+ 		if (G.discipline_state == STATE_NSET) {
+ 			set_new_values(STATE_FREQ, /*offset:*/ 0, recv_time);
