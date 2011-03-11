From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 11 Mar 2011 16:13:32 +0800
Subject: [Buildroot] [PATCH 6/9] util-linux : convert to autotarget and bump
	to 2.19
In-Reply-To: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
Message-ID: <1299831215-26466-6-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/util-linux/Config.in                       |  113 +++++-
 ...linux-2.13-pre17-hardcode-a-out-constants.patch |   41 --
 .../util-linux-2.19-context_umount.patch           |   52 +++
 package/util-linux/util-linux-no-nls-fix.patch     |   25 --
 package/util-linux/util-linux-susv3-legacy.patch   |  429 --------------------
 package/util-linux/util-linux-umount2-fix.patch    |   20 -
 package/util-linux/util-linux.mk                   |  185 +++++----
 7 files changed, 268 insertions(+), 597 deletions(-)
 delete mode 100644 package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch
 create mode 100644 package/util-linux/util-linux-2.19-context_umount.patch
 delete mode 100644 package/util-linux/util-linux-no-nls-fix.patch
 delete mode 100644 package/util-linux/util-linux-susv3-legacy.patch
 delete mode 100644 package/util-linux/util-linux-umount2-fix.patch

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 434dae9..8cd9821 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_UTIL-LINUX
+config BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -12,3 +12,114 @@ config BR2_PACKAGE_UTIL-LINUX
 
 comment "util-linux requires a toolchain with RPC support"
 	depends on !BR2_INET_RPC
+
+menu "util-linux tool support"
+	depends on BR2_PACKAGE_UTIL_LINUX
+
+############################################
+# default enabled and should be disabled by
+#  --disable-foo
+#
+
+config BR2_PACKAGE_UTIL_LINUX_MOUNT
+	bool "build mount utilties"
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_FSCK
+	bool "build \"fsck\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	bool "build libuuid and uuid utilities"
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_UUIDD
+	bool "build \"uuidd\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	bool "build libblkid and blkid utilities"
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_AGETTY
+	bool "build \"agetty\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_CRAMFS
+	bool "build \"fsck.cramfs, mkfs.cramfs\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
+	bool "build \"switch_root\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+	bool "build \"pivot_root\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
+	bool "build \"fallocate\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_UNSHARE
+	bool "build \"unshare\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_RENAME
+	bool "build \"rename\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
+	bool "build \"chrt, ionice, teskset\""
+	default y
+
+config BR2_PACKAGE_UTIL_LINUX_WALL
+	bool "build \"wall\""
+	default y
+
+
+############################################
+# default disabled and should be enabled by
+#  --enable-foo
+#
+config BR2_PACKAGE_UTIL_LINUX_ARCH
+	bool "build \"arch\""
+	default n
+
+config BR2_PACKAGE_UTIL_LINUX_INIT
+	bool "build \"simpleinit, shutdown, initctl\""
+	default n
+
+config BR2_PACKAGE_UTIL_LINUX_KILL
+	bool "build \"kill\""
+	default n
+
+config BR2_PACKAGE_UTIL_LINUX_LAST
+	bool "build \"last\""
+	default n
+
+config BR2_PACKAGE_UTIL_LINUX_MESG
+	bool "build \"kill\""
+	default n
+
+config BR2_PACKAGE_UTIL_LINUX_PARTX
+	bool "build \"addpart, delpart, partx\""
+	default n
+
+config BR2_PACKAGE_UTIL_LINUX_RAW
+	bool "build \"raw\""
+	default n
+
+config BR2_PACKAGE_UTIL_LINUX_RESET
+	bool "build \"reset\""
+	default n
+
+config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
+	bool "build \"chfn, chsh, login, newgrp, vipw\""
+	default n
+
+config BR2_PACKAGE_UTIL_LINUX_WRITE
+	bool "build \"addpart, delpart, partx\""
+	default n
+
+endmenu
diff --git a/package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch b/package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch
deleted file mode 100644
index b115c41..0000000
--- a/package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Hardcode a.out related constants
-
-The OMAGIC, NMAGIC and ZMAGIC constants, related to the legacy a.out
-binary format, are no longer available in the headers of all
-architectures, due to this binary format being deprecated. For that
-reason, util-linux fails to build.
-
-We therefore take the approach used in newer versions of
-util-linux-ng: hardcoding those values. See
-http://git.kernel.org/?p=utils/util-linux-ng/util-linux-ng.git;a=commitdiff;h=e9eb4dad0ece03914f67f6d1ded74cfbbe694ba4
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- text-utils/more.c |    7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-Index: util-linux-2.13-pre7/text-utils/more.c
-===================================================================
---- util-linux-2.13-pre7.orig/text-utils/more.c
-+++ util-linux-2.13-pre7/text-utils/more.c
-@@ -53,7 +53,6 @@
- #include <sys/stat.h>
- #include <sys/file.h>
- #include <sys/wait.h>
--#include <a.out.h>
- #include <locale.h>
- #include "xstrncpy.h"
- #include "nls.h"
-@@ -504,9 +503,9 @@
- 
- 	if (fread(twobytes, 2, 1, f) == 1) {
- 		switch(twobytes[0] + (twobytes[1]<<8)) {
--		case OMAGIC:	/* 0407 */
--		case NMAGIC:	/* 0410 */
--		case ZMAGIC:	/* 0413 */
-+		case 0407:	/* a.out obj */
-+		case 0410:	/* a.out exec */
-+		case 0413:	/* a.out demand exec */
- 		case 0405:
- 		case 0411:
- 		case 0177545:
diff --git a/package/util-linux/util-linux-2.19-context_umount.patch b/package/util-linux/util-linux-2.19-context_umount.patch
new file mode 100644
index 0000000..9b0fed7
--- /dev/null
+++ b/package/util-linux/util-linux-2.19-context_umount.patch
@@ -0,0 +1,52 @@
+From db9bd703a9a696bd73cb7d41e98c66854a604477 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Fri, 11 Feb 2011 10:45:09 +0100
+Subject: [PATCH] libmount: add fallbacks for old systems without umount2() syscall
+
+Reported-by: Peter Breitenlohner <peb@mppmu.mpg.de>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ shlibs/mount/src/context_umount.c |   28 ++++++++++++++++++++++++++++
+ 1 files changed, 28 insertions(+), 0 deletions(-)
+
+diff --git a/shlibs/mount/src/context_umount.c b/shlibs/mount/src/context_umount.c
+index bd9be69..1187a87 100644
+--- a/shlibs/mount/src/context_umount.c
++++ b/shlibs/mount/src/context_umount.c
+@@ -21,6 +21,34 @@
+ #include "strutils.h"
+ #include "mountP.h"
+
++#if defined(MNT_FORCE)
++/* Interesting ... it seems libc knows about MNT_FORCE and presumably
++   about umount2 as well -- need not do anything */
++#else /* MNT_FORCE */
++/* Does the present kernel source know about umount2? */
++# include <linux/unistd.h>
++# ifdef __NR_umount2
++static int umount2(const char *path, int flags);
++_syscall2(int, umount2, const char *, path, int, flags);
++# else /* __NR_umount2 */
++static int
++umount2(const char *path, int flags) {
++	fprintf(stderr, _("umount: compiled without support for -f\n"));
++	errno = ENOSYS;
++	return -1;
++}
++#endif /* __NR_umount2 */
++# if !defined(MNT_FORCE)
++# define MNT_FORCE 1
++#endif
++
++#endif /* MNT_FORCE */
++
++#if !defined(MNT_DETACH)
++#define MNT_DETACH 2
++#endif
++
++
+ static int lookup_umount_fs(struct libmnt_context *cxt)
+ {
+	int rc;
+--
+1.7.4.1
diff --git a/package/util-linux/util-linux-no-nls-fix.patch b/package/util-linux/util-linux-no-nls-fix.patch
deleted file mode 100644
index c02009f..0000000
--- a/package/util-linux/util-linux-no-nls-fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-[PATCH]: fix util-linux build without NLS support
-
-util-linux partly supports builds without NLS support, but it forgets to
-provide a dummy setlocale() macro.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- include/nls.h |    4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: util-linux-2.13-pre7/include/nls.h
-===================================================================
---- util-linux-2.13-pre7.orig/include/nls.h
-+++ util-linux-2.13-pre7/include/nls.h
-@@ -19,6 +19,10 @@
- # define textdomain(Domain) /* empty */
- # define _(Text) (Text)
- # define N_(Text) (Text)
-+# undef LC_ALL
-+# define LC_ALL 0
-+# undef setlocale
-+# define setlocale(category, locale)
- #endif
- 
- 
diff --git a/package/util-linux/util-linux-susv3-legacy.patch b/package/util-linux/util-linux-susv3-legacy.patch
deleted file mode 100644
index 2239119..0000000
--- a/package/util-linux/util-linux-susv3-legacy.patch
+++ /dev/null
@@ -1,429 +0,0 @@
-[PATCH] replace susv3 legacy functions with modern equivalents
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- fdisk/cfdisk.c         |    2 +-
- fdisk/fdiskbsdlabel.c  |   16 ++++++++--------
- fdisk/sfdisk.c         |   10 +++++-----
- login-utils/login.c    |    6 +++---
- login-utils/shutdown.c |    2 +-
- login-utils/ttymsg.c   |    2 +-
- login-utils/vipw.c     |    4 ++--
- login-utils/wall.c     |    2 +-
- misc-utils/logger.c    |    2 +-
- misc-utils/namei.c     |    2 +-
- misc-utils/whereis.c   |    4 ++--
- mount/mntent.c         |    4 ++--
- mount/mount.c          |    4 ++--
- mount/mount_by_label.c |    2 +-
- mount/sundries.c       |    2 +-
- mount/umount.c         |    2 +-
- partx/partx.c          |    2 +-
- text-utils/colcrt.c    |    4 ++--
- text-utils/display.c   |    2 +-
- text-utils/parse.c     |    8 ++++----
- 20 files changed, 41 insertions(+), 41 deletions(-)
-
-Index: util-linux-2.13-pre7/fdisk/fdiskbsdlabel.c
-===================================================================
---- util-linux-2.13-pre7.orig/fdisk/fdiskbsdlabel.c
-+++ util-linux-2.13-pre7/fdisk/fdiskbsdlabel.c
-@@ -538,10 +538,10 @@
- 
-   /* We need a backup of the disklabel (xbsd_dlabel might have changed). */
-   d = &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE];
--  bcopy (d, &dl, sizeof (struct xbsd_disklabel));
-+  memmove (&dl, d, sizeof (struct xbsd_disklabel));
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
-+  memmove (d, &dl, sizeof (struct xbsd_disklabel));
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
-+	memmove (d, &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
-+	       sizeof (struct xbsd_disklabel));
- 
- 	if (d -> d_magic != BSD_DISKMAGIC || d -> d_magic2 != BSD_DISKMAGIC)
- 		return 0;
-@@ -776,8 +776,8 @@
-   /* This is necessary if we want to write the bootstrap later,
-      otherwise we'd write the old disklabel with the bootstrap.
-   */
--  bcopy (d, &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
--	 sizeof (struct xbsd_disklabel));
-+  memmove (&disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
-+	 d, sizeof (struct xbsd_disklabel));
- 
- #if defined (__alpha__) && BSD_LABELSECTOR == 0
-   alpha_bootblock_checksum (disklabelbuffer);
-Index: util-linux-2.13-pre7/login-utils/ttymsg.c
-===================================================================
---- util-linux-2.13-pre7.orig/login-utils/ttymsg.c
-+++ util-linux-2.13-pre7/login-utils/ttymsg.c
-@@ -111,7 +111,7 @@
- 		if (wret >= 0) {
- 			left -= wret;
- 			if (iov != localiov) {
--				bcopy(iov, localiov,
-+				memmove(localiov, iov,
- 				    iovcnt * sizeof(struct iovec));
- 				iov = localiov;
- 			}
-Index: util-linux-2.13-pre7/login-utils/vipw.c
-===================================================================
---- util-linux-2.13-pre7.orig/login-utils/vipw.c
-+++ util-linux-2.13-pre7/login-utils/vipw.c
-@@ -313,8 +313,8 @@
- 	bindtextdomain(PACKAGE, LOCALEDIR);
- 	textdomain(PACKAGE);
- 
--	bzero(tmp_file, FILENAMELEN);
--	progname = (rindex(argv[0], '/')) ? rindex(argv[0], '/') + 1 : argv[0];
-+	memset(tmp_file, 0, FILENAMELEN);
-+	progname = (strrchr(argv[0], '/')) ? strrchr(argv[0], '/') + 1 : argv[0];
- 	if (!strcmp(progname, "vigr")) {
- 		program = VIGR;
- 		xstrncpy(orig_file, GROUP_FILE, sizeof(orig_file));
-Index: util-linux-2.13-pre7/misc-utils/logger.c
-===================================================================
---- util-linux-2.13-pre7.orig/misc-utils/logger.c
-+++ util-linux-2.13-pre7/misc-utils/logger.c
-@@ -198,7 +198,7 @@
- 			} else {
- 				if (p != buf)
- 					*p++ = ' ';
--				bcopy(*argv++, p, len);
-+				memmove(p, *argv++, len);
- 				*(p += len) = '\0';
- 			}
- 		}
-Index: util-linux-2.13-pre7/misc-utils/namei.c
-===================================================================
---- util-linux-2.13-pre7.orig/misc-utils/namei.c
-+++ util-linux-2.13-pre7/misc-utils/namei.c
-@@ -242,7 +242,7 @@
- 		 * call namei()
- 		 */
- 		
--		bzero(sym, BUFSIZ);
-+		memset(sym, 0, BUFSIZ);
- 		if(readlink(buf, sym, BUFSIZ) == -1){
- 		    (void)printf(_(" ? problems reading symlink %s - %s (%d)\n"), buf, ERR);
- 		    return;
-Index: util-linux-2.13-pre7/text-utils/colcrt.c
-===================================================================
---- util-linux-2.13-pre7.orig/text-utils/colcrt.c
-+++ util-linux-2.13-pre7/text-utils/colcrt.c
-@@ -252,8 +252,8 @@
- 		}
- 		putwchar('\n');
- 	}
--	bcopy(page[ol], page, (267 - ol) * 132 * sizeof(wchar_t));
--	bzero(page[267- ol], ol * 132 * sizeof(wchar_t));
-+	memmove(page, page[ol], (267 - ol) * 132 * sizeof(wchar_t));
-+	memset(page[267- ol], 0, ol * 132 * sizeof(wchar_t));
- 	outline -= ol;
- 	outcol = 0;
- 	first = 1;
-Index: util-linux-2.13-pre7/fdisk/sfdisk.c
-===================================================================
---- util-linux-2.13-pre7.orig/fdisk/sfdisk.c
-+++ util-linux-2.13-pre7/fdisk/sfdisk.c
-@@ -40,7 +40,7 @@
- #include <unistd.h>		/* read, write */
- #include <fcntl.h>		/* O_RDWR */
- #include <errno.h>		/* ERANGE */
--#include <string.h>		/* index() */
-+#include <string.h>		/* strchr() */
- #include <ctype.h>
- #include <getopt.h>
- #include <sys/ioctl.h>
-@@ -1709,12 +1709,12 @@
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
-@@ -1724,7 +1724,7 @@
-     }
- 
-     /* dump style? - then bad input is fatal */
--    if ((ip = index(line+2, ':')) != 0) {
-+    if ((ip = strchr(line+2, ':')) != 0) {
- 	struct dumpfld *d;
- 
-       nxtfld:
-@@ -2491,7 +2491,7 @@
- 
-     if (argc < 1)
-       fatal(_("no command?\n"));
--    if ((progn = rindex(argv[0], '/')) == NULL)
-+    if ((progn = strrchr(argv[0], '/')) == NULL)
-       progn = argv[0];
-     else
-       progn++;
-Index: util-linux-2.13-pre7/login-utils/login.c
-===================================================================
---- util-linux-2.13-pre7.orig/login-utils/login.c
-+++ util-linux-2.13-pre7/login-utils/login.c
-@@ -337,7 +337,7 @@
-      */
-     gethostname(tbuf, sizeof(tbuf));
-     xstrncpy(thishost, tbuf, sizeof(thishost));
--    domain = index(tbuf, '.');
-+    domain = strchr(tbuf, '.');
-     
-     username = tty_name = hostname = NULL;
-     fflag = hflag = pflag = 0;
-@@ -356,7 +356,7 @@
- 	      exit(1);
- 	  }
- 	  hflag = 1;
--	  if (domain && (p = index(optarg, '.')) &&
-+	  if (domain && (p = strchr(optarg, '.')) &&
- 	      strcasecmp(p, domain) == 0)
- 	    *p = 0;
- 
-@@ -1101,7 +1101,7 @@
- 	childArgv[childArgc++] = buff;
-     } else {
- 	tbuf[0] = '-';
--	xstrncpy(tbuf + 1, ((p = rindex(pwd->pw_shell, '/')) ?
-+	xstrncpy(tbuf + 1, ((p = strrchr(pwd->pw_shell, '/')) ?
- 			   p + 1 : pwd->pw_shell),
- 		sizeof(tbuf)-1);
- 	
-Index: util-linux-2.13-pre7/login-utils/shutdown.c
-===================================================================
---- util-linux-2.13-pre7.orig/login-utils/shutdown.c
-+++ util-linux-2.13-pre7/login-utils/shutdown.c
-@@ -279,7 +279,7 @@
- 			if (fgets (line, sizeof(line), fp) != NULL &&
- 			    strncasecmp (line, "HALT_ACTION", 11) == 0 &&
- 			    iswhitespace(line[11])) {
--				p = index(line, '\n');
-+				p = strchr(line, '\n');
- 				if (p)
- 					*p = 0;		/* strip final '\n' */
- 				p = line+11;
-Index: util-linux-2.13-pre7/misc-utils/whereis.c
-===================================================================
---- util-linux-2.13-pre7.orig/misc-utils/whereis.c
-+++ util-linux-2.13-pre7/misc-utils/whereis.c
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
-Index: util-linux-2.13-pre7/mount/mntent.c
-===================================================================
---- util-linux-2.13-pre7.orig/mount/mntent.c
-+++ util-linux-2.13-pre7/mount/mntent.c
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
-Index: util-linux-2.13-pre7/mount/mount.c
-===================================================================
---- util-linux-2.13-pre7.orig/mount/mount.c
-+++ util-linux-2.13-pre7/mount/mount.c
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
-Index: util-linux-2.13-pre7/mount/mount_by_label.c
-===================================================================
---- util-linux-2.13-pre7.orig/mount/mount_by_label.c
-+++ util-linux-2.13-pre7/mount/mount_by_label.c
-@@ -213,7 +213,7 @@
- 	    fseek(procpt, 0, SEEK_SET);
- 
- 	    while (fgets(line, sizeof(line), procpt)) {
--		if (!index(line, '\n'))
-+		if (!strchr(line, '\n'))
- 			break;
- 
- 		if (sscanf (line, " %d %d %d %[^\n ]",
-Index: util-linux-2.13-pre7/mount/sundries.c
-===================================================================
---- util-linux-2.13-pre7.orig/mount/sundries.c
-+++ util-linux-2.13-pre7/mount/sundries.c
-@@ -138,7 +138,7 @@
- 	     if (strncmp(p, type, len) == 0 &&
- 		 (p[len] == 0 || p[len] == ','))
- 		     return !no;
--	     p = index(p,',');
-+	     p = strchr(p,',');
- 	     if (!p)
- 		     break;
- 	     p++;
-Index: util-linux-2.13-pre7/mount/umount.c
-===================================================================
---- util-linux-2.13-pre7.orig/mount/umount.c
-+++ util-linux-2.13-pre7/mount/umount.c
-@@ -332,7 +332,7 @@
- 			if (res < 0)
- 				umnt_err2 = errno;
- 			/* Do not complain about remote NFS mount points */
--			if (errno == ENOENT && index(spec, ':'))
-+			if (errno == ENOENT && strchr(spec, ':'))
- 				umnt_err2 = 0;
- 		}
- 	}
-Index: util-linux-2.13-pre7/partx/partx.c
-===================================================================
---- util-linux-2.13-pre7.orig/partx/partx.c
-+++ util-linux-2.13-pre7/partx/partx.c
-@@ -130,7 +130,7 @@
- 	case 'n':
- 		p = optarg;
- 		lower = atoi(p);
--		p = index(p, '-');
-+		p = strchr(p, '-');
- 		if (p)
- 			upper = atoi(p+1);
- 		else
-Index: util-linux-2.13-pre7/text-utils/display.c
-===================================================================
---- util-linux-2.13-pre7.orig/text-utils/display.c
-+++ util-linux-2.13-pre7/text-utils/display.c
-@@ -163,7 +163,7 @@
- 	pr->cchar[0] = 's';
- 	pr->cchar[1] = 0;
- 	for (p1 = pr->fmt; *p1 != '%'; ++p1);
--	for (p2 = ++p1; *p1 && index(spec, *p1); ++p1);
-+	for (p2 = ++p1; *p1 && strchr(spec, *p1); ++p1);
- 	while ((*p2++ = *p1++) != 0) ;
- }
- 
-Index: util-linux-2.13-pre7/text-utils/parse.c
-===================================================================
---- util-linux-2.13-pre7.orig/text-utils/parse.c
-+++ util-linux-2.13-pre7/text-utils/parse.c
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
-Index: util-linux-2.13-pre7/fdisk/cfdisk.c
-===================================================================
---- util-linux-2.13-pre7.orig/fdisk/cfdisk.c
-+++ util-linux-2.13-pre7/fdisk/cfdisk.c
-@@ -348,7 +348,7 @@
- /* Some libc's have their own basename() */
- static char *
- my_basename(char *devname) {
--    char *s = rindex(devname, '/');
-+    char *s = strrchr(devname, '/');
-     return s ? s+1 : devname;
- }
- 
-Index: util-linux-2.13-pre7/login-utils/wall.c
-===================================================================
---- util-linux-2.13-pre7.orig/login-utils/wall.c
-+++ util-linux-2.13-pre7/login-utils/wall.c
-@@ -87,7 +87,7 @@
-         textdomain(PACKAGE);
- 
- 	progname = argv[0];
--	p = rindex(progname, '/');
-+	p = strrchr(progname, '/');
- 	if (p)
- 	     progname = p+1;
- 
diff --git a/package/util-linux/util-linux-umount2-fix.patch b/package/util-linux/util-linux-umount2-fix.patch
deleted file mode 100644
index 14b6c34..0000000
--- a/package/util-linux/util-linux-umount2-fix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-[PATCH] fix multiple definitions of umount2 issue
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- mount/umount.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: util-linux-2.13-pre7/mount/umount.c
-===================================================================
---- util-linux-2.13-pre7.orig/mount/umount.c
-+++ util-linux-2.13-pre7/mount/umount.c
-@@ -29,7 +29,7 @@
- #include "nfsmount.h"
- #include <arpa/inet.h>
- 
--#if defined(MNT_FORCE) && !defined(__sparc__) && !defined(__arm__)
-+#if 1
- /* Interesting ... it seems libc knows about MNT_FORCE and presumably
-    about umount2 as well -- need not do anything */
- #else /* MNT_FORCE */
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 445b4d1..f01dd47 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -3,100 +3,123 @@
 # util-linux
 #
 #############################################################
-UTIL-LINUX_VERSION:=2.13-pre7
-UTIL-LINUX_SOURCE:=util-linux-$(UTIL-LINUX_VERSION).tar.bz2
-UTIL-LINUX_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux/testing
-UTIL-LINUX_DIR:=$(BUILD_DIR)/util-linux-$(UTIL-LINUX_VERSION)
-UTIL-LINUX_CAT:=$(BZCAT)
-UTIL-LINUX_BINARY:=$(UTIL-LINUX_DIR)/misc-utils/chkdupexe
-UTIL-LINUX_TARGET_BINARY:=$(TARGET_DIR)/usr/bin/chkdupexe
-
-# schedutils isn't support for all archs
-ifneq ($(BR2_i386)$(BR2_powerpc)$(BR2_x86_64)$(BR2_ia64)$(BR2_alpha),)
-UTIL-LINUX_SCHED_UTILS:=--enable-schedutils
+UTIL_LINUX_VERSION:=2.19
+UTIL_LINUX_SOURCE:=util-linux-$(UTIL_LINUX_VERSION).tar.bz2
+UTIL_LINUX_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION)/
+
+UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
+
+#If both util-linux and busybox are selected, make certain util-linux
+#wins the fight over who gets to have their utils actually installed
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+UTIL_LINUX_DEPENDENCIES += busybox
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+UTIL_LINUX_DEPENDENCIES += ncurses
 else
-UTIL-LINUX_SCHED_UTILS:=--disable-schedutils
+UTIL_LINUX_CONF_OPT += --without-ncurses
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-UTIL-LINUX_DEPENDENCIES += gettext libintl
-UTIL-LINUX_MAKE_OPT = LIBS=-lintl
+
+#############################################
+#
+# disable default utilities
+#
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_MOUNT),n)
+UTIL_LINUX_CONF_OPT += --disable-mount
 endif
 
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-UTIL-LINUX_DEPENDENCIES += ncurses
-endif
-
-$(DL_DIR)/$(UTIL-LINUX_SOURCE):
-	$(call DOWNLOAD,$(UTIL-LINUX_SITE),$(UTIL-LINUX_SOURCE))
-
-$(UTIL-LINUX_DIR)/.unpacked: $(DL_DIR)/$(UTIL-LINUX_SOURCE)
-	$(UTIL-LINUX_CAT) $(DL_DIR)/$(UTIL-LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(UTIL-LINUX_DIR) package/util-linux/ util-linux\*.patch
-	touch $(UTIL-LINUX_DIR)/.unpacked
-
-$(UTIL-LINUX_DIR)/.configured: $(UTIL-LINUX_DIR)/.unpacked
-	(cd $(UTIL-LINUX_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_lib_blkid_blkid_known_fstype=no \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--disable-use-tty-group \
-		--prefix=/ \
-		--exec-prefix=/ \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(UTIL-LINUX_SCHED_UTILS) \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-		ARCH=$(ARCH) \
-	)
-	touch $(UTIL-LINUX_DIR)/.configured
-
-$(UTIL-LINUX_BINARY): $(UTIL-LINUX_DIR)/.configured
-	$(MAKE) \
-		-C $(UTIL-LINUX_DIR) \
-		ARCH=$(ARCH) \
-		CC="$(TARGET_CC)" \
-		OPT="$(TARGET_CFLAGS)" \
-		$(UTIL-LINUX_MAKE_OPT) \
-		HAVE_SLANG="NO"
-
-$(UTIL-LINUX_TARGET_BINARY): $(UTIL-LINUX_BINARY)
-	$(MAKE) ARCH=$(ARCH) DESTDIR=$(TARGET_DIR) USE_TTY_GROUP=no -C $(UTIL-LINUX_DIR) install
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/share/info \
-		$(TARGET_DIR)/usr/share/man $(TARGET_DIR)/usr/share/doc
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_FSCK),n)
+UTIL_LINUX_CONF_OPT += --disable-fsck
+endif
 
-#If both util-linux and busybox are selected, make certain util-linux
-#wins the fight over who gets to have their utils actually installed
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-UTIL-LINUX_DEPENDENCIES := busybox $(UTIL-LINUX_DEPENDENCIES)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),n)
+UTIL_LINUX_CONF_OPT += --disable-libuuid
 endif
 
-util-linux: $(UTIL-LINUX_DEPENDENCIES) $(UTIL-LINUX_TARGET_BINARY)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_UUIDD),n)
+UTIL_LINUX_CONF_OPT += --disable-uuidd
+endif
 
-util-linux-source: $(DL_DIR)/$(UTIL-LINUX_SOURCE)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),n)
+UTIL_LINUX_CONF_OPT += --disable-libblkid
+endif
 
-util-linux-clean:
-	#There is no working 'uninstall' target. Just skip it...
-	#$(MAKE) DESTDIR=$(TARGET_DIR) -C $(UTIL-LINUX_DIR) uninstall
-	-$(MAKE) -C $(UTIL-LINUX_DIR) clean
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),n)
+UTIL_LINUX_CONF_OPT += --disable-agetty
+endif
 
-util-linux-dirclean:
-	rm -rf $(UTIL-LINUX_DIR)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_CRAMFS),n)
+UTIL_LINUX_CONF_OPT += --disable-cramfs
+endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT),n)
+UTIL_LINUX_CONF_OPT += --disable-switch_root
+endif
 
-#############################################################
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),n)
+UTIL_LINUX_CONF_OPT += --disable-pivot_root
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),n)
+UTIL_LINUX_CONF_OPT += --disable-fallocate
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_RENAME),n)
+UTIL_LINUX_CONF_OPT += --disable-rename
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS),n)
+UTIL_LINUX_CONF_OPT += --disable-schedutils
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_WALL),n)
+UTIL_LINUX_CONF_OPT += --disable-unshare
+endif
+
+#############################################
 #
-# Toplevel Makefile options
+# enable extra utilities
 #
-#############################################################
-ifeq ($(BR2_PACKAGE_UTIL-LINUX),y)
-TARGETS+=util-linux
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_ARCH),y)
+UTIL_LINUX_CONF_OPT += --enable-arch
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_INIT),y)
+UTIL_LINUX_CONF_OPT += --enable-init
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_KILL),y)
+UTIL_LINUX_CONF_OPT += --enable-kill
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LAST),y)
+UTIL_LINUX_CONF_OPT += --enable-last
 endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_MESG),y)
+UTIL_LINUX_CONF_OPT += --enable-mesg
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_PARTX),y)
+UTIL_LINUX_CONF_OPT += --enable-partx
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_RAW),y)
+UTIL_LINUX_CONF_OPT += --enable-raw
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_RESET),y)
+UTIL_LINUX_CONF_OPT += --enable-reset
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
+UTIL_LINUX_CONF_OPT += --enable-login-utils
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_WRITE),y)
+UTIL_LINUX_CONF_OPT += --enable-write
+endif
+
+$(eval $(call AUTOTARGETS,package,util-linux))
-- 
1.7.0.4
