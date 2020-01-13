From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 21:17:07 +0100
Subject: [Buildroot] [git commit] package/libnss: bump to version 3.49.1
Message-ID: <20200113201115.2A7ED818FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=239bea89b0fce801073a60068518214585c1e51a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 1 upstreamed patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...743-Fix-PowerPc-build-sys-auxv.h-failure.patch} |  0
 .../0001-add-zlib-include-dir-variable.patch       | 49 ----------------------
 package/libnss/libnss.hash                         |  2 +-
 package/libnss/libnss.mk                           |  2 +-
 4 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch b/package/libnss/0001-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
similarity index 100%
rename from package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
rename to package/libnss/0001-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
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
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index d87ad8e3ab..01098df99a 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_48_RTM/src/SHA256SUMS
-sha256	6738094dc4fd63061118a122bf3999a64fe8c7117fc52f6e81c2279181bde71d  nss-3.49.tar.gz
+sha256	d9aa42e49e02bb0dc0a2f164604cfc718e11a2a06ddb266cd676376ac21b026e  nss-3.49.1.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 61950ade25..d7d3cda86b 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.49
+LIBNSS_VERSION = 3.49.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
