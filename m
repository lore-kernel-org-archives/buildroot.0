From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 25 Mar 2008 07:38:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080325143846.07F653C34D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-25 07:38:45 -0700 (Tue, 25 Mar 2008)
New Revision: 21492

Log:
busybox: add 1.10.0 release


Added:
   trunk/buildroot/package/busybox/busybox-1.10.0-tail.patch
   trunk/buildroot/package/busybox/busybox-1.10.0-taskset.patch
   trunk/buildroot/package/busybox/busybox-1.10.0-udhcp.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-03-25 14:15:39 UTC (rev 21491)
+++ trunk/buildroot/package/busybox/Config.in	2008-03-25 14:38:45 UTC (rev 21492)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_9_X
+	default BR2_BUSYBOX_VERSION_1_10_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -35,6 +35,9 @@
 	config BR2_BUSYBOX_VERSION_1_9_X
 		bool "BusyBox 1.9.x"
 
+	config BR2_BUSYBOX_VERSION_1_10_X
+		bool "BusyBox 1.10.x"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -47,6 +50,7 @@
 	default "1.7.4"		if BR2_BUSYBOX_VERSION_1_7_X
 	default "1.8.2"		if BR2_BUSYBOX_VERSION_1_8_X
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
+	default "1.10.0"	if BR2_BUSYBOX_VERSION_1_10_X
 
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
@@ -71,6 +75,7 @@
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_X
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_8_X
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_9_X
+	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_10_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.

Added: trunk/buildroot/package/busybox/busybox-1.10.0-tail.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.0-tail.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.0-tail.patch	2008-03-25 14:38:45 UTC (rev 21492)
@@ -0,0 +1,62 @@
+--- busybox-1.10.0/coreutils/tail.c	Thu Mar 20 12:46:51 2008
++++ busybox-1.10.0-tail/coreutils/tail.c	Sun Mar 23 04:25:12 2008
+@@ -163,8 +163,6 @@
+ 	fmt = header_fmt + 1;	/* Skip header leading newline on first output. */
+ 	i = 0;
+ 	do {
+-		off_t current;
+-
+ 		if (nfiles > header_threshhold) {
+ 			tail_xprint_header(fmt, argv[i]);
+ 			fmt = header_fmt;
+@@ -173,19 +171,17 @@
+ 		/* Optimizing count-bytes case if the file is seekable.
+ 		 * Beware of backing up too far.
+ 		 * Also we exclude files with size 0 (because of /proc/xxx) */
+-		current = lseek(fds[i], 0, SEEK_END);
+-		if (current > 0) {
+-			if (!from_top) {
++		if (COUNT_BYTES && !from_top) {
++			off_t current = lseek(fds[i], 0, SEEK_END);
++			if (current > 0) {
+ 				if (count == 0)
+ 					continue; /* showing zero lines is easy :) */
+-				if (COUNT_BYTES) {
+-					current -= count;
+-					if (current < 0)
+-						current = 0;
+-					xlseek(fds[i], current, SEEK_SET);
+-					bb_copyfd_size(fds[i], STDOUT_FILENO, count);
+-					continue;
+-				}
++				current -= count;
++				if (current < 0)
++					current = 0;
++				xlseek(fds[i], current, SEEK_SET);
++				bb_copyfd_size(fds[i], STDOUT_FILENO, count);
++				continue;
+ 			}
+ 		}
+ 
+--- busybox-1.10.0/testsuite/tail/tail-n-works	Thu Mar 20 12:46:57 2008
++++ busybox-1.10.0-tail/testsuite/tail/tail-n-works	Sun Mar 23 04:25:12 2008
+@@ -1,4 +1,4 @@
+-[ -n "$d" ] || d=..
+-tail -n 2 "$d/README" > logfile.gnu
+-busybox tail -n 2 "$d/README" > logfile.bb
+-cmp logfile.gnu logfile.bb
++echo -ne "abc\ndef\n123\n" >input
++echo -ne "def\n123\n" >logfile.ok
++busybox tail -n 2 input > logfile.bb
++cmp logfile.ok logfile.bb
+--- busybox-1.10.0/testsuite/tail/tail-works	Thu Mar 20 12:46:57 2008
++++ busybox-1.10.0-tail/testsuite/tail/tail-works	Sun Mar 23 04:25:12 2008
+@@ -1,4 +1,4 @@
+-[ -n "$d" ] || d=..
+-tail -n 2 "$d/README" > logfile.gnu
+-busybox tail -n 2 "$d/README" > logfile.bb
+-cmp logfile.gnu logfile.bb
++echo -ne "abc\ndef\n123\n" >input
++echo -ne "def\n123\n" >logfile.ok
++busybox tail -2 input > logfile.bb
++cmp logfile.ok logfile.bb

Added: trunk/buildroot/package/busybox/busybox-1.10.0-taskset.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.0-taskset.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.0-taskset.patch	2008-03-25 14:38:45 UTC (rev 21492)
@@ -0,0 +1,27 @@
+--- busybox-1.10.0/miscutils/taskset.c	Thu Mar 20 12:46:55 2008
++++ busybox-1.10.0-taskset/miscutils/taskset.c	Sat Mar 22 18:46:21 2008
+@@ -50,6 +50,11 @@
+ 	char *pid_str;
+ 	char *aff = aff; /* for compiler */
+ 
++	/* NB: we mimic util-linux's taskset: -p does not take
++	 * an argument, i.e., "-pN" is NOT valid, only "-p N"!
++	 * Indeed, util-linux-2.13-pre7 uses:
++	 * getopt_long(argc, argv, "+pchV", ...), not "...p:..." */
++
+ 	opt_complementary = "-1"; /* at least 1 arg */
+ 	opt_p = getopt32(argv, "+p");
+ 	argv += optind;
+--- busybox-1.10.0/testsuite/taskset.tests	Thu Mar 20 12:47:04 2008
++++ busybox-1.10.0-taskset/testsuite/taskset.tests	Sat Mar 22 18:46:21 2008
+@@ -7,8 +7,8 @@
+ a="taskset"
+ 
+ # testing "test name"              "opts" "expected result" "file inp" "stdin"
+-testing "taskset (get from pid 1)" "$a -p1 >/dev/null;echo \$?" "0\n" "" ""
+-testing "taskset (invalid pid)"    "$a -p0 >/dev/null 2>&1;echo \$?" "1\n" "" ""
++testing "taskset (get from pid 1)" "$a -p 1 >/dev/null;echo \$?" "0\n" "" ""
++testing "taskset (invalid pid)"    "$a -p 0 >/dev/null 2>&1;echo \$?" "1\n" "" ""
+ testing "taskset (set_aff, needs CAP_SYS_NICE)" \
+                                    "$a 0x1 $SHELL -c $a\ -p\ \$$\|grep\ \"current\ affinity\ mask:\ 1\" >/dev/null;echo \$?" \
+ 				                                "0\n" "" ""

Added: trunk/buildroot/package/busybox/busybox-1.10.0-udhcp.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.0-udhcp.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.0-udhcp.patch	2008-03-25 14:38:45 UTC (rev 21492)
@@ -0,0 +1,15 @@
+--- busybox-1.10.0/networking/udhcp/clientsocket.c	Thu Mar 20 12:46:42 2008
++++ busybox-1.10.0-udhcp/networking/udhcp/clientsocket.c	Tue Mar 25 07:04:32 2008
+@@ -22,11 +22,11 @@
+  */
+ 
+ #include <features.h>
++#include <asm/types.h>
+ #if (defined(__GLIBC__) && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1) || defined(_NEWLIB_VERSION)
+ #include <netpacket/packet.h>
+ #include <net/ethernet.h>
+ #else
+-#include <asm/types.h>
+ #include <linux/if_packet.h>
+ #include <linux/if_ether.h>
+ #endif
