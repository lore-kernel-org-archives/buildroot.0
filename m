Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB12C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 12:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5127C40BFC;
	Wed, 10 Aug 2022 12:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5127C40BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kINjk2iHC3q4; Wed, 10 Aug 2022 12:40:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6359840BD5;
	Wed, 10 Aug 2022 12:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6359840BD5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58F9B1BF312
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3899161081
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3899161081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErulLLs89siW for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 12:40:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7480860BB3
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7480860BB3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 70FB68705B; Wed, 10 Aug 2022 12:25:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 14:37:31 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 89ec94055cc41bd06138a8e38b5d34eb8e21c019
X-Git-Newrev: f611902b60137bb9bc40e3094a8b8f8a8d8d22b5
X-Patchwork-Hint: ignore
Message-Id: <20220810122550.70FB68705B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/uclibc: introduce
 and use BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS and BR2_PACKAGE_UCLIBC_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=f611902b60137bb9bc40e3094a8b8f8a8d8d22b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

In this commit BR2_PACKAGE_UCLIBC_SUPPORTS looks redundant with
BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS, but for other C libraries, like glibc,
it can be different.

To be consistent, we use the same pattern for uClibc.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4142dbe7f08d5dcdc0dcfd041f3f816dd6e8a7f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 280075b1a9..bf337d1e95 100644
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
