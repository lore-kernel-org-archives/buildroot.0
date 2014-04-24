From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:36:09 +0200
Subject: [Buildroot] [git commit] proftpd: bump version
Message-ID: <20140424113619.B59E59C9CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=108d50d50ca04f47f2f0d8880beebb8c3a221576
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-fix-kernel-header-capability-version.patch} |    0
 package/proftpd/proftpd-0002-__mempcpy.patch       |   54 ++++++++++++++++++++
 package/proftpd/proftpd.mk                         |    4 +-
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd-1.3.3g-fix-kernel-header-capability-version.patch b/package/proftpd/proftpd-0001-fix-kernel-header-capability-version.patch
similarity index 100%
rename from package/proftpd/proftpd-1.3.3g-fix-kernel-header-capability-version.patch
rename to package/proftpd/proftpd-0001-fix-kernel-header-capability-version.patch
diff --git a/package/proftpd/proftpd-0002-__mempcpy.patch b/package/proftpd/proftpd-0002-__mempcpy.patch
new file mode 100644
index 0000000..1b8f0b0
--- /dev/null
+++ b/package/proftpd/proftpd-0002-__mempcpy.patch
@@ -0,0 +1,54 @@
+[PATCH] pr_fnmatch.c: use mempcpy, not __mempcpy to fix linker issue with uClibc
+
+The standard name (as checked for by configure) for the function is mempcpy,
+not __mempcpy, so use that instead.
+
+The existing code happens to work on glibc, as that provides an __mempcpy
+alias, but other C libraries (E.G.  uClibc) don't:
+
+./host/usr/bin/arm-linux-nm -D ./staging/lib/libuClibc-0.9.33.2.so | grep mempcpy
+00035d2c W mempcpy
+00036cf8 W wmempcpy
+
+vs
+
+./host/usr/bin/arm-none-linux-gnueabi-nm -D staging/lib/libc-2.18.so | grep mempcpy
+0007d140 T mempcpy
+0007d140 T __mempcpy
+000e15f0 T __mempcpy_chk
+00081828 T __mempcpy_small
+00083148 W wmempcpy
+000e4e3c T __wmempcpy_chk
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/pr_fnmatch.c      |    2 +-
+ lib/pr_fnmatch_loop.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: proftpd-1.3.4d/lib/pr_fnmatch.c
+===================================================================
+--- proftpd-1.3.4d.orig/lib/pr_fnmatch.c
++++ proftpd-1.3.4d/lib/pr_fnmatch.c
+@@ -250,7 +250,7 @@
+ # endif
+ # define STRLEN(S) strlen (S)
+ # define STRCAT(D, S) strcat (D, S)
+-# define MEMPCPY(D, S, N) __mempcpy (D, S, N)
++# define MEMPCPY(D, S, N) mempcpy (D, S, N)
+ # define MEMCHR(S, C, N) memchr (S, C, N)
+ # define STRCOLL(S1, S2) strcoll (S1, S2)
+ # include "pr_fnmatch_loop.c"
+Index: proftpd-1.3.4d/lib/pr_fnmatch_loop.c
+===================================================================
+--- proftpd-1.3.4d.orig/lib/pr_fnmatch_loop.c
++++ proftpd-1.3.4d/lib/pr_fnmatch_loop.c
+@@ -54,7 +54,7 @@
+ /* Copy N bytes of SRC to DEST, return pointer to bytes after the
+    last written byte.  */
+ static void *
+-__mempcpy (void *dest, const void *src, size_t n)
++mempcpy (void *dest, const void *src, size_t n)
+ {
+   return (char *) memcpy (dest, src, n) + n;
+ }
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 6188846..2f7eb0d 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.3g
-PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.bz2
+PROFTPD_VERSION = 1.3.4d
+PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.gz
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source/
 PROFTPD_LICENSE = GPLv2+
 PROFTPD_LICENSE_FILES = COPYING
