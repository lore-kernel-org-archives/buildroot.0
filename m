Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C5AC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E88141BE6;
	Wed, 30 Aug 2023 11:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E88141BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDiuRc79-H9e; Wed, 30 Aug 2023 11:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7DD5408A4;
	Wed, 30 Aug 2023 11:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7DD5408A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2406E1BF282
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1581822F8
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1581822F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqr55duTgmuT for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E981822F9
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E981822F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DB9C8655A; Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 12:49:04 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 43e1e51997a152e9c1c084c89b5f01886a701f8e
X-Git-Newrev: 16c683a27df3634941637b76426c0793b5d019e8
X-Patchwork-Hint: ignore
Message-Id: <20230830110242.1DB9C8655A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/wolfssl: disable
 asm on armv4
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

commit: https://git.buildroot.net/buildroot/commit/?id=16c683a27df3634941637b76426c0793b5d019e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Quoting
https://developer.arm.com/documentation/dui0489/i/arm-and-thumb-instructions/clz
"This ARM instruction is available in ARMv5T and above."

Fixes:
- armeb
  http://autobuild.buildroot.net/results/ea9/ea9b19e872b4b20b97fceec3f7e0a6a1109c4f12/
  /tmp/ccdRCOaB.s:27: Error: selected processor does not support `clz r5,r2' in ARM mode
- arm
  http://autobuild.buildroot.net/results/cb1/cb1c7ac68b3379d3f4b5efc897198bea0a904217/
  /tmp/cc72ECAj.s:6764: Error: selected processor does not support `clz r5,r0' in ARM mode
  /tmp/cc72ECAj.s:7110: Error: selected processor does not support `clz r5,lr' in ARM mode
  /tmp/cc72ECAj.s:8934: Error: selected processor does not support `clz r5,fp' in ARM mode

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4c663675646264e9bb1e72f014195081a1582d19)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index c41bdb6888..9d173412fe 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS
 	bool
 	default y if BR2_aarch64
-	default y if BR2_arm || BR2_armeb
+	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4 # clz
 	default y if BR2_powerpc
 	default y if BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS32R6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
