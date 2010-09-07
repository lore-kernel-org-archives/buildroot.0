From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Tue,  7 Sep 2010 19:38:17 +0200
Subject: [Buildroot] [PATCH 1/2] introducing util-linux-ng as replacement
	for util-linux
Message-ID: <1283881098-3955-1-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcus Osdoba <ossy1980@gmx.net>

mark util-linux as deprecated since next version (util-linux-ng) is available
some basic components of utillinuxng can be switched of (--disable-<> in configure step)
this patch uses version 2.17.2 of util-linux-ng

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 package/Config.in                                  |    1 +
 ...0001-replace-bcopy-bzero-index-and-rindex.patch |  418 ++++++++++++++++++++
 .../0002-Allow-linking-with-uClibc.patch           |   26 ++
 package/util-linux-ng/Config.in                    |   47 +++
 package/util-linux-ng/util-linux-ng.mk             |   57 +++
 package/util-linux/Config.in                       |    1 +
 6 files changed, 550 insertions(+), 0 deletions(-)
 create mode 100644 package/util-linux-ng/0001-replace-bcopy-bzero-index-and-rindex.patch
 create mode 100644 package/util-linux-ng/0002-Allow-linking-with-uClibc.patch
 create mode 100644 package/util-linux-ng/Config.in
 create mode 100644 package/util-linux-ng/util-linux-ng.mk

diff --git a/package/Config.in b/package/Config.in
index d60d8ef..a94e398 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -472,6 +472,7 @@ source "package/psmisc/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
 source "package/util-linux/Config.in"
+source "package/util-linux-ng/Config.in"
 endif
 endmenu
 
diff --git a/package/util-linux-ng/0001-replace-bcopy-bzero-index-and-rindex.patch b/package/util-linux-ng/0001-replace-bcopy-bzero-index-and-rindex.patch
new file mode 100644
index 0000000..ef66f07
--- /dev/null
+++ b/package/util-linux-ng/0001-replace-bcopy-bzero-index-and-rindex.patch
@@ -0,0 +1,418 @@
+From 12c0f4a5762bf42d8bb3a9b9f86bc4253aa749cb Mon Sep 17 00:00:00 2001
+From: Daniel Mierswa <impulze@...>
+Date: Mon, 17 Aug 2009 06:17:54 +0200
+Subject: [PATCH 1/2] replace bcopy,bzero,index and rindex
+
+Those 4 functions are marked as LEGACY in POSIX.1-2001 and removed in
+POSIX.1-2008.
+
+Replaced with memmove,memset,strchr and strrchr.
+---
+ fdisk/cfdisk.c            |    2 +-
+ fdisk/fdiskbsdlabel.c     |   13 +++++++------
+ fdisk/sfdisk.c            |   10 +++++-----
+ login-utils/login.c       |    6 +++---
+ login-utils/shutdown.c    |    2 +-
+ login-utils/ttymsg.c      |    2 +-
+ login-utils/vipw.c        |    4 ++--
+ login-utils/wall.c        |    2 +-
+ misc-utils/logger.c       |    2 +-
+ misc-utils/whereis.c      |    4 ++--
+ mount/mount.c             |    4 ++--
+ mount/mount_mntent.c      |    4 ++--
+ mount/sundries.c          |    2 +-
+ partx/partx.c             |    2 +-
+ shlibs/blkid/src/config.c |    4 ++--
+ text-utils/colcrt.c       |    4 ++--
+ text-utils/display.c      |    2 +-
+ text-utils/parse.c        |    8 ++++----
+ text-utils/ul.c           |    2 +-
+ 19 files changed, 40 insertions(+), 39 deletions(-)
+
+diff --git a/fdisk/cfdisk.c b/fdisk/cfdisk.c
+index fc0357d..1846e11 100644
+--- a/fdisk/cfdisk.c
++++ b/fdisk/cfdisk.c
+@@ -357,7 +357,7 @@ xmalloc (size_t size) {
+ /* Some libc's have their own basename() */
+ static char *
+ my_basename(char *devname) {
+-    char *s = rindex(devname, '/');
++    char *s = strrchr(devname, '/');
+     return s ? s+1 : devname;
+ }
+ 
+diff --git a/fdisk/fdiskbsdlabel.c b/fdisk/fdiskbsdlabel.c
+index 377b64e..d5243b9 100644
+--- a/fdisk/fdiskbsdlabel.c
++++ b/fdisk/fdiskbsdlabel.c
+@@ -538,7 +538,7 @@ xbsd_write_bootstrap (void)
+ 
+   /* We need a backup of the disklabel (xbsd_dlabel might have changed). */
+   d = &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE];
+-  bcopy (d, &dl, sizeof (struct xbsd_disklabel));
++  memmove (&dl, d, sizeof (struct xbsd_disklabel));
+ 
+   /* The disklabel will be overwritten by 0's from bootxx anyway */
+   bzero (d, sizeof (struct xbsd_disklabel));
+@@ -555,7 +555,7 @@ xbsd_write_bootstrap (void)
+       exit ( EXIT_FAILURE );
+     }
+ 
+-  bcopy (&dl, d, sizeof (struct xbsd_disklabel));
++  memmove (d, &dl, sizeof (struct xbsd_disklabel));
+ 
+ #if defined (__powerpc__) || defined (__hppa__)
+   sector = 0;
+@@ -740,8 +740,9 @@ xbsd_readlabel (struct partition *p, struct xbsd_disklabel *d)
+ 	if (BSD_BBSIZE != read (fd, disklabelbuffer, BSD_BBSIZE))
+ 		fatal (unable_to_read);
+ 
+-	bcopy (&disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
+-	       d, sizeof (struct xbsd_disklabel));
++	memmove (d,
++	         &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
++	         sizeof (struct xbsd_disklabel));
+ 
+ 	if (d -> d_magic != BSD_DISKMAGIC || d -> d_magic2 != BSD_DISKMAGIC)
+ 		return 0;
+@@ -776,8 +777,8 @@ xbsd_writelabel (struct partition *p, struct xbsd_disklabel *d)
+   /* This is necessary if we want to write the bootstrap later,
+      otherwise we'd write the old disklabel with the bootstrap.
+   */
+-  bcopy (d, &disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET],
+-	 sizeof (struct xbsd_disklabel));
++  memmove (&disklabelbuffer[BSD_LABELSECTOR * SECTOR_SIZE + BSD_LABELOFFSET], d,
++           sizeof (struct xbsd_disklabel));
+ 
+ #if defined (__alpha__) && BSD_LABELSECTOR == 0
+   alpha_bootblock_checksum (disklabelbuffer);
+diff --git a/fdisk/sfdisk.c b/fdisk/sfdisk.c
+index da779aa..8fae5bb 100644
+--- a/fdisk/sfdisk.c
++++ b/fdisk/sfdisk.c
+@@ -40,7 +40,7 @@
+ #include <unistd.h>		/* read, write */
+ #include <fcntl.h>		/* O_RDWR */
+ #include <errno.h>		/* ERANGE */
+-#include <string.h>		/* index() */
++#include <string.h>		/* strchr(), strrchr() */
+ #include <ctype.h>
+ #include <getopt.h>
+ #include <sys/ioctl.h>
+@@ -1725,12 +1725,12 @@ read_stdin(char **fields, char *line, int fieldssize, int linesize) {
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
+@@ -1740,7 +1740,7 @@ read_stdin(char **fields, char *line, int fieldssize, int linesize) {
+     }
+ 
+     /* dump style? - then bad input is fatal */
+-    if ((ip = index(line+2, ':')) != 0) {
++    if ((ip = strchr(line+2, ':')) != 0) {
+ 	struct dumpfld *d;
+ 
+       nxtfld:
+@@ -2503,7 +2503,7 @@ main(int argc, char **argv) {
+ 
+     if (argc < 1)
+       fatal(_("no command?\n"));
+-    if ((progn = rindex(argv[0], '/')) == NULL)
++    if ((progn = strrchr(argv[0], '/')) == NULL)
+       progn = argv[0];
+     else
+       progn++;
+diff --git a/login-utils/login.c b/login-utils/login.c
+index 7328ede..486b30b 100644
+--- a/login-utils/login.c
++++ b/login-utils/login.c
+@@ -418,7 +418,7 @@ main(int argc, char **argv)
+      */
+     gethostname(tbuf, sizeof(tbuf));
+     xstrncpy(thishost, tbuf, sizeof(thishost));
+-    domain = index(tbuf, '.');
++    domain = strchr(tbuf, '.');
+ 
+     username = tty_name = hostname = NULL;
+     fflag = hflag = pflag = 0;
+@@ -437,7 +437,7 @@ main(int argc, char **argv)
+ 	      exit(1);
+ 	  }
+ 	  hflag = 1;
+-	  if (domain && (p = index(optarg, '.')) &&
++	  if (domain && (p = strchr(optarg, '.')) &&
+ 	      strcasecmp(p, domain) == 0)
+ 	    *p = 0;
+ 
+@@ -1251,7 +1251,7 @@ Michael Riepe <michael@...>
+ 	childArgv[childArgc++] = buff;
+     } else {
+ 	tbuf[0] = '-';
+-	xstrncpy(tbuf + 1, ((p = rindex(pwd->pw_shell, '/')) ?
++	xstrncpy(tbuf + 1, ((p = strrchr(pwd->pw_shell, '/')) ?
+ 			   p + 1 : pwd->pw_shell),
+ 		sizeof(tbuf)-1);
+ 
+diff --git a/login-utils/shutdown.c b/login-utils/shutdown.c
+index f798e58..58600b9 100644
+--- a/login-utils/shutdown.c
++++ b/login-utils/shutdown.c
+@@ -281,7 +281,7 @@ main(int argc, char *argv[])
+ 			if (fgets (line, sizeof(line), fp) != NULL &&
+ 			    strncasecmp (line, "HALT_ACTION", 11) == 0 &&
+ 			    iswhitespace(line[11])) {
+-				p = index(line, '\n');
++				p = strchr(line, '\n');
+ 				if (p)
+ 					*p = 0;		/* strip final '\n' */
+ 				p = line+11;
+diff --git a/login-utils/ttymsg.c b/login-utils/ttymsg.c
+index 24b74bc..92282c1 100644
+--- a/login-utils/ttymsg.c
++++ b/login-utils/ttymsg.c
+@@ -111,7 +111,7 @@ ttymsg(struct iovec *iov, int iovcnt, char *line, int tmout) {
+ 		if (wret >= 0) {
+ 			left -= wret;
+ 			if (iov != localiov) {
+-				bcopy(iov, localiov,
++				memmove(localiov, iov,
+ 				    iovcnt * sizeof(struct iovec));
+ 				iov = localiov;
+ 			}
+diff --git a/login-utils/vipw.c b/login-utils/vipw.c
+index 5f44721..b3972f3 100644
+--- a/login-utils/vipw.c
++++ b/login-utils/vipw.c
+@@ -311,8 +311,8 @@ int main(int argc, char *argv[]) {
+ 	bindtextdomain(PACKAGE, LOCALEDIR);
+ 	textdomain(PACKAGE);
+ 
+-	bzero(tmp_file, FILENAMELEN);
+-	progname = (rindex(argv[0], '/')) ? rindex(argv[0], '/') + 1 : argv[0];
++	memset(tmp_file, '\0', FILENAMELEN);
++	progname = (strrchr(argv[0], '/')) ? strrchr(argv[0], '/') + 1 : argv[0];
+ 	if (!strcmp(progname, "vigr")) {
+ 		program = VIGR;
+ 		xstrncpy(orig_file, GROUP_FILE, sizeof(orig_file));
+diff --git a/login-utils/wall.c b/login-utils/wall.c
+index 42856ae..7b5f671 100644
+--- a/login-utils/wall.c
++++ b/login-utils/wall.c
+@@ -95,7 +95,7 @@ main(int argc, char **argv) {
+         textdomain(PACKAGE);
+ 
+ 	progname = argv[0];
+-	p = rindex(progname, '/');
++	p = strrchr(progname, '/');
+ 	if (p)
+ 	     progname = p+1;
+ 
+diff --git a/misc-utils/logger.c b/misc-utils/logger.c
+index 72a8f85..95050a1 100644
+--- a/misc-utils/logger.c
++++ b/misc-utils/logger.c
+@@ -196,7 +196,7 @@ main(int argc, char **argv) {
+ 			} else {
+ 				if (p != buf)
+ 					*p++ = ' ';
+-				bcopy(*argv++, p, len);
++				memmove(p, *argv++, len);
+ 				*(p += len) = '\0';
+ 			}
+ 		}
+diff --git a/misc-utils/whereis.c b/misc-utils/whereis.c
+index 71ee683..931ff77 100644
+--- a/misc-utils/whereis.c
++++ b/misc-utils/whereis.c
+@@ -325,14 +325,14 @@ findin(char *dir, char *cp) {
+ 	char dirbuf[1024];
+ 	struct stat statbuf;
+ 
+-	dd = index(dir, '*');
++	dd = strchr(dir, '*');
+ 	if (!dd)
+ 		goto noglob;
+ 
+ 	l = strlen(dir);
+ 	if (l < sizeof(dirbuf)) {	/* refuse excessively long names */
+ 		strcpy (dirbuf, dir);
+-		d = index(dirbuf, '*');
++		d = strchr(dirbuf, '*');
+ 		*d = 0;
+ 		dirp = opendir(dirbuf);
+ 		if (dirp == NULL)
+diff --git a/mount/mount.c b/mount/mount.c
+index ef478c7..e8cb549 100644
+--- a/mount/mount.c
++++ b/mount/mount.c
+@@ -911,11 +911,11 @@ guess_fstype_and_mount(const char *spec, const char *node, const char **types,
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
+ 	 if (do_mount (&args, special, status) == 0)
+diff --git a/mount/mount_mntent.c b/mount/mount_mntent.c
+index e6e64bb..f2623fd 100644
+--- a/mount/mount_mntent.c
++++ b/mount/mount_mntent.c
+@@ -157,7 +157,7 @@ my_getmntent (mntFILE *mfp) {
+ 			return NULL;
+ 
+ 		mfp->mntent_lineno++;
+-		s = index (buf, '\n');
++		s = strchr (buf, '\n');
+ 		if (s == NULL) {
+ 			/* Missing final newline?  Otherwise extremely */
+ 			/* long line - assume file was corrupted */
+@@ -165,7 +165,7 @@ my_getmntent (mntFILE *mfp) {
+ 				fprintf(stderr, _("[mntent]: warning: no final "
+ 					"newline at the end of %s\n"),
+ 					mfp->mntent_file);
+-				s = index (buf, 0);
++				s = strchr (buf, 0);
+ 			} else {
+ 				mfp->mntent_errs = 1;
+ 				goto err;
+diff --git a/mount/sundries.c b/mount/sundries.c
+index 3980f81..658eec5 100644
+--- a/mount/sundries.c
++++ b/mount/sundries.c
+@@ -157,7 +157,7 @@ matching_type (const char *type, const char *types) {
+ 	     if (strncmp(p, type, len) == 0 &&
+ 		 (p[len] == 0 || p[len] == ','))
+ 		     return !no;
+-	     p = index(p,',');
++	     p = strchr(p,',');
+ 	     if (!p)
+ 		     break;
+ 	     p++;
+diff --git a/partx/partx.c b/partx/partx.c
+index 8650742..25485ff 100644
+--- a/partx/partx.c
++++ b/partx/partx.c
+@@ -131,7 +131,7 @@ main(int argc, char **argv){
+ 	case 'n':
+ 		p = optarg;
+ 		lower = atoi(p);
+-		p = index(p, '-');
++		p = strchr(p, '-');
+ 		if (p)
+ 			upper = atoi(p+1);
+ 		else
+diff --git a/shlibs/blkid/src/config.c b/shlibs/blkid/src/config.c
+index 9091736..fcc7b6f 100644
+--- a/shlibs/blkid/src/config.c
++++ b/shlibs/blkid/src/config.c
+@@ -68,12 +68,12 @@ static int parse_next(FILE *fd, struct blkid_config *conf)
+ 	do {
+ 		if (fgets (buf, sizeof(buf), fd) == NULL)
+ 			return feof(fd) ? 0 : -1;
+-		s = index (buf, '\n');
++		s = strchr (buf, '\n');
+ 		if (!s) {
+ 			/* Missing final newline?  Otherwise extremely */
+ 			/* long line - assume file was corrupted */
+ 			if (feof(fd))
+-				s = index (buf, '\0');
++				s = strchr (buf, '\0');
+ 			else {
+ 				DBG(DEBUG_CONFIG, fprintf(stderr,
+ 					"libblkid: config file: missing newline at line '%s'.\n",
+diff --git a/text-utils/colcrt.c b/text-utils/colcrt.c
+index 891fd86..6f79665 100644
+--- a/text-utils/colcrt.c
++++ b/text-utils/colcrt.c
+@@ -252,8 +252,8 @@ void pflush(int ol)
+ 		}
+ 		putwchar('\n');
+ 	}
+-	bcopy(page[ol], page, (267 - ol) * 132 * sizeof(wchar_t));
+-	bzero(page[267- ol], ol * 132 * sizeof(wchar_t));
++	memmove(page, page[ol], (267 - ol) * 132 * sizeof(wchar_t));
++	memset(page[267- ol], '\0', ol * 132 * sizeof(wchar_t));
+ 	outline -= ol;
+ 	outcol = 0;
+ 	first = 1;
+diff --git a/text-utils/display.c b/text-utils/display.c
+index 3d4bdcd..91857c2 100644
+--- a/text-utils/display.c
++++ b/text-utils/display.c
+@@ -163,7 +163,7 @@ static void bpad(PR *pr)
+ 	pr->cchar[0] = 's';
+ 	pr->cchar[1] = 0;
+ 	for (p1 = pr->fmt; *p1 != '%'; ++p1);
+-	for (p2 = ++p1; *p1 && index(spec, *p1); ++p1);
++	for (p2 = ++p1; *p1 && strchr(spec, *p1); ++p1);
+ 	while ((*p2++ = *p1++) != 0) ;
+ }
+ 
+diff --git a/text-utils/parse.c b/text-utils/parse.c
+index d7a3020..8164c60 100644
+--- a/text-utils/parse.c
++++ b/text-utils/parse.c
+@@ -64,7 +64,7 @@ void addfile(char *name)
+ 		exit(1);
+ 	}
+ 	while (fgets(buf, sizeof(buf), fp)) {
+-		if ((p = index(buf, '\n')) == NULL) {
++		if ((p = strchr(buf, '\n')) == NULL) {
+ 			(void)fprintf(stderr, _("hexdump: line too long.\n"));
+ 			while ((ch = getchar()) != '\n' && ch != EOF);
+ 			continue;
+@@ -171,7 +171,7 @@ int size(FS *fs)
+ 			 * skip any special chars -- save precision in
+ 			 * case it's a %s format.
+ 			 */
+-			while (index(spec + 1, *++fmt));
++			while (strchr(spec + 1, *++fmt));
+ 			if (*fmt == '.' && isdigit((unsigned char)*++fmt)) {
+ 				prec = atoi(fmt);
+ 				while (isdigit((unsigned char)*++fmt));
+@@ -244,10 +244,10 @@ void rewrite(FS *fs)
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
+diff --git a/text-utils/ul.c b/text-utils/ul.c
+index 76c0a97..a1491b8 100644
+--- a/text-utils/ul.c
++++ b/text-utils/ul.c
+@@ -42,7 +42,7 @@
+ 
+ #include <stdio.h>
+ #include <unistd.h>		/* for getopt(), isatty() */
+-#include <string.h>		/* for bzero(), strcpy() */
++#include <string.h>		/* for memset(), strcpy() */
+ #include <term.h>		/* for setupterm() */
+ #include <stdlib.h>		/* for getenv() */
+ #include <limits.h>		/* for INT_MAX */
+-- 
+1.6.4
+
diff --git a/package/util-linux-ng/0002-Allow-linking-with-uClibc.patch b/package/util-linux-ng/0002-Allow-linking-with-uClibc.patch
new file mode 100644
index 0000000..9c9eb12
--- /dev/null
+++ b/package/util-linux-ng/0002-Allow-linking-with-uClibc.patch
@@ -0,0 +1,26 @@
+From 7973232b86fd16cbcee3bf5e743392c8a452d085 Mon Sep 17 00:00:00 2001
+From: Daniel Mierswa <impulze@...>
+Date: Mon, 17 Aug 2009 07:21:35 +0200
+Subject: [PATCH 2/2] Allow linking with uClibc
+
+uClibc uses lseek64 as llseek, so use it.
+---
+ shlibs/blkid/src/llseek.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/shlibs/blkid/src/llseek.c b/shlibs/blkid/src/llseek.c
+index 5bd0e51..75b7d24 100644
+--- a/shlibs/blkid/src/llseek.c
++++ b/shlibs/blkid/src/llseek.c
+@@ -30,7 +30,7 @@
+ 
+ #ifdef __linux__
+ 
+-#if defined(HAVE_LSEEK64) && defined(HAVE_LSEEK64_PROTOTYPE)
++#if defined(HAVE_LSEEK64) && defined(HAVE_LSEEK64_PROTOTYPE) || defined(__UCLIBC__)
+ 
+ #define my_llseek lseek64
+ 
+-- 
+1.6.4
+
diff --git a/package/util-linux-ng/Config.in b/package/util-linux-ng/Config.in
new file mode 100644
index 0000000..d516873
--- /dev/null
+++ b/package/util-linux-ng/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_UTIL_LINUX_NG
+	bool "util-linux-ng"
+	depends on (BR2_PROGRAM_INVOCATION && BR2_LARGEFILE)
+	help
+	  Fork of util-linux which consists of essential Linux utilities.
+
+	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
+	  http://userweb.kernel.org/~kzak/util-linux-ng/
+
+comment "util-linux-ng requires a toolchain with PROGRAM_INVOCATION support"
+	depends on !BR2_PROGRAM_INVOCATION
+
+comment "util-linux-ng requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
+if BR2_PACKAGE_UTIL_LINUX_NG
+comment "utils selection"
+
+config BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
+	bool "The library and tools for blkid support."
+	help
+	 This package provides the recent blkid support 
+	 (parallel versions exist in e2fsprogs and busybox)
+
+config BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID
+	bool "The library and tools for uuid support."
+	help
+	 This package provides the recent uuid support 
+	 (parallel versions exist in e2fsprogs and busybox)
+
+
+config BR2_PACKAGE_UTIL_LINUX_NG_MOUNT_UTILS
+	bool "Devices mount/unmounting utilities"
+	depends on BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID && BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
+	help
+	 This package contains utilities to mount/unmount devices.
+	 Also provided by busybox.
+
+config BR2_PACKAGE_UTIL_LINUX_NG_FSCK
+	bool "Filesystem check"
+	depends on BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID && BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
+	help
+	 Linux mainstream filesystem check.
+	 Also provided by busybox.
+
+
+endif
diff --git a/package/util-linux-ng/util-linux-ng.mk b/package/util-linux-ng/util-linux-ng.mk
new file mode 100644
index 0000000..4ea2bbe
--- /dev/null
+++ b/package/util-linux-ng/util-linux-ng.mk
@@ -0,0 +1,57 @@
+#############################################################
+#
+# UTIL_LINUX_NG
+#
+#############################################################
+UTIL_LINUX_NG_VERSION=2.17.2
+UTIL_LINUX_NG_MAJORVERSION=2.17
+UTIL_LINUX_NG_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux-ng/v$(UTIL_LINUX_NG_MAJORVERSION)
+UTIL_LINUX_NG_SOURCE=util-linux-ng-$(UTIL_LINUX_NG_VERSION).tar.bz2
+#UTIL_LINUX_NG_INSTALL_STAGING = YES
+UTIL_LINUX_NG_CONF_OPT=--disable-use-tty-group \
+                       --enable-shared \
+                       --without-libiconv-prefix \
+                       --without-libintl-prefix \
+                       --disable-rpath \
+                       --disable-nls \
+                       --disable-schedutils \
+                       --disable-doc
+
+UTIL_LINUX_NG_DEPENDENCIES=e2fsprogs
+UTIL_LINUX_NG_LIBTOOL_PATCH = NO
+
+# make util-linux-ng win over links to busybox binary
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+  UTIL_LINUX_NG_DEPENDENCIES+=busybox
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+  ifneq ($(BR2_USE_WCHAR),y)
+    UTIL_LINUX_NG_CONF_OPT+=--with-ncurses
+  endif # BR2_USE_WCHAR
+else
+  UTIL_LINUX_NG_CONF_OPT+=--without-ncurses
+endif # BR2_PACKAGE_NCURSES
+
+ifneq ($(BR2_PACKAGE_ZLIB),y)
+  UTIL_LINUX_NG_CONF_OPT+=--disable-cramfs
+endif
+
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_NG_MOUNT_UTILS),y)
+  UTIL_LINUX_NG_CONF_OPT+=--disable-mount
+endif
+
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID),y)
+  UTIL_LINUX_NG_CONF_OPT+=--disable-libuuid
+endif
+
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID),y)
+  UTIL_LINUX_NG_CONF_OPT+=--disable-libblkid
+endif
+
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_NG_FSCK),y)
+  UTIL_LINUX_NG_CONF_OPT+=--disable-fsck
+endif
+
+
+$(eval $(call AUTOTARGETS,package,util-linux-ng))
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 434dae9..00e9f88 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UTIL-LINUX
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_INET_RPC
+	depends on BR2_DEPRECATED
 	help
 	  Various useful/essential Linux utilities.
 
-- 
1.7.1
