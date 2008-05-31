From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 05:58:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080531125823.37FE13C853@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 05:58:22 -0700 (Sat, 31 May 2008)
New Revision: 22148

Log:
busybox: additional 1.10.2 fixes


Added:
   trunk/buildroot/package/busybox/busybox-1.10.2-fuser.patch
   trunk/buildroot/package/busybox/busybox-1.10.2-ip.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.10.2-fuser.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.2-fuser.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.2-fuser.patch	2008-05-31 12:58:22 UTC (rev 22148)
@@ -0,0 +1,29 @@
+--- busybox-1.10.2/procps/fuser.c	Sat Apr 19 06:03:13 2008
++++ busybox-1.10.2-fuser/procps/fuser.c	Wed May 28 16:53:35 2008
+@@ -208,6 +208,7 @@
+ 	return plist;
+ }
+ 
++/* NB: does chdir internally */
+ static pid_list *scan_proc_pids(inode_list *ilist)
+ {
+ 	DIR *d;
+@@ -215,7 +216,8 @@
+ 	pid_t pid;
+ 	pid_list *plist;
+ 
+-	d = opendir(".");
++	xchdir("/proc");
++	d = opendir("/proc");
+ 	if (!d)
+ 		return NULL;
+ 
+@@ -329,7 +331,7 @@
+ 		pp++;
+ 	}
+ 
+-	plist = scan_proc_pids(ilist);
++	plist = scan_proc_pids(ilist); /* changes dir to "/proc" */
+ 
+ 	if (!plist)
+ 		return EXIT_FAILURE;

Added: trunk/buildroot/package/busybox/busybox-1.10.2-ip.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.2-ip.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.2-ip.patch	2008-05-31 12:58:22 UTC (rev 22148)
@@ -0,0 +1,11 @@
+--- busybox-1.10.2/networking/libiproute/ip_parse_common_args.c	Sat Apr 19 05:50:26 2008
++++ busybox-1.10.2-ip/networking/libiproute/ip_parse_common_args.c	Sat May 31 09:32:09 2008
+@@ -54,7 +54,7 @@
+ 				break;
+ 			}
+ 		}
+-		arg = index_in_strings(ip_common_commands, opt);
++		arg = index_in_substrings(ip_common_commands, opt);
+ 		if (arg < 0)
+ 			bb_show_usage();
+ 		if (arg == ARG_oneline) {
