From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Mar 2009 08:52:57 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/util-linux
Message-ID: <20090303085257.AF61D764F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-03 08:52:56 +0000 (Tue, 03 Mar 2009)
New Revision: 25499

Log:
util-linux: bump version

Fixes #19

Added:
   trunk/buildroot/package/util-linux/util-linux-no-nls-fix.patch
   trunk/buildroot/package/util-linux/util-linux-susv3-legacy.patch
   trunk/buildroot/package/util-linux/util-linux-umount2-fix.patch

Removed:
   trunk/buildroot/package/util-linux/util-linux-gcc41.patch
   trunk/buildroot/package/util-linux/util-linux-remove-deprecated-functions.patch

Modified:
   trunk/buildroot/package/util-linux/util-linux.mk


Changeset:
Deleted: trunk/buildroot/package/util-linux/util-linux-gcc41.patch
===================================================================
--- trunk/buildroot/package/util-linux/util-linux-gcc41.patch	2009-03-02 22:20:14 UTC (rev 25498)
+++ trunk/buildroot/package/util-linux/util-linux-gcc41.patch	2009-03-03 08:52:56 UTC (rev 25499)
@@ -1,28 +0,0 @@
-diff -urN util-linux-2.12q/disk-utils/fsck.cramfs.c util-linux-2.12q-patched/disk-utils/fsck.cramfs.c
---- util-linux-2.12q/disk-utils/fsck.cramfs.c	2004-12-11 08:53:16.000000000 -0600
-+++ util-linux-2.12q-patched/disk-utils/fsck.cramfs.c	2005-10-03 17:27:13.000000000 -0500
-@@ -77,15 +77,7 @@
- #define PAD_SIZE 512
- 
- #include <asm/page.h>
--#ifdef PAGE_SIZE
--#define PAGE_CACHE_SIZE ((int) PAGE_SIZE)
--#elif defined __ia64__
--#define PAGE_CACHE_SIZE (16384)
--#elif defined __alpha__
--#define PAGE_CACHE_SIZE (8192)
--#else
- #define PAGE_CACHE_SIZE (4096)
--#endif
- 
- /* Guarantee access to at least 8kB at a time */
- #define ROMBUFFER_BITS	13
-@@ -95,7 +87,7 @@
- static unsigned long read_buffer_block = ~0UL;
- 
- /* Uncompressing data structures... */
--static char outbuffer[PAGE_CACHE_SIZE*2];
-+static char outbuffer[4096*2];
- z_stream stream;
- 
- #endif /* INCLUDE_FS_TESTS */

Added: trunk/buildroot/package/util-linux/util-linux-no-nls-fix.patch
===================================================================
--- trunk/buildroot/package/util-linux/util-linux-no-nls-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/util-linux/util-linux-no-nls-fix.patch	2009-03-03 08:52:56 UTC (rev 25499)
@@ -0,0 +1,25 @@
+[PATCH]: fix util-linux build without NLS support
+
+util-linux partly supports builds without NLS support, but it forgets to
+provide a dummy setlocale() macro.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/nls.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: util-linux-2.13-pre7/include/nls.h
+===================================================================
+--- util-linux-2.13-pre7.orig/include/nls.h
++++ util-linux-2.13-pre7/include/nls.h
+@@ -19,6 +19,10 @@
+ # define textdomain(Domain) /* empty */
+ # define _(Text) (Text)
+ # define N_(Text) (Text)
++# undef LC_ALL
++# define LC_ALL 0
++# undef setlocale
++# define setlocale(category, locale)
+ #endif
+ 
+ 

Deleted: trunk/buildroot/package/util-linux/util-linux-remove-deprecated-functions.patch
===================================================================
--- trunk/buildroot/package/util-linux/util-linux-remove-deprecated-functions.patch	2009-03-02 22:20:14 UTC (rev 25498)
+++ trunk/buildroot/package/util-linux/util-linux-remove-deprecated-functions.patch	2009-03-03 08:52:56 UTC (rev 25499)
@@ -1,325 +0,0 @@
-diff -ur util-linux-2.12r/fdisk/cfdisk.c util-linux-2.12r-patched/fdisk/cfdisk.c
---- util-linux-2.12r/fdisk/cfdisk.c	2005-09-09 16:44:57.000000000 -0500
-+++ util-linux-2.12r-patched/fdisk/cfdisk.c	2006-12-04 23:21:09.646235820 -0600
-@@ -353,7 +353,7 @@
- /* Some libc's have their own basename() */
- static char *
- my_basename(char *devname) {
--    char *s = rindex(devname, '/');
-+    char *s = strrchr(devname, '/');
-     return s ? s+1 : devname;
- }
- 
-diff -ur util-linux-2.12r/fdisk/fdiskbsdlabel.c util-linux-2.12r-patched/fdisk/fdiskbsdlabel.c
---- util-linux-2.12r/fdisk/fdiskbsdlabel.c	2003-07-13 16:12:47.000000000 -0500
-+++ util-linux-2.12r-patched/fdisk/fdiskbsdlabel.c	2006-12-04 23:21:09.646235820 -0600
-@@ -538,10 +538,10 @@
- 
-   /* We need a backup of the disklabel (xbsd_dlabel might have changed). */
-   d = &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE];
--  bcopy (d, &dl, sizeof (struct xbsd_disklabel));
-+  memcpy (&dl, d, sizeof (struct xbsd_disklabel));
- 
-   /* The disklabel will be overwritten by 0's from bootxx anyway */
--  bzero (d, sizeof (struct xbsd_disklabel));
-+  memset (d, 0, sizeof (struct xbsd_disklabel));
- 
-   snprintf (path, sizeof(path), "%s/boot%s", bootdir, dkbasename);
-   if (!xbsd_get_bootstrap (path, &disklabelbuffer[xbsd_dlabel.d_secsize],
-@@ -555,7 +555,7 @@
-       exit ( EXIT_FAILURE );
-     }
- 
--  bcopy (&dl, d, sizeof (struct xbsd_disklabel));
-+  memcpy (d, &dl, sizeof (struct xbsd_disklabel));
- 
- #if defined (__powerpc__) || defined (__hppa__)
-   sector = 0;
-@@ -657,7 +657,7 @@
- 	struct geom g;
- 
- 	get_geometry (fd, &g);
--	bzero (d, sizeof (struct xbsd_disklabel));
-+	memset (d, 0, sizeof (struct xbsd_disklabel));
- 
- 	d -> d_magic = BSD_DISKMAGIC;
- 
-@@ -740,8 +740,8 @@
- 	if (BSD_BBSIZE != read (fd, disklabelbuffer, BSD_BBSIZE))
- 		fatal (unable_to_read);
- 
--	bcopy (&disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
--	       d, sizeof (struct xbsd_disklabel));
-+	memcpy (d, &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
-+	       sizeof (struct xbsd_disklabel));
- 
- 	if (d -> d_magic != BSD_DISKMAGIC || d -> d_magic2 != BSD_DISKMAGIC)
- 		return 0;
-@@ -776,7 +776,7 @@
-   /* This is necessary if we want to write the bootstrap later,
-      otherwise we'd write the old disklabel with the bootstrap.
-   */
--  bcopy (d, &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
-+  memcpy (&disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET], d,
- 	 sizeof (struct xbsd_disklabel));
- 
- #if defined (__alpha__) && BSD_LABELSECTOR == 0
-diff -ur util-linux-2.12r/fdisk/sfdisk.c util-linux-2.12r-patched/fdisk/sfdisk.c
---- util-linux-2.12r/fdisk/sfdisk.c	2005-01-04 16:31:57.000000000 -0600
-+++ util-linux-2.12r-patched/fdisk/sfdisk.c	2006-12-04 23:21:09.650236137 -0600
-@@ -1730,12 +1730,12 @@
- 	eof = 1;
- 	return RD_EOF;
-     }
--    if (!(lp = index(lp, '\n')))
-+    if (!(lp = strchr(lp, '\n')))
-       fatal(_("long or incomplete input line - quitting\n"));
-     *lp = 0;
- 
-     /* remove comments, if any */
--    if ((lp = index(line+2, '#')) != 0)
-+    if ((lp = strchr(line+2, '#')) != 0)
-       *lp = 0;
- 
-     /* recognize a few commands - to be expanded */
-@@ -1745,7 +1745,7 @@
-     }
- 
-     /* dump style? - then bad input is fatal */
--    if ((ip = index(line+2, ':')) != 0) {
-+    if ((ip = strchr(line+2, ':')) != 0) {
- 	struct dumpfld *d;
- 
-       nxtfld:
-@@ -2514,7 +2514,7 @@
- 
-     if (argc < 1)
-       fatal(_("no command?\n"));
--    if ((progn = rindex(argv[0], '/')) == NULL)
-+    if ((progn = strrchr(argv[0], '/')) == NULL)
-       progn = argv[0];
-     else
-       progn++;
-diff -ur util-linux-2.12r/login-utils/login.c util-linux-2.12r-patched/login-utils/login.c
---- util-linux-2.12r/login-utils/login.c	2004-12-04 20:37:12.000000000 -0600
-+++ util-linux-2.12r-patched/login-utils/login.c	2006-12-04 23:21:09.650236137 -0600
-@@ -97,8 +97,6 @@
- #include <sys/file.h>
- #include <termios.h>
- #include <string.h>
--#define index strchr
--#define rindex strrchr
- #include <sys/ioctl.h>
- #include <sys/wait.h>
- #include <signal.h>
-@@ -1192,7 +1190,7 @@
- 	childArgv[childArgc++] = buff;
-     } else {
- 	tbuf[0] = '-';
--	xstrncpy(tbuf + 1, ((p = rindex(pwd->pw_shell, '/')) ?
-+	xstrncpy(tbuf + 1, ((p = strrchr(pwd->pw_shell, '/')) ?
- 			   p + 1 : pwd->pw_shell),
- 		sizeof(tbuf)-1);
- 	
-diff -ur util-linux-2.12r/login-utils/passwd.c util-linux-2.12r-patched/login-utils/passwd.c
---- util-linux-2.12r/login-utils/passwd.c	2002-03-08 17:00:11.000000000 -0600
-+++ util-linux-2.12r-patched/login-utils/passwd.c	2006-12-04 23:21:09.650236137 -0600
-@@ -194,7 +194,7 @@
- 	if ( c-gecos && (g = (char *)malloc (c-gecos+1)) ) {
- 	    strncpy (g, gecos, c-gecos);
- 	    g[c-gecos] = 0;
--	    while ( (c=rindex(g, ' ')) ) {
-+	    while ( (c=strrchr(g, ' ')) ) {
- 		if ( !check_passwd_string(passwd, c+1) ) {
- 		    printf(_("Please don't use something like your realname as password!\n"));
- 		    free (g);
-diff -ur util-linux-2.12r/login-utils/vipw.c util-linux-2.12r-patched/login-utils/vipw.c
---- util-linux-2.12r/login-utils/vipw.c	2004-03-04 15:54:44.000000000 -0600
-+++ util-linux-2.12r-patched/login-utils/vipw.c	2006-12-04 23:21:09.650236137 -0600
-@@ -314,7 +314,7 @@
- 	textdomain(PACKAGE);
- 
- 	bzero(tmp_file, FILENAMELEN);
--	progname = (rindex(argv[0], '/')) ? rindex(argv[0], '/') + 1 : argv[0];
-+	progname = (strrchr(argv[0], '/')) ? strrchr(argv[0], '/') + 1 : argv[0];
- 	if (!strcmp(progname, "vigr")) {
- 		program = VIGR;
- 		xstrncpy(orig_file, GROUP_FILE, sizeof(orig_file));
-diff -ur util-linux-2.12r/login-utils/wall.c util-linux-2.12r-patched/login-utils/wall.c
---- util-linux-2.12r/login-utils/wall.c	2002-03-08 17:00:19.000000000 -0600
-+++ util-linux-2.12r-patched/login-utils/wall.c	2006-12-04 23:21:09.650236137 -0600
-@@ -87,7 +87,7 @@
-         textdomain(PACKAGE);
- 
- 	progname = argv[0];
--	p = rindex(progname, '/');
-+	p = strrchr(progname, '/');
- 	if (p)
- 	     progname = p+1;
- 
-diff -ur util-linux-2.12r/misc-utils/logger.c util-linux-2.12r-patched/misc-utils/logger.c
---- util-linux-2.12r/misc-utils/logger.c	2004-09-06 16:13:49.000000000 -0500
-+++ util-linux-2.12r-patched/misc-utils/logger.c	2006-12-04 23:21:09.650236137 -0600
-@@ -198,7 +198,7 @@
- 			} else {
- 				if (p != buf)
- 					*p++ = ' ';
--				bcopy(*argv++, p, len);
-+				memcpy(p, *argv++, len);
- 				*(p += len) = '\0';
- 			}
- 		}
-diff -ur util-linux-2.12r/misc-utils/whereis.c util-linux-2.12r-patched/misc-utils/whereis.c
---- util-linux-2.12r/misc-utils/whereis.c	2001-03-15 04:09:58.000000000 -0600
-+++ util-linux-2.12r-patched/misc-utils/whereis.c	2006-12-04 23:21:09.650236137 -0600
-@@ -323,14 +323,14 @@
- 	char dirbuf[1024];
- 	struct stat statbuf;
- 
--	dd = index(dir, '*');
-+	dd = strchr(dir, '*');
- 	if (!dd)
- 		goto noglob;
- 
- 	l = strlen(dir);
- 	if (l < sizeof(dirbuf)) { 	/* refuse excessively long names */
- 		strcpy (dirbuf, dir);
--		d = index(dirbuf, '*');
-+		d = strchr(dirbuf, '*');
- 		*d = 0;
- 		dirp = opendir(dirbuf);
- 		if (dirp == NULL)
-diff -ur util-linux-2.12r/mount/mntent.c util-linux-2.12r-patched/mount/mntent.c
---- util-linux-2.12r/mount/mntent.c	2004-10-13 15:57:34.000000000 -0500
-+++ util-linux-2.12r-patched/mount/mntent.c	2006-12-04 23:21:09.650236137 -0600
-@@ -158,7 +158,7 @@
- 			return NULL;
- 
- 		mfp->mntent_lineno++;
--		s = index (buf, '\n');
-+		s = strchr (buf, '\n');
- 		if (s == NULL) {
- 			/* Missing final newline?  Otherwise extremely */
- 			/* long line - assume file was corrupted */
-@@ -166,7 +166,7 @@
- 				fprintf(stderr, _("[mntent]: warning: no final "
- 					"newline at the end of %s\n"),
- 					mfp->mntent_file);
--				s = index (buf, 0);
-+				s = strchr (buf, 0);
- 			} else {
- 				mfp->mntent_errs = 1;
- 				goto err;
-diff -ur util-linux-2.12r/mount/mount.c util-linux-2.12r-patched/mount/mount.c
---- util-linux-2.12r/mount/mount.c	2004-12-21 16:00:36.000000000 -0600
-+++ util-linux-2.12r-patched/mount/mount.c	2006-12-04 23:21:09.654236454 -0600
-@@ -488,11 +488,11 @@
- 
-    /* Accept a comma-separated list of types, and try them one by one */
-    /* A list like "nonfs,.." indicates types not to use */
--   if (*types && strncmp(*types, "no", 2) && index(*types,',')) {
-+   if (*types && strncmp(*types, "no", 2) && strchr(*types,',')) {
-       char *t = strdup(*types);
-       char *p;
- 
--      while((p = index(t,',')) != NULL) {
-+      while((p = strchr(t,',')) != NULL) {
- 	 *p = 0;
- 	 args.type = *types = t;
- 	 if(do_mount_syscall (&args) == 0)
-diff -ur util-linux-2.12r/mount/mount_by_label.c util-linux-2.12r-patched/mount/mount_by_label.c
---- util-linux-2.12r/mount/mount_by_label.c	2004-12-21 17:15:33.000000000 -0600
-+++ util-linux-2.12r-patched/mount/mount_by_label.c	2006-12-04 23:21:09.654236454 -0600
-@@ -213,7 +213,7 @@
- 	    fseek(procpt, 0, SEEK_SET);
- 
- 	    while (fgets(line, sizeof(line), procpt)) {
--		if (!index(line, '\n'))
-+		if (!strchr(line, '\n'))
- 			break;
- 
- 		if (sscanf (line, " %d %d %d %[^\n ]",
-diff -ur util-linux-2.12r/mount/sundries.c util-linux-2.12r-patched/mount/sundries.c
---- util-linux-2.12r/mount/sundries.c	2004-12-21 13:12:31.000000000 -0600
-+++ util-linux-2.12r-patched/mount/sundries.c	2006-12-04 23:21:09.654236454 -0600
-@@ -138,7 +138,7 @@
- 	     if (strncmp(p, type, len) == 0 &&
- 		 (p[len] == 0 || p[len] == ','))
- 		     return !no;
--	     p = index(p,',');
-+	     p = strchr(p,',');
- 	     if (!p)
- 		     break;
- 	     p++;
-diff -ur util-linux-2.12r/mount/umount.c util-linux-2.12r-patched/mount/umount.c
---- util-linux-2.12r/mount/umount.c	2005-09-10 13:07:38.000000000 -0500
-+++ util-linux-2.12r-patched/mount/umount.c	2006-12-04 23:21:09.654236454 -0600
-@@ -338,7 +338,7 @@
- 			if (res < 0)
- 				umnt_err2 = errno;
- 			/* Do not complain about remote NFS mount points */
--			if (errno == ENOENT && index(spec, ':'))
-+			if (errno == ENOENT && strchr(spec, ':'))
- 				umnt_err2 = 0;
- 		}
- 	}
-diff -ur util-linux-2.12r/text-utils/colcrt.c util-linux-2.12r-patched/text-utils/colcrt.c
---- util-linux-2.12r/text-utils/colcrt.c	2001-03-15 04:09:59.000000000 -0600
-+++ util-linux-2.12r-patched/text-utils/colcrt.c	2006-12-04 23:23:45.614600041 -0600
-@@ -252,8 +252,8 @@
- 		}
- 		putwchar('\n');
- 	}
--	bcopy(page[ol], page, (267 - ol) * 132 * sizeof(wchar_t));
--	bzero(page[267- ol], ol * 132 * sizeof(wchar_t));
-+	memcpy(page, page[ol], (267 - ol) * 132 * sizeof(wchar_t));
-+	memset(page[267- ol], 0, ol * 132 * sizeof(wchar_t));
- 	outline -= ol;
- 	outcol = 0;
- 	first = 1;
-diff -ur util-linux-2.12r/text-utils/display.c util-linux-2.12r-patched/text-utils/display.c
---- util-linux-2.12r/text-utils/display.c	2002-03-08 17:05:39.000000000 -0600
-+++ util-linux-2.12r-patched/text-utils/display.c	2006-12-04 23:24:32.478315487 -0600
-@@ -163,7 +163,7 @@
- 	pr->cchar[0] = 's';
- 	pr->cchar[1] = 0;
- 	for (p1 = pr->fmt; *p1 != '%'; ++p1);
--	for (p2 = ++p1; *p1 && index(spec, *p1); ++p1);
-+	for (p2 = ++p1; *p1 && strchr(spec, *p1); ++p1);
- 	while ((*p2++ = *p1++) != 0) ;
- }
- 
-diff -ur util-linux-2.12r/text-utils/parse.c util-linux-2.12r-patched/text-utils/parse.c
---- util-linux-2.12r/text-utils/parse.c	2002-03-08 17:07:00.000000000 -0600
-+++ util-linux-2.12r-patched/text-utils/parse.c	2006-12-04 23:24:19.913319294 -0600
-@@ -64,7 +64,7 @@
- 		exit(1);
- 	}
- 	while (fgets(buf, sizeof(buf), fp)) {
--		if ((p = index(buf, '\n')) == NULL) {
-+		if ((p = strchr(buf, '\n')) == NULL) {
- 			(void)fprintf(stderr, _("hexdump: line too long.\n"));
- 			while ((ch = getchar()) != '\n' && ch != EOF);
- 			continue;
-@@ -171,7 +171,7 @@
- 			 * skip any special chars -- save precision in
- 			 * case it's a %s format.
- 			 */
--			while (index(spec + 1, *++fmt));
-+			while (strchr(spec + 1, *++fmt));
- 			if (*fmt == '.' && isdigit((unsigned char)*++fmt)) {
- 				prec = atoi(fmt);
- 				while (isdigit((unsigned char)*++fmt));
-@@ -244,10 +244,10 @@
- 			if (fu->bcnt) {
- 				sokay = USEBCNT;
- 				/* skip to conversion character */
--				for (++p1; index(spec, *p1); ++p1);
-+				for (++p1; strchr(spec, *p1); ++p1);
- 			} else {
- 				/* skip any special chars, field width */
--				while (index(spec + 1, *++p1));
-+				while (strchr(spec + 1, *++p1));
- 				if (*p1 == '.' &&
- 				    isdigit((unsigned char)*++p1)) {
- 					sokay = USEPREC;

Added: trunk/buildroot/package/util-linux/util-linux-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/util-linux/util-linux-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/util-linux/util-linux-susv3-legacy.patch	2009-03-03 08:52:56 UTC (rev 25499)
@@ -0,0 +1,429 @@
+[PATCH] replace susv3 legacy functions with modern equivalents
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ fdisk/cfdisk.c         |    2 +-
+ fdisk/fdiskbsdlabel.c  |   16 ++++++++--------
+ fdisk/sfdisk.c         |   10 +++++-----
+ login-utils/login.c    |    6 +++---
+ login-utils/shutdown.c |    2 +-
+ login-utils/ttymsg.c   |    2 +-
+ login-utils/vipw.c     |    4 ++--
+ login-utils/wall.c     |    2 +-
+ misc-utils/logger.c    |    2 +-
+ misc-utils/namei.c     |    2 +-
+ misc-utils/whereis.c   |    4 ++--
+ mount/mntent.c         |    4 ++--
+ mount/mount.c          |    4 ++--
+ mount/mount_by_label.c |    2 +-
+ mount/sundries.c       |    2 +-
+ mount/umount.c         |    2 +-
+ partx/partx.c          |    2 +-
+ text-utils/colcrt.c    |    4 ++--
+ text-utils/display.c   |    2 +-
+ text-utils/parse.c     |    8 ++++----
+ 20 files changed, 41 insertions(+), 41 deletions(-)
+
+Index: util-linux-2.13-pre7/fdisk/fdiskbsdlabel.c
+===================================================================
+--- util-linux-2.13-pre7.orig/fdisk/fdiskbsdlabel.c
++++ util-linux-2.13-pre7/fdisk/fdiskbsdlabel.c
+@@ -538,10 +538,10 @@
+ 
+   /* We need a backup of the disklabel (xbsd_dlabel might have changed). */
+   d = &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE];
+-  bcopy (d, &dl, sizeof (struct xbsd_disklabel));
++  memmove (&dl, d, sizeof (struct xbsd_disklabel));
+ 
+   /* The disklabel will be overwritten by 0's from bootxx anyway */
+-  bzero (d, sizeof (struct xbsd_disklabel));
++  memset (d, 0, sizeof (struct xbsd_disklabel));
+ 
+   snprintf (path, sizeof(path), "%s/boot%s", bootdir, dkbasename);
+   if (!xbsd_get_bootstrap (path, &disklabelbuffer[xbsd_dlabel.d_secsize],
+@@ -555,7 +555,7 @@
+       exit ( EXIT_FAILURE );
+     }
+ 
+-  bcopy (&dl, d, sizeof (struct xbsd_disklabel));
++  memmove (d, &dl, sizeof (struct xbsd_disklabel));
+ 
+ #if defined (__powerpc__) || defined (__hppa__)
+   sector = 0;
+@@ -657,7 +657,7 @@
+ 	struct geom g;
+ 
+ 	get_geometry (fd, &g);
+-	bzero (d, sizeof (struct xbsd_disklabel));
++	memset (d, 0, sizeof (struct xbsd_disklabel));
+ 
+ 	d -> d_magic = BSD_DISKMAGIC;
+ 
+@@ -740,8 +740,8 @@
+ 	if (BSD_BBSIZE != read (fd, disklabelbuffer, BSD_BBSIZE))
+ 		fatal (unable_to_read);
+ 
+-	bcopy (&disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
+-	       d, sizeof (struct xbsd_disklabel));
++	memmove (d, &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
++	       sizeof (struct xbsd_disklabel));
+ 
+ 	if (d -> d_magic != BSD_DISKMAGIC || d -> d_magic2 != BSD_DISKMAGIC)
+ 		return 0;
+@@ -776,8 +776,8 @@
+   /* This is necessary if we want to write the bootstrap later,
+      otherwise we'd write the old disklabel with the bootstrap.
+   */
+-  bcopy (d, &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
+-	 sizeof (struct xbsd_disklabel));
++  memmove (&disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
++	 d, sizeof (struct xbsd_disklabel));
+ 
+ #if defined (__alpha__) && BSD_LABELSECTOR == 0
+   alpha_bootblock_checksum (disklabelbuffer);
+Index: util-linux-2.13-pre7/login-utils/ttymsg.c
+===================================================================
+--- util-linux-2.13-pre7.orig/login-utils/ttymsg.c
++++ util-linux-2.13-pre7/login-utils/ttymsg.c
+@@ -111,7 +111,7 @@
+ 		if (wret >= 0) {
+ 			left -= wret;
+ 			if (iov != localiov) {
+-				bcopy(iov, localiov,
++				memmove(localiov, iov,
+ 				    iovcnt * sizeof(struct iovec));
+ 				iov = localiov;
+ 			}
+Index: util-linux-2.13-pre7/login-utils/vipw.c
+===================================================================
+--- util-linux-2.13-pre7.orig/login-utils/vipw.c
++++ util-linux-2.13-pre7/login-utils/vipw.c
+@@ -313,8 +313,8 @@
+ 	bindtextdomain(PACKAGE, LOCALEDIR);
+ 	textdomain(PACKAGE);
+ 
+-	bzero(tmp_file, FILENAMELEN);
+-	progname = (rindex(argv[0], '/')) ? rindex(argv[0], '/') + 1 : argv[0];
++	memset(tmp_file, 0, FILENAMELEN);
++	progname = (strrchr(argv[0], '/')) ? strrchr(argv[0], '/') + 1 : argv[0];
+ 	if (!strcmp(progname, "vigr")) {
+ 		program = VIGR;
+ 		xstrncpy(orig_file, GROUP_FILE, sizeof(orig_file));
+Index: util-linux-2.13-pre7/misc-utils/logger.c
+===================================================================
+--- util-linux-2.13-pre7.orig/misc-utils/logger.c
++++ util-linux-2.13-pre7/misc-utils/logger.c
+@@ -198,7 +198,7 @@
+ 			} else {
+ 				if (p != buf)
+ 					*p++ = ' ';
+-				bcopy(*argv++, p, len);
++				memmove(p, *argv++, len);
+ 				*(p += len) = '\0';
+ 			}
+ 		}
+Index: util-linux-2.13-pre7/misc-utils/namei.c
+===================================================================
+--- util-linux-2.13-pre7.orig/misc-utils/namei.c
++++ util-linux-2.13-pre7/misc-utils/namei.c
+@@ -242,7 +242,7 @@
+ 		 * call namei()
+ 		 */
+ 		
+-		bzero(sym, BUFSIZ);
++		memset(sym, 0, BUFSIZ);
+ 		if(readlink(buf, sym, BUFSIZ) == -1){
+ 		    (void)printf(_(" ? problems reading symlink %s - %s (%d)\n"), buf, ERR);
+ 		    return;
+Index: util-linux-2.13-pre7/text-utils/colcrt.c
+===================================================================
+--- util-linux-2.13-pre7.orig/text-utils/colcrt.c
++++ util-linux-2.13-pre7/text-utils/colcrt.c
+@@ -252,8 +252,8 @@
+ 		}
+ 		putwchar('\n');
+ 	}
+-	bcopy(page[ol], page, (267 - ol) * 132 * sizeof(wchar_t));
+-	bzero(page[267- ol], ol * 132 * sizeof(wchar_t));
++	memmove(page, page[ol], (267 - ol) * 132 * sizeof(wchar_t));
++	memset(page[267- ol], 0, ol * 132 * sizeof(wchar_t));
+ 	outline -= ol;
+ 	outcol = 0;
+ 	first = 1;
+Index: util-linux-2.13-pre7/fdisk/sfdisk.c
+===================================================================
+--- util-linux-2.13-pre7.orig/fdisk/sfdisk.c
++++ util-linux-2.13-pre7/fdisk/sfdisk.c
+@@ -40,7 +40,7 @@
+ #include <unistd.h>		/* read, write */
+ #include <fcntl.h>		/* O_RDWR */
+ #include <errno.h>		/* ERANGE */
+-#include <string.h>		/* index() */
++#include <string.h>		/* strchr() */
+ #include <ctype.h>
+ #include <getopt.h>
+ #include <sys/ioctl.h>
+@@ -1709,12 +1709,12 @@
+ 	eof = 1;
+ 	return RD_EOF;
+     }
+-    if (!(lp = index(lp, '\n')))
++    if (!(lp = strchr(lp, '\n')))
+       fatal(_("long or incomplete input line - quitting\n"));
+     *lp = 0;
+ 
+     /* remove comments, if any */
+-    if ((lp = index(line+2, '#')) != 0)
++    if ((lp = strchr(line+2, '#')) != 0)
+       *lp = 0;
+ 
+     /* recognize a few commands - to be expanded */
+@@ -1724,7 +1724,7 @@
+     }
+ 
+     /* dump style? - then bad input is fatal */
+-    if ((ip = index(line+2, ':')) != 0) {
++    if ((ip = strchr(line+2, ':')) != 0) {
+ 	struct dumpfld *d;
+ 
+       nxtfld:
+@@ -2491,7 +2491,7 @@
+ 
+     if (argc < 1)
+       fatal(_("no command?\n"));
+-    if ((progn = rindex(argv[0], '/')) == NULL)
++    if ((progn = strrchr(argv[0], '/')) == NULL)
+       progn = argv[0];
+     else
+       progn++;
+Index: util-linux-2.13-pre7/login-utils/login.c
+===================================================================
+--- util-linux-2.13-pre7.orig/login-utils/login.c
++++ util-linux-2.13-pre7/login-utils/login.c
+@@ -337,7 +337,7 @@
+      */
+     gethostname(tbuf, sizeof(tbuf));
+     xstrncpy(thishost, tbuf, sizeof(thishost));
+-    domain = index(tbuf, '.');
++    domain = strchr(tbuf, '.');
+     
+     username = tty_name = hostname = NULL;
+     fflag = hflag = pflag = 0;
+@@ -356,7 +356,7 @@
+ 	      exit(1);
+ 	  }
+ 	  hflag = 1;
+-	  if (domain && (p = index(optarg, '.')) &&
++	  if (domain && (p = strchr(optarg, '.')) &&
+ 	      strcasecmp(p, domain) == 0)
+ 	    *p = 0;
+ 
+@@ -1101,7 +1101,7 @@
+ 	childArgv[childArgc++] = buff;
+     } else {
+ 	tbuf[0] = '-';
+-	xstrncpy(tbuf + 1, ((p = rindex(pwd->pw_shell, '/')) ?
++	xstrncpy(tbuf + 1, ((p = strrchr(pwd->pw_shell, '/')) ?
+ 			   p + 1 : pwd->pw_shell),
+ 		sizeof(tbuf)-1);
+ 	
+Index: util-linux-2.13-pre7/login-utils/shutdown.c
+===================================================================
+--- util-linux-2.13-pre7.orig/login-utils/shutdown.c
++++ util-linux-2.13-pre7/login-utils/shutdown.c
+@@ -279,7 +279,7 @@
+ 			if (fgets (line, sizeof(line), fp) != NULL &&
+ 			    strncasecmp (line, "HALT_ACTION", 11) == 0 &&
+ 			    iswhitespace(line[11])) {
+-				p = index(line, '\n');
++				p = strchr(line, '\n');
+ 				if (p)
+ 					*p = 0;		/* strip final '\n' */
+ 				p = line+11;
+Index: util-linux-2.13-pre7/misc-utils/whereis.c
+===================================================================
+--- util-linux-2.13-pre7.orig/misc-utils/whereis.c
++++ util-linux-2.13-pre7/misc-utils/whereis.c
+@@ -323,14 +323,14 @@
+ 	char dirbuf[1024];
+ 	struct stat statbuf;
+ 
+-	dd = index(dir, '*');
++	dd = strchr(dir, '*');
+ 	if (!dd)
+ 		goto noglob;
+ 
+ 	l = strlen(dir);
+ 	if (l < sizeof(dirbuf)) { 	/* refuse excessively long names */
+ 		strcpy (dirbuf, dir);
+-		d = index(dirbuf, '*');
++		d = strchr(dirbuf, '*');
+ 		*d = 0;
+ 		dirp = opendir(dirbuf);
+ 		if (dirp == NULL)
+Index: util-linux-2.13-pre7/mount/mntent.c
+===================================================================
+--- util-linux-2.13-pre7.orig/mount/mntent.c
++++ util-linux-2.13-pre7/mount/mntent.c
+@@ -158,7 +158,7 @@
+ 			return NULL;
+ 
+ 		mfp->mntent_lineno++;
+-		s = index (buf, '\n');
++		s = strchr (buf, '\n');
+ 		if (s == NULL) {
+ 			/* Missing final newline?  Otherwise extremely */
+ 			/* long line - assume file was corrupted */
+@@ -166,7 +166,7 @@
+ 				fprintf(stderr, _("[mntent]: warning: no final "
+ 					"newline at the end of %s\n"),
+ 					mfp->mntent_file);
+-				s = index (buf, 0);
++				s = strchr (buf, 0);
+ 			} else {
+ 				mfp->mntent_errs = 1;
+ 				goto err;
+Index: util-linux-2.13-pre7/mount/mount.c
+===================================================================
+--- util-linux-2.13-pre7.orig/mount/mount.c
++++ util-linux-2.13-pre7/mount/mount.c
+@@ -488,11 +488,11 @@
+ 
+    /* Accept a comma-separated list of types, and try them one by one */
+    /* A list like "nonfs,.." indicates types not to use */
+-   if (*types && strncmp(*types, "no", 2) && index(*types,',')) {
++   if (*types && strncmp(*types, "no", 2) && strchr(*types,',')) {
+       char *t = strdup(*types);
+       char *p;
+ 
+-      while((p = index(t,',')) != NULL) {
++      while((p = strchr(t,',')) != NULL) {
+ 	 *p = 0;
+ 	 args.type = *types = t;
+ 	 if(do_mount_syscall (&args) == 0)
+Index: util-linux-2.13-pre7/mount/mount_by_label.c
+===================================================================
+--- util-linux-2.13-pre7.orig/mount/mount_by_label.c
++++ util-linux-2.13-pre7/mount/mount_by_label.c
+@@ -213,7 +213,7 @@
+ 	    fseek(procpt, 0, SEEK_SET);
+ 
+ 	    while (fgets(line, sizeof(line), procpt)) {
+-		if (!index(line, '\n'))
++		if (!strchr(line, '\n'))
+ 			break;
+ 
+ 		if (sscanf (line, " %d %d %d %[^\n ]",
+Index: util-linux-2.13-pre7/mount/sundries.c
+===================================================================
+--- util-linux-2.13-pre7.orig/mount/sundries.c
++++ util-linux-2.13-pre7/mount/sundries.c
+@@ -138,7 +138,7 @@
+ 	     if (strncmp(p, type, len) == 0 &&
+ 		 (p[len] == 0 || p[len] == ','))
+ 		     return !no;
+-	     p = index(p,',');
++	     p = strchr(p,',');
+ 	     if (!p)
+ 		     break;
+ 	     p++;
+Index: util-linux-2.13-pre7/mount/umount.c
+===================================================================
+--- util-linux-2.13-pre7.orig/mount/umount.c
++++ util-linux-2.13-pre7/mount/umount.c
+@@ -332,7 +332,7 @@
+ 			if (res < 0)
+ 				umnt_err2 = errno;
+ 			/* Do not complain about remote NFS mount points */
+-			if (errno == ENOENT && index(spec, ':'))
++			if (errno == ENOENT && strchr(spec, ':'))
+ 				umnt_err2 = 0;
+ 		}
+ 	}
+Index: util-linux-2.13-pre7/partx/partx.c
+===================================================================
+--- util-linux-2.13-pre7.orig/partx/partx.c
++++ util-linux-2.13-pre7/partx/partx.c
+@@ -130,7 +130,7 @@
+ 	case 'n':
+ 		p = optarg;
+ 		lower = atoi(p);
+-		p = index(p, '-');
++		p = strchr(p, '-');
+ 		if (p)
+ 			upper = atoi(p+1);
+ 		else
+Index: util-linux-2.13-pre7/text-utils/display.c
+===================================================================
+--- util-linux-2.13-pre7.orig/text-utils/display.c
++++ util-linux-2.13-pre7/text-utils/display.c
+@@ -163,7 +163,7 @@
+ 	pr->cchar[0] = 's';
+ 	pr->cchar[1] = 0;
+ 	for (p1 = pr->fmt; *p1 != '%'; ++p1);
+-	for (p2 = ++p1; *p1 && index(spec, *p1); ++p1);
++	for (p2 = ++p1; *p1 && strchr(spec, *p1); ++p1);
+ 	while ((*p2++ = *p1++) != 0) ;
+ }
+ 
+Index: util-linux-2.13-pre7/text-utils/parse.c
+===================================================================
+--- util-linux-2.13-pre7.orig/text-utils/parse.c
++++ util-linux-2.13-pre7/text-utils/parse.c
+@@ -64,7 +64,7 @@
+ 		exit(1);
+ 	}
+ 	while (fgets(buf, sizeof(buf), fp)) {
+-		if ((p = index(buf, '\n')) == NULL) {
++		if ((p = strchr(buf, '\n')) == NULL) {
+ 			(void)fprintf(stderr, _("hexdump: line too long.\n"));
+ 			while ((ch = getchar()) != '\n' && ch != EOF);
+ 			continue;
+@@ -171,7 +171,7 @@
+ 			 * skip any special chars -- save precision in
+ 			 * case it's a %s format.
+ 			 */
+-			while (index(spec + 1, *++fmt));
++			while (strchr(spec + 1, *++fmt));
+ 			if (*fmt == '.' && isdigit((unsigned char)*++fmt)) {
+ 				prec = atoi(fmt);
+ 				while (isdigit((unsigned char)*++fmt));
+@@ -244,10 +244,10 @@
+ 			if (fu->bcnt) {
+ 				sokay = USEBCNT;
+ 				/* skip to conversion character */
+-				for (++p1; index(spec, *p1); ++p1);
++				for (++p1; strchr(spec, *p1); ++p1);
+ 			} else {
+ 				/* skip any special chars, field width */
+-				while (index(spec + 1, *++p1));
++				while (strchr(spec + 1, *++p1));
+ 				if (*p1 == '.' &&
+ 				    isdigit((unsigned char)*++p1)) {
+ 					sokay = USEPREC;
+Index: util-linux-2.13-pre7/fdisk/cfdisk.c
+===================================================================
+--- util-linux-2.13-pre7.orig/fdisk/cfdisk.c
++++ util-linux-2.13-pre7/fdisk/cfdisk.c
+@@ -348,7 +348,7 @@
+ /* Some libc's have their own basename() */
+ static char *
+ my_basename(char *devname) {
+-    char *s = rindex(devname, '/');
++    char *s = strrchr(devname, '/');
+     return s ? s+1 : devname;
+ }
+ 
+Index: util-linux-2.13-pre7/login-utils/wall.c
+===================================================================
+--- util-linux-2.13-pre7.orig/login-utils/wall.c
++++ util-linux-2.13-pre7/login-utils/wall.c
+@@ -87,7 +87,7 @@
+         textdomain(PACKAGE);
+ 
+ 	progname = argv[0];
+-	p = rindex(progname, '/');
++	p = strrchr(progname, '/');
+ 	if (p)
+ 	     progname = p+1;
+ 

Added: trunk/buildroot/package/util-linux/util-linux-umount2-fix.patch
===================================================================
--- trunk/buildroot/package/util-linux/util-linux-umount2-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/util-linux/util-linux-umount2-fix.patch	2009-03-03 08:52:56 UTC (rev 25499)
@@ -0,0 +1,20 @@
+[PATCH] fix multiple definitions of umount2 issue
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ mount/umount.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: util-linux-2.13-pre7/mount/umount.c
+===================================================================
+--- util-linux-2.13-pre7.orig/mount/umount.c
++++ util-linux-2.13-pre7/mount/umount.c
+@@ -29,7 +29,7 @@
+ #include "nfsmount.h"
+ #include <arpa/inet.h>
+ 
+-#if defined(MNT_FORCE) && !defined(__sparc__) && !defined(__arm__)
++#if 1
+ /* Interesting ... it seems libc knows about MNT_FORCE and presumably
+    about umount2 as well -- need not do anything */
+ #else /* MNT_FORCE */

Modified: trunk/buildroot/package/util-linux/util-linux.mk
===================================================================
--- trunk/buildroot/package/util-linux/util-linux.mk	2009-03-02 22:20:14 UTC (rev 25498)
+++ trunk/buildroot/package/util-linux/util-linux.mk	2009-03-03 08:52:56 UTC (rev 25499)
@@ -3,7 +3,7 @@
 # util-linux
 #
 #############################################################
-UTIL-LINUX_VERSION:=2.12r
+UTIL-LINUX_VERSION:=2.13-pre7
 UTIL-LINUX_SOURCE:=util-linux-$(UTIL-LINUX_VERSION).tar.bz2
 UTIL-LINUX_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux
 UTIL-LINUX_DIR:=$(BUILD_DIR)/util-linux-$(UTIL-LINUX_VERSION)
@@ -11,15 +11,19 @@
 UTIL-LINUX_BINARY:=$(UTIL-LINUX_DIR)/misc-utils/chkdupexe
 UTIL-LINUX_TARGET_BINARY:=$(TARGET_DIR)/usr/bin/chkdupexe
 
+# schedutils isn't support for all archs
+ifneq ($(BR2_i386)$(BR2_powerpc)$(BR2_x86_64)$(BR2_ia64)$(BR2_alpha),)
+UTIL-LINUX_SCHED_UTILS:=--enable-schedutils
+else
+UTIL-LINUX_SCHED_UTILS:=--disable-schedutils
+endif
+
 $(DL_DIR)/$(UTIL-LINUX_SOURCE):
 	$(call DOWNLOAD,$(UTIL-LINUX_SITE),$(UTIL-LINUX_SOURCE))
 
 $(UTIL-LINUX_DIR)/.unpacked: $(DL_DIR)/$(UTIL-LINUX_SOURCE)
 	$(UTIL-LINUX_CAT) $(DL_DIR)/$(UTIL-LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(UTIL-LINUX_DIR) package/util-linux/ util-linux\*.patch
-ifneq ($(BR2_LARGEFILE),y)
-	$(SED) "/D_FILE_OFFSET_BITS/ d" $(UTIL-LINUX_DIR)/MCONFIG
-endif
 	touch $(UTIL-LINUX_DIR)/.unpacked
 
 $(UTIL-LINUX_DIR)/.configured: $(UTIL-LINUX_DIR)/.unpacked
@@ -28,24 +32,21 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--disable-use-tty-group \
+		--prefix=/ \
+		--exec-prefix=/ \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
+		$(UTIL-LINUX_SCHED_UTILS) \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 		ARCH=$(ARCH) \
 	)
-	$(SED) "s,^INSTALLSUID=.*,INSTALLSUID=\\$$\(INSTALL\) -m \\$$\(BINMODE\)," \
-		$(UTIL-LINUX_DIR)/MCONFIG
-	$(SED) "s,^USE_TTY_GROUP=.*,USE_TTY_GROUP=no," $(UTIL-LINUX_DIR)/MCONFIG
 	touch $(UTIL-LINUX_DIR)/.configured
 
 $(UTIL-LINUX_BINARY): $(UTIL-LINUX_DIR)/.configured
