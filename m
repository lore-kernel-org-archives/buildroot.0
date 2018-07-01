From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 15:47:13 +0200
Subject: [Buildroot] [git commit] poco: fix build on AArch 64 BE
Message-ID: <20180701134417.82FCC836FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a33e5c9a3a78c1717f7f07795bbabdbc84e837bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of Poco currently fails on AArch64 BE due to the built-in
double-conversion code. This commit adds a patch that adapts an
upstream double-conversion fix to the Poco code base.

Fixes:

  http://autobuild.buildroot.net/results/d8d17f3cb669585af592afb5e824088ae82ccbcf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...src-utils.h-backport-double-conversion-ch.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch b/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
new file mode 100644
index 0000000000..8193457f97
--- /dev/null
+++ b/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
@@ -0,0 +1,32 @@
+From b077b4a5afbfde47288baed072152a6b7f318250 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 1 Jul 2018 15:37:47 +0200
+Subject: [PATCH] Foundation/src/utils.h: backport double-conversion change for
+ AArch64 BE support
+
+This commit, identical to upstream double-conversion commit
+https://github.com/google/double-conversion/commit/cb2beeb6771025377c665d1c3ea08388bc6e619a
+allows Poco to build on AArch64 big-endian.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/pocoproject/poco/pull/2378
+---
+ Foundation/src/utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
+index a7bda0171..fd49e1768 100644
+--- a/Foundation/src/utils.h
++++ b/Foundation/src/utils.h
+@@ -62,7 +62,7 @@
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+-    defined(__AARCH64EL__) || \
++    defined(__AARCH64EL__) || defined(__aarch64__) || \
+     defined(nios2) || defined(__nios2) || defined(__nios2__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__)
+-- 
+2.14.4
+
