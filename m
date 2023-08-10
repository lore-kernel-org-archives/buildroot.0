Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47998EC8739
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E1683BD8;
	Thu,  7 Sep 2023 15:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2E1683BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jpjk-ecd3dz; Thu,  7 Sep 2023 15:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A545483BE4;
	Thu,  7 Sep 2023 15:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A545483BE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 125011BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0812441E52
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0812441E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77TbcjLpO7te for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE94F41DC4
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE94F41DC4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D54CC86A21; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 22:39:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 527e538a82754ad5ca412c1612328ec5e6d78b78
X-Git-Newrev: 60cf00d3f4679069c1f1c0c8943e50626bbfb12a
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.D54CC86A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/mips: re-add support for MIPS IV
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

commit: https://git.buildroot.net/buildroot/commit/?id=60cf00d3f4679069c1f1c0c8943e50626bbfb12a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for MIPS IV was dropped in commit
dd45fe0efb678a8a674330ad46b7641a3284dff9 ("arch/mips: remove
deprecated mips1/2/3/4 support"). However, even though it is an older
ISA than R1, it is still useful to support older MIPS-based
systems (e.g.: Cobalt Qube).

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.mips | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 7f44f06c9d..29b4180d21 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -40,8 +40,8 @@ choice
 	help
 	  Specific CPU variant to use
 
-	  64bit capable: 64, 64r2, 64r3, 64r5, 64r6
-	  non-64bit capable: 32, 32r2, 32r3, 32r5, 32r6
+	  64bit capable: mips4, 64, 64r2, 64r3, 64r5, 64r6
+	  non-64bit capable: mips4, 32, 32r2, 32r3, 32r5, 32r6
 
 config BR2_mips_32
 	bool "Generic MIPS32"
@@ -97,6 +97,8 @@ config BR2_mips_xburst
 	  to be used in order to prevent emitting these instructions.
 
 	  See http://www.ingenic.com/en/?xburst.html
+config BR2_mips4
+	bool "MIPS IV"
 config BR2_mips_64
 	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
@@ -262,6 +264,7 @@ config BR2_GCC_TARGET_ARCH
 	default "octeon2"	if BR2_mips_octeon2
 	default "octeon3"	if BR2_mips_octeon3
 	default "p6600"		if BR2_mips_p6600
+	default "mips4"		if BR2_mips4
 
 config BR2_MIPS_OABI32
 	bool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
