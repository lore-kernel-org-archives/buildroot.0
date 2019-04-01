From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Mon,  1 Apr 2019 11:22:08 +1100
Subject: [Buildroot] [PATCH] make: Include patch for gl_lstat support
Message-ID: <20190401002208.16062-1-sam@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include upstream commit 193f1e8 "glob: Do not assume glibc glob
internals". Without this if building glibc with host-make it will fail
with a segfault in make:

>>> glibc glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1 Building
PATH="/scratch/builds/host-make/host/bin:/scratch/builds/host-make/host/sbin:/home/sam/bin:/home/sam/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"  /scratch/builds/host-make/host/bin/host-make -j25  -C /scratch/builds/host-make/build/glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/build
/scratch/builds/host-make/host/bin/host-make -r PARALLELMFLAGS="" -C /scratch/builds/host-make/build/glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1 objdir=`pwd` all
Segmentation fault (core dumped)

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
This also applies to the 2019.02 branch.

 ...b-Do-not-assume-glibc-glob-internals.patch | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch

diff --git a/package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch b/package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
new file mode 100644
index 0000000000..236a936d5b
--- /dev/null
+++ b/package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
@@ -0,0 +1,67 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sun, 24 Sep 2017 09:12:58 -0400
+Subject: [PATCH] glob: Do not assume glibc glob internals.
+
+It has been proposed that glibc glob start using gl_lstat,
+which the API allows it to do.  GNU 'make' should not get in
+the way of this.  See:
+https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
+
+* dir.c (local_lstat): New function, like local_stat.
+(dir_setup_glob): Use it to initialize gl_lstat too, as the API
+requires.
+---
+ dir.c | 29 +++++++++++++++++++++++++++--
+ 1 file changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/dir.c b/dir.c
+index adbb8a9..c343e4c 100644
+--- a/dir.c
++++ b/dir.c
+@@ -1299,15 +1299,40 @@ local_stat (const char *path, struct stat *buf)
+ }
+ #endif
+ 
++/* Similarly for lstat.  */
++#if !defined(lstat) && !defined(WINDOWS32) || defined(VMS)
++# ifndef VMS
++#  ifndef HAVE_SYS_STAT_H
++int lstat (const char *path, struct stat *sbuf);
++#  endif
++# else
++    /* We are done with the fake lstat.  Go back to the real lstat */
++#   ifdef lstat
++#     undef lstat
++#   endif
++# endif
++# define local_lstat lstat
++#elif defined(WINDOWS32)
++/* Windows doesn't support lstat().  */
++# define local_lstat local_stat
++#else
++static int
++local_lstat (const char *path, struct stat *buf)
++{
++  int e;
++  EINTRLOOP (e, lstat (path, buf));
++  return e;
++}
++#endif
++
+ void
+ dir_setup_glob (glob_t *gl)
+ {
+   gl->gl_opendir = open_dirstream;
+   gl->gl_readdir = read_dirstream;
+   gl->gl_closedir = free;
++  gl->gl_lstat = local_lstat;
+   gl->gl_stat = local_stat;
+-  /* We don't bother setting gl_lstat, since glob never calls it.
+-     The slot is only there for compatibility with 4.4 BSD.  */
+ }
+ 
+ void
+-- 
+2.21.0
+
-- 
2.21.0
