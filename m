From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 16:22:23 +0100
Subject: [Buildroot] [git commit branch/next] opus: bump version to 1.1.1
Message-ID: <20151127152754.9B6CC81F7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=218938e470c74d84e79ded2b2cbaba893e2af199
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

And drop now upstreamed patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-bashism-in-ARM-optimization-handling.patch |   43 --------------------
 package/opus/opus.hash                             |    2 +-
 package/opus/opus.mk                               |    2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/opus/0001-configure.ac-fix-bashism-in-ARM-optimization-handling.patch b/package/opus/0001-configure.ac-fix-bashism-in-ARM-optimization-handling.patch
deleted file mode 100644
index 80b9dfc6..0000000
--- a/package/opus/0001-configure.ac-fix-bashism-in-ARM-optimization-handling.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a3d4f4f2385394b822b8f66342de8a1e3b4217bb Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sun, 8 Dec 2013 10:54:25 +0100
-Subject: [PATCH] configure.ac: fix bashism in ARM optimization handling
-
-Submitted upstream:
-http://lists.xiph.org/pipermail/opus/2013-December/002422.html
-
-Breaks configure when /bin/sh isn't bash with:
-
-configure: Trying to force-enable ARMv6 media instructions...
-checking if assembler supports ARMv6 media instructions on ARM... yes
-configure: Trying to force-enable NEON instructions...
-checking if assembler supports NEON instructions on ARM... yes
-./configure.lineno: 12799: Bad substitution
-
-Fix it by using the %% expansion to remove everything from the first
-space instead.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0ba4a80..443362f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -333,9 +333,9 @@ AS_IF([test x"${enable_asm}" = x"yes"],[
- 
- AM_CONDITIONAL([CPU_ARM], [test "$cpu_arm" = "yes"])
- AM_CONDITIONAL([OPUS_ARM_INLINE_ASM],
--    [test x"${inline_optimization:0:3}" = x"ARM"])
-+    [test x"${inline_optimization%% *}" = x"ARM"])
- AM_CONDITIONAL([OPUS_ARM_EXTERNAL_ASM],
--    [test x"${asm_optimization:0:3}" = x"ARM"])
-+    [test x"${asm_optimization%% *}" = x"ARM"])
- 
- AS_IF([test x"$enable_rtcd" = x"yes"],[
-     AS_IF([test x"$rtcd_support" != x"no"],[
--- 
-1.8.4.rc3
-
diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 9c4e34d..b3aea0d 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	b9727015a58affcf3db527322bf8c4d2fcf39f5f6b8f15dbceca20206cbe1d95	opus-1.1.tar.gz
+sha256	9b84ff56bd7720d5554103c557664efac2b8b18acc4bbcc234cb881ab9a3371e	opus-1.1.1.tar.gz
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 8e6f885..c4fef3a 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.1
+OPUS_VERSION = 1.1.1
 OPUS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3c
 OPUS_LICENSE_FILES = COPYING
