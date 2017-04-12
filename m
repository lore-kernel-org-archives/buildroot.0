From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:59:20 +0200
Subject: [Buildroot] [git commit] proftpd: bump version to 1.3.6
Message-ID: <20170412201132.C7DAF82641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c01199a1a6b20ff27ebeb0ed272ff72960a66f75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0002-__mempcpy.patch is not necessary since this commit:

https://github.com/proftpd/proftpd/commit/8dfaceb389d924920bb4f4dd47ddeb2c78fb5f2a

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/proftpd/0002-__mempcpy.patch | 54 ------------------------------------
 package/proftpd/proftpd.hash         |  6 ++--
 package/proftpd/proftpd.mk           |  2 +-
 3 files changed, 4 insertions(+), 58 deletions(-)

diff --git a/package/proftpd/0002-__mempcpy.patch b/package/proftpd/0002-__mempcpy.patch
deleted file mode 100644
index 1b8f0b0..0000000
--- a/package/proftpd/0002-__mempcpy.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-[PATCH] pr_fnmatch.c: use mempcpy, not __mempcpy to fix linker issue with uClibc
-
-The standard name (as checked for by configure) for the function is mempcpy,
-not __mempcpy, so use that instead.
-
-The existing code happens to work on glibc, as that provides an __mempcpy
-alias, but other C libraries (E.G.  uClibc) don't:
-
-./host/usr/bin/arm-linux-nm -D ./staging/lib/libuClibc-0.9.33.2.so | grep mempcpy
-00035d2c W mempcpy
-00036cf8 W wmempcpy
-
-vs
-
-./host/usr/bin/arm-none-linux-gnueabi-nm -D staging/lib/libc-2.18.so | grep mempcpy
-0007d140 T mempcpy
-0007d140 T __mempcpy
-000e15f0 T __mempcpy_chk
-00081828 T __mempcpy_small
-00083148 W wmempcpy
-000e4e3c T __wmempcpy_chk
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/pr_fnmatch.c      |    2 +-
- lib/pr_fnmatch_loop.c |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: proftpd-1.3.4d/lib/pr_fnmatch.c
-===================================================================
---- proftpd-1.3.4d.orig/lib/pr_fnmatch.c
-+++ proftpd-1.3.4d/lib/pr_fnmatch.c
-@@ -250,7 +250,7 @@
- # endif
- # define STRLEN(S) strlen (S)
- # define STRCAT(D, S) strcat (D, S)
--# define MEMPCPY(D, S, N) __mempcpy (D, S, N)
-+# define MEMPCPY(D, S, N) mempcpy (D, S, N)
- # define MEMCHR(S, C, N) memchr (S, C, N)
- # define STRCOLL(S1, S2) strcoll (S1, S2)
- # include "pr_fnmatch_loop.c"
-Index: proftpd-1.3.4d/lib/pr_fnmatch_loop.c
-===================================================================
---- proftpd-1.3.4d.orig/lib/pr_fnmatch_loop.c
-+++ proftpd-1.3.4d/lib/pr_fnmatch_loop.c
-@@ -54,7 +54,7 @@
- /* Copy N bytes of SRC to DEST, return pointer to bytes after the
-    last written byte.  */
- static void *
--__mempcpy (void *dest, const void *src, size_t n)
-+mempcpy (void *dest, const void *src, size_t n)
- {
-   return (char *) memcpy (dest, src, n) + n;
- }
diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index cc8add9..537222f 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.5d.tar.gz.md5
-md5	bcd2846edf0dad4c4d49a7c8c176d83a	proftpd-1.3.5d.tar.gz
+# From ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.6.tar.gz.md5
+md5 13270911c42aac842435f18205546a1b proftpd-1.3.6.tar.gz
 # Locally calculated
-sha256	f4e2997be7f22a5b31d7ac72497ed4f4471d24d32385978350410713e76129ac	proftpd-1.3.5d.tar.gz
+sha256 91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf proftpd-1.3.6.tar.gz
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 21f7de5..5f42408 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.5d
+PROFTPD_VERSION = 1.3.6
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
