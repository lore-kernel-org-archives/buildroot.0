From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  5 May 2008 10:17:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080505171701.8C25C3C61C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-05 10:17:00 -0700 (Mon, 05 May 2008)
New Revision: 21934

Log:
busybox: additional 1.10.1 patches


Added:
   trunk/buildroot/package/busybox/busybox-1.10.1-echo.patch
   trunk/buildroot/package/busybox/busybox-1.10.1-hppa.patch
   trunk/buildroot/package/busybox/busybox-1.10.1-tar.patch
   trunk/buildroot/package/busybox/busybox-1.10.1-trylink.patch

Modified:
   trunk/buildroot/package/busybox/busybox-1.10.1-mdev.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.10.1-echo.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-echo.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-echo.patch	2008-05-05 17:17:00 UTC (rev 21934)
@@ -0,0 +1,38 @@
+--- busybox-1.10.1/coreutils/echo.c	Sat Apr 19 05:50:32 2008
++++ busybox-1.10.1-echo/coreutils/echo.c	Wed Apr 30 02:37:08 2008
+@@ -27,10 +27,8 @@
+ 
+ /* This is a NOFORK applet. Be very careful! */
+ 
+-/* argc is unused, but removing it precludes compiler from
+- * using call -> jump optimization */
++/* NB: can be used by shell even if not enabled as applet */
+ 
+-int echo_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+ int echo_main(int argc ATTRIBUTE_UNUSED, char **argv)
+ {
+ 	const char *arg;
+@@ -110,15 +108,19 @@
+ 				}
+ #if !ENABLE_FEATURE_FANCY_ECHO
+ 				/* SUSv3 specifies that octal escapes must begin with '0'. */
+-				if ( (((unsigned char)*arg) - '1') >= 7)
++				if ( ((int)(unsigned char)(*arg) - '0') >= 8) /* '8' or bigger */
+ #endif
+ 				{
+ 					/* Since SUSv3 mandates a first digit of 0, 4-digit octals
+ 					* of the form \0### are accepted. */
+-					if (*arg == '0' && ((unsigned char)(arg[1]) - '0') < 8) {
+-						arg++;
++					if (*arg == '0') {
++						/* NB: don't turn "...\0" into "...\" */
++						if (arg[1] && ((unsigned char)(arg[1]) - '0') < 8) {
++							arg++;
++						}
+ 					}
+-					/* bb_process_escape_sequence can handle nul correctly */
++					/* bb_process_escape_sequence handles NUL correctly
++					 * ("...\" case). */
+ 					c = bb_process_escape_sequence(&arg);
+ 				}
+ 			}

Added: trunk/buildroot/package/busybox/busybox-1.10.1-hppa.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-hppa.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-hppa.patch	2008-05-05 17:17:00 UTC (rev 21934)
@@ -0,0 +1,37 @@
+--- busybox-1.10.1/include/libbb.h	Sat Apr 19 05:50:36 2008
++++ busybox-1.10.1-hppa/include/libbb.h	Mon Apr 28 10:34:36 2008
+@@ -288,20 +288,20 @@
+ 	 * SIGSYS   Bad argument to routine
+ 	 * SIGTRAP  Trace/breakpoint trap
+ 	 */
+-	BB_FATAL_SIGS = 0
+-		+ (1 << SIGHUP)
+-		+ (1 << SIGINT)
+-		+ (1 << SIGTERM)
+-		+ (1 << SIGPIPE)   // Write to pipe with no readers
+-		+ (1 << SIGQUIT)   // Quit from keyboard
+-		+ (1 << SIGABRT)   // Abort signal from abort(3)
+-		+ (1 << SIGALRM)   // Timer signal from alarm(2)
+-		+ (1 << SIGVTALRM) // Virtual alarm clock
+-		+ (1 << SIGXCPU)   // CPU time limit exceeded
+-		+ (1 << SIGXFSZ)   // File size limit exceeded
+-		+ (1 << SIGUSR1)   // Yes kids, these are also fatal!
+-		+ (1 << SIGUSR2)
+-		+ 0,
++	BB_FATAL_SIGS = (int)(0
++		+ (1LL << SIGHUP)
++		+ (1LL << SIGINT)
++		+ (1LL << SIGTERM)
++		+ (1LL << SIGPIPE)   // Write to pipe with no readers
++		+ (1LL << SIGQUIT)   // Quit from keyboard
++		+ (1LL << SIGABRT)   // Abort signal from abort(3)
++		+ (1LL << SIGALRM)   // Timer signal from alarm(2)
++		+ (1LL << SIGVTALRM) // Virtual alarm clock
++		+ (1LL << SIGXCPU)   // CPU time limit exceeded
++		+ (1LL << SIGXFSZ)   // File size limit exceeded
++		+ (1LL << SIGUSR1)   // Yes kids, these are also fatal!
++		+ (1LL << SIGUSR2)
++		+ 0),
+ };
+ void bb_signals(int sigs, void (*f)(int));
+ /* Unlike signal() and bb_signals, sets handler with sigaction()

Modified: trunk/buildroot/package/busybox/busybox-1.10.1-mdev.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-mdev.patch	2008-05-05 14:48:13 UTC (rev 21933)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-mdev.patch	2008-05-05 17:17:00 UTC (rev 21934)
@@ -1,5 +1,5 @@
 --- busybox-1.10.1/util-linux/mdev.c	Sat Apr 19 05:50:39 2008
-+++ busybox-1.10.1-mdev/util-linux/mdev.c	Sat Apr 26 17:15:54 2008
++++ busybox-1.10.1-mdev/util-linux/mdev.c	Fri May  2 14:48:06 2008
 @@ -12,6 +12,8 @@
  #include "libbb.h"
  #include "xregex.h"
@@ -40,7 +40,7 @@
  	char *command = NULL;
  	char *alias = NULL;
  
-@@ -42,156 +58,177 @@
+@@ -42,156 +58,178 @@
  	 * also depend on path having writeable space after it.
  	 */
  	if (!delete) {
@@ -204,13 +204,19 @@
 +			if (ENABLE_FEATURE_MDEV_RENAME) {
 +				if (!next)
 +					break;
-+				val = next;
-+				next = next_field(val);
-+				if (*val == '>') {
++				if (*next == '>') {
 +#if ENABLE_FEATURE_MDEV_RENAME_REGEXP
-+					/* substitute %1..9 with off[1..9], if any */
 +					char *s, *p;
 +					unsigned i, n;
++#endif
++					val = next;
++					next = next_field(val);
++#if ENABLE_FEATURE_MDEV_RENAME_REGEXP
++					/* substitute %1..9 with off[1..9], if any */
++					n = 0;
++					s = val;
++					while (*s && *s++ == '%')
++						n++;
  
 -					/* parse GID */
 -					grp = getgrnam(str_gid);
@@ -218,11 +224,7 @@
 -						gid = grp->gr_gid;
 -					else
 -						gid = strtoul(str_gid, NULL, 10);
-+					n = 0;
-+					s = val;
-+					while (*s && *s++ == '%')
-+						n++;
- 
+-
 -				} else if (field == 2) {
 -
 -					/* Mode device permissions */
@@ -327,7 +329,7 @@
  
  		if (ENABLE_FEATURE_MDEV_RENAME)
  			unlink(device_name);
-@@ -208,39 +245,44 @@
+@@ -208,39 +246,44 @@
  			if (ENABLE_FEATURE_MDEV_RENAME && alias) {
  				char *dest;
  
@@ -389,7 +391,7 @@
  }
  
  /* File callback for /sys/ traversal */
-@@ -249,14 +291,15 @@
+@@ -249,14 +292,15 @@
                        void *userData,
                        int depth ATTRIBUTE_UNUSED)
  {
@@ -408,7 +410,7 @@
  	make_device(scratch, 0);
  
  	return TRUE;
-@@ -287,12 +330,6 @@
+@@ -287,12 +331,6 @@
  	int cnt;
  	int firmware_fd, loading_fd, data_fd;
  
@@ -421,7 +423,7 @@
  	/* check for /lib/firmware/$FIRMWARE */
  	xchdir("/lib/firmware");
  	firmware_fd = xopen(firmware, O_RDONLY);
-@@ -304,16 +341,15 @@
+@@ -304,16 +342,15 @@
  	xchdir(sysfs_path);
  	for (cnt = 0; cnt < 30; ++cnt) {
  		loading_fd = open("loading", O_WRONLY);
@@ -444,7 +446,7 @@
  		goto out;
  
  	/* load firmware by `cat /lib/firmware/$FIRMWARE > /sys/$DEVPATH/data */
-@@ -324,9 +360,9 @@
+@@ -324,9 +361,9 @@
  
  	/* tell kernel result by `echo [0|-1] > /sys/$DEVPATH/loading` */
  	if (cnt > 0)
@@ -456,7 +458,7 @@
  
   out:
  	if (ENABLE_FEATURE_CLEAN_UP) {
-@@ -341,16 +377,14 @@
+@@ -341,16 +378,14 @@
  {
  	char *action;
  	char *env_path;
@@ -475,7 +477,7 @@
  		struct stat st;
  
  		xstat("/", &st);
-@@ -366,26 +400,27 @@
+@@ -366,26 +401,27 @@
  			fileAction, dirAction, temp, 0);
  
  	} else {

Added: trunk/buildroot/package/busybox/busybox-1.10.1-tar.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-tar.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-tar.patch	2008-05-05 17:17:00 UTC (rev 21934)
@@ -0,0 +1,24 @@
+--- busybox-1.10.1/archival/libunarchive/get_header_tar.c	Sat Apr 19 05:50:29 2008
++++ busybox-1.10.1-tar/archival/libunarchive/get_header_tar.c	Tue Apr 29 06:12:29 2008
+@@ -112,7 +112,7 @@
+ 	archive_handle->offset += 512;
+ 
+ 	/* If there is no filename its an empty header */
+-	if (tar.name[0] == 0) {
++	if (tar.name[0] == 0 && tar.prefix[0] == 0) {
+ 		if (end) {
+ 			/* This is the second consecutive empty header! End of archive!
+ 			 * Read until the end to empty the pipe from gz or bz2
+@@ -211,9 +211,12 @@
+ 	/* getOctal trashes subsequent field, therefore we call it
+ 	 * on fields in reverse order */
+ 	if (tar.devmajor[0]) {
++		char t = tar.prefix[0];
++		/* we trash prefix[0] here, but we DO need it later! */
+ 		unsigned minor = GET_OCTAL(tar.devminor);
+ 		unsigned major = GET_OCTAL(tar.devmajor);
+ 		file_header->device = makedev(major, minor);
++		tar.prefix[0] = t;
+ 	}
+ 	file_header->link_target = NULL;
+ 	if (!linkname && parse_names && tar.linkname[0]) {

Added: trunk/buildroot/package/busybox/busybox-1.10.1-trylink.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-trylink.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-trylink.patch	2008-05-05 17:17:00 UTC (rev 21934)
@@ -0,0 +1,11 @@
+--- busybox-1.10.1/scripts/trylink	Sat Apr 19 05:50:27 2008
++++ busybox-1.10.1-trylink/scripts/trylink	Wed Apr 30 02:10:19 2008
+@@ -66,7 +66,7 @@
+ 	#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ 	syntax error here
+ 	#endif
+-	" >"$tempname"
++	" >"$tempname".c
+     if $CC "$tempname".c -c -o "$tempname".o >/dev/null 2>&1; then
+ 	echo "$2";
+     else
