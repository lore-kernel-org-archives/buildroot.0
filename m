Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E7CC001E0
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13034417E6;
	Thu, 27 Jul 2023 10:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13034417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gm8L2G_75C0y; Thu, 27 Jul 2023 10:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6022C404D0;
	Thu, 27 Jul 2023 10:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6022C404D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5445B1BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ECBB4048C
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ECBB4048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SnJ481QaJioZ for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:27:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6177A402A7
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6177A402A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 510F38369B; Thu, 27 Jul 2023 10:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 12:27:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f60a122281de425fb6884304c8f8b006416b31b5
X-Git-Newrev: 4c663675646264e9bb1e72f014195081a1582d19
X-Patchwork-Hint: ignore
Message-Id: <20230727102757.510F38369B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: disable asm on armv4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c663675646264e9bb1e72f014195081a1582d19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
