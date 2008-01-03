From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Jan 2008 05:33:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080103133322.C38D2120113@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-01-03 05:33:21 -0800 (Thu, 03 Jan 2008)
New Revision: 20702

Log:
busybox: Bump version to 1.7.4



Added:
   trunk/buildroot/package/busybox/busybox-1.7.4-grep.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-01-03 13:33:19 UTC (rev 20701)
+++ trunk/buildroot/package/busybox/Config.in	2008-01-03 13:33:21 UTC (rev 20702)
@@ -36,7 +36,7 @@
 	string
 	default "1.2.2.1"	if BR2_BUSYBOX_VERSION_1_2_2_1
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
-	default "1.7.2"		if BR2_BUSYBOX_VERSION_1_7_X
+	default "1.7.4"		if BR2_BUSYBOX_VERSION_1_7_X
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS

Added: trunk/buildroot/package/busybox/busybox-1.7.4-grep.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.7.4-grep.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.7.4-grep.patch	2008-01-03 13:33:21 UTC (rev 20702)
@@ -0,0 +1,38 @@
+diff -urN busybox-1.7.4/findutils/grep.c busybox-1.7.4-grep/findutils/grep.c
+--- busybox-1.7.4/findutils/grep.c	2007-09-03 04:48:54.000000000 -0700
++++ busybox-1.7.4-grep/findutils/grep.c	2007-12-08 19:02:33.000000000 -0800
+@@ -154,14 +154,14 @@
+ 
+ 	while ((line = xmalloc_getline(file)) != NULL) {
+ 		llist_t *pattern_ptr = pattern_head;
+-		grep_list_data_t * gl;
++		grep_list_data_t *gl = gl; /* for gcc */
+ 
+ 		linenum++;
+ 		ret = 0;
+ 		while (pattern_ptr) {
+ 			gl = (grep_list_data_t *)pattern_ptr->data;
+ 			if (FGREP_FLAG) {
+-				ret = strstr(line, gl->pattern) != NULL;
++				ret |= (strstr(line, gl->pattern) != NULL);
+ 			} else {
+ 				/*
+ 				 * test for a postitive-assertion match (regexec returns success (0)
+@@ -255,8 +255,15 @@
+ 				print_n_lines_after = lines_after;
+ #endif
+ 				if (option_mask32 & OPT_o) {
+-					line[regmatch.rm_eo] = '\0';
+-					print_line(line + regmatch.rm_so, linenum, ':');
++					if (FGREP_FLAG) {
++						/* -Fo just prints the pattern
++						 * (unless -v: -Fov doesnt print anything at all) */
++						if (ret)
++							print_line(gl->pattern, linenum, ':');
++					} else {
++						line[regmatch.rm_eo] = '\0';
++						print_line(line + regmatch.rm_so, linenum, ':');
++					}
+ 				} else {
+ 					print_line(line, linenum, ':');
+ 				}
