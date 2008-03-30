From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 30 Mar 2008 07:37:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080330143707.8361D3C4E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-30 07:37:06 -0700 (Sun, 30 Mar 2008)
New Revision: 21579

Log:
busybox: additional 1.10.0 fixes


Added:
   trunk/buildroot/package/busybox/busybox-1.10.0-fuser.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.10.0-fuser.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.0-fuser.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.0-fuser.patch	2008-03-30 14:37:06 UTC (rev 21579)
@@ -0,0 +1,43 @@
+--- busybox-1.10.0/procps/fuser.c	Thu Mar 20 12:47:05 2008
++++ busybox-1.10.0-fuser/procps/fuser.c	Sat Mar 29 18:55:23 2008
+@@ -57,11 +57,11 @@
+ 
+ static char *parse_net_arg(const char *arg, unsigned *port)
+ {
+-	char path[12], tproto[5];
++	char path[20], tproto[5];
+ 
+ 	if (sscanf(arg, "%u/%4s", port, tproto) != 2)
+ 		return NULL;
+-	sprintf(path, "net/%s", tproto);
++	sprintf(path, "/proc/net/%s", tproto);
+ 	if (access(path, R_OK) != 0)
+ 		return NULL;
+ 	return xstrdup(tproto);
+@@ -99,7 +99,7 @@
+ static inode_list *scan_proc_net(const char *proto,
+ 				unsigned port, inode_list *ilist)
+ {
+-	char path[12], line[MAX_LINE + 1];
++	char path[20], line[MAX_LINE + 1];
+ 	char addr[128];
+ 	ino_t tmp_inode;
+ 	dev_t tmp_dev;
+@@ -109,7 +109,7 @@
+ 
+ 	tmp_dev = find_socket_dev();
+ 
+-	sprintf(path, "net/%s", proto);
++	sprintf(path, "/proc/net/%s", proto);
+ 	f = fopen(path, "r");
+ 	if (!f)
+ 		return ilist;
+@@ -313,8 +313,6 @@
+ 
+ 	opt = getopt32(argv, OPTION_STRING);
+ 	argv += optind;
+-
+-	xchdir("/proc");
+ 
+ 	ilist = NULL;
+ 	pp = argv;
