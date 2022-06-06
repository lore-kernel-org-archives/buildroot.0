Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FBEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34329417E6;
	Mon,  6 Jun 2022 10:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJBVb3frCgbh; Mon,  6 Jun 2022 10:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07311417C4;
	Mon,  6 Jun 2022 10:26:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B59381BF982
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A473D83404
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uufzQFuWf7aD for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:26:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D95B82A0B
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:26:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A9AE586CB6; Mon,  6 Jun 2022 10:14:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 12:21:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd839aeb7f40596e60bc53a96b7a65892924cc26
X-Git-Newrev: 4142dbe7f08d5dcdc0dcfd041f3f816dd6e8a7f3
X-Patchwork-Hint: ignore
Message-Id: <20220606101443.A9AE586CB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: introduce and use
 BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS and BR2_PACKAGE_UCLIBC_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=4142dbe7f08d5dcdc0dcfd041f3f816dd6e8a7f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In this commit BR2_PACKAGE_UCLIBC_SUPPORTS looks redundant with
BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS, but for other C libraries, like glibc,
it can be different.

To be consistent, we use the same pattern for uClibc.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uclibc/Config.in                | 28 ++++++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in |  8 +-------
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 310414bebc..754c3ea014 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,3 +1,31 @@
+config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_arcle
+	default y if BR2_arceb
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_i386
+	default y if BR2_m68k
+	default y if BR2_microblaze
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_RISCV_64
+	default y if BR2_sh4
+	default y if BR2_sh4eb
+	default y if BR2_sparc
+	default y if BR2_xtensa
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_UCLIBC_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
+
 if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 comment "uClibc Options"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index b68f5e3133..7ce2998cf7 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -27,13 +27,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
-	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
-		   BR2_arm     || BR2_armeb    || \
-		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
-		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
-		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
-		   BR2_x86_64
+	depends on BR2_PACKAGE_UCLIBC_SUPPORTS
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  This option selects uClibc-ng as the C library for the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
