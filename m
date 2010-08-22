From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:52:00 +0200
Subject: [Buildroot] [PATCH 08/20] Update busybox 1.17.1 fixes
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a22d4082eac385cf5386f19d8c9207ee1fd381c1.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo@zacarias.com.ar>

New shell_common fix and sed fix.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../busybox-1.17.1/busybox-1.17.1-sed.patch        |   66 ++++++++++++++++++++
 .../busybox-1.17.1/busybox-1.17.1-shell.patch      |   19 ++++++
 2 files changed, 85 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch

diff --git a/package/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch b/package/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
new file mode 100644
index 0000000..1b523c2
--- /dev/null
+++ b/package/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
@@ -0,0 +1,66 @@
+diff -urpN busybox-1.17.1/editors/sed.c busybox-1.17.1-sed/editors/sed.c
+--- busybox-1.17.1/editors/sed.c	2010-07-06 04:25:53.000000000 +0200
++++ busybox-1.17.1-sed/editors/sed.c	2010-08-01 04:15:39.000000000 +0200
+@@ -61,6 +61,10 @@
+ #include "libbb.h"
+ #include "xregex.h"
+ 
++enum {
++	OPT_in_place = 1 << 0,
++};
++
+ /* Each sed command turns into one of these structures. */
+ typedef struct sed_cmd_s {
+ 	/* Ordered by alignment requirements: currently 36 bytes on x86 */
+@@ -938,8 +942,11 @@ static void process_files(void)
+ 
+ 		if (matched) {
+ 			/* once matched, "n,xxx" range is dead, disabling it */
+-			if (sed_cmd->beg_line > 0)
++			if (sed_cmd->beg_line > 0
++			 && !(option_mask32 & OPT_in_place) /* but not for -i */
++			) {
+ 				sed_cmd->beg_line = -2;
++			}
+ 			sed_cmd->in_match = !(
+ 				/* has the ending line come, or is this a single address command? */
+ 				(sed_cmd->end_line ?
+@@ -1270,9 +1277,6 @@ static void add_cmd_block(char *cmdstr)
+ int sed_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+ int sed_main(int argc UNUSED_PARAM, char **argv)
+ {
+-	enum {
+-		OPT_in_place = 1 << 0,
+-	};
+ 	unsigned opt;
+ 	llist_t *opt_e, *opt_f;
+ 	int status = EXIT_SUCCESS;
+@@ -1292,6 +1296,7 @@ int sed_main(int argc UNUSED_PARAM, char
+ 	opt_e = opt_f = NULL;
+ 	opt_complementary = "e::f::" /* can occur multiple times */
+ 	                    "nn"; /* count -n */
++	/* -i must be first, to match OPT_in_place definition */
+ 	opt = getopt32(argv, "irne:f:", &opt_e, &opt_f,
+ 			    &G.be_quiet); /* counter for -n */
+ 	//argc -= optind;
+diff -urpN busybox-1.17.1/testsuite/sed.tests busybox-1.17.1-sed/testsuite/sed.tests
+--- busybox-1.17.1/testsuite/sed.tests	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-sed/testsuite/sed.tests	2010-08-01 04:19:26.000000000 +0200
+@@ -270,11 +270,16 @@ testing "sed a cmd ended by double backs
+ 	| two \\
+ '
+ 
+-# fisrt three lines are deleted; 4th line is matched and printed by "2,3" and by "4" ranges
++# first three lines are deleted; 4th line is matched and printed by "2,3" and by "4" ranges
+ testing "sed with N skipping lines past ranges on next cmds" \
+ 	"sed -n '1{N;N;d};1p;2,3p;3p;4p'" \
+ 	"4\n4\n" "" "1\n2\n3\n4\n"
+ 
++testing "sed -i with address modifies all files, not only first" \
++	"cp input input2; sed -i -e '1s/foo/bar/' input input2 && cat input input2; rm input2" \
++	"bar\nbar\n" "foo\n" ""
++
++
+ # testing "description" "arguments" "result" "infile" "stdin"
+ 
+ exit $FAILCOUNT
diff --git a/package/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch b/package/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
index 04adc8f..5279b12 100644
--- a/package/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
+++ b/package/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
@@ -84,3 +84,22 @@ diff -urpN busybox-1.17.1/shell/hush_test/hush-trap/signal7.tests busybox-1.17.1
 +&& test x"$REAL_CHILD" = x"$PARENTS_IDEA_OF_CHILD"
 +echo "Bug detected: $?"
 +}
+diff -urpN busybox-1.17.1/shell/shell_common.c busybox-1.17.1-shell/shell/shell_common.c
+--- busybox-1.17.1/shell/shell_common.c	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-shell/shell/shell_common.c	2010-07-27 08:41:43.000000000 +0200
+@@ -428,9 +428,14 @@ shell_builtin_ulimit(char **argv)
+ 						val <<= l->factor_shift;
+ 					}
+ //bb_error_msg("opt %c val_str:'%s' val:%lld", opt_char, val_str, (long long)val);
++					/* from man bash: "If neither -H nor -S
++					 * is specified, both the soft and hard
++					 * limits are set. */
++					if (!opts)
++						opts = OPT_hard + OPT_soft;
+ 					if (opts & OPT_hard)
+ 						limit.rlim_max = val;
+-					if ((opts & OPT_soft) || opts == 0)
++					if (opts & OPT_soft)
+ 						limit.rlim_cur = val;
+ //bb_error_msg("setrlimit(%d, %lld, %lld)", l->cmd, (long long)limit.rlim_cur, (long long)limit.rlim_max);
+ 					if (setrlimit(l->cmd, &limit) < 0) {
-- 
1.7.0.4
