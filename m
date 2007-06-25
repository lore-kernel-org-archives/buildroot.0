From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 04:07:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070625110712.A87C6A45F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 04:07:11 -0700 (Mon, 25 Jun 2007)
New Revision: 18925

Log:
- add post 1.6.0 fix


Added:
   trunk/buildroot/package/busybox/busybox-1.6.0-test.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.6.0-test.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.6.0-test.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.6.0-test.patch	2007-06-25 11:07:11 UTC (rev 18925)
@@ -0,0 +1,70 @@
+--- busybox-1.6.0/coreutils/test.c	2007-06-01 13:48:34.000000000 +0200
++++ /tmp/busybox_1_6_stable/coreutils/test.c	2007-06-25 12:29:55.000000000 +0200
+@@ -182,19 +182,23 @@
+ int bb_test(int argc, char **argv)
+ {
+ 	int res;
++	char *arg0;
++	bool _off;
+ 
+-	if (LONE_CHAR(argv[0], '[')) {
++	arg0 = strrchr(argv[0], '/');
++	if (!arg0++) arg0 = argv[0];
++	if (arg0[0] == '[') {
+ 		--argc;
+-		if (NOT_LONE_CHAR(argv[argc], ']')) {
+-			bb_error_msg("missing ]");
+-			return 2;
+-		}
+-		argv[argc] = NULL;
+-	} else if (strcmp(argv[0], "[[") == 0) {
+-		--argc;
+-		if (strcmp(argv[argc], "]]")) {
+-			bb_error_msg("missing ]]");
+-			return 2;
++		if (!arg0[1]) { /* "[" ? */
++			if (NOT_LONE_CHAR(argv[argc], ']')) {
++				bb_error_msg("missing ]");
++				return 2;
++			}
++		} else { /* assuming "[[" */
++			if (strcmp(argv[argc], "]]") != 0) {
++				bb_error_msg("missing ]]");
++				return 2;
++			}
+ 		}
+ 		argv[argc] = NULL;
+ 	}
+@@ -219,15 +223,19 @@
+ 	if (argc == 2)
+ 		return *argv[1] == '\0';
+ //assert(argc);
+-	if (LONE_CHAR(argv[1], '!')) {
+-		bool _off;
++	/* remember if we saw argc==4 which wants *no* '!' test */
++	_off = argc - 4;
++	if (_off ?
++		(LONE_CHAR(argv[1], '!'))
++		: (argv[1][0] != '!' || argv[1][1] != '\0'))
++	{
+ 		if (argc == 3)
+ 			return *argv[2] != '\0';
+-		_off = argc - 4;
++
+ 		t_lex(argv[2 + _off]);
+ 		if (t_wp_op && t_wp_op->op_type == BINOP) {
+ 			t_wp = &argv[1 + _off];
+-			return binop() == 0;
++			return binop() == _off;
+ 		}
+ 	}
+ 	t_wp = &argv[1];
+@@ -378,7 +386,7 @@
+ static int filstat(char *nm, enum token mode)
+ {
+ 	struct stat s;
+-	int i;
++	int i = i; /* gcc 3.x thinks it can be used uninitialized */
+ 
+ 	if (mode == FILSYM) {
+ #ifdef S_IFLNK
