From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 15:44:04 +0200
Subject: [Buildroot] [git commit] package/bison: bump version to 3.4.1
Message-ID: <20190801134529.45EC8811D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3c2f33543b91670f8ead627ec7975142b9e6b5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00014.html

Removed patches applied to upstream gnulib:
http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=4af4a4a71827c0bc5e0ec67af23edef4f15cee8e
http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=74d9d6a293d7462dea8f83e7fc5ac792e956a0ad

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...lush-adjust-to-glibc-2.28-libio.h-removal.patch | 50 ----------------------
 ...ush-be-more-paranoid-about-libio.h-change.patch | 46 --------------------
 package/bison/bison.hash                           |  2 +-
 package/bison/bison.mk                             |  2 +-
 4 files changed, 2 insertions(+), 98 deletions(-)

diff --git a/package/bison/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch b/package/bison/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
deleted file mode 100644
index e9dee48af9..0000000000
--- a/package/bison/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 4af4a4a71827c0bc5e0ec67af23edef4f15cee8e Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 5 Mar 2018 10:56:29 -0800
-Subject: [PATCH 1/1] fflush: adjust to glibc 2.28 libio.h removal
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Daniel P. Berrang?? in:
-https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
-* lib/fbufmode.c (fbufmode):
-* lib/fflush.c (clear_ungetc_buffer_preserving_position)
-(disable_seek_optimization, rpl_fflush):
-* lib/fpending.c (__fpending):
-* lib/fpurge.c (fpurge):
-* lib/freadable.c (freadable):
-* lib/freadahead.c (freadahead):
-* lib/freading.c (freading):
-* lib/freadptr.c (freadptr):
-* lib/freadseek.c (freadptrinc):
-* lib/fseeko.c (fseeko):
-* lib/fseterr.c (fseterr):
-* lib/fwritable.c (fwritable):
-* lib/fwriting.c (fwriting):
-Check _IO_EOF_SEEN instead of _IO_ftrylockfile.
-* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
-Define if not already defined.
----
- lib/fseterr.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-[yann.morin.1998 at free.fr: partially backport from upstream gnulib]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/lib/fseterr.c b/lib/fseterr.c
-index 82649c3ac..adb637256 100644
---- a/lib/fseterr.c
-+++ b/lib/fseterr.c
-@@ -29,7 +29,7 @@ fseterr (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_flags |= _IO_ERR_SEEN;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
--- 
-2.14.1
-
diff --git a/package/bison/0002-fflush-be-more-paranoid-about-libio.h-change.patch b/package/bison/0002-fflush-be-more-paranoid-about-libio.h-change.patch
deleted file mode 100644
index 035f8282c1..0000000000
--- a/package/bison/0002-fflush-be-more-paranoid-about-libio.h-change.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 74d9d6a293d7462dea8f83e7fc5ac792e956a0ad Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 8 Mar 2018 16:42:45 -0800
-Subject: [PATCH 2/2] fflush: be more paranoid about libio.h change
-
-Suggested by Eli Zaretskii in:
-https://lists.gnu.org/r/emacs-devel/2018-03/msg00270.html
-* lib/fbufmode.c (fbufmode):
-* lib/fflush.c (clear_ungetc_buffer_preserving_position)
-(disable_seek_optimization, rpl_fflush):
-* lib/fpending.c (__fpending):
-* lib/fpurge.c (fpurge):
-* lib/freadable.c (freadable):
-* lib/freadahead.c (freadahead):
-* lib/freading.c (freading):
-* lib/freadptr.c (freadptr):
-* lib/freadseek.c (freadptrinc):
-* lib/fseeko.c (fseeko):
-* lib/fseterr.c (fseterr):
-* lib/fwritable.c (fwritable):
-* lib/fwriting.c (fwriting):
-Look at _IO_ftrylockfile as well as at _IO_EOF_SEEN.
----
- lib/fseterr.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-[yann.morin.1998 at free.fr: partially backport from upstream gnulib]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/lib/fseterr.c b/lib/fseterr.c
-index adb637256..fd9da6338 100644
---- a/lib/fseterr.c
-+++ b/lib/fseterr.c
-@@ -29,7 +29,8 @@ fseterr (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
-+  /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_flags |= _IO_ERR_SEEN;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
--- 
-2.14.1
-
diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index 2c3320852f..a98ed6c89a 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	a72428c7917bdf9fa93cb8181c971b6e22834125848cf1d03ce10b1bb0716fe1	bison-3.0.4.tar.xz
+sha256	27159ac5ebf736dffd5636fd2cd625767c9e437de65baa63cb0de83570bd820d	bison-3.4.1.tar.xz
 # License files, locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index e4fc50410b..e5d09a4514 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.0.4
+BISON_VERSION = 3.4.1
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
