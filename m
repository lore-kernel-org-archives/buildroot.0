From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 09:51:59 +0100
Subject: [Buildroot] [git commit] package/weston: update patches with
 upstream backports
Message-ID: <20200209084046.B6E8C8CA88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a76d0b072a0edb78c27a9e296748d155029ebfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These updated patches fix the same issues but are backported from upstream
commits instead of pull requests.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ally-include-sys-mman.h-in-os-compatibili.patch | 17 +++---
 ...add-missing-defines-for-pre-v3.17-kernels.patch | 42 --------------
 ...d-all-the-seal-logic-behind-HAVE_MEMFD_CR.patch | 67 ++++++++++++++++++++++
 3 files changed, 76 insertions(+), 50 deletions(-)

diff --git a/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch b/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
index 0c632fbf35..33b1353fba 100644
--- a/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
+++ b/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
@@ -1,4 +1,4 @@
-From 888dd1ae6a0261230b2bc47079d7b20df8c05e68 Mon Sep 17 00:00:00 2001
+From 7b36f171d09354a2d3a48db0ae2d34d66aa4f1ae Mon Sep 17 00:00:00 2001
 From: James Hilliard <james.hilliard1@gmail.com>
 Date: Sat, 1 Feb 2020 20:02:29 -0700
 Subject: [PATCH] unconditionally include sys/mman.h in os-compatibility.c
@@ -13,20 +13,21 @@ Fixes:
                          LOCK_READ
 
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/wayland/weston/merge_requests/368]
+[james.hilliard1 at gmail.com: backport from upstream commit
+7b36f171d09354a2d3a48db0ae2d34d66aa4f1ae]
 ---
- shared/os-compatibility.c | 2 --
- 1 file changed, 2 deletions(-)
+ shared/os-compatibility.c | 3 ---
+ 1 file changed, 3 deletions(-)
 
 diff --git a/shared/os-compatibility.c b/shared/os-compatibility.c
-index 5e1ce479..ddc37807 100644
+index 5e1ce479..041c929f 100644
 --- a/shared/os-compatibility.c
 +++ b/shared/os-compatibility.c
-@@ -35,9 +35,7 @@
+@@ -34,10 +34,7 @@
+ #include <string.h>
  #include <stdlib.h>
  #include <libweston/zalloc.h>
- 
+-
 -#ifdef HAVE_MEMFD_CREATE
  #include <sys/mman.h>
 -#endif
diff --git a/package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch b/package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch
deleted file mode 100644
index 39360f4fd2..0000000000
--- a/package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f43c98b23e0d7731cd8d7a9b4510c359f3df7930 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 1 Feb 2020 23:32:29 -0700
-Subject: [PATCH] add missing defines for pre-v3.17 kernels
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/wayland/weston/merge_requests/369]
----
- shared/os-compatibility.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/shared/os-compatibility.c b/shared/os-compatibility.c
-index ddc37807..26c39e67 100644
---- a/shared/os-compatibility.c
-+++ b/shared/os-compatibility.c
-@@ -39,6 +39,22 @@
- 
- #include "os-compatibility.h"
- 
-+#ifndef F_GET_SEALS
-+#define F_GET_SEALS	(1034)
-+#endif
-+
-+#ifndef F_SEAL_SHRINK
-+#define F_SEAL_SHRINK	0x0002
-+#endif
-+
-+#ifndef F_SEAL_GROW
-+#define F_SEAL_GROW	0x0004
-+#endif
-+
-+#ifndef F_SEAL_WRITE
-+#define F_SEAL_WRITE	0x0008
-+#endif
-+
- #define READONLY_SEALS (F_SEAL_SHRINK | F_SEAL_GROW | F_SEAL_WRITE)
- 
- int
--- 
-2.20.1
-
diff --git a/package/weston/0002-shared-guard-all-the-seal-logic-behind-HAVE_MEMFD_CR.patch b/package/weston/0002-shared-guard-all-the-seal-logic-behind-HAVE_MEMFD_CR.patch
new file mode 100644
index 0000000000..c403ede4be
--- /dev/null
+++ b/package/weston/0002-shared-guard-all-the-seal-logic-behind-HAVE_MEMFD_CR.patch
@@ -0,0 +1,67 @@
+From f0d3a6149158f682230ae9a1e69289431974f635 Mon Sep 17 00:00:00 2001
+From: Sebastian Wick <sebastian@sebastianwick.net>
+Date: Wed, 5 Feb 2020 10:27:23 +0100
+Subject: [PATCH] shared: guard all the seal logic behind HAVE_MEMFD_CREATE
+
+The initial version of os_ro_anonymous_file missed two guards around the
+seal logic which leads to a compilation error on older systems.
+
+Also make the check for a read-only file symmetric in
+os_ro_anonymous_file_get_fd and os_ro_anonymous_file_put_fd.
+
+Signed-off-by: Sebastian Wick <sebastian@sebastianwick.net>
+[james.hilliard1 at gmail.com: backport from upstream commit
+f0d3a6149158f682230ae9a1e69289431974f635]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ shared/os-compatibility.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/shared/os-compatibility.c b/shared/os-compatibility.c
+index 041c929f..2e12b7cc 100644
+--- a/shared/os-compatibility.c
++++ b/shared/os-compatibility.c
+@@ -340,6 +340,7 @@ os_ro_anonymous_file_get_fd(struct ro_anonymous_file *file,
+ 	void *src, *dst;
+ 	int seals, fd;
+ 
++#ifdef HAVE_MEMFD_CREATE
+ 	seals = fcntl(file->fd, F_GET_SEALS);
+ 
+ 	/* file was sealed for read-only and we don't have to support MAP_SHARED
+@@ -348,6 +349,7 @@ os_ro_anonymous_file_get_fd(struct ro_anonymous_file *file,
+ 	if (seals != -1 && mapmode == RO_ANONYMOUS_FILE_MAPMODE_PRIVATE &&
+ 	    (seals & READONLY_SEALS) == READONLY_SEALS)
+ 		return file->fd;
++#endif
+ 
+ 	/* for all other cases we create a new anonymous file that can be mapped
+ 	 * with MAP_SHARED and copy the contents to it and return that instead
+@@ -388,17 +390,18 @@ os_ro_anonymous_file_get_fd(struct ro_anonymous_file *file,
+ int
+ os_ro_anonymous_file_put_fd(int fd)
+ {
++#ifdef HAVE_MEMFD_CREATE
+ 	int seals = fcntl(fd, F_GET_SEALS);
+ 	if (seals == -1 && errno != EINVAL)
+ 		return -1;
+ 
+-	/* If the fd cannot be sealed seals is -1 at this point
+-	 * or the file can be sealed but has not been sealed for writing.
+-	 * In both cases we created a new anonymous file that we have to
+-	 * close.
++	/* The only case in which we do NOT have to close the file is when the file
++	 * was sealed for read-only
+ 	 */
+-	if (seals == -1 || !(seals & F_SEAL_WRITE))
+-		close(fd);
++	if (seals != -1 && (seals & READONLY_SEALS) == READONLY_SEALS)
++		return 0;
++#endif
+ 
++	close(fd);
+ 	return 0;
+ }
+-- 
+2.20.1
+
