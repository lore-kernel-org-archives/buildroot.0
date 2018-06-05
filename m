From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 22:10:39 +0200
Subject: [Buildroot] [git commit] libbsd: bump to version 0.9.1
Message-ID: <20180605201321.A6C3783C46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64aec332bf4eada6df9453d60c17460e6c17dd39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Add a patch fixing build with musl libc.

Update the list of licenses based on the content of COPYING. The
BSD-5-Clause license is not listed by SPDX, but that is its name in the
COPYING file.

Update the license file hash: new licenses, dates update, reformat.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-declaration-protection-for-glibc-alread.patch |  80 -------
 .../0001-flopen-fix-build-with-musl-libc.patch     |  40 ++++
 .../0002-Fix-build-for-openrisc-with-uClibc.patch  |  48 -----
 .../0003-Handle-systems-missing-sys-cdefs.h.patch  | 230 ---------------------
 package/libbsd/libbsd.hash                         |   6 +-
 package/libbsd/libbsd.mk                           |   5 +-
 6 files changed, 46 insertions(+), 363 deletions(-)

diff --git a/package/libbsd/0001-Fix-function-declaration-protection-for-glibc-alread.patch b/package/libbsd/0001-Fix-function-declaration-protection-for-glibc-alread.patch
deleted file mode 100644
index fdf45bdef6..0000000000
--- a/package/libbsd/0001-Fix-function-declaration-protection-for-glibc-alread.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 1f8a3f7bccfc84b195218ad0086ebd57049c3490 Mon Sep 17 00:00:00 2001
-From: Guillem Jover <guillem@hadrons.org>
-Date: Tue, 6 Mar 2018 01:39:45 +0100
-Subject: [PATCH] Fix function declaration protection for glibc already
- providing them
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On non-glibc based systems we cannot unconditionally use the
-__GLIBC_PREREQ macro as it gets expanded before evaluation. Instead,
-if it is undefined, define it to 0.
-
-We should also always declare these functions on non-glibc based
-systems. And on systems with a new enough glibc, which provides these
-functions, we should still provide the declarations if _GNU_SOURCE
-is *not* defined.
-
-Backported from:
-https://cgit.freedesktop.org/libbsd/patch/?id=1f8a3f7bccfc84b195218ad0086ebd57049c3490
-
-Reported-by: J??rg Krause <joerg.krause@embedded.rocks>
-Signed-off-by: Guillem Jover <guillem@hadrons.org>
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- include/bsd/stdlib.h    | 3 ++-
- include/bsd/string.h    | 3 ++-
- include/bsd/sys/cdefs.h | 8 ++++++++
- 3 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/include/bsd/stdlib.h b/include/bsd/stdlib.h
-index 8d33d1f..a5b063c 100644
---- a/include/bsd/stdlib.h
-+++ b/include/bsd/stdlib.h
-@@ -71,7 +71,8 @@ int sradixsort(const unsigned char **base, int nmemb,
-                const unsigned char *table, unsigned endbyte);
- 
- void *reallocf(void *ptr, size_t size);
--#if defined(_GNU_SOURCE) && defined(__GLIBC__) && !__GLIBC_PREREQ(2, 26)
-+#if !defined(__GLIBC__) || \
-+    (defined(__GLIBC__) && (!__GLIBC_PREREQ(2, 26) || !defined(_GNU_SOURCE)))
- void *reallocarray(void *ptr, size_t nmemb, size_t size);
- #endif
- 
-diff --git a/include/bsd/string.h b/include/bsd/string.h
-index 29097f6..f987fee 100644
---- a/include/bsd/string.h
-+++ b/include/bsd/string.h
-@@ -46,7 +46,8 @@ size_t strlcat(char *dst, const char *src, size_t siz);
- char *strnstr(const char *str, const char *find, size_t str_len);
- void strmode(mode_t mode, char *str);
- 
--#if defined(_GNU_SOURCE) && defined(__GLIBC__) && !__GLIBC_PREREQ(2, 25)
-+#if !defined(__GLIBC__) || \
-+    (defined(__GLIBC__) && (!__GLIBC_PREREQ(2, 25) || !defined(_GNU_SOURCE)))
- void explicit_bzero(void *buf, size_t len);
- #endif
- __END_DECLS
-diff --git a/include/bsd/sys/cdefs.h b/include/bsd/sys/cdefs.h
-index b4c8f30..d1cc419 100644
---- a/include/bsd/sys/cdefs.h
-+++ b/include/bsd/sys/cdefs.h
-@@ -58,6 +58,14 @@
- #endif
- #endif
- 
-+/*
-+ * On non-glibc based systems, we cannot unconditionally use the
-+ * __GLIBC_PREREQ macro as it gets expanded before evaluation.
-+ */
-+#ifndef __GLIBC_PREREQ
-+#define __GLIBC_PREREQ(maj, min) 0
-+#endif
-+
- /*
-  * Some kFreeBSD headers expect those macros to be set for sanity checks.
-  */
--- 
-2.16.2
-
diff --git a/package/libbsd/0001-flopen-fix-build-with-musl-libc.patch b/package/libbsd/0001-flopen-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..6f0aeffed7
--- /dev/null
+++ b/package/libbsd/0001-flopen-fix-build-with-musl-libc.patch
@@ -0,0 +1,40 @@
+From 8575450b9c1226fc38196b29e33c67f2b58cacf5 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 5 Jun 2018 19:18:47 +0300
+Subject: [PATCH] flopen: fix build with musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 993828d84ee (Add flopenat() function from FreeBSD) dropped the
+fcntl.h header. This breaks the build with musl libc:
+
+flopen.c: In function ???vflopenat???:
+flopen.c:60:14: error: ???O_CREAT??? undeclared (first use in this function)
+  if (flags & O_CREAT) {
+              ^~~~~~~
+
+Restore the fcntl.h header include to fix the build.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: sent to libbsd at lists.freedesktop.org
+
+ src/flopen.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/flopen.c b/src/flopen.c
+index b9972c94ec90..ff20d074445b 100644
+--- a/src/flopen.c
++++ b/src/flopen.c
+@@ -32,6 +32,7 @@
+ #include <sys/stat.h>
+ 
+ #include <errno.h>
++#include <fcntl.h>
+ #include <stdarg.h>
+ #include <unistd.h>
+ 
+-- 
+2.17.1
+
diff --git a/package/libbsd/0002-Fix-build-for-openrisc-with-uClibc.patch b/package/libbsd/0002-Fix-build-for-openrisc-with-uClibc.patch
deleted file mode 100644
index 1b28df5a8b..0000000000
--- a/package/libbsd/0002-Fix-build-for-openrisc-with-uClibc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From aa902671bf1e0e808fd994bd6b403d70af7ab6dd Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 3 Apr 2018 20:02:14 +0300
-Subject: [PATCH] Fix build for openrisc with uClibc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-uClibc defines EM_OR1K instead of EM_OPENRISC for the OpenRISC ELF
-e_machine ID. Use EM_OR1K when EM_OPENRISC is not defined.
-
-This fixes the following build failure:
-
-In file included from nlist.c:44:0:
-nlist.c: In function ???__elf_is_okay__???:
-local-elf.h:224:23: error: ???EM_OPENRISC??? undeclared (first use in this function)
- #define ELF_TARG_MACH EM_OPENRISC
-                       ^
-nlist.c:77:26: note: in expansion of macro ???ELF_TARG_MACH???
-   if (ehdr->e_machine == ELF_TARG_MACH &&
-                          ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: sent to libbsd at lists.freedesktop.org
-
- src/local-elf.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/local-elf.h b/src/local-elf.h
-index 1faf182f87d7..79f7d026f6c9 100644
---- a/src/local-elf.h
-+++ b/src/local-elf.h
-@@ -221,7 +221,11 @@
- 
- #elif defined(__or1k__)
- 
-+#if defined(EM_OPENRISC)
- #define ELF_TARG_MACH	EM_OPENRISC
-+#else
-+#define ELF_TARG_MACH	EM_OR1K
-+#endif
- #define ELF_TARG_CLASS	ELFCLASS32
- #define ELF_TARG_DATA	ELFDATA2MSB
- 
--- 
-2.16.3
-
diff --git a/package/libbsd/0003-Handle-systems-missing-sys-cdefs.h.patch b/package/libbsd/0003-Handle-systems-missing-sys-cdefs.h.patch
deleted file mode 100644
index 2cf7a5f09f..0000000000
--- a/package/libbsd/0003-Handle-systems-missing-sys-cdefs.h.patch
+++ /dev/null
@@ -1,230 +0,0 @@
-From 11ec8f1e5dfa1c10e0c9fb94879b6f5b96ba52dd Mon Sep 17 00:00:00 2001
-From: Guillem Jover <guillem@hadrons.org>
-Date: Tue, 6 Mar 2018 01:41:35 +0100
-Subject: [PATCH] Handle systems missing <sys/cdefs.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This is a non-portable header, and we cannot expect it to be provided by
-the system libc (e.g. musl). We just need and rely on declaration that
-we have defined ourselves in our own <bsd/sys/cdefs.h>. So we switch to
-only ever assume that.
-
-Fixes: https://bugs.freedesktop.org/105281
-
-Backported from: 11ec8f1e5dfa1c10e0c9fb94879b6f5b96ba52dd
-
-Signed-off-by: Guillem Jover <guillem@hadrons.org>
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- include/bsd/libutil.h        | 4 ++++
- include/bsd/md5.h            | 4 ++++
- include/bsd/nlist.h          | 4 ++++
- include/bsd/readpassphrase.h | 4 ++++
- include/bsd/stdlib.h         | 4 ++++
- include/bsd/string.h         | 4 ++++
- include/bsd/stringlist.h     | 5 +++++
- include/bsd/sys/queue.h      | 4 ++++
- include/bsd/sys/tree.h       | 4 ++++
- include/bsd/timeconv.h       | 4 ++++
- include/bsd/vis.h            | 4 ++++
- include/bsd/wchar.h          | 4 ++++
- 12 files changed, 49 insertions(+)
-
-diff --git a/include/bsd/libutil.h b/include/bsd/libutil.h
-index 45b3b15..ccca29a 100644
---- a/include/bsd/libutil.h
-+++ b/include/bsd/libutil.h
-@@ -40,7 +40,11 @@
- #define LIBBSD_LIBUTIL_H
- 
- #include <features.h>
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- #include <sys/types.h>
- #include <stdint.h>
- #include <stdio.h>
-diff --git a/include/bsd/md5.h b/include/bsd/md5.h
-index 5f3ae46..bf36a30 100644
---- a/include/bsd/md5.h
-+++ b/include/bsd/md5.h
-@@ -27,7 +27,11 @@ typedef struct MD5Context {
- 	uint8_t buffer[MD5_BLOCK_LENGTH];	/* input buffer */
- } MD5_CTX;
- 
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- #include <sys/types.h>
- 
- __BEGIN_DECLS
-diff --git a/include/bsd/nlist.h b/include/bsd/nlist.h
-index cb297e8..8767117 100644
---- a/include/bsd/nlist.h
-+++ b/include/bsd/nlist.h
-@@ -27,7 +27,11 @@
- #ifndef LIBBSD_NLIST_H
- #define LIBBSD_NLIST_H
- 
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- 
- struct nlist {
- 	union {
-diff --git a/include/bsd/readpassphrase.h b/include/bsd/readpassphrase.h
-index 14744b8..5eb8021 100644
---- a/include/bsd/readpassphrase.h
-+++ b/include/bsd/readpassphrase.h
-@@ -31,7 +31,11 @@
- #define RPP_SEVENBIT    0x10		/* Strip the high bit from input. */
- #define RPP_STDIN       0x20		/* Read from stdin, not /dev/tty */
- 
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- #include <sys/types.h>
- 
- __BEGIN_DECLS
-diff --git a/include/bsd/stdlib.h b/include/bsd/stdlib.h
-index ebc9638..8d33d1f 100644
---- a/include/bsd/stdlib.h
-+++ b/include/bsd/stdlib.h
-@@ -42,7 +42,11 @@
- #ifndef LIBBSD_STDLIB_H
- #define LIBBSD_STDLIB_H
- 
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- #include <sys/stat.h>
- #include <stdint.h>
- 
-diff --git a/include/bsd/string.h b/include/bsd/string.h
-index 6798bf6..29097f6 100644
---- a/include/bsd/string.h
-+++ b/include/bsd/string.h
-@@ -33,7 +33,11 @@
- #ifndef LIBBSD_STRING_H
- #define LIBBSD_STRING_H
- 
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- #include <sys/types.h>
- 
- __BEGIN_DECLS
-diff --git a/include/bsd/stringlist.h b/include/bsd/stringlist.h
-index ff30cac..dd71496 100644
---- a/include/bsd/stringlist.h
-+++ b/include/bsd/stringlist.h
-@@ -31,7 +31,12 @@
- 
- #ifndef LIBBSD_STRINGLIST_H
- #define LIBBSD_STRINGLIST_H
-+
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- #include <sys/types.h>
- 
- /*
-diff --git a/include/bsd/sys/queue.h b/include/bsd/sys/queue.h
-index 4a94ea7..ac00026 100644
---- a/include/bsd/sys/queue.h
-+++ b/include/bsd/sys/queue.h
-@@ -33,7 +33,11 @@
- #ifndef LIBBSD_SYS_QUEUE_H
- #define LIBBSD_SYS_QUEUE_H
- 
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- 
- /*
-  * This file defines four types of data structures: singly-linked lists,
-diff --git a/include/bsd/sys/tree.h b/include/bsd/sys/tree.h
-index 628bec0..325b382 100644
---- a/include/bsd/sys/tree.h
-+++ b/include/bsd/sys/tree.h
-@@ -30,7 +30,11 @@
- #ifndef LIBBSD_SYS_TREE_H
- #define LIBBSD_SYS_TREE_H
- 
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- 
- /*
-  * This file defines data structures for different types of trees:
-diff --git a/include/bsd/timeconv.h b/include/bsd/timeconv.h
-index e2a2c55..a426bd3 100644
---- a/include/bsd/timeconv.h
-+++ b/include/bsd/timeconv.h
-@@ -41,7 +41,11 @@
- #ifndef LIBBSD_TIMECONV_H
- #define LIBBSD_TIMECONV_H
- 
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- #include <stdint.h>
- #include <time.h>
- 
-diff --git a/include/bsd/vis.h b/include/bsd/vis.h
-index 970dfdd..ab5430c 100644
---- a/include/bsd/vis.h
-+++ b/include/bsd/vis.h
-@@ -72,7 +72,11 @@
-  */
- #define	UNVIS_END	1	/* no more characters */
- 
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- 
- __BEGIN_DECLS
- char	*vis(char *, int, int, int);
-diff --git a/include/bsd/wchar.h b/include/bsd/wchar.h
-index 33a500e..7216503 100644
---- a/include/bsd/wchar.h
-+++ b/include/bsd/wchar.h
-@@ -40,7 +40,11 @@
- #define LIBBSD_WCHAR_H
- 
- #include <stddef.h>
-+#ifdef LIBBSD_OVERLAY
- #include <sys/cdefs.h>
-+#else
-+#include <bsd/sys/cdefs.h>
-+#endif
- #include <sys/types.h>
- 
- __BEGIN_DECLS
--- 
-2.17.0
-
diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 133df90cb9..93af3944ae 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,3 +1,3 @@
-# From https://lists.freedesktop.org/archives/libbsd/2018-January/000166.html
-sha256	f548f10e5af5a08b1e22889ce84315b1ebe41505b015c9596bad03fd13a12b31	libbsd-0.8.7.tar.xz
-sha256	0b6cedd686394f9c811a6a9fd314d68ab4738475ad3d9df61154259fa649a2a7	COPYING
+# From https://lists.freedesktop.org/archives/libbsd/2018-May/000190.html
+sha256	56d835742327d69faccd16955a60b6dcf30684a8da518c4eca0ac713b9e0a7a4	libbsd-0.9.1.tar.xz
+sha256	df6d8e1b5b3a5b06376c658c8ad3afc82687f1c0e0404cec4738ad14b2675708	COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index e211389ec7..2d78b8c5f3 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.8.7
+LIBBSD_VERSION = 0.9.1
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = https://archive.hadrons.org/software/libbsd
-LIBBSD_LICENSE = BSD-3-Clause, MIT
+LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
+		MIT, ISC, Beerware
 LIBBSD_LICENSE_FILES = COPYING
 LIBBSD_INSTALL_STAGING = YES
 
