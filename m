Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB1CC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 17:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E7060F49;
	Sun, 17 Jul 2022 17:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30E7060F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_V4RoapT-Bb; Sun, 17 Jul 2022 17:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D02360F86;
	Sun, 17 Jul 2022 17:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D02360F86
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A78781BF3CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 17:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67DA84168F
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 17:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67DA84168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aSqyqUm-2D9P for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 17:43:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61C2E40986
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 17:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61C2E40986
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B6ACA83C1A; Sun, 17 Jul 2022 17:30:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 19:42:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ff22c698a0ddb5a4424f09368c5523c2058c1a4
X-Git-Newrev: 9a51381cedc16e6d70cb85e1144f6e0fa89af69a
X-Patchwork-Hint: ignore
Message-Id: <20220717173015.B6ACA83C1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: prevent config with
 unsupported RISC-V float ABI
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a51381cedc16e6d70cb85e1144f6e0fa89af69a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc currently supports RISC-V with a soft-float or 64-bit
hard-float ABI, but not 32-bit hard-float. Selecting
BR2_RISCV_ABI_LP64F results in a build failure:

./include/sys/asm.h:42:4: error: #error unsupported FLEN
   42 | #  error unsupported FLEN
      |    ^~~~~

Change the conditions for BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
accordingly.

Fixes:

  http://autobuild.buildroot.net/results/ac6e2c4369df46bad9a2ad46ce073e3f15f22ee6/

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
[Thomas: instead of !BR2_RISCV_ABI_LP64F, use BR2_RISCV_ABI_LP64 ||
BR2_RISCV_ABI_LP64D]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 754c3ea014..2eea4d30f3 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -15,7 +15,8 @@ config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
 	default y if BR2_mips64el
 	default y if BR2_or1k
 	default y if BR2_powerpc
-	default y if BR2_RISCV_64
+	# see libc/sysdeps/linux/riscv64/sys/asm.h
+	default y if BR2_RISCV_64 && (BR2_RISCV_ABI_LP64 || BR2_RISCV_ABI_LP64D)
 	default y if BR2_sh4
 	default y if BR2_sh4eb
 	default y if BR2_sparc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
