From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Jan 2008 05:33:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080103133325.8689C12010F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-01-03 05:33:25 -0800 (Thu, 03 Jan 2008)
New Revision: 20703

Log:
busybox: Bump version to 1.8.2



Added:
   trunk/buildroot/package/busybox/busybox-1.8.2-arping.patch
   trunk/buildroot/package/busybox/busybox-1.8.2-static.patch
   trunk/buildroot/package/busybox/busybox-1.8.2-vi.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-01-03 13:33:21 UTC (rev 20702)
+++ trunk/buildroot/package/busybox/Config.in	2008-01-03 13:33:25 UTC (rev 20703)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_7_X
+	default BR2_BUSYBOX_VERSION_1_8_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -26,7 +26,11 @@
 
 	config BR2_BUSYBOX_VERSION_1_7_X
 		bool "BusyBox 1.7.x"
+		depends on BR2_DEPRECATED || BR2_RECENT
 
+	config BR2_BUSYBOX_VERSION_1_8_X
+		bool "BusyBox 1.8.x"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -37,6 +41,7 @@
 	default "1.2.2.1"	if BR2_BUSYBOX_VERSION_1_2_2_1
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
 	default "1.7.4"		if BR2_BUSYBOX_VERSION_1_7_X
+	default "1.8.2"		if BR2_BUSYBOX_VERSION_1_8_X
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS
@@ -59,6 +64,7 @@
 	default "package/busybox/busybox-1.2.2.1.config" if BR2_BUSYBOX_VERSION_1_2_2_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_X
+	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_8_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.

Added: trunk/buildroot/package/busybox/busybox-1.8.2-arping.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.8.2-arping.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.8.2-arping.patch	2008-01-03 13:33:25 UTC (rev 20703)
@@ -0,0 +1,13 @@
+diff -urN busybox-1.8.2/networking/arping.c busybox-1.8.2-arping/networking/arping.c
+--- busybox-1.8.2/networking/arping.c	2007-11-10 01:40:47.000000000 +0000
++++ busybox-1.8.2-arping/networking/arping.c	2007-12-18 10:31:55.000000000 +0000
+@@ -207,7 +207,8 @@
+ 		}
+ 
+ 		if (last) {
+-			printf(" %u.%03ums\n", last / 1000, last % 1000);
++			unsigned diff = MONOTONIC_US() - last;
++			printf(" %u.%03ums\n", diff / 1000, diff % 1000);
+ 		} else {
+ 			printf(" UNSOLICITED?\n");
+ 		}

Added: trunk/buildroot/package/busybox/busybox-1.8.2-static.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.8.2-static.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.8.2-static.patch	2008-01-03 13:33:25 UTC (rev 20703)
@@ -0,0 +1,12 @@
+diff -urN busybox-1.8.2/applets/applets.c busybox-1.8.2-static/applets/applets.c
+--- busybox-1.8.2/applets/applets.c	2007-11-10 01:40:53.000000000 +0000
++++ busybox-1.8.2-static/applets/applets.c	2007-12-09 03:46:04.000000000 +0000
+@@ -17,7 +17,7 @@
+ #warning See sources.redhat.com/bugzilla/show_bug.cgi?id=3400
+ #warning Note that glibc is unsuitable for static linking anyway.
+ #warning If you still want to do it, remove -Wl,--gc-sections
+-#warning from top-level Makefile and remove this warning.
++#warning from file scripts/trylink and remove this warning.
+ #error Aborting compilation.
+ #endif
+ 

Added: trunk/buildroot/package/busybox/busybox-1.8.2-vi.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.8.2-vi.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.8.2-vi.patch	2008-01-03 13:33:25 UTC (rev 20703)
@@ -0,0 +1,40 @@
+diff -urN busybox-1.8.2/editors/vi.c busybox-1.8.2-vi/editors/vi.c
+--- busybox-1.8.2/editors/vi.c	2007-11-10 01:40:54.000000000 +0000
++++ busybox-1.8.2-vi/editors/vi.c	2007-12-10 16:26:01.000000000 +0000
+@@ -184,6 +184,7 @@
+ #if ENABLE_FEATURE_VI_COLON
+ 	char *initial_cmds[3];  // currently 2 entries, NULL terminated
+ #endif
++	char readbuffer[MAX_LINELEN];
+ };
+ #define G (*ptr_to_globals)
+ #define text           (G.text          )
+@@ -200,6 +201,10 @@
+ #define term_orig      (G.term_orig     )
+ #define term_vi        (G.term_vi       )
+ #define initial_cmds   (G.initial_cmds  )
++#define readbuffer     (G.readbuffer    )
++#define INIT_G() do { \
++	PTR_TO_GLOBALS = xzalloc(sizeof(G)); \
++} while (0)
+ 
+ static int init_text_buffer(char *); // init from file or create new
+ static void edit_file(char *);	// edit one file
+@@ -321,7 +326,7 @@
+ 	my_pid = getpid();
+ #endif
+ 
+-	PTR_TO_GLOBALS = xzalloc(sizeof(G));
++	INIT_G();
+ 
+ #if ENABLE_FEATURE_VI_CRASHME
+ 	srand((long) my_pid);
+@@ -2142,8 +2147,6 @@
+ 	return safe_poll(pfd, 1, hund*10) > 0;
+ }
+ 
+-#define readbuffer bb_common_bufsiz1
+-
+ static int readed_for_parse;
+ 
+ //----- IO Routines --------------------------------------------
