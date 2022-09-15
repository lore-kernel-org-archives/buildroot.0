Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4CDECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 08:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B82CD61012;
	Thu, 15 Sep 2022 08:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B82CD61012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 477S4ichswx3; Thu, 15 Sep 2022 08:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0BAF60A97;
	Thu, 15 Sep 2022 08:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0BAF60A97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBFB01BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C779B833CE
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C779B833CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdPDvSH3n9rc for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 08:45:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 190DD833D3
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 08:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190DD833D3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 06CED83C2F; Thu, 15 Sep 2022 08:45:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 10:40:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 33a8e1d53ca035c24bef84e9711a16d39c885f17
X-Git-Newrev: a8ad45c77e6b19f8389255ab57929019d3a6d68b
X-Patchwork-Hint: ignore
Message-Id: <20220915084557.06CED83C2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] linux/linux: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8ad45c77e6b19f8389255ab57929019d3a6d68b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
