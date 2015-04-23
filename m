From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 24 Apr 2015 01:12:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: fix musl compile
Message-ID: <1429830746-30309-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Expand existing rpmatch() patch for uClibc to musl. Add another patch to
fix more compile issues with musl.

Patches sent upstream:
1) "include/common.h: fix build against musl"
   [http://patchwork.ozlabs.org/patch/464074/]
2) "Makefile: fix build against musl"
   [http://patchwork.ozlabs.org/patch/464072/]
3) "lib/libfec.c: fix build against musl"
   [http://patchwork.ozlabs.org/patch/464073/]

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...1-Fix-rpmatch-call-under-uClibc-and-musl.patch} | 49 ++++++++++++++--------
 .../0002-Fix-compile-against-musl-C-library.patch  | 46 ++++++++++++++++++++
 2 files changed, 77 insertions(+), 18 deletions(-)
 rename package/mtd/{0001-Fix-rpmatch-call-under-uClibc.patch => 0001-Fix-rpmatch-call-under-uClibc-and-musl.patch} (54%)
 create mode 100644 package/mtd/0002-Fix-compile-against-musl-C-library.patch

diff --git a/package/mtd/0001-Fix-rpmatch-call-under-uClibc.patch b/package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
similarity index 54%
rename from package/mtd/0001-Fix-rpmatch-call-under-uClibc.patch
rename to package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
index 910a501..0963456 100644
--- a/package/mtd/0001-Fix-rpmatch-call-under-uClibc.patch
+++ b/package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
@@ -1,12 +1,14 @@
-From aebb2831c13ffc6f1df79e638b99e78c52aed4ce Mon Sep 17 00:00:00 2001
-Message-Id: <aebb2831c13ffc6f1df79e638b99e78c52aed4ce.1397593673.git.baruch@tkos.co.il>
+From b64616e1403090ad388a115d61bfc8671b5a5853 Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Sun, 13 Apr 2014 15:26:46 +0300
-Subject: [PATCH] Fix rpmatch() call under uClibc
+Subject: [PATCH 1/2] Fix rpmatch() call under uClibc and musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
-Combine the following two patches. The first is upstream (commit 50c9e11f7e),
-the second has been posted upstream at
-http://patchwork.ozlabs.org/patch/339365/.
+Combine the following two upstream uClibc (commit 50c9e11f7e and
+5923077649) and a musl patch sent to the mailing list
+(http://patchwork.ozlabs.org/patch/464074/).
 
 include/common.h: fix build against current uClibc
 
@@ -25,25 +27,38 @@ So the uClibc version check introduced in commit 50c9e11f7e (include/common.h:
 fix build against current uClibc) is not enough. Rename the local rpmatch()
 implementation to avoid collision.
 
+include/common.h: fix build against musl
+
+Like uClibc version older than (not yet released) 0.9.34 musl does not have
+a rpmatch() implementation.
+
+uClibc defines both __UCLIBC__ and __GLIBC__. So first check for uCibc and its
+version and then for a non glibc implementation (like musl). Note, musl does
+not define __MUSL__.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
 Cc: Mike Frysinger <vapier@gentoo.org>
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 ---
  include/common.h | 14 ++++++++++++++
  1 file changed, 14 insertions(+)
 
 diff --git a/include/common.h b/include/common.h
-index 4ffccea17213..838dc757bdf1 100644
+index 4ffccea..d1be21e 100644
 --- a/include/common.h
 +++ b/include/common.h
 @@ -102,6 +102,20 @@ extern "C" {
- 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
- } while(0)
- 
-+#if defined(__UCLIBC__)
-+/* uClibc versions before 0.9.34 don't have rpmatch() */
-+#if __UCLIBC_MAJOR__ == 0 && \
+	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
+} while(0)
+
++/* uClibc versions before 0.9.34 and musl don't have rpmatch() */
++#if defined(__UCLIBC__) && \
++		(__UCLIBC_MAJOR__ == 0 && \
 +		(__UCLIBC_MINOR__ < 9 || \
-+		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))
++		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))) || \
++	!defined(__GLIBC__)
 +#define rpmatch __rpmatch
 +static inline int __rpmatch(const char *resp)
 +{
@@ -51,11 +66,9 @@ index 4ffccea17213..838dc757bdf1 100644
 +	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
 +}
 +#endif
-+#endif
 +
  /**
   * prompt the user for confirmation
   */
--- 
-1.9.1
-
+--
+2.3.6
diff --git a/package/mtd/0002-Fix-compile-against-musl-C-library.patch b/package/mtd/0002-Fix-compile-against-musl-C-library.patch
new file mode 100644
index 0000000..9c2cfed
--- /dev/null
+++ b/package/mtd/0002-Fix-compile-against-musl-C-library.patch
@@ -0,0 +1,46 @@
+From 47f7d86eb9483ace5f275db3d0574f1af54a598f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 31 Mar 2015 00:27:48 +0200
+Subject: [PATCH 2/2] Fix compile against musl C library
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Makefile:
+  - fix undefined reference to 'libintl_gettext'
+lib/libfec.c:
+  - add missing #include <sys/types.h> for u_long
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile     | 2 +-
+ lib/libfec.c | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index eade234..36bb700 100644
+--- a/Makefile
++++ b/Makefile
+@@ -105,7 +105,7 @@ $(call _mkdep,lib/,libmtd.a)
+ obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
+	hashtable/hashtable.o hashtable/hashtable_itr.o
+ LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
+-LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
++LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -lintl
+ $(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
+
+ #
+diff --git a/lib/libfec.c b/lib/libfec.c
+index ff5a127..c5e7749 100644
+--- a/lib/libfec.c
++++ b/lib/libfec.c
+@@ -45,6 +45,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/types.h>
+
+ /*
+  * stuff used for testing purposes only
+--
+2.3.6
-- 
2.3.6
