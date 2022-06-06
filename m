Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0FAC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65E0D403E9;
	Mon,  6 Jun 2022 10:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxlZl5j900FV; Mon,  6 Jun 2022 10:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 798D2408AF;
	Mon,  6 Jun 2022 10:26:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B34DD1BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A239060EA8
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Li-55ht4WjRj for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:26:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABF1060E2E
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:26:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B944B86CB5; Mon,  6 Jun 2022 10:14:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 12:21:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4142dbe7f08d5dcdc0dcfd041f3f816dd6e8a7f3
X-Git-Newrev: 7532fc1bcd35f034754a467cb1dd39ecc8839b36
X-Patchwork-Hint: ignore
Message-Id: <20220606101443.B944B86CB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: introduce and use
 BR2_PACKAGE_MUSL_ARCH_SUPPORTS and BR2_PACKAGE_MUSL_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=7532fc1bcd35f034754a467cb1dd39ecc8839b36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In this commit BR2_PACKAGE_MUSL_SUPPORTS looks redundant with
BR2_PACKAGE_MUSL_ARCH_SUPPORTS, but for other C libraries, like glibc,
it can be different.

To be consistent, we use the same pattern for musl.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/musl/Config.in                  | 28 ++++++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in | 10 +---------
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 69da615b63..c1a10bdd58 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -1,3 +1,31 @@
+config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_i386
+	default y if BR2_microblaze
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_sh
+	default y if BR2_x86_64
+	depends on !BR2_powerpc_SPE # not supported, build breaks
+	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
+	# sh2 nommu is supported by musl, but we don't have support
+	# for it in Buildroot.
+	depends on BR2_USE_MMU
+
+config BR2_PACKAGE_MUSL_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_MUSL_ARCH_SUPPORTS
+
 config BR2_PACKAGE_MUSL
 	bool
 	default y
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 7ce2998cf7..0dac816a4d 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -61,15 +61,7 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
-	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
-		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
-		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
-		   BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
-	depends on !BR2_powerpc_SPE # not supported, build breaks
-	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
-	# sh2 nommu is supported by musl, but we don't have support
-	# for it in Buildroot.
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_MUSL_SUPPORTS
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
