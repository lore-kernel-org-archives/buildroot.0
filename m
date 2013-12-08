From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 11:08:12 +0100
Subject: [Buildroot] [git commit] opus: fix configure issue with ARM
	optimization when /bin/sh isn't bash
Message-ID: <20131208100828.BFE969BF65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea9e0fe309b55268c966424d5a686b07390d2e48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/136/1360fefb79ebc7d95ef3a7459be681ac11e1ffb4/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-bashism-in-ARM-optimization-handling.patch |   43 ++++++++++++++++++++
 package/opus/opus.mk                               |    1 +
 2 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/opus/opus-01-configure.ac-fix-bashism-in-ARM-optimization-handling.patch b/package/opus/opus-01-configure.ac-fix-bashism-in-ARM-optimization-handling.patch
new file mode 100644
index 0000000..80b9dfc
--- /dev/null
+++ b/package/opus/opus-01-configure.ac-fix-bashism-in-ARM-optimization-handling.patch
@@ -0,0 +1,43 @@
+From a3d4f4f2385394b822b8f66342de8a1e3b4217bb Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sun, 8 Dec 2013 10:54:25 +0100
+Subject: [PATCH] configure.ac: fix bashism in ARM optimization handling
+
+Submitted upstream:
+http://lists.xiph.org/pipermail/opus/2013-December/002422.html
+
+Breaks configure when /bin/sh isn't bash with:
+
+configure: Trying to force-enable ARMv6 media instructions...
+checking if assembler supports ARMv6 media instructions on ARM... yes
+configure: Trying to force-enable NEON instructions...
+checking if assembler supports NEON instructions on ARM... yes
+./configure.lineno: 12799: Bad substitution
+
+Fix it by using the %% expansion to remove everything from the first
+space instead.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0ba4a80..443362f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -333,9 +333,9 @@ AS_IF([test x"${enable_asm}" = x"yes"],[
+ 
+ AM_CONDITIONAL([CPU_ARM], [test "$cpu_arm" = "yes"])
+ AM_CONDITIONAL([OPUS_ARM_INLINE_ASM],
+-    [test x"${inline_optimization:0:3}" = x"ARM"])
++    [test x"${inline_optimization%% *}" = x"ARM"])
+ AM_CONDITIONAL([OPUS_ARM_EXTERNAL_ASM],
+-    [test x"${asm_optimization:0:3}" = x"ARM"])
++    [test x"${asm_optimization%% *}" = x"ARM"])
+ 
+ AS_IF([test x"$enable_rtcd" = x"yes"],[
+     AS_IF([test x"$rtcd_support" != x"no"],[
+-- 
+1.8.4.rc3
+
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 00181de..007cf16 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -10,6 +10,7 @@ OPUS_LICENSE = BSD-3c
 OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
 OPUS_CONF_OPT = --disable-doc
+OPUS_AUTORECONF = YES
 
 ifeq ($(BR2_SOFT_FLOAT),y)
 OPUS_CONF_OPT += --enable-fixed-point
