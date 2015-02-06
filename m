From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Feb 2015 20:03:35 +0100
Subject: [Buildroot] [git commit] mono: add patch to fix MIPS build issue
Message-ID: <20150206190353.BE09B81798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3398f29da053a972b074c4e70a869853071dcca5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to version 3.12 of Mono, it fails to build on MIPS. The
patch added by this commit fixes this build failure, simply caused by
a missing include.

Fixes:

  http://autobuild.buildroot.org/results/6f5/6f5e20a4a99eb0db650430bf6285c844fd940711/

Submitted upstream at https://github.com/mono/mono/pull/1550.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-mono-context.h-fix-build-on-MIPS.patch    |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch b/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
new file mode 100644
index 0000000..dab22ce
--- /dev/null
+++ b/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
@@ -0,0 +1,33 @@
+From 8f489c24e1770c2852efcaff9419d54bfadf0854 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 6 Feb 2015 14:56:10 +0100
+Subject: [PATCH] mono-context.h: fix build on MIPS
+
+The mono-context.h file uses definitions such as mips_fp and mips_sp,
+which are defined in <mono/arch/mips/mips-codegen.h>, but this file is
+not included, leading to build failures.
+
+This fix is similar to 4437ecea91bab3fe68ba1c30521acf75052662cd (for
+ARM).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ mono/utils/mono-context.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/mono/utils/mono-context.h b/mono/utils/mono-context.h
+index d96eb75..ad56e2c 100755
+--- a/mono/utils/mono-context.h
++++ b/mono/utils/mono-context.h
+@@ -464,6 +464,8 @@ mono_ia64_context_get_fp (MonoContext *ctx)
+ 
+ #elif ((defined(__mips__) && !defined(MONO_CROSS_COMPILE)) || (defined(TARGET_MIPS))) && SIZEOF_REGISTER == 4 /* defined(__ia64__) */
+ 
++#include <mono/arch/mips/mips-codegen.h>
++
+ typedef struct {
+ 	mgreg_t	    sc_pc;
+ 	mgreg_t		sc_regs [32];
+-- 
+2.1.0
+
