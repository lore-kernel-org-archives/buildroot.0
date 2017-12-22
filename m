From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Dec 2017 10:16:48 +0100
Subject: [Buildroot] [git commit] strace: bump to version 4.20
Message-ID: <20171222091829.738C583637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c0829f8e527c8d14feca06c5b4f9f8e2e332ae6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...s-fix-program_invocation_name-type-confli.patch | 45 ----------------------
 package/strace/strace.hash                         | 10 ++---
 package/strace/strace.mk                           |  2 +-
 3 files changed, 6 insertions(+), 51 deletions(-)

diff --git a/package/strace/0001-error_prints-fix-program_invocation_name-type-confli.patch b/package/strace/0001-error_prints-fix-program_invocation_name-type-confli.patch
deleted file mode 100644
index 9c982f3..0000000
--- a/package/strace/0001-error_prints-fix-program_invocation_name-type-confli.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 96ad51b91c6ab7ff8bac58f90f199324baed07af Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 8 Sep 2017 12:08:13 +0300
-Subject: [PATCH] error_prints: fix program_invocation_name type conflict
-
-uClibc-ng declares program_invocation_name as const. This causes the
-build failure below:
-
-error_prints.c:40:14: error: conflicting types for ???program_invocation_name???
- extern char *program_invocation_name;
-              ^~~~~~~~~~~~~~~~~~~~~~~
-In file included from error_prints.c:32:0:
-.../output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/errno.h:54:20: note: previous declaration of ???program_invocation_name??? was here
- extern const char *program_invocation_name, *program_invocation_short_name;
-                    ^~~~~~~~~~~~~~~~~~~~~~~
-Makefile:3856: recipe for target 'strace-error_prints.o' failed
-
-Declare program_invocation_name only when the C library does not provide
-one.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: merged,
-https://github.com/strace/strace/commit/d45f27147f7d95eb209463dc03dc039ea3f15b59
-
- error_prints.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/error_prints.c b/error_prints.c
-index 8519b9246698..710e99b04ab9 100644
---- a/error_prints.c
-+++ b/error_prints.c
-@@ -37,7 +37,9 @@
- 
- #include "error_prints.h"
- 
-+#ifndef HAVE_PROGRAM_INVOCATION_NAME
- extern char *program_invocation_name;
-+#endif
- 
- static void
- verror_msg(int err_no, const char *fmt, va_list p)
--- 
-2.14.1
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index cd3ba1d..404be39 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/strace/files/strace/4.19/
-md5	846a9a26e74e797f42d77a0348104072	strace-4.19.tar.xz
-sha1	43091b8a07c227a6ffafd6d0f9536917c9447011	strace-4.19.tar.xz
+# From https://sourceforge.net/projects/strace/files/strace/4.20/
+md5	f2271ab0fac49ebee9cbd7f3469227cb	strace-4.20.tar.xz
+sha1	9cebc754af3434e4027a07745770892f685c0316	strace-4.20.tar.xz
 # Locally calculated after checking signature
-# https://sourceforge.net/projects/strace/files/strace/4.19/strace-4.19.tar.xz.asc
-sha256	7c93ebc6c29280f47c24a0eb86873a99ccb2cac6512c60a60ba4ef99ab807281	strace-4.19.tar.xz
+# https://sourceforge.net/projects/strace/files/strace/4.20/strace-4.20.tar.xz.asc
+sha256	5bf3148dd17306a42566f7da17368fdd781afa147db05ea63a4ca2b50f58c523	strace-4.20.tar.xz
 sha256	ea7ff222f36c9df0aa2924a8f7c7d2aec3ea11e752feba4b15ec79b695b6236a	COPYING
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index dc36021..ba57774 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.19
+STRACE_VERSION = 4.20
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3-Clause
