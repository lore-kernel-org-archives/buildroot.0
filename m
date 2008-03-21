From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 21 Mar 2008 03:14:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080321101416.6DFA83C313@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-21 03:14:15 -0700 (Fri, 21 Mar 2008)
New Revision: 21438

Log:
busybox: bump version (1.9.2)


Removed:
   trunk/buildroot/package/busybox/busybox-1.9.1-httpd-POST.patch
   trunk/buildroot/package/busybox/busybox-1.9.1-init.patch
   trunk/buildroot/package/busybox/busybox-1.9.1-lineedit.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-03-21 09:56:19 UTC (rev 21437)
+++ trunk/buildroot/package/busybox/Config.in	2008-03-21 10:14:15 UTC (rev 21438)
@@ -46,7 +46,7 @@
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
 	default "1.7.4"		if BR2_BUSYBOX_VERSION_1_7_X
 	default "1.8.2"		if BR2_BUSYBOX_VERSION_1_8_X
-	default "1.9.1"		if BR2_BUSYBOX_VERSION_1_9_X
+	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS

Deleted: trunk/buildroot/package/busybox/busybox-1.9.1-httpd-POST.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.1-httpd-POST.patch	2008-03-21 09:56:19 UTC (rev 21437)
+++ trunk/buildroot/package/busybox/busybox-1.9.1-httpd-POST.patch	2008-03-21 10:14:15 UTC (rev 21438)
@@ -1,11 +0,0 @@
---- busybox-1.9.1/networking/httpd.c	Tue Feb 12 17:03:01 2008
-+++ busybox-1.9.1-httpd-POST/networking/httpd.c	Mon Mar 17 13:58:09 2008
-@@ -1950,7 +1950,7 @@
- 			if ((STRNCASECMP(iobuf, "Content-length:") == 0)) {
- 				/* extra read only for POST */
- 				if (prequest != request_GET) {
--					tptr = iobuf + sizeof("Content-length:") - 1;
-+					tptr = tptr = skip_whitespace(iobuf + sizeof("Content-length:") - 1);
- 					if (!tptr[0])
- 						send_headers_and_exit(HTTP_BAD_REQUEST);
- 					errno = 0;

Deleted: trunk/buildroot/package/busybox/busybox-1.9.1-init.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.1-init.patch	2008-03-21 09:56:19 UTC (rev 21437)
+++ trunk/buildroot/package/busybox/busybox-1.9.1-init.patch	2008-03-21 10:14:15 UTC (rev 21438)
@@ -1,27 +0,0 @@
---- busybox-1.9.1/init/init.c	Tue Feb 12 17:03:12 2008
-+++ busybox-1.9.1-init/init/init.c	Mon Mar 17 14:19:41 2008
-@@ -225,8 +225,22 @@
- 		}
- 		messageD(L_LOG, "console='%s'", s);
- 	} else {
--		/* Make sure fd 0,1,2 are not closed */
--		bb_sanitize_stdio();
-+		/* Make sure fd 0,1,2 are not closed
-+		 * (so that they won't be used by future opens) */
-+
-+		/* bb_sanitize_stdio(); - WRONG.
-+		 * Fail if "/dev/null" doesnt exist, and for init
-+		 * this is a real possibility! Open code it instead. */
-+
-+		int fd = open(bb_dev_null, O_RDWR);
-+		if (fd < 0) {
-+			/* Give me _ANY_ open descriptor! */
-+			fd = xopen("/", O_RDONLY); /* we don't believe this can fail */
-+		}
-+    		while ((unsigned)fd < 2)
-+            		fd = dup(fd);
-+		if (fd > 2)
-+			close (fd);
- 	}
- 
- 	s = getenv("TERM");

Deleted: trunk/buildroot/package/busybox/busybox-1.9.1-lineedit.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.1-lineedit.patch	2008-03-21 09:56:19 UTC (rev 21437)
+++ trunk/buildroot/package/busybox/busybox-1.9.1-lineedit.patch	2008-03-21 10:14:15 UTC (rev 21438)
@@ -1,19 +0,0 @@
---- busybox-1.9.1/libbb/lineedit.c	Tue Feb 12 17:10:25 2008
-+++ busybox-1.9.1-lineedit/libbb/lineedit.c	Mon Feb 18 23:26:54 2008
-@@ -246,7 +246,15 @@
- 	if (cmdedit_x >= num) {
- 		cmdedit_x -= num;
- 		if (num <= 4) {
--			printf("\b\b\b\b" + (4-num));
-+			/* This is longer by 5 bytes on x86.
-+			 * Also gets mysteriously
-+			 * miscompiled for some ARM users.
-+			 * printf(("\b\b\b\b" + 4) - num);
-+			 * return;
-+			 */
-+			do {
-+				bb_putchar('\b');
-+			} while (--num);
- 			return;
- 		}
- 		printf("\033[%uD", num);
