From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 Jul 2008 04:19:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080722111908.7005D3C729@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-22 04:19:07 -0700 (Tue, 22 Jul 2008)
New Revision: 22911

Log:
busybox: 1.11.1 patches

Added:
   trunk/buildroot/package/busybox/busybox-1.11.1-basename.patch
   trunk/buildroot/package/busybox/busybox-1.11.1-tar.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.11.1-basename.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.11.1-basename.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.11.1-basename.patch	2008-07-22 11:19:07 UTC (rev 22911)
@@ -0,0 +1,9 @@
+--- busybox-1.11.1/coreutils/basename.c	Wed Jun 25 14:51:23 2008
++++ busybox-1.11.1-basename/coreutils/basename.c	Thu Jul 17 20:04:36 2008
+@@ -48,5 +48,5 @@
+ 
+ 	/* puts(s) will do, but we can do without stdio this way: */
+ 	s[m++] = '\n';
+-	return full_write(STDOUT_FILENO, s, m) == (ssize_t)m;
++	return full_write(STDOUT_FILENO, s, m) != (ssize_t)m;
+ }

Added: trunk/buildroot/package/busybox/busybox-1.11.1-tar.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.11.1-tar.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.11.1-tar.patch	2008-07-22 11:19:07 UTC (rev 22911)
@@ -0,0 +1,53 @@
+--- busybox-1.11.1/archival/libunarchive/get_header_tar.c	Wed Jun 25 14:51:17 2008
++++ busybox-1.11.1-tar/archival/libunarchive/get_header_tar.c	Sun Jul 20 19:11:45 2008
+@@ -261,26 +261,31 @@
+ 	case '0':
+ #if ENABLE_FEATURE_TAR_OLDGNU_COMPATIBILITY
+ 		if (last_char_is(file_header->name, '/')) {
+-			file_header->mode |= S_IFDIR;
+-		} else
++			goto set_dir;
++		}
+ #endif
+ 		file_header->mode |= S_IFREG;
+ 		break;
+ 	case '2':
+ 		file_header->mode |= S_IFLNK;
++		/* have seen tarballs with size field containing
++		 * the size of the link target's name */
++ size0:
++		file_header->size = 0;
+ 		break;
+ 	case '3':
+ 		file_header->mode |= S_IFCHR;
+-		break;
++		goto size0; /* paranoia */
+ 	case '4':
+ 		file_header->mode |= S_IFBLK;
+-		break;
++		goto size0;
+ 	case '5':
++ set_dir:
+ 		file_header->mode |= S_IFDIR;
+-		break;
++		goto size0;
+ 	case '6':
+ 		file_header->mode |= S_IFIFO;
+-		break;
++		goto size0;
+ #if ENABLE_FEATURE_TAR_GNU_EXTENSIONS
+ 	case 'L':
+ 		/* free: paranoia: tar with several consecutive longnames */
+--- busybox-1.11.1/archival/libunarchive/seek_by_jump.c	Wed Jun 25 14:51:17 2008
++++ busybox-1.11.1-tar/archival/libunarchive/seek_by_jump.c	Sun Jul 20 19:11:45 2008
+@@ -8,7 +8,9 @@
+ 
+ void seek_by_jump(const archive_handle_t *archive_handle, unsigned amount)
+ {
+-	if (lseek(archive_handle->src_fd, (off_t) amount, SEEK_CUR) == (off_t) -1) {
++	if (amount
++	 && lseek(archive_handle->src_fd, (off_t) amount, SEEK_CUR) == (off_t) -1
++	) {
+ 		if (errno == ESPIPE)
+ 			seek_by_read(archive_handle, amount);
+ 		else
