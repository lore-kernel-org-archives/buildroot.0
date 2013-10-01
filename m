From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  1 Oct 2013 13:38:12 +0200
Subject: [Buildroot] [PATCH] Fix compilation of systemd with uclibc
Message-ID: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd-uclibc-fix.patch was applied to systemd to provide execvpe function
when compiled with uclibc. However, this function is now provided by
libc-add-non-standard-execvpe-function.patch in uclibc package.

These two patchs are now in conflict. This commit remove
systemd/systemd-uclibc-fix.patch.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/systemd/systemd-uclibc-fix.patch |   59 ------------------------------
 1 file changed, 59 deletions(-)
 delete mode 100644 package/systemd/systemd-uclibc-fix.patch

diff --git a/package/systemd/systemd-uclibc-fix.patch b/package/systemd/systemd-uclibc-fix.patch
deleted file mode 100644
index 9a20845..0000000
--- a/package/systemd/systemd-uclibc-fix.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-[PATCH] fix build with uClibc
-
-Based on OE patch from Khem Raj:
-
-http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
-
-But extended to also cover execvpe (OE carries a patch adding execvpe
-support to uClibc).
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/journal/journal-file.c |    2 ++
- src/macro.h                |   15 +++++++++++++++
- 2 files changed, 17 insertions(+)
-
-Index: systemd-44/src/macro.h
-===================================================================
---- systemd-44.orig/src/macro.h
-+++ systemd-44/src/macro.h
-@@ -28,6 +28,21 @@
- #include <sys/uio.h>
- #include <inttypes.h>
- 
-+#ifdef __UCLIBC__
-+/* uclibc does not implement mkostemp GNU extension */
-+#define mkostemp(x,y) mkstemp(x)
-+/* uclibc does not implement execvpe GNU extension */
-+#ifndef _GNU_SOURCE
-+#define _GNU_SOURCE
-+#endif
-+#include <unistd.h>
-+static inline int execvpe(const char *file, char *const argv[],
-+                          char *const envp[])
-+{
-+        environ = (char **)envp;
-+        return execvp(file, argv);
-+}
-+#endif
- #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
- #define _sentinel_ __attribute__ ((sentinel))
- #define _noreturn_ __attribute__((noreturn))
-Index: systemd-44/src/journal/journal-file.c
-===================================================================
---- systemd-44.orig/src/journal/journal-file.c
-+++ systemd-44/src/journal/journal-file.c
-@@ -229,11 +229,13 @@
-                 }
-         }
- 
-+#ifndef __UCLIBC__
-         /* Note that the glibc fallocate() fallback is very
-            inefficient, hence we try to minimize the allocation area
-            as we can. */
-         if (posix_fallocate(f->fd, old_size, new_size - old_size) < 0)
-                 return -errno;
-+#endif
- 
-         if (fstat(f->fd, &f->last_stat) < 0)
-                 return -errno;
-- 
1.7.9.5
