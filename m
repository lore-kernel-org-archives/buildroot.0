Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67915CF31BA
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DE618174F;
	Wed,  2 Oct 2024 20:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyBzA9tw9lB6; Wed,  2 Oct 2024 20:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2699B8176A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2699B8176A;
	Wed,  2 Oct 2024 20:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC8A91BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA1E5401B1
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZ7p36XCnCrO for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B4D340042
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B4D340042
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 750B484706; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:30:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66e8b5ece41c8edb0d519b2093c6c1741862224e
X-Git-Newrev: a6b364c2e311011bb5626c6a156be34daf919dd0
X-Patchwork-Hint: ignore
Message-Id: <20241002203511.750B484706@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 handle BR2_BINFMT_FLAT
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6b364c2e311011bb5626c6a156be34daf919dd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the introduction of ARM FDPIC support, we need to make sure that
the existing ARM FLAT external toolchains are not made
visible/available when ARM FDPIC is selected. This commit updates the
gen-bootlin-toolchains script to take this into account.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains                                | 2 +-
 .../toolchain-external/toolchain-external-bootlin/Config.in.options   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index ef034058e1..bd1beec995 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -62,7 +62,7 @@ arches = {
         'prefix': 'armeb',
     },
     'armv7m': {
-        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7M'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7M', 'BR2_BINFMT_FLAT'],
         'test_options': ['BR2_arm', 'BR2_cortex_m4'],
         'prefix': 'arm',
     },
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index e3ee7aa2c0..098e44fc36 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -10,7 +10,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_arm && BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF
 	default y if BR2_arm && BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF
 	default y if BR2_armeb && BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF
-	default y if BR2_arm && BR2_ARM_CPU_ARMV7M
+	default y if BR2_arm && BR2_ARM_CPU_ARMV7M && BR2_BINFMT_FLAT
 	default y if BR2_m68k_m68k
 	default y if BR2_m68k_cf
 	default y if BR2_microblazebe
@@ -1136,6 +1136,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
 	bool "armv7m uclibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
+	depends on BR2_BINFMT_FLAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1160,6 +1161,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
 	bool "armv7m uclibc stable 2024.05-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
+	depends on BR2_BINFMT_FLAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
