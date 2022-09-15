Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1647CECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 08:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A97DC41046;
	Thu, 15 Sep 2022 08:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A97DC41046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XpdovBJPewPZ; Thu, 15 Sep 2022 08:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3D3E41030;
	Thu, 15 Sep 2022 08:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3D3E41030
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A02D1C11A0
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11CB4403D0
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11CB4403D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvUpXrhyZ65v for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 08:43:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A1EA40382
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 08:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A1EA40382
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EAF9E83BF3; Thu, 15 Sep 2022 08:43:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 10:40:16 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 03b6692026d501c1737ffd5680180e79f828558b
X-Git-Newrev: e47b4b2a54b29043f46d411219778562035815a6
X-Patchwork-Hint: ignore
Message-Id: <20220915084326.EAF9E83BF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] linux/linux: fix
 firmware-imx dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e47b4b2a54b29043f46d411219778562035815a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit 666084f4943773fd659393e16982ab2baaa99d0e ("linux:linux.mk: Add
"firmware-imx" dependency if needed") introduced a dependency from
linux to firmware-imx, but based on the incorrect BR2 option.

This commit fixes this mistake.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0276a6fccfd738914767c56bebe5dc8bb9342b6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 322ccabbd9..ffe68ded9d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -77,7 +77,7 @@ LINUX_DEPENDENCIES = host-kmod
 LINUX_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
 	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
-	$(if $(BR2_PACKAGE_FREESCALE_IMX),firmware-imx) \
+	$(if $(BR2_PACKAGE_FIRMWARE_IMX),firmware-imx) \
 	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
