Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613D1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 21:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 119F261553;
	Thu, 26 May 2022 21:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CEQDHz2oxzkd; Thu, 26 May 2022 21:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05AF961550;
	Thu, 26 May 2022 21:03:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D669A1BF9C1
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2FAF4123F
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFb4SkJNPaB9 for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 21:03:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8BA0400AB
 for <buildroot@buildroot.org>; Thu, 26 May 2022 21:03:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 17A8D8652B; Thu, 26 May 2022 20:51:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 11:19:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0c787c7955f9ed632564e7335dbfecfd668c93a6
X-Git-Newrev: 814880699521dde1efe7e572da92909ad712f6d9
X-Patchwork-Hint: ignore
Message-Id: <20220526205151.17A8D8652B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] arch: drop support for
 SH2A
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

commit: https://git.buildroot.net/buildroot/commit/?id=814880699521dde1efe7e572da92909ad712f6d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Until commit "arch/Config.in.sh: fixup MMU selection" in this series,
SH2A could either be used with BR2_USE_MMU disabled or BR2_USE_MMU
enabled.

The later made absolutely no sense, since SH2A does not have a MMU:
MMU support was introduced starting from SH3 according to
https://en.wikipedia.org/wiki/SuperH#SH-3

Also, since commit 22d5501e03b019218b718b5de7ca74824a8eaf42 ("arch:
tidy up binary formats config"), which was merged in Buildroot
2015.05, the architecture tuple used when BR2_sh2a=y and BR2_USE_MMU
disabled is sh2a-buildroot-uclinux-uclibc, and this was already
unsupported back in the days of Buildroot 2015.08 and binutils 2.24,
causing the build to fail with:

*** BFD does not support target sh2a-buildroot-uclinux-uclibc.

just like it fails to build today with recent version of binutils.

So, this has been broken since 2015.08, and nobody complained. SH2A is
seldom used, so it's time to kill it.

It is worth mentioning that there had been an attempt at resurrecting
SH2 support around 2015 (see https://lwn.net/Articles/647636/) as part
of the J2 core. This effort led to the addition of FDPIC support for
SH2A in the musl C library (and therefore proper ELF binaries, with
shared libraries), but that was never supported in Buildroot. Now that
the J2 project is essentially dead, there is no reason to bother with
this.

Fixes:

  http://autobuild.buildroot.net/results/63d01d33ae30f86b63b9f42a9fea116f2f3e9005/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 04ea3d38dd76f4e96f4961143d674aff59b13d3f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                        | 7 +++++++
 arch/Config.in.sh                       | 5 +----
 package/uclibc/Config.in                | 1 -
 toolchain/toolchain-buildroot/Config.in | 2 +-
 utils/genrandconfig                     | 9 +++------
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3b066bbf72..325457afb5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_sh2a
+	bool "sh2a architecture support removed"
+	select BR2_LEGACY
+	help
+	  The SuperH 2A (SH2A) architecture was not maintained, and
+	  broken, so its support was dropped.
+
 config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
 	bool "weston fbdev removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index a012cbf491..f00954bb5e 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -5,8 +5,6 @@ choice
 	help
 	  Specific CPU variant to use
 
-config BR2_sh2a
-	bool "sh2a (SH2A big endian)"
 config BR2_sh4
 	bool "sh4 (SH4 little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
@@ -22,7 +20,6 @@ config BR2_sh4aeb
 endchoice
 
 config BR2_ARCH
-	default "sh2a"		if BR2_sh2a
 	default "sh4"		if BR2_sh4
 	default "sh4eb"		if BR2_sh4eb
 	default "sh4a"		if BR2_sh4a
@@ -33,7 +30,7 @@ config BR2_NORMALIZED_ARCH
 
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_sh4 || BR2_sh4a
-	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
+	default "BIG"		if BR2_sh4eb || BR2_sh4aeb
 
 config BR2_READELF_ARCH_NAME
 	default "Renesas / SuperH SH"
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2091166b62..310414bebc 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -124,7 +124,6 @@ config BR2_UCLIBC_MIPS_NAN
 
 config BR2_UCLIBC_SH_TYPE
 	string
-	default "SH2A" if BR2_sh2a
 	default "SH4"  if BR2_sh4 || BR2_sh4eb
 	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 4004c0edf8..be89f68ab5 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -31,7 +31,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_arm     || BR2_armeb    || \
 		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || BR2_sh2a   || \
+		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
 		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
 		   BR2_x86_64
 	select BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 3483d55c14..c2ca30f51e 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -237,12 +237,9 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
        BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
         return False
-    # libffi not available on sh2a and ARMv7-M, but propagating libffi
-    # arch dependencies in Buildroot is really too much work, so we
-    # handle this here.
-    if 'BR2_sh2a=y\n' in configlines and \
-       'BR2_PACKAGE_LIBFFI=y\n' in configlines:
-        return False
+    # libffi not available on ARMv7-M, but propagating libffi arch
+    # dependencies in Buildroot is really too much work, so we handle
+    # this here.
     if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and \
        'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
