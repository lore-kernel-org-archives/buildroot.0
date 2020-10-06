From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Oct 2020 22:02:51 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/uclibc: backport
 static linking fixes
Message-ID: <20201006195508.6786E8EC64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0037f1be049289546a8f2043f4b997dda16548c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
     - http://autobuild.buildroot.net/results/645/6453da1471398e8c788e5b86abc4bf2e83e6c0b2
     - http://autobuild.buildroot.net/results/64d/64db6fcb132896ef3552b52ea743d53d05133982
     - http://autobuild.buildroot.net/results/938/938729c42d52bd9e74454bc34b2b20c4e0503142
     - http://autobuild.buildroot.net/results/bc5/bc50834820c921ce4927f23e4dcfa2aaa405c657
     - http://autobuild.buildroot.net/results/a15/a156ffcbe16af4b2f5440dad06c6985b8fcd045e

Suggested-by: Waldemar Brodkorb <wbx@openadk.org>
Suggested-by: Damien Le Moal <damien.lemoal@wdc.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
[Peter: drop 0001-Revert-Fix-static-linking-with-GCC-10.patch, which is only
	for 1.0.35]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-static-builds-with-gcc-10.x.patch     | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch b/package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
new file mode 100644
index 0000000000..0aefe3d82e
--- /dev/null
+++ b/package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
@@ -0,0 +1,27 @@
+From 4deace34cfcc5476b71a9cdc05828f5a48d1cd74 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Thu, 3 Sep 2020 15:08:24 +0200
+Subject: [PATCH] fix static builds with gcc 10.x
+
+[petr.vorel at gmail.com: backport of upstream commit 4deace34cfcc5476b71a9cdc05828f5a48d1cd74]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ Rules.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index f270b7bee..55e88d462 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -288,7 +288,7 @@ OPTIMIZATION += $(CFLAG_-fstrict-aliasing)
+ 
+ # Why -funsigned-char: I hunted a bug related to incorrect
+ # sign extension of 'char' type for 10 hours straight. Not fun.
+-CPU_CFLAGS-y := -funsigned-char -fno-builtin
++CPU_CFLAGS-y := -funsigned-char -fno-builtin -fcommon
+ 
+ $(eval $(call check-gcc-var,-fno-asm))
+ CPU_CFLAGS-y += $(CFLAG_-fno-asm)
+-- 
+2.27.0.rc0
+
