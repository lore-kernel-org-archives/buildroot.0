Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4CDC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 19:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3614410AE;
	Thu, 11 Aug 2022 19:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3614410AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfoKuMTwmh_l; Thu, 11 Aug 2022 19:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AEE74049A;
	Thu, 11 Aug 2022 19:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AEE74049A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A85061BF3AA
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A78813AE
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75A78813AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIkOnkpbJmnL for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 19:34:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E51881396
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 19:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E51881396
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 774A6872EC; Thu, 11 Aug 2022 19:20:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 21:27:50 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: e2daea5fcc528dce89e57ae46b143028873f8202
X-Git-Newrev: e95fa1c56ccc4e5e7468b129f5edfb27c24bb50d
X-Patchwork-Hint: ignore
Message-Id: <20220811192009.774A6872EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/zlib-ng: add
 upstream patch to fix build with uclibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=e95fa1c56ccc4e5e7468b129f5edfb27c24bb50d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure with uclibc on arm architectures (and
similar on powerpc):

/home/buildroot/autobuild/instance-2/output-1/build/zlib-ng-2.0.6/arch/arm/armfeature.c:4:12: fatal error: sys/auxv.h: No such file or directory
    4 | #  include <sys/auxv.h>
      |            ^~~~~~~~~~~~
compilation terminated.

Fixes:

  http://autobuild.buildroot.net/results/1ac782825e897981d932b405ca60cd2ec4b3b8cb/

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1666b661c6c103d05bbbea05f0f2b89ee4560527)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-that-sys-auxv.h-exists-at-configure-time.patch | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-configure-time.patch b/package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-configure-time.patch
new file mode 100644
index 0000000000..ba8297cda7
--- /dev/null
+++ b/package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-configure-time.patch
@@ -0,0 +1,90 @@
+From e1baa6b439c06f3d0e6be3e381cc746ffb55aee1 Mon Sep 17 00:00:00 2001
+From: Mika Lindqvist <postmaster@raasu.org>
+Date: Wed, 13 Apr 2022 01:22:29 +0300
+Subject: [PATCH] Check that sys/auxv.h exists at configure time and add
+ preprocessor define for it. * Protect including sys/auxv.h in all relevant
+ files with the new preprocessor define * Test for both existence of both
+ sys/auxv.h and getauxval() with both cmake and configure
+
+[Ben Hutchings: Backport to 2.0.6:
+ - Drop the s390 changes
+ - Change some filenames]
+
+Backported from: e1baa6b439c06f3d0e6be3e381cc746ffb55aee1
+Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
+---
+ CMakeLists.txt        |    4 ++++
+ arch/arm/armfeature.c |    2 +-
+ arch/power/power.c    |    5 ++++-
+ configure             |   13 +++++++++++++
+ 4 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0dd196130..e4e4b7332 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -338,6 +338,10 @@ endif()
+ #
+ # Check for standard/system includes
+ #
++check_include_file(sys/auxv.h  HAVE_SYS_AUXV_H)
++if(HAVE_SYS_AUXV_H)
++    add_definitions(-DHAVE_SYS_AUXV_H)
++endif()
+ check_include_file(sys/sdt.h   HAVE_SYS_SDT_H)
+ if(HAVE_SYS_SDT_H)
+     add_definitions(-DHAVE_SYS_SDT_H)
+diff --git a/arch/arm/arm_features.c b/arch/arm/arm_features.c
+index 195c94992..f6b67687f 100644
+--- a/arch/arm/armfeature.c
++++ b/arch/arm/armfeature.c
+@@ -1,6 +1,6 @@
+ #include "../../zutil.h"
+ 
+-#if defined(__linux__)
++#if defined(__linux__) && defined(HAVE_SYS_AUXV_H)
+ #  include <sys/auxv.h>
+ #  ifdef ARM_ASM_HWCAP
+ #    include <asm/hwcap.h>
+diff --git a/arch/power/power_features.c b/arch/power/power_features.c
+index 9186b40d8..65599d9a7 100644
+--- a/arch/power/power.c
++++ b/arch/power/power.c
+@@ -1,9 +1,12 @@
+ /* POWER feature check
+  * Copyright (C) 2020 Matheus Castanho <msc@linux.ibm.com>, IBM
++ * Copyright (C) 2021-2022 Mika T. Lindqvist <postmaster@raasu.org>
+  * For conditions of distribution and use, see copyright notice in zlib.h
+  */
+ 
+-#include <sys/auxv.h>
++#ifdef HAVE_SYS_AUXV_H
++#  include <sys/auxv.h>
++#endif
+ #include "../../zutil.h"
+ 
+ Z_INTERNAL int power_cpu_has_arch_2_07;
+diff --git a/configure b/configure
+index aed1909cc..a357e1c8a 100755
+--- a/configure
++++ b/configure
+@@ -776,6 +776,19 @@ else
+   echo "Checking for strerror... No." | tee -a configure.log
+ fi
+ 
++# check for getauxval() for architecture feature detection at run-time
++cat > $test.c <<EOF
++#include <sys/auxv.h>
++int main() { return getauxval(0); }
++EOF
++if try $CC $CFLAGS -o $test $test.c $LDSHAREDLIBC; then
++  echo "Checking for getauxval() in sys/auxv.h... Yes." | tee -a configure.log
++  CFLAGS="${CFLAGS} -DHAVE_SYS_AUXV_H"
++  SFLAGS="${SFLAGS} -DHAVE_SYS_AUXV_H"
++else
++  echo "Checking for getauxval() in sys/auxv.h... No." | tee -a configure.log
++fi
++
+ # We need to remove zconf.h from source directory if building outside of it
+ if [ "$SRCDIR" != "$BUILDDIR" ]; then
+     rm -f $SRCDIR/zconf${SUFFIX}.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
