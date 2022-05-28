Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F16C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1EA4189D;
	Sat, 28 May 2022 09:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4y7qxhC-3Q1; Sat, 28 May 2022 09:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35EA04187C;
	Sat, 28 May 2022 09:17:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 109AE1BF962
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F388D60B56
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bW0rmfQ_da7m for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41ECE60B51
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 15A1C84257; Sat, 28 May 2022 09:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:08:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 216cbeb9933862d4b46430a3cbb06f1cb98b917f
X-Git-Newrev: d54e65686a783624b7707d1e6fc703e37eb26b83
X-Patchwork-Hint: ignore
Message-Id: <20220528090538.15A1C84257@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] linux:linux.mk: Add
 "firmware-imx" dependency if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=d54e65686a783624b7707d1e6fc703e37eb26b83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Since SDMA firmwares for imx[6,7,8] are now provided only by
firmware-imx package and not linux-firmware package [1]. If
CONFIG_EXTRA_FIRMWARE is set in the kernel config, the build will fail
if the imx firmware is not available.

[1] http://lists.busybox.net/pipermail/buildroot/2021-January/603807.html

Signed-off-by: Leger Charlie <c.leger@borea-dental.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 666084f4943773fd659393e16982ab2baaa99d0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
