From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 26 Mar 2008 14:49:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080326214959.9F2583C3A2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-26 14:49:58 -0700 (Wed, 26 Mar 2008)
New Revision: 21510

Log:
busybox: bump 1.7.x and 1.8.x versions


Removed:
   trunk/buildroot/package/busybox/busybox-1.7.4-grep.patch
   trunk/buildroot/package/busybox/busybox-1.8.2-arping.patch
   trunk/buildroot/package/busybox/busybox-1.8.2-static.patch
   trunk/buildroot/package/busybox/busybox-1.8.2-vi.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-03-26 20:06:24 UTC (rev 21509)
+++ trunk/buildroot/package/busybox/Config.in	2008-03-26 21:49:58 UTC (rev 21510)
@@ -47,8 +47,8 @@
 	string
 	default "1.2.2.1"	if BR2_BUSYBOX_VERSION_1_2_2_1
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
-	default "1.7.4"		if BR2_BUSYBOX_VERSION_1_7_X
-	default "1.8.2"		if BR2_BUSYBOX_VERSION_1_8_X
+	default "1.7.5"		if BR2_BUSYBOX_VERSION_1_7_X
+	default "1.8.3"		if BR2_BUSYBOX_VERSION_1_8_X
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
 	default "1.10.0"	if BR2_BUSYBOX_VERSION_1_10_X
 

Deleted: trunk/buildroot/package/busybox/busybox-1.7.4-grep.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.7.4-grep.patch	2008-03-26 20:06:24 UTC (rev 21509)
+++ trunk/buildroot/package/busybox/busybox-1.7.4-grep.patch	2008-03-26 21:49:58 UTC (rev 21510)
@@ -1,38 +0,0 @@
-diff -urN busybox-1.7.4/findutils/grep.c busybox-1.7.4-grep/findutils/grep.c
---- busybox-1.7.4/findutils/grep.c	2007-09-03 04:48:54.000000000 -0700
-+++ busybox-1.7.4-grep/findutils/grep.c	2007-12-08 19:02:33.000000000 -0800
-@@ -154,14 +154,14 @@
- 
- 	while ((line = xmalloc_getline(file)) != NULL) {
- 		llist_t *pattern_ptr = pattern_head;
--		grep_list_data_t * gl;
-+		grep_list_data_t *gl = gl; /* for gcc */
- 
- 		linenum++;
- 		ret = 0;
- 		while (pattern_ptr) {
- 			gl = (grep_list_data_t *)pattern_ptr->data;
- 			if (FGREP_FLAG) {
--				ret = strstr(line, gl->pattern) != NULL;
-+				ret |= (strstr(line, gl->pattern) != NULL);
- 			} else {
- 				/*
- 				 * test for a postitive-assertion match (regexec returns success (0)
-@@ -255,8 +255,15 @@
- 				print_n_lines_after = lines_after;
- #endif
- 				if (option_mask32 & OPT_o) {
--					line[regmatch.rm_eo] = '\0';
--					print_line(line + regmatch.rm_so, linenum, ':');
-+					if (FGREP_FLAG) {
-+						/* -Fo just prints the pattern
-+						 * (unless -v: -Fov doesnt print anything at all) */
-+						if (ret)
-+							print_line(gl->pattern, linenum, ':');
-+					} else {
-+						line[regmatch.rm_eo] = '\0';
-+						print_line(line + regmatch.rm_so, linenum, ':');
-+					}
- 				} else {
- 					print_line(line, linenum, ':');
- 				}

Deleted: trunk/buildroot/package/busybox/busybox-1.8.2-arping.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.8.2-arping.patch	2008-03-26 20:06:24 UTC (rev 21509)
+++ trunk/buildroot/package/busybox/busybox-1.8.2-arping.patch	2008-03-26 21:49:58 UTC (rev 21510)
@@ -1,13 +0,0 @@
-diff -urN busybox-1.8.2/networking/arping.c busybox-1.8.2-arping/networking/arping.c
---- busybox-1.8.2/networking/arping.c	2007-11-10 01:40:47.000000000 +0000
-+++ busybox-1.8.2-arping/networking/arping.c	2007-12-18 10:31:55.000000000 +0000
-@@ -207,7 +207,8 @@
- 		}
- 
- 		if (last) {
--			printf(" %u.%03ums\n", last / 1000, last % 1000);
-+			unsigned diff = MONOTONIC_US() - last;
-+			printf(" %u.%03ums\n", diff / 1000, diff % 1000);
- 		} else {
- 			printf(" UNSOLICITED?\n");
- 		}

Deleted: trunk/buildroot/package/busybox/busybox-1.8.2-static.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.8.2-static.patch	2008-03-26 20:06:24 UTC (rev 21509)
+++ trunk/buildroot/package/busybox/busybox-1.8.2-static.patch	2008-03-26 21:49:58 UTC (rev 21510)
@@ -1,12 +0,0 @@
-diff -urN busybox-1.8.2/applets/applets.c busybox-1.8.2-static/applets/applets.c
---- busybox-1.8.2/applets/applets.c	2007-11-10 01:40:53.000000000 +0000
-+++ busybox-1.8.2-static/applets/applets.c	2007-12-09 03:46:04.000000000 +0000
-@@ -17,7 +17,7 @@
- #warning See sources.redhat.com/bugzilla/show_bug.cgi?id=3400
- #warning Note that glibc is unsuitable for static linking anyway.
- #warning If you still want to do it, remove -Wl,--gc-sections
--#warning from top-level Makefile and remove this warning.
-+#warning from file scripts/trylink and remove this warning.
- #error Aborting compilation.
- #endif
- 

Deleted: trunk/buildroot/package/busybox/busybox-1.8.2-vi.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.8.2-vi.patch	2008-03-26 20:06:24 UTC (rev 21509)
+++ trunk/buildroot/package/busybox/busybox-1.8.2-vi.patch	2008-03-26 21:49:58 UTC (rev 21510)
@@ -1,40 +0,0 @@
-diff -urN busybox-1.8.2/editors/vi.c busybox-1.8.2-vi/editors/vi.c
---- busybox-1.8.2/editors/vi.c	2007-11-10 01:40:54.000000000 +0000
-+++ busybox-1.8.2-vi/editors/vi.c	2007-12-10 16:26:01.000000000 +0000
-@@ -184,6 +184,7 @@
- #if ENABLE_FEATURE_VI_COLON
- 	char *initial_cmds[3];  // currently 2 entries, NULL terminated
- #endif
-+	char readbuffer[MAX_LINELEN];
- };
- #define G (*ptr_to_globals)
- #define text           (G.text          )
-@@ -200,6 +201,10 @@
- #define term_orig      (G.term_orig     )
- #define term_vi        (G.term_vi       )
- #define initial_cmds   (G.initial_cmds  )
-+#define readbuffer     (G.readbuffer    )
-+#define INIT_G() do { \
-+	PTR_TO_GLOBALS = xzalloc(sizeof(G)); \
-+} while (0)
- 
- static int init_text_buffer(char *); // init from file or create new
- static void edit_file(char *);	// edit one file
-@@ -321,7 +326,7 @@
- 	my_pid = getpid();
- #endif
- 
--	PTR_TO_GLOBALS = xzalloc(sizeof(G));
-+	INIT_G();
- 
- #if ENABLE_FEATURE_VI_CRASHME
- 	srand((long) my_pid);
-@@ -2142,8 +2147,6 @@
- 	return safe_poll(pfd, 1, hund*10) > 0;
- }
- 
--#define readbuffer bb_common_bufsiz1
--
- static int readed_for_parse;
- 
- //----- IO Routines --------------------------------------------
