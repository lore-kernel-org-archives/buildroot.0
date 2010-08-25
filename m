From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: additional 1.17.1 fixes
Message-ID: <20100825153146.EB8D489016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9ed8308d58e931ca1d34e27b2b54d7ac70d7fe89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.17.1/busybox-1.17.1-grep.patch       |   39 +++++++++++++
 .../busybox-1.17.1/busybox-1.17.1-make.patch       |   32 ++++++++++
 .../busybox-1.17.1/busybox-1.17.1-mdev.patch       |   49 ++++++++++++++++
 .../busybox-1.17.1/busybox-1.17.1-sed.patch        |   61 ++++++++++++++++++--
 4 files changed, 176 insertions(+), 5 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
 create mode 100644 package/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
 create mode 100644 package/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch

diff --git a/package/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch b/package/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
new file mode 100644
index 0000000..f8fc25d
--- /dev/null
+++ b/package/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
@@ -0,0 +1,39 @@
+diff -urpN busybox-1.17.1/findutils/grep.c busybox-1.17.1-grep/findutils/grep.c
+--- busybox-1.17.1/findutils/grep.c	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-grep/findutils/grep.c	2010-08-23 02:37:08.000000000 +0200
+@@ -461,15 +461,19 @@ static int grep_file(FILE *file)
+ 						if (found)
+ 							print_line(gl->pattern, strlen(gl->pattern), linenum, ':');
+ 					} else while (1) {
++						unsigned start = gl->matched_range.rm_so;
+ 						unsigned end = gl->matched_range.rm_eo;
++						unsigned len = end - start;
+ 						char old = line[end];
+ 						line[end] = '\0';
+-						print_line(line + gl->matched_range.rm_so,
+-								end - gl->matched_range.rm_so,
+-								linenum, ':');
++						/* Empty match is not printed: try "echo test | grep -o ''" */
++						if (len != 0)
++							print_line(line + start, len, linenum, ':');
+ 						if (old == '\0')
+ 							break;
+ 						line[end] = old;
++						if (len == 0)
++							end++;
+ #if !ENABLE_EXTRA_COMPAT
+ 						if (regexec(&gl->compiled_regex, line + end,
+ 								1, &gl->matched_range, REG_NOTBOL) != 0)
+diff -urpN busybox-1.17.1/testsuite/grep.tests busybox-1.17.1-grep/testsuite/grep.tests
+--- busybox-1.17.1/testsuite/grep.tests	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-grep/testsuite/grep.tests	2010-08-23 02:37:08.000000000 +0200
+@@ -98,5 +98,9 @@ testing "grep -o does not loop forever" 
+ 	'grep -o "[^/]*$"' \
+ 	"test\n" \
+ 	"" "/var/test\n"
++testing "grep -o does not loop forever on zero-length match" \
++	'grep -o "" | head -n1' \
++	"" \
++	"" "test\n"
+ 
+ exit $FAILCOUNT
diff --git a/package/busybox/busybox-1.17.1/busybox-1.17.1-make.patch b/package/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
new file mode 100644
index 0000000..6177696
--- /dev/null
+++ b/package/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
@@ -0,0 +1,32 @@
+diff -urpN busybox-1.17.1/Makefile busybox-1.17.1-make/Makefile
+--- busybox-1.17.1/Makefile	2010-07-25 00:13:44.000000000 +0200
++++ busybox-1.17.1-make/Makefile	2010-08-22 09:30:33.000000000 +0200
+@@ -433,7 +433,12 @@ ifeq ($(config-targets),1)
+ -include $(srctree)/arch/$(ARCH)/Makefile
+ export KBUILD_DEFCONFIG
+ 
+-config %config: scripts_basic outputmakefile gen_build_files FORCE
++config: scripts_basic outputmakefile gen_build_files FORCE
++	$(Q)mkdir -p include
++	$(Q)$(MAKE) $(build)=scripts/kconfig $@
++	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease
++
++%config: scripts_basic outputmakefile gen_build_files FORCE
+ 	$(Q)mkdir -p include
+ 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
+ 	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease
+@@ -1285,9 +1290,13 @@ endif
+ 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+ 
+ # Modules
+-/ %/: prepare scripts FORCE
++%/: prepare scripts FORCE
+ 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
+ 	$(build)=$(build-dir)
++/: prepare scripts FORCE
++	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
++	$(build)=$(build-dir)
++
+ %.ko: prepare scripts FORCE
+ 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1)   \
+ 	$(build)=$(build-dir) $(@:.ko=.o)
diff --git a/package/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch b/package/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
new file mode 100644
index 0000000..71c7abd
--- /dev/null
+++ b/package/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
@@ -0,0 +1,49 @@
+diff -urpN busybox-1.17.1/testsuite/mdev.tests busybox-1.17.1-mdev/testsuite/mdev.tests
+--- busybox-1.17.1/testsuite/mdev.tests	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-mdev/testsuite/mdev.tests	2010-08-23 02:38:21.000000000 +0200
+@@ -38,6 +38,16 @@ brw-rw---- 1 0 0 8,0 sda
+ SKIP=
+ 
+ # continuing to use directory structure from prev test
++optional STATIC FEATURE_MDEV_CONF FEATURE_LS_TIMESTAMPS FEATURE_LS_USERNAME
++testing "mdev deletes /block/sda" \
++	"env - PATH=$PATH ACTION=remove DEVPATH=/block/sda chroot mdev.testdir /mdev 2>&1;
++	ls -ln mdev.testdir/dev | $FILTER_LS" \
++"\
++" \
++	"" ""
++SKIP=
++
++# continuing to use directory structure from prev test
+ rm -rf mdev.testdir/dev/*
+ echo ".* 1:1 666" >mdev.testdir/etc/mdev.conf
+ echo "sda 2:2 444" >>mdev.testdir/etc/mdev.conf
+diff -urpN busybox-1.17.1/util-linux/mdev.c busybox-1.17.1-mdev/util-linux/mdev.c
+--- busybox-1.17.1/util-linux/mdev.c	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-mdev/util-linux/mdev.c	2010-08-23 02:38:21.000000000 +0200
+@@ -132,6 +132,7 @@ static void make_device(char *path, int 
+ 			major = -1;
+ 		}
+ 	}
++	/* else: for delete, -1 still deletes the node, but < -1 suppresses that */
+ 
+ 	/* Determine device name, type, major and minor */
+ 	device_name = (char*) bb_basename(path);
+@@ -279,7 +280,7 @@ static void make_device(char *path, int 
+ 				if (aliaslink == '!' && s == a+1) {
+ 					val = st;
+ 					/* "!": suppress node creation/deletion */
+-					major = -1;
++					major = -2;
+ 				}
+ 				else if (aliaslink == '>' || aliaslink == '=') {
+ 					val = st;
+@@ -379,7 +380,7 @@ static void make_device(char *path, int 
+ 				free(command);
+ 			}
+ 
+-			if (delete && major >= 0) {
++			if (delete && major >= -1) {
+ 				if (ENABLE_FEATURE_MDEV_RENAME && alias) {
+ 					if (aliaslink == '>')
+ 						unlink(device_name);
diff --git a/package/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch b/package/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
index 1b523c2..f65aebe 100644
--- a/package/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
+++ b/package/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
@@ -1,6 +1,6 @@
 diff -urpN busybox-1.17.1/editors/sed.c busybox-1.17.1-sed/editors/sed.c
 --- busybox-1.17.1/editors/sed.c	2010-07-06 04:25:53.000000000 +0200
-+++ busybox-1.17.1-sed/editors/sed.c	2010-08-01 04:15:39.000000000 +0200
++++ busybox-1.17.1-sed/editors/sed.c	2010-08-17 02:05:27.000000000 +0200
 @@ -61,6 +61,10 @@
  #include "libbb.h"
  #include "xregex.h"
@@ -25,7 +25,36 @@ diff -urpN busybox-1.17.1/editors/sed.c busybox-1.17.1-sed/editors/sed.c
  			sed_cmd->in_match = !(
  				/* has the ending line come, or is this a single address command? */
  				(sed_cmd->end_line ?
-@@ -1270,9 +1277,6 @@ static void add_cmd_block(char *cmdstr)
+@@ -985,6 +992,8 @@ static void process_files(void)
+ 		}
+ 
+ 		/* actual sedding */
++		//bb_error_msg("pattern_space:'%s' next_line:'%s' cmd:%c",
++		//pattern_space, next_line, sed_cmd->cmd);
+ 		switch (sed_cmd->cmd) {
+ 
+ 		/* Print line number */
+@@ -1111,10 +1120,16 @@ static void process_files(void)
+ 		{
+ 			int len;
+ 			/* If no next line, jump to end of script and exit. */
++			/* http://www.gnu.org/software/sed/manual/sed.html:
++			 * "Most versions of sed exit without printing anything
++			 * when the N command is issued on the last line of
++			 * a file. GNU sed prints pattern space before exiting
++			 * unless of course the -n command switch has been
++			 * specified. This choice is by design."
++			 */
+ 			if (next_line == NULL) {
+-				free(next_line);
+-				next_line = NULL;
+-				goto discard_line;
++				//goto discard_line;
++				goto discard_commands; /* GNU behavior */
+ 			}
+ 			/* Append next_line, read new next_line. */
+ 			len = strlen(pattern_space);
+@@ -1270,9 +1285,6 @@ static void add_cmd_block(char *cmdstr)
  int sed_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
  int sed_main(int argc UNUSED_PARAM, char **argv)
  {
@@ -35,7 +64,7 @@ diff -urpN busybox-1.17.1/editors/sed.c busybox-1.17.1-sed/editors/sed.c
  	unsigned opt;
  	llist_t *opt_e, *opt_f;
  	int status = EXIT_SUCCESS;
-@@ -1292,6 +1296,7 @@ int sed_main(int argc UNUSED_PARAM, char
+@@ -1292,6 +1304,7 @@ int sed_main(int argc UNUSED_PARAM, char
  	opt_e = opt_f = NULL;
  	opt_complementary = "e::f::" /* can occur multiple times */
  	                    "nn"; /* count -n */
@@ -45,8 +74,30 @@ diff -urpN busybox-1.17.1/editors/sed.c busybox-1.17.1-sed/editors/sed.c
  	//argc -= optind;
 diff -urpN busybox-1.17.1/testsuite/sed.tests busybox-1.17.1-sed/testsuite/sed.tests
 --- busybox-1.17.1/testsuite/sed.tests	2010-07-06 04:25:54.000000000 +0200
-+++ busybox-1.17.1-sed/testsuite/sed.tests	2010-08-01 04:19:26.000000000 +0200
-@@ -270,11 +270,16 @@ testing "sed a cmd ended by double backs
++++ busybox-1.17.1-sed/testsuite/sed.tests	2010-08-17 02:05:27.000000000 +0200
+@@ -80,10 +80,18 @@ test x"$SKIP_KNOWN_BUGS" = x"" && {
+ # Query: how does this interact with no newline at EOF?
+ testing "sed n (flushes pattern space, terminates early)" "sed -e 'n;p'" \
+ 	"a\nb\nb\nc\n" "" "a\nb\nc\n"
+-# N does _not_ flush pattern space, therefore c is still in there @ script end.
+-testing "sed N (doesn't flush pattern space when terminating)" "sed -e 'N;p'" \
+-	"a\nb\na\nb\nc\n" "" "a\nb\nc\n"
+ }
++# non-GNU sed: N does _not_ flush pattern space, therefore c is eaten @ script end
++# GNU sed: N flushes pattern space, therefore c is printed too @ script end
++testing "sed N (flushes pattern space (GNU behavior))" "sed -e 'N;p'" \
++	"a\nb\na\nb\nc\n" "" "a\nb\nc\n"
++
++testing "sed N test2" "sed ':a;N;s/\n/ /;ta'" \
++	"a b c\n" "" "a\nb\nc\n"
++
++testing "sed N test3" "sed 'N;s/\n/ /'" \
++	"a b\nc\n" "" "a\nb\nc\n"
++
+ testing "sed address match newline" 'sed "/b/N;/b\\nc/i woo"' \
+ 	"a\nwoo\nb\nc\nd\n" "" "a\nb\nc\nd\n"
+ 
+@@ -270,11 +278,16 @@ testing "sed a cmd ended by double backs
  	| two \\
  '
  
-- 
1.7.1
