From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Jul 2010 15:44:43 +0200
Subject: [Buildroot] [git commit master 1/1] busbox: add 1.17.0 upstream
	fixes
Message-ID: <20100712134511.3501982887@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=387754249806a6f438575368ce1694786b3a4084
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.17.0/busybox-1.17.0-acpid.patch      |   30 ++++++
 .../busybox-1.17.0-build_system.patch              |  101 ++++++++++++++++++++
 .../busybox-1.17.0/busybox-1.17.0-diff.patch       |   72 ++++++++++++++
 .../busybox-1.17.0/busybox-1.17.0-mktemp.patch     |   13 +++
 .../busybox-1.17.0/busybox-1.17.0-modprobe-l.patch |   27 +++++
 .../busybox-1.17.0/busybox-1.17.0-wget.patch       |   12 +++
 6 files changed, 255 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-acpid.patch
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-build_system.patch
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-diff.patch
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-mktemp.patch
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-modprobe-l.patch
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-wget.patch

diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-acpid.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-acpid.patch
new file mode 100644
index 0000000..664b87e
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-acpid.patch
@@ -0,0 +1,30 @@
+diff -urpN busybox-1.17.0/util-linux/acpid.c busybox-1.17.0-acpid/util-linux/acpid.c
+--- busybox-1.17.0/util-linux/acpid.c	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-acpid/util-linux/acpid.c	2010-07-12 06:24:00.000000000 +0200
+@@ -9,9 +9,25 @@
+ #include "libbb.h"
+ 
+ #include <linux/input.h>
++#ifndef EV_SW
++# define EV_SW         0x05
++#endif
++#ifndef EV_KEY
++# define EV_KEY        0x01
++#endif
++#ifndef SW_LID
++# define SW_LID        0x00
++#endif
+ #ifndef SW_RFKILL_ALL
+-# define SW_RFKILL_ALL 3
++# define SW_RFKILL_ALL 0x03
+ #endif
++#ifndef KEY_POWER
++# define KEY_POWER     116     /* SC System Power Down */
++#endif
++#ifndef KEY_SLEEP
++# define KEY_SLEEP     142     /* SC System Sleep */
++#endif
++
+ 
+ /*
+  * acpid listens to ACPI events coming either in textual form
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-build_system.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-build_system.patch
new file mode 100644
index 0000000..2112644
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-build_system.patch
@@ -0,0 +1,101 @@
+diff -urpN busybox-1.17.0/applets/usage_compressed busybox-1.17.0-build_system/applets/usage_compressed
+--- busybox-1.17.0/applets/usage_compressed	2010-07-04 23:33:59.000000000 +0200
++++ busybox-1.17.0-build_system/applets/usage_compressed	2010-07-10 01:31:18.000000000 +0200
+@@ -40,8 +40,4 @@ echo '#define PACKED_USAGE \'
+ 	-e 's/$/ \\/'
+ echo ''
+ 
+-if cmp -s "$target.$$" "$target" 2>/dev/null; then
+-    rm -- "$target.$$"
+-else
+-    mv -- "$target.$$" "$target"
+-fi
++mv -- "$target.$$" "$target"
+diff -urpN busybox-1.17.0/init/bootchartd.c busybox-1.17.0-build_system/init/bootchartd.c
+--- busybox-1.17.0/init/bootchartd.c	2010-07-04 15:32:24.000000000 +0200
++++ busybox-1.17.0-build_system/init/bootchartd.c	2010-07-10 01:31:14.000000000 +0200
+@@ -18,7 +18,7 @@
+ //config:	  and stopped using bootchartd stop.
+ //config:
+ //config:config FEATURE_BOOTCHARTD_BLOATED_HEADER
+-//config:	bool "bootchartd"
++//config:	bool "Compatible, bloated header"
+ //config:	default y
+ //config:	depends on BOOTCHARTD
+ //config:	help
+@@ -35,7 +35,7 @@
+ //config:	  makes bootchartd applet to dump a subset of it.
+ //config:
+ //config:config FEATURE_BOOTCHARTD_CONFIG_FILE
+-//config:	bool "bootchartd"
++//config:	bool "Support bootchartd.conf"
+ //config:	default y
+ //config:	depends on BOOTCHARTD
+ //config:	help
+diff -urpN busybox-1.17.0/scripts/gen_build_files.sh busybox-1.17.0-build_system/scripts/gen_build_files.sh
+--- busybox-1.17.0/scripts/gen_build_files.sh	2010-06-26 00:42:29.000000000 +0200
++++ busybox-1.17.0-build_system/scripts/gen_build_files.sh	2010-07-10 01:31:38.000000000 +0200
+@@ -4,6 +4,8 @@ test $# -ge 2 || { echo "Syntax: $0 SRCT
+ 
+ # cd to objtree
+ cd -- "$2" || { echo "Syntax: $0 SRCTREE OBJTREE"; exit 1; }
++# In separate objtree build, include/ might not exist yet
++mkdir include 2>/dev/null
+ 
+ srctree="$1"
+ 
+@@ -46,10 +48,12 @@ if test x"$new" != x"$old"; then
+ fi
+ 
+ # (Re)generate */Kbuild and */Config.in
+-find -type d | while read -r d; do
++{ cd -- "$srctree" && find -type d; } | while read -r d; do
+ 	d="${d#./}"
++
+ 	src="$srctree/$d/Kbuild.src"
+ 	dst="$d/Kbuild"
++	mkdir -p -- "$d" 2>/dev/null
+ 	if test -f "$src"; then
+ 		#echo "  CHK     $dst"
+ 
+@@ -69,6 +73,7 @@ find -type d | while read -r d; do
+ 
+ 	src="$srctree/$d/Config.src"
+ 	dst="$d/Config.in"
++	mkdir -p -- "$d" 2>/dev/null
+ 	if test -f "$src"; then
+ 		#echo "  CHK     $dst"
+ 
+diff -urpN busybox-1.17.0/scripts/Makefile.build busybox-1.17.0-build_system/scripts/Makefile.build
+--- busybox-1.17.0/scripts/Makefile.build	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-build_system/scripts/Makefile.build	2010-07-10 01:31:38.000000000 +0200
+@@ -13,8 +13,13 @@ __build:
+ include scripts/Kbuild.include
+ 
+ # The filename Kbuild has precedence over Makefile
++# bbox: we also try to include Kbuild file in obj tree first
+ kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
+-include $(if $(wildcard $(kbuild-dir)/Kbuild), $(kbuild-dir)/Kbuild, $(kbuild-dir)/Makefile)
++include $(if $(wildcard $(src)/Kbuild), $(src)/Kbuild, \
++		$(if $(wildcard $(kbuild-dir)/Kbuild), $(kbuild-dir)/Kbuild, \
++			$(kbuild-dir)/Makefile \
++		) \
++	)
+ 
+ include scripts/Makefile.lib
+ 
+diff -urpN busybox-1.17.0/scripts/test_make_O busybox-1.17.0-build_system/scripts/test_make_O
+--- busybox-1.17.0/scripts/test_make_O	1970-01-01 01:00:00.000000000 +0100
++++ busybox-1.17.0-build_system/scripts/test_make_O	2010-07-10 01:31:38.000000000 +0200
+@@ -0,0 +1,11 @@
++#!/bin/sh
++
++b=`basename $PWD`
++test "${b#busybox}" != "$b" || { echo "Must be run in busybox tree"; exit 1; }
++
++rm -rf ../testdir_make_O.$$
++mkdir ../testdir_make_O.$$
++odir=`cd ../testdir_make_O.$$ && pwd`
++test -d "$odir" || exit 1
++
++make O="$odir" $MAKEOPTS "$@" defconfig busybox 2>&1 | tee test_make_O.log
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-diff.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-diff.patch
new file mode 100644
index 0000000..ba3da8d
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-diff.patch
@@ -0,0 +1,72 @@
+diff -urpN busybox-1.17.0/editors/diff.c busybox-1.17.0-diff/editors/diff.c
+--- busybox-1.17.0/editors/diff.c	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-diff/editors/diff.c	2010-07-10 03:52:33.000000000 +0200
+@@ -760,9 +760,11 @@ static int FAST_FUNC add_to_dirlist(cons
+ 		void *userdata, int depth UNUSED_PARAM)
+ {
+ 	struct dlist *const l = userdata;
++	const char *file = filename + l->len;
+ 	l->dl = xrealloc_vector(l->dl, 6, l->e);
+-	/* + 1 skips "/" after dirname */
+-	l->dl[l->e] = xstrdup(filename + l->len + 1);
++	while (*file == '/')
++		file++;
++	l->dl[l->e] = xstrdup(file);
+ 	l->e++;
+ 	return TRUE;
+ }
+diff -urpN busybox-1.17.0/testsuite/diff.tests busybox-1.17.0-diff/testsuite/diff.tests
+--- busybox-1.17.0/testsuite/diff.tests	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-diff/testsuite/diff.tests	2010-07-10 01:31:51.000000000 +0200
+@@ -4,7 +4,7 @@
+ 
+ . ./testing.sh
+ 
+-# testing "test name" "options" "expected result" "file input" "stdin"
++# testing "test name" "commands" "expected result" "file input" "stdin"
+ 
+ # diff outputs date/time in the header, which should not be analysed
+ # NB: sed has tab character in s command!
+@@ -100,9 +100,11 @@ testing "diff always takes context from 
+ 	"abc\na  c\ndef\n" \
+ 	"a c\n"
+ 
+-# testing "test name" "options" "expected result" "file input" "stdin"
++# testing "test name" "commands" "expected result" "file input" "stdin"
+ 
++# clean up
+ rm -rf diff1 diff2
++
+ mkdir diff1 diff2 diff2/subdir
+ echo qwe >diff1/-
+ echo asd >diff2/subdir/-
+@@ -187,4 +189,29 @@ SKIP=
+ # clean up
+ rm -rf diff1 diff2
+ 
++# NOT using directory structure from prev test...
++mkdir diff1 diff2
++echo qwe >diff1/-
++echo rty >diff2/-
++optional FEATURE_DIFF_DIR
++testing "diff diff1 diff2/" \
++	"diff -ur diff1 diff2/ | $TRIM_TAB; diff -ur .///diff1 diff2//// | $TRIM_TAB" \
++"\
++--- diff1/-
+++++ diff2/-
++@@ -1 +1 @@
++-qwe
+++rty
++--- .///diff1/-
+++++ diff2////-
++@@ -1 +1 @@
++-qwe
+++rty
++" \
++	"" ""
++SKIP=
++
++# clean up
++rm -rf diff1 diff2
++
+ exit $FAILCOUNT
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-mktemp.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-mktemp.patch
new file mode 100644
index 0000000..023a7cf
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-mktemp.patch
@@ -0,0 +1,13 @@
+diff -urpN busybox-1.17.0/debianutils/mktemp.c busybox-1.17.0-mktemp/debianutils/mktemp.c
+--- busybox-1.17.0/debianutils/mktemp.c	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-mktemp/debianutils/mktemp.c	2010-07-12 03:42:48.000000000 +0200
+@@ -50,7 +50,8 @@ int mktemp_main(int argc UNUSED_PARAM, c
+ 	opts = getopt32(argv, "dqtp:", &path);
+ 
+ 	chp = argv[optind] ? argv[optind] : xstrdup("tmp.XXXXXX");
+-	chp = concat_path_file(path, chp);
++	if (chp[0] != '/' || (opts & 8))
++		chp = concat_path_file(path, chp);
+ 
+ 	if (opts & 1) { /* -d */
+ 		if (mkdtemp(chp) == NULL)
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-modprobe-l.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-modprobe-l.patch
new file mode 100644
index 0000000..496a599
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-modprobe-l.patch
@@ -0,0 +1,27 @@
+diff -urpN busybox-1.17.0/modutils/modprobe.c busybox-1.17.0-modprobe-l/modutils/modprobe.c
+--- busybox-1.17.0/modutils/modprobe.c	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-modprobe-l/modutils/modprobe.c	2010-07-10 01:25:42.000000000 +0200
+@@ -483,6 +483,11 @@ int modprobe_main(int argc UNUSED_PARAM,
+ 	opt = getopt32(argv, INSMOD_OPTS MODPROBE_OPTS INSMOD_ARGS);
+ 	argv += optind;
+ 
++	/* Goto modules location */
++	xchdir(CONFIG_DEFAULT_MODULES_DIR);
++	uname(&uts);
++	xchdir(uts.release);
++
+ 	if (opt & MODPROBE_OPT_LIST_ONLY) {
+ 		char name[MODULE_NAME_LEN];
+ 		char *colon, *tokens[2];
+@@ -524,11 +529,6 @@ int modprobe_main(int argc UNUSED_PARAM,
+ 		return EXIT_SUCCESS;
+ 	}
+ 
+-	/* Goto modules location */
+-	xchdir(CONFIG_DEFAULT_MODULES_DIR);
+-	uname(&uts);
+-	xchdir(uts.release);
+-
+ 	/* Retrieve module names of already loaded modules */
+ 	{
+ 		char *s;
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-wget.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-wget.patch
new file mode 100644
index 0000000..d649f65
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-wget.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.17.0/networking/wget.c busybox-1.17.0-wget/networking/wget.c
+--- busybox-1.17.0/networking/wget.c	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-wget/networking/wget.c	2010-07-12 03:27:57.000000000 +0200
+@@ -50,7 +50,7 @@ static void progress_meter(int flag)
+ 	}
+ 
+ 	bb_progress_update(&G.pmt, G.curfile, G.beg_range, G.transferred,
+-			   G.chunked ? 0 : G.content_len + G.beg_range);
++			   G.chunked ? 0 : G.beg_range + G.transferred + G.content_len);
+ 
+ 	if (flag == 0) {
+ 		/* last call to progress_meter */
-- 
1.7.1
