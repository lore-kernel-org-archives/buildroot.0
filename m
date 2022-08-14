Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4639EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D904660BA9;
	Sun, 14 Aug 2022 10:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D904660BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8dD_yHxS5ND; Sun, 14 Aug 2022 10:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9F060A8A;
	Sun, 14 Aug 2022 10:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9F060A8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFFC1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCCF14024B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCCF14024B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ceFucB3aqff6 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:29:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D21B400D8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D21B400D8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 56F478747E; Sun, 14 Aug 2022 10:14:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:28:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 848404ed7b2f1c4048c83c231ae34efbd66face2
X-Git-Newrev: 0276a6fccfd738914767c56bebe5dc8bb9342b6c
X-Patchwork-Hint: ignore
Message-Id: <20220814101440.56F478747E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux/linux: fix firmware-imx dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=0276a6fccfd738914767c56bebe5dc8bb9342b6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 666084f4943773fd659393e16982ab2baaa99d0e ("linux:linux.mk: Add
"firmware-imx" dependency if needed") introduced a dependency from
linux to firmware-imx, but based on the incorrect BR2 option.

This commit fixes this mistake.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3d9ac37959..efdc21eff2 100644
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
