From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  6 Oct 2008 11:52:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081006185202.94BA03C732@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-06 11:52:02 -0700 (Mon, 06 Oct 2008)
New Revision: 23602

Log:
busybox: 1.12.1 grep fix

Added:
   trunk/buildroot/package/busybox/busybox-1.12.1-grep.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.12.1-grep.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-grep.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-grep.patch	2008-10-06 18:52:02 UTC (rev 23602)
@@ -0,0 +1,27 @@
+--- busybox-1.12.1/findutils/grep.c	Sun Sep 28 20:04:28 2008
++++ busybox-1.12.1-grep/findutils/grep.c	Wed Oct  1 00:45:49 2008
+@@ -363,12 +363,22 @@
+ 						 * (unless -v: -Fov doesnt print anything at all) */
+ 						if (found)
+ 							print_line(gl->pattern, strlen(gl->pattern), linenum, ':');
+-					} else {
++					} else while (1) {
++						char old = line[gl->matched_range.rm_eo];
+ 						line[gl->matched_range.rm_eo] = '\0';
+ 						print_line(line + gl->matched_range.rm_so,
+ 								gl->matched_range.rm_eo - gl->matched_range.rm_so,
+ 								linenum, ':');
+-					}
++						line[gl->matched_range.rm_eo] = old;
++#if !ENABLE_EXTRA_COMPAT
++						break;
++#else
++						if (re_search(&gl->compiled_regex, line, line_len,
++								gl->matched_range.rm_eo, line_len - gl->matched_range.rm_eo, 
++								&gl->matched_range) < 0)
++							break;
++#endif
++					} 
+ 				} else {
+ 					print_line(line, line_len, linenum, ':');
+ 				}
