From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 17 Mar 2008 12:44:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080317194443.985ED12CB1F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-17 12:44:43 -0700 (Mon, 17 Mar 2008)
New Revision: 21370

Log:
busybox: additional 1.9.1 patches


Added:
   trunk/buildroot/package/busybox/busybox-1.9.1-httpd-POST.patch
   trunk/buildroot/package/busybox/busybox-1.9.1-init.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.9.1-httpd-POST.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.1-httpd-POST.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.1-httpd-POST.patch	2008-03-17 19:44:43 UTC (rev 21370)
@@ -0,0 +1,11 @@
+--- busybox-1.9.1/networking/httpd.c	Tue Feb 12 17:03:01 2008
++++ busybox-1.9.1-httpd-POST/networking/httpd.c	Mon Mar 17 13:58:09 2008
+@@ -1950,7 +1950,7 @@
+ 			if ((STRNCASECMP(iobuf, "Content-length:") == 0)) {
+ 				/* extra read only for POST */
+ 				if (prequest != request_GET) {
+-					tptr = iobuf + sizeof("Content-length:") - 1;
++					tptr = tptr = skip_whitespace(iobuf + sizeof("Content-length:") - 1);
+ 					if (!tptr[0])
+ 						send_headers_and_exit(HTTP_BAD_REQUEST);
+ 					errno = 0;

Added: trunk/buildroot/package/busybox/busybox-1.9.1-init.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.1-init.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.1-init.patch	2008-03-17 19:44:43 UTC (rev 21370)
@@ -0,0 +1,27 @@
+--- busybox-1.9.1/init/init.c	Tue Feb 12 17:03:12 2008
++++ busybox-1.9.1-init/init/init.c	Mon Mar 17 14:19:41 2008
+@@ -225,8 +225,22 @@
+ 		}
+ 		messageD(L_LOG, "console='%s'", s);
+ 	} else {
+-		/* Make sure fd 0,1,2 are not closed */
+-		bb_sanitize_stdio();
++		/* Make sure fd 0,1,2 are not closed
++		 * (so that they won't be used by future opens) */
++
++		/* bb_sanitize_stdio(); - WRONG.
++		 * Fail if "/dev/null" doesnt exist, and for init
++		 * this is a real possibility! Open code it instead. */
++
++		int fd = open(bb_dev_null, O_RDWR);
++		if (fd < 0) {
++			/* Give me _ANY_ open descriptor! */
++			fd = xopen("/", O_RDONLY); /* we don't believe this can fail */
++		}
++    		while ((unsigned)fd < 2)
++            		fd = dup(fd);
++		if (fd > 2)
++			close (fd);
+ 	}
+ 
+ 	s = getenv("TERM");
