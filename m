From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2020 20:46:42 +0100
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.50
Message-ID: <20200208193633.7C3A58D5A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcefe548f94d966e7b966c16359027bda209632d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires already bumped libnspr version 4.25.

Release notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.50_release_notes

Drop all patches since they have been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-add-zlib-include-dir-variable.patch       | 49 ----------------------
 ...2743-Fix-PowerPc-build-sys-auxv.h-failure.patch | 40 ------------------
 package/libnss/libnss.hash                         |  4 +-
 package/libnss/libnss.mk                           |  2 +-
 4 files changed, 3 insertions(+), 92 deletions(-)

diff --git a/package/libnss/0001-add-zlib-include-dir-variable.patch b/package/libnss/0001-add-zlib-include-dir-variable.patch
deleted file mode 100644
index cd0bdeec31..0000000000
--- a/package/libnss/0001-add-zlib-include-dir-variable.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Add ZLIB_INCLUDE_DIR variable
-
-On Linux platform[1], the build system forces to use zlib from the
-system instead of compiling the one located intree.
-
-The following error is raised when the zlib header is installed
-somewhere else than in the default system include path:
-
-	ssl3con.c:39:18: fatal error: zlib.h: No such file or directory
-	 #include "zlib.h"
-
-The same trick setup for sqlite include directory is reproduced for
-zlib. The build system disallows in any manner to give arguments to the
-compiler explicity.
-
-The variable ZLIB_INCLUDE_DIR point to the directory where the zlib
-header is located.
-
-[1]: https://hg.mozilla.org/projects/nss/file/NSS_3_33_BRANCH/coreconf/Linux.mk#l180
-[2]: https://hg.mozilla.org/projects/nss/file/NSS_3_33_BRANCH/lib/softoken/manifest.mn#l17
-
-Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
-
---- libnss-3.33.orig/nss/lib/ssl/manifest.mn	2017-09-20 02:47:27.000000000 -0400
-+++ libnss-3.33/nss/lib/ssl/manifest.mn	2018-02-16 16:45:41.512709898 -0500
-@@ -6,6 +6,10 @@
- 
- # DEFINES = -DTRACE
- 
-+ifdef ZLIB_INCLUDE_DIR
-+INCLUDES += -I$(ZLIB_INCLUDE_DIR)
-+endif
-+
- EXPORTS = \
-         ssl.h \
-         sslt.h \
---- host-libnss-3.33.orig/nss/cmd/signtool/manifest.mn.orig	2018-02-16 17:08:58.474777871 -0500
-+++ host-libnss-3.33/nss/cmd/signtool/manifest.mn	2018-02-16 17:09:22.603710963 -0500
-@@ -6,6 +6,10 @@
- 
- MODULE = nss
- 
-+ifdef ZLIB_INCLUDE_DIR
-+INCLUDES += -I$(ZLIB_INCLUDE_DIR)
-+endif
-+
- EXPORTS = 
- 
- CSRCS = signtool.c		\
diff --git a/package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch b/package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
deleted file mode 100644
index c8f12d777a..0000000000
--- a/package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From efe0fd875c80ff6e3a05db6c5e15b07c173530a6 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 10 Dec 2019 13:06:01 +0100
-Subject: [PATCH] Bug 1602743 - Fix PowerPc build sys/auxv.h failure
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- nss/lib/freebl/blinit.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/nss/lib/freebl/blinit.c b/nss/lib/freebl/blinit.c
-index 959109b60..f0654595d 100644
---- a/nss/lib/freebl/blinit.c
-+++ b/nss/lib/freebl/blinit.c
-@@ -357,7 +357,9 @@ ppc_crypto_support()
- 
- #if defined(__powerpc__)
- 
-+#if (__has_include(<sys/auxv.h>))
- #include <sys/auxv.h>
-+#endif
- 
- // Defines from cputable.h in Linux kernel - PPC, letting us build on older kernels
- #ifndef PPC_FEATURE2_VEC_CRYPTO
-@@ -368,8 +370,11 @@ static void
- CheckPPCSupport()
- {
-     char *disable_hw_crypto = PR_GetEnvSecure("NSS_DISABLE_PPC_GHASH");
-+    long hwcaps = 0;
- 
--    long hwcaps = getauxval(AT_HWCAP2);
-+#if (__has_include(<sys/auxv.h>))
-+    hwcaps = getauxval(AT_HWCAP2);
-+#endif
- 
-     ppc_crypto_support_ = hwcaps & PPC_FEATURE2_VEC_CRYPTO && disable_hw_crypto == NULL;
- }
--- 
-2.20.1
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index dc04acbb6e..f4a6d74ee7 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_49_2_RTM/src/SHA256SUMS
-sha256	faa7502c3ce9240d4be2aa88f63d88cf7d1cc512060e63ef21a7813c236160b2  nss-3.49.2.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_50_RTM/src/SHA256SUMS
+sha256	185df319775243f5f5daa9d49b7f9cc5f2b389435be3247c3376579bee063ba7  nss-3.50.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 11b57d8142..4de9d3183f 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.49.2
+LIBNSS_VERSION = 3.50
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
