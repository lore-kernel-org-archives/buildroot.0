Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC0C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 09:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7447240002;
	Fri,  3 Jun 2022 09:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a6cBKquuGQdf; Fri,  3 Jun 2022 09:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A82354058D;
	Fri,  3 Jun 2022 09:22:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 740281BF35A
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6268340A03
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QGgrH1XUmPU7 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 09:22:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 168C8408C8
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 09:22:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 18D3086AD5; Fri,  3 Jun 2022 09:10:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Jun 2022 11:13:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb7182c3e340509b804d8cad0a362cf0a34af879
X-Git-Newrev: 1061ed6c6273e90618b05ddc0cb66be17364da33
X-Patchwork-Hint: ignore
Message-Id: <20220603091027.18D3086AD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add -fno-PIE to
 CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=1061ed6c6273e90618b05ddc0cb66be17364da33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default the toolchain-wrapper enable -fPIE to the build of all packages.
TF-A support Position Independent Executable(PIE) only in few build cases,
therefore it should be disable by default.
If you still want to enable PIE, TF-A provide a "ENABLE_PIE" build options
that will override the cflags for the supported cases.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Peter: Only do so for BR2_PIC_PIE]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 03fa83b7b5..35a95a7ec2 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -50,6 +50,7 @@ endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
+	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
