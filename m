Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004E5CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 11:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C432160813;
	Mon,  2 Sep 2024 11:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zkk5rU2_Xlqx; Mon,  2 Sep 2024 11:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D507F60839
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D507F60839;
	Mon,  2 Sep 2024 11:18:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BFFD1BF46D
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 11:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4430A403FB
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 11:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJucyvk_IkWZ for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 11:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EDD8403E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EDD8403E2
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 11:18:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78EE486993; Mon,  2 Sep 2024 11:18:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Sep 2024 13:15:28 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 49f95629605ab60133ea9f7ba0f77c8bf29c8942
X-Git-Newrev: b60d6dafb741c7b3ee7aac49a1442f9983452ae4
X-Patchwork-Hint: ignore
Message-Id: <20240902111844.78EE486993@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gcc: fix build
 with BR2_TIME_BITS_64=y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b60d6dafb741c7b3ee7aac49a1442f9983452ae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

On the architectures that supports libsanitizer (part of gcc), the
build is currently failing with BR2_TIME_BITS_64=y. This is because
some code in libsanitizer unsets _FILE_OFFSET_BITS, but building code
with _FILE_OFFSET_BITS unset, but _TIME_BITS set isn't legal.

To fix this, this commit backports two changes:

- One change to also unset _TIME_BITS in
  sanitizer_platform_limits_posix.cpp. This change is upstream in
  LLVM, and already part of GCC 14.x, so we only bringing it to GCC
  12.x and GCC 13.x.

- A second change doing the same modification, but in
  sanitizer_procmaps_solaris.cpp, which as crazy as it might sound,
  also gets compiled on Linux platforms (but to basically an empty
  file). This change has been submitted upstream to both LLVM and gcc.

Notes:

 - the special PowerPC SPE version of GCC cannot be affected, as only
   uClibc-ng is used for this architecture, and uClibc-ng doesn't use
   _TIME_BITS=64 (but now default to 64-bit time_t on 32-bit
   architectures, like musl does).

 - the special ARC version doesn't need patching because libsanitizer
   doesn't support the ARC architecture, so it doesn't get built

Fixes:

  http://autobuild.buildroot.net/results/ff2dbfdabf0bb6a0d82ea8a80122ab97fd75bd3f/
  https://gitlab.com/buildroot.org/buildroot/-/issues/16

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 81a4b6e7b8b5bb368bce940798bf8432fb420851)
[Peter: drop 14.1.0 patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ..._BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 44 ++++++++++++++++++
 ...r-also-undef-_TIME_BITS-in-sanitizer_proc.patch | 53 ++++++++++++++++++++++
 ..._BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 44 ++++++++++++++++++
 ...r-also-undef-_TIME_BITS-in-sanitizer_proc.patch | 53 ++++++++++++++++++++++
 4 files changed, 194 insertions(+)

diff --git a/package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
new file mode 100644
index 0000000000..386c9287f6
--- /dev/null
+++ b/package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
@@ -0,0 +1,44 @@
+From e45f12ecf703eed45515d451cf014fba32e7410b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Feb 2023 11:48:35 -0800
+Subject: [PATCH] Undef _TIME_BITS along with _FILE_OFFSET_BITS on Linux
+
+On 32-bit glibc>=2.34 systems using 64bit time_t build fails because
+_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
+
+Fixes
+
+```
+/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
+ only with _FILE_OFFSET_BITS=64"
+| #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+|     ^
+| 1 error generated.
+```
+
+Reviewed By: thesamesam, MaskRay
+
+Differential Revision: https://reviews.llvm.org/D140812
+
+Upstream: https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d53b3d94aaf211ffb2159614f5aaaf03ceb861cc
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp         | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index bfdccd5df07..4cedcbfb4bf 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -18,6 +18,7 @@
+ // depends on _FILE_OFFSET_BITS setting.
+ // To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
+ #undef _FILE_OFFSET_BITS
++#undef _TIME_BITS
+ #endif
+ 
+ // Must go after undef _FILE_OFFSET_BITS.
+-- 
+2.45.2
+
diff --git a/package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
new file mode 100644
index 0000000000..80c3378d7b
--- /dev/null
+++ b/package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
@@ -0,0 +1,53 @@
+From 940a0c955bca98aba937c4bfe3fe4a4c17dddb85 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 18 Jul 2024 23:13:41 +0200
+Subject: [PATCH] libsanitizer: also undef _TIME_BITS in
+ sanitizer_procmaps_solaris.cpp
+
+Upstream commit
+https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
+of LLVM added a #undef _TIME_BITS in
+libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
+fix the build on 32-bit Linux platforms that have enabled 64-bit
+time_t using _TIME_BITS=64.
+
+Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
+sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
+including any header file. To fix this, the upstream fix was to also
+undef _TIME_BITS.
+
+This commit simply does the same in sanitizer_procmaps_solaris.cpp,
+which also gets compiled under Linux (despite what the file name
+says). In practice on Linux hosts (where _TIME_BITS=64 matters),
+sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
+the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
+the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
+before including sanitizer_platform.h, which will set the
+SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
+
+Fixes:
+
+armeb-buildroot-linux-gnueabi/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+
+Upstream: https://gcc.gnu.org/pipermail/gcc-patches/2024-July/657811.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+index e16c4e938cb..ca88cf2c2df 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+@@ -11,6 +11,7 @@
+ 
+ // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
+ #undef _FILE_OFFSET_BITS
++#undef _TIME_BITS
+ #include "sanitizer_platform.h"
+ #if SANITIZER_SOLARIS
+ #include "sanitizer_common.h"
+-- 
+2.45.2
+
diff --git a/package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
new file mode 100644
index 0000000000..a3be0914b9
--- /dev/null
+++ b/package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
@@ -0,0 +1,44 @@
+From 88b73eedcfa0fc58aee2555377e6f7d4de153282 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Feb 2023 11:48:35 -0800
+Subject: [PATCH] Undef _TIME_BITS along with _FILE_OFFSET_BITS on Linux
+
+On 32-bit glibc>=2.34 systems using 64bit time_t build fails because
+_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
+
+Fixes
+
+```
+/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
+ only with _FILE_OFFSET_BITS=64"
+| #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+|     ^
+| 1 error generated.
+```
+
+Reviewed By: thesamesam, MaskRay
+
+Differential Revision: https://reviews.llvm.org/D140812
+
+Upstream: https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d53b3d94aaf211ffb2159614f5aaaf03ceb861cc
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp         | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index bcbd143d19d..1b23898b374 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -18,6 +18,7 @@
+ // depends on _FILE_OFFSET_BITS setting.
+ // To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
+ #undef _FILE_OFFSET_BITS
++#undef _TIME_BITS
+ #endif
+ 
+ // Must go after undef _FILE_OFFSET_BITS.
+-- 
+2.45.2
+
diff --git a/package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
new file mode 100644
index 0000000000..73b09ac389
--- /dev/null
+++ b/package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
@@ -0,0 +1,53 @@
+From 7ad54084a2c07cca6d03dfe274893e903852d359 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 18 Jul 2024 23:13:41 +0200
+Subject: [PATCH] libsanitizer: also undef _TIME_BITS in
+ sanitizer_procmaps_solaris.cpp
+
+Upstream commit
+https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
+of LLVM added a #undef _TIME_BITS in
+libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
+fix the build on 32-bit Linux platforms that have enabled 64-bit
+time_t using _TIME_BITS=64.
+
+Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
+sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
+including any header file. To fix this, the upstream fix was to also
+undef _TIME_BITS.
+
+This commit simply does the same in sanitizer_procmaps_solaris.cpp,
+which also gets compiled under Linux (despite what the file name
+says). In practice on Linux hosts (where _TIME_BITS=64 matters),
+sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
+the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
+the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
+before including sanitizer_platform.h, which will set the
+SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
+
+Fixes:
+
+armeb-buildroot-linux-gnueabi/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+
+Upstream: https://gcc.gnu.org/pipermail/gcc-patches/2024-July/657811.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+index eeb49e2afe3..1b23fd4d512 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+@@ -11,6 +11,7 @@
+ 
+ // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
+ #undef _FILE_OFFSET_BITS
++#undef _TIME_BITS
+ #include "sanitizer_platform.h"
+ #if SANITIZER_SOLARIS
+ #  include <fcntl.h>
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
