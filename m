From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Sep 2018 22:18:24 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/bison: fix build
 on host with glibc-2.28
Message-ID: <20180920202121.6D36A886EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10012bef11ddf0114c5e125d61c43b97f8a5be6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Similarly to c48f8a6462 (package/m4: fix build on host with glibc-2.28),
backport the two fixes fromn gnulib upstream, that allows building
host-bison on systems using glibc 2.28.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reported-by: c32 on IRC
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 373ac58b82d2430b745e90c7c8b39e319949882a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lush-adjust-to-glibc-2.28-libio.h-removal.patch | 50 ++++++++++++++++++++++
 ...ush-be-more-paranoid-about-libio.h-change.patch | 46 ++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/package/bison/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch b/package/bison/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
new file mode 100644
index 0000000000..e9dee48af9
--- /dev/null
+++ b/package/bison/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
@@ -0,0 +1,50 @@
+From 4af4a4a71827c0bc5e0ec67af23edef4f15cee8e Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 5 Mar 2018 10:56:29 -0800
+Subject: [PATCH 1/1] fflush: adjust to glibc 2.28 libio.h removal
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Daniel P. Berrang?? in:
+https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
+* lib/fbufmode.c (fbufmode):
+* lib/fflush.c (clear_ungetc_buffer_preserving_position)
+(disable_seek_optimization, rpl_fflush):
+* lib/fpending.c (__fpending):
+* lib/fpurge.c (fpurge):
+* lib/freadable.c (freadable):
+* lib/freadahead.c (freadahead):
+* lib/freading.c (freading):
+* lib/freadptr.c (freadptr):
+* lib/freadseek.c (freadptrinc):
+* lib/fseeko.c (fseeko):
+* lib/fseterr.c (fseterr):
+* lib/fwritable.c (fwritable):
+* lib/fwriting.c (fwriting):
+Check _IO_EOF_SEEN instead of _IO_ftrylockfile.
+* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
+Define if not already defined.
+---
+ lib/fseterr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+[yann.morin.1998 at free.fr: partially backport from upstream gnulib]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/lib/fseterr.c b/lib/fseterr.c
+index 82649c3ac..adb637256 100644
+--- a/lib/fseterr.c
++++ b/lib/fseterr.c
+@@ -29,7 +29,7 @@ fseterr (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_flags |= _IO_ERR_SEEN;
+ #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
+-- 
+2.14.1
+
diff --git a/package/bison/0002-fflush-be-more-paranoid-about-libio.h-change.patch b/package/bison/0002-fflush-be-more-paranoid-about-libio.h-change.patch
new file mode 100644
index 0000000000..035f8282c1
--- /dev/null
+++ b/package/bison/0002-fflush-be-more-paranoid-about-libio.h-change.patch
@@ -0,0 +1,46 @@
+From 74d9d6a293d7462dea8f83e7fc5ac792e956a0ad Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 8 Mar 2018 16:42:45 -0800
+Subject: [PATCH 2/2] fflush: be more paranoid about libio.h change
+
+Suggested by Eli Zaretskii in:
+https://lists.gnu.org/r/emacs-devel/2018-03/msg00270.html
+* lib/fbufmode.c (fbufmode):
+* lib/fflush.c (clear_ungetc_buffer_preserving_position)
+(disable_seek_optimization, rpl_fflush):
+* lib/fpending.c (__fpending):
+* lib/fpurge.c (fpurge):
+* lib/freadable.c (freadable):
+* lib/freadahead.c (freadahead):
+* lib/freading.c (freading):
+* lib/freadptr.c (freadptr):
+* lib/freadseek.c (freadptrinc):
+* lib/fseeko.c (fseeko):
+* lib/fseterr.c (fseterr):
+* lib/fwritable.c (fwritable):
+* lib/fwriting.c (fwriting):
+Look at _IO_ftrylockfile as well as at _IO_EOF_SEEN.
+---
+ lib/fseterr.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+[yann.morin.1998 at free.fr: partially backport from upstream gnulib]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/lib/fseterr.c b/lib/fseterr.c
+index adb637256..fd9da6338 100644
+--- a/lib/fseterr.c
++++ b/lib/fseterr.c
+@@ -29,7 +29,8 @@ fseterr (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
++  /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_flags |= _IO_ERR_SEEN;
+ #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
+   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
+-- 
+2.14.1
+
