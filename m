Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FC4C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 12:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1619840C0B;
	Wed, 10 Aug 2022 12:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1619840C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DcGc0lR5DcTk; Wed, 10 Aug 2022 12:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0534D40BF4;
	Wed, 10 Aug 2022 12:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0534D40BF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F34DA1BF312
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CECED6107E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECED6107E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlYjjPf9u07c for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 12:40:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AFC06107A
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AFC06107A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1BCD787067; Wed, 10 Aug 2022 12:25:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 14:34:08 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 5dbeaa333918d00edc71e5ffe66df3afad41346a
X-Git-Newrev: 707df553dde446fcbc5ed7eac66fb53c9dcbdf34
X-Patchwork-Hint: ignore
Message-Id: <20220810122556.1BCD787067@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/uclibc: prevent
 config with unsupported RISC-V float ABI
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

commit: https://git.buildroot.net/buildroot/commit/?id=707df553dde446fcbc5ed7eac66fb53c9dcbdf34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 9a51381cedc16e6d70cb85e1144f6e0fa89af69a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
