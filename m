From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Mar 2010 15:19:42 +0100
Subject: [Buildroot] [git commit master] busybox: additional 1.16.0 fixes
Message-ID: <20100322145739.B723977716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d6a2fa87b8e6b131b1ad52f9f586605db95607ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.16.0-hush.patch          |   14 ++++
 .../busybox/busybox-1.16.0-standalone_single.patch |   78 ++++++++++++++++++++
 package/busybox/busybox-1.16.0-touch.patch         |   21 +++++
 3 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.0-hush.patch
 create mode 100644 package/busybox/busybox-1.16.0-standalone_single.patch
 create mode 100644 package/busybox/busybox-1.16.0-touch.patch

diff --git a/package/busybox/busybox-1.16.0-hush.patch b/package/busybox/busybox-1.16.0-hush.patch
new file mode 100644
index 0000000..7847cc5
--- /dev/null
+++ b/package/busybox/busybox-1.16.0-hush.patch
@@ -0,0 +1,14 @@
+diff -urpN busybox-1.16.0/shell/hush.c busybox-1.16.0-hush/shell/hush.c
+--- busybox-1.16.0/shell/hush.c	2010-01-25 17:51:24.000000000 +0100
++++ busybox-1.16.0-hush/shell/hush.c	2010-03-22 01:46:39.000000000 +0100
+@@ -3568,7 +3568,9 @@ static void execvp_or_die(char **argv)
+ {
+ 	debug_printf_exec("execing '%s'\n", argv[0]);
+ 	sigprocmask(SIG_SETMASK, &G.inherited_set, NULL);
+-	execvp(argv[0], argv);
++	/* if FEATURE_SH_STANDALONE, "exec <applet_name>" should work,
++	 * therefore we should use BB_EXECVP, not execvp */
++	BB_EXECVP(argv[0], argv);
+ 	bb_perror_msg("can't execute '%s'", argv[0]);
+ 	_exit(127); /* bash compat */
+ }
diff --git a/package/busybox/busybox-1.16.0-standalone_single.patch b/package/busybox/busybox-1.16.0-standalone_single.patch
new file mode 100644
index 0000000..011a36c
--- /dev/null
+++ b/package/busybox/busybox-1.16.0-standalone_single.patch
@@ -0,0 +1,78 @@
+diff -urpN busybox-1.16.0/applets/applet_tables.c busybox-1.16.0-standalone_single/applets/applet_tables.c
+--- busybox-1.16.0/applets/applet_tables.c	2010-01-25 01:59:38.000000000 +0100
++++ busybox-1.16.0-standalone_single/applets/applet_tables.c	2010-03-21 19:44:06.000000000 +0100
+@@ -79,6 +79,7 @@ int main(int argc, char **argv)
+ 	}
+ 	printf("\n");
+ 
++	printf("#ifndef SKIP_definitions\n");
+ 	printf("const char applet_names[] ALIGN1 = \"\"\n");
+ 	for (i = 0; i < NUM_APPLETS; i++) {
+ 		printf("\"%s\" \"\\0\"\n", applets[i].name);
+@@ -120,9 +121,10 @@ int main(int argc, char **argv)
+ 		printf("0x%02x,\n", v);
+ 		i++;
+ 	}
+-	printf("};\n\n");
++	printf("};\n");
+ #endif
+-
++	printf("#endif /* SKIP_definitions */\n");
++	printf("\n");
+ 	printf("#define MAX_APPLET_NAME_LEN %u\n", MAX_APPLET_NAME_LEN);
+ 
+ 	return 0;
+diff -urpN busybox-1.16.0/shell/ash.c busybox-1.16.0-standalone_single/shell/ash.c
+--- busybox-1.16.0/shell/ash.c	2010-01-25 01:59:38.000000000 +0100
++++ busybox-1.16.0-standalone_single/shell/ash.c	2010-03-21 19:44:06.000000000 +0100
+@@ -43,8 +43,6 @@
+ #endif
+ 
+ #include "busybox.h" /* for applet_names */
+-//TODO: pull in some .h and find out do we have SINGLE_APPLET_MAIN?
+-//#include "applet_tables.h" doesn't work
+ #include <paths.h>
+ #include <setjmp.h>
+ #include <fnmatch.h>
+@@ -58,12 +56,15 @@
+ # define CLEAR_RANDOM_T(rnd) ((void)0)
+ #endif
+ 
+-#if defined SINGLE_APPLET_MAIN
++#define SKIP_definitions 1
++#include "applet_tables.h"
++#undef SKIP_definitions
++#if NUM_APPLETS == 1
+ /* STANDALONE does not make sense, and won't compile */
+ # undef CONFIG_FEATURE_SH_STANDALONE
+ # undef ENABLE_FEATURE_SH_STANDALONE
+ # undef IF_FEATURE_SH_STANDALONE
+-# undef IF_NOT_FEATURE_SH_STANDALONE(...)
++# undef IF_NOT_FEATURE_SH_STANDALONE
+ # define ENABLE_FEATURE_SH_STANDALONE 0
+ # define IF_FEATURE_SH_STANDALONE(...)
+ # define IF_NOT_FEATURE_SH_STANDALONE(...) __VA_ARGS__
+diff -urpN busybox-1.16.0/shell/hush.c busybox-1.16.0-standalone_single/shell/hush.c
+--- busybox-1.16.0/shell/hush.c	2010-01-25 17:51:24.000000000 +0100
++++ busybox-1.16.0-standalone_single/shell/hush.c	2010-03-21 19:44:06.000000000 +0100
+@@ -125,14 +125,18 @@
+ # define USE_FOR_MMU(...)
+ #endif
+ 
+-#if defined SINGLE_APPLET_MAIN
++#define SKIP_definitions 1
++#include "applet_tables.h"
++#undef SKIP_definitions
++#if NUM_APPLETS == 1
+ /* STANDALONE does not make sense, and won't compile */
+ # undef CONFIG_FEATURE_SH_STANDALONE
+ # undef ENABLE_FEATURE_SH_STANDALONE
+ # undef IF_FEATURE_SH_STANDALONE
++# undef IF_NOT_FEATURE_SH_STANDALONE
++# define ENABLE_FEATURE_SH_STANDALONE 0
+ # define IF_FEATURE_SH_STANDALONE(...)
+ # define IF_NOT_FEATURE_SH_STANDALONE(...) __VA_ARGS__
+-# define ENABLE_FEATURE_SH_STANDALONE 0
+ #endif
+ 
+ #if !ENABLE_HUSH_INTERACTIVE
diff --git a/package/busybox/busybox-1.16.0-touch.patch b/package/busybox/busybox-1.16.0-touch.patch
new file mode 100644
index 0000000..4cd62b5
--- /dev/null
+++ b/package/busybox/busybox-1.16.0-touch.patch
@@ -0,0 +1,21 @@
+diff -urpN busybox-1.16.0/coreutils/touch.c busybox-1.16.0-touch/coreutils/touch.c
+--- busybox-1.16.0/coreutils/touch.c	2010-01-25 01:59:38.000000000 +0100
++++ busybox-1.16.0-touch/coreutils/touch.c	2010-03-21 13:05:34.000000000 +0100
+@@ -104,7 +104,7 @@ int touch_main(int argc UNUSED_PARAM, ch
+ 	}
+ 
+ 	do {
+-		if (utimes(*argv, reference_file ? timebuf : NULL) != 0) {
++		if (utimes(*argv, (reference_file || date_str) ? timebuf : NULL) != 0) {
+ 			if (errno == ENOENT) { /* no such file */
+ 				if (opts) { /* creation is disabled, so ignore */
+ 					continue;
+@@ -113,7 +113,7 @@ int touch_main(int argc UNUSED_PARAM, ch
+ 				fd = open(*argv, O_RDWR | O_CREAT, 0666);
+ 				if (fd >= 0) {
+ 					xclose(fd);
+-					if (reference_file)
++					if (reference_file || date_str)
+ 						utimes(*argv, timebuf);
+ 					continue;
+ 				}
-- 
1.6.3.3
