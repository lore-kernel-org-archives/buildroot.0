From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Aug 2015 17:41:32 -0300
Subject: [Buildroot] [PATCH] mtd: bump to version 1.5.2
Message-ID: <1438634492-31171-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches upstream so drop them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...01-Fix-rpmatch-call-under-uClibc-and-musl.patch | 78 ----------------------
 .../0002-lib-libfec.c-fix-build-against-musl.patch | 29 --------
 .../0003-serve_image-do-not-include-error.h.patch  | 30 ---------
 .../0004-recv_image-do-not-include-error.h.patch   | 30 ---------
 .../0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch   | 76 ---------------------
 package/mtd/mtd.hash                               |  4 +-
 package/mtd/mtd.mk                                 |  2 +-
 7 files changed, 3 insertions(+), 246 deletions(-)
 delete mode 100644 package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
 delete mode 100644 package/mtd/0002-lib-libfec.c-fix-build-against-musl.patch
 delete mode 100644 package/mtd/0003-serve_image-do-not-include-error.h.patch
 delete mode 100644 package/mtd/0004-recv_image-do-not-include-error.h.patch
 delete mode 100644 package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch

diff --git a/package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch b/package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
deleted file mode 100644
index fa2e709..0000000
--- a/package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From b56296212c27071f06d98cdad6b32b7db583adb0 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 13 Apr 2014 15:26:46 +0300
-Subject: [PATCH 1/1] Fix rpmatch() call under uClibc and musl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The current uClibc 0.9.33 and the musl C library do not implement rpmatch().
-
-Combine two upstream uClibc patches (commit 50c9e11f7e and
-5923077649) and a musl patch sent to the mailing list
-(http://patchwork.ozlabs.org/patch/464074/).
-
-include/common.h: fix build against current uClibc
-
-Commit dbe0fd17f2 (mtd-utils: new prompt() helper for talking to the user)
-introduced a rpmatch() call. However, uClibc versions older than (not yet
-released) 0.9.34 don't have rpmatch() implementation. Add one.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
-Acked-by: Mike Frysinger <vapier@gentoo.org>
-
-include/common.h: fix build against recent 0.9.33 uClibc
-
-An implementation of rpmatch() was backported to the 0.9.33 branch of uClibc.
-So the uClibc version check introduced in commit 50c9e11f7e (include/common.h:
-fix build against current uClibc) is not enough. Rename the local rpmatch()
-implementation to avoid collision.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Acked-by: Mike Frysinger <vapier@gentoo.org>
-Signed-off-by: Brian Norris <computersforpeace@gmail.com>
-
-include/common.h: fix build against musl
-
-Like uClibc version older than (not yet released) 0.9.34 musl does not have
-a rpmatch() implementation.
-
-uClibc defines both __UCLIBC__ and __GLIBC__. So first check for uCibc and its
-version and then for a non glibc implementation (like musl). Note, musl does
-not define __MUSL__.
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- include/common.h | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/include/common.h b/include/common.h
-index 4ffccea..944c712 100644
---- a/include/common.h
-+++ b/include/common.h
-@@ -102,6 +102,21 @@ extern "C" {
- 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
- } while(0)
- 
-+/* uClibc versions before 0.9.34 and musl don't have rpmatch() */
-+#if defined(__UCLIBC__) && \
-+		(__UCLIBC_MAJOR__ == 0 && \
-+		(__UCLIBC_MINOR__ < 9 || \
-+		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))) || \
-+	!defined(__GLIBC__)
-+#undef rpmatch
-+#define rpmatch __rpmatch
-+static inline int __rpmatch(const char *resp)
-+{
-+    return (resp[0] == 'y' || resp[0] == 'Y') ? 1 :
-+	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
-+}
-+#endif
-+
- /**
-  * prompt the user for confirmation
-  */
--- 
-2.3.6
-
diff --git a/package/mtd/0002-lib-libfec.c-fix-build-against-musl.patch b/package/mtd/0002-lib-libfec.c-fix-build-against-musl.patch
deleted file mode 100644
index 3b1da53..0000000
--- a/package/mtd/0002-lib-libfec.c-fix-build-against-musl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7086438e488fa57c1add720590256f2c92602877 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Tue, 31 Mar 2015 00:31:34 +0200
-Subject: [PATCH 2/4] lib/libfec.c: fix build against musl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Add missing #include <sys/types.h> for u_long.
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- lib/libfec.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/libfec.c b/lib/libfec.c
-index ff5a127..c5e7749 100644
---- a/lib/libfec.c
-+++ b/lib/libfec.c
-@@ -45,6 +45,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/types.h>
-
- /*
-  * stuff used for testing purposes only
---
-2.3.6
diff --git a/package/mtd/0003-serve_image-do-not-include-error.h.patch b/package/mtd/0003-serve_image-do-not-include-error.h.patch
deleted file mode 100644
index 1b5c8dc..0000000
--- a/package/mtd/0003-serve_image-do-not-include-error.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2734daedb65c9cc43c0d5247b580c599953102fe Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Fri, 24 Apr 2015 22:04:45 +0200
-Subject: [PATCH 3/4] serve_image: do not include error.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-serve_image does not use anything from it and it is not available with all
-C libraries.
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- serve_image.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/serve_image.c b/serve_image.c
-index 38549a1..4f0e946 100644
---- a/serve_image.c
-+++ b/serve_image.c
-@@ -3,7 +3,6 @@
-
- #include <time.h>
- #include <errno.h>
--#include <error.h>
- #include <netdb.h>
- #include <stdio.h>
- #include <stdlib.h>
---
-2.3.6
diff --git a/package/mtd/0004-recv_image-do-not-include-error.h.patch b/package/mtd/0004-recv_image-do-not-include-error.h.patch
deleted file mode 100644
index 5c58dce..0000000
--- a/package/mtd/0004-recv_image-do-not-include-error.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c5837be1cc2422fc16b1fe030548e5a3ab951a54 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Fri, 24 Apr 2015 22:06:31 +0200
-Subject: [PATCH 4/4] recv_image: do not include error.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-recv_image does not use anything from it and it is not available with all
-C libraries.
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- recv_image.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/recv_image.c b/recv_image.c
-index 26a8361..0093831 100644
---- a/recv_image.c
-+++ b/recv_image.c
-@@ -4,7 +4,6 @@
- #define _BSD_SOURCE	/* struct ip_mreq */
-
- #include <errno.h>
--#include <error.h>
- #include <stdio.h>
- #include <netdb.h>
- #include <stdlib.h>
---
-2.3.6
diff --git a/package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch b/package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch
deleted file mode 100644
index 7ae691e..0000000
--- a/package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From patchwork Sat May  2 12:38:06 2015
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: mkfs.ubifs: Fix build with gcc 5.1
-From: Bernhard Walle <bernhard@bwalle.de>
-X-Patchwork-Id: 467254
-Message-Id: <1430570286-30434-1-git-send-email-bernhard@bwalle.de>
-To: linux-mtd at lists.infradead.org
-Cc: Bernhard Walle <bernhard@bwalle.de>
-Date: Sat,  2 May 2015 14:38:06 +0200
-
-In gcc 5.1, the default C standard which is used to compile a C file,
-has changed from gnu89 to gnu11. This changed the meaning of 'extern
-inline'. See https://gcc.gnu.org/gcc-5/porting_to.html.
-
-In mkfs.ubifs, this leads to multiple definitions of
-hashtable_iterator_key and -hashtable_iterator_value. I think the most
-pragmatic way to fix the issue is to replace 'extern inline' with
-'static inline' here.
-
-Fetch from:
-https://patchwork.ozlabs.org/patch/467254/
-
-Signed-off-by: Bernhard Walle <bernhard@bwalle.de>
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- mkfs.ubifs/hashtable/hashtable_itr.c | 12 ------------
- mkfs.ubifs/hashtable/hashtable_itr.h |  4 ++--
- 2 files changed, 2 insertions(+), 14 deletions(-)
-
-diff --git a/mkfs.ubifs/hashtable/hashtable_itr.c b/mkfs.ubifs/hashtable/hashtable_itr.c
-index 24f4dde..d102453 100644
---- a/mkfs.ubifs/hashtable/hashtable_itr.c
-+++ b/mkfs.ubifs/hashtable/hashtable_itr.c
-@@ -35,18 +35,6 @@ hashtable_iterator(struct hashtable *h)
- }
- 
- /*****************************************************************************/
--/* key      - return the key of the (key,value) pair at the current position */
--/* value    - return the value of the (key,value) pair at the current position */
--
--void *
--hashtable_iterator_key(struct hashtable_itr *i)
--{ return i->e->k; }
--
--void *
--hashtable_iterator_value(struct hashtable_itr *i)
--{ return i->e->v; }
--
--/*****************************************************************************/
- /* advance - advance the iterator to the next element
-  *           returns zero if advanced to end of table */
- 
-diff --git a/mkfs.ubifs/hashtable/hashtable_itr.h b/mkfs.ubifs/hashtable/hashtable_itr.h
-index 87a97eb..5c94a04 100644
---- a/mkfs.ubifs/hashtable/hashtable_itr.h
-+++ b/mkfs.ubifs/hashtable/hashtable_itr.h
-@@ -28,7 +28,7 @@ hashtable_iterator(struct hashtable *h);
- /* hashtable_iterator_key
-  * - return the value of the (key,value) pair at the current position */
- 
--extern inline void *
-+static inline void *
- hashtable_iterator_key(struct hashtable_itr *i)
- {
-     return i->e->k;
-@@ -37,7 +37,7 @@ hashtable_iterator_key(struct hashtable_itr *i)
- /*****************************************************************************/
- /* value - return the value of the (key,value) pair at the current position */
- 
--extern inline void *
-+static inline void *
- hashtable_iterator_value(struct hashtable_itr *i)
- {
-     return i->e->v;
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 79b90ae..a99e04e 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.5.1.tar.bz2.asc
-sha256 3b2ed1d05f73bd3789a85bebf5072874a72f8daf63552fd44a94e2a9acf1620b mtd-utils-1.5.1.tar.bz2
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.5.2.tar.bz2.asc
+sha256	5db57389280a3abaec5dd23af2590988b70f213fa3929c12a2642c8f9a86f400	mtd-utils-1.5.2.tar.bz2
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 535e580..edf6e08 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 1.5.1
+MTD_VERSION = 1.5.2
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPLv2
-- 
2.4.6
