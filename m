Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56035C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB57E60ABA;
	Thu,  5 May 2022 21:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqOgzc67kc6g; Thu,  5 May 2022 21:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5F060A81;
	Thu,  5 May 2022 21:30:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 683B71BF308
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5612160A81
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b41xu4Fiaqhs for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 21:30:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96905608D8
 for <buildroot@buildroot.org>; Thu,  5 May 2022 21:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9A95385C03; Thu,  5 May 2022 21:19:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 May 2022 23:24:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4239958963fd7da78fa8683646ad4b781a54c7fd
X-Git-Newrev: 666084f4943773fd659393e16982ab2baaa99d0e
X-Patchwork-Hint: ignore
Message-Id: <20220505211945.9A95385C03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux:linux.mk: Add "firmware-imx"
 dependency if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=666084f4943773fd659393e16982ab2baaa99d0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since SDMA firmwares for imx[6,7,8] are now provided only by
firmware-imx package and not linux-firmware package [1]. If
CONFIG_EXTRA_FIRMWARE is set in the kernel config, the build will fail
if the imx firmware is not available.

[1] http://lists.busybox.net/pipermail/buildroot/2021-January/603807.html

Signed-off-by: Leger Charlie <c.leger@borea-dental.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index e0a1ff74f9..b27e436b0d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -77,6 +77,7 @@ LINUX_DEPENDENCIES = host-kmod
 LINUX_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
 	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
+	$(if $(BR2_PACKAGE_FREESCALE_IMX),firmware-imx) \
 	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
