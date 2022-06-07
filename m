Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA772C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4847613F7;
	Tue,  7 Jun 2022 14:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VVy4qRmsbQB; Tue,  7 Jun 2022 14:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E28C7610C4;
	Tue,  7 Jun 2022 14:07:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EE101BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70D446100D
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zyOWLwceTZb1 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:05:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7D4A613F8
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:05:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4F89F86749; Tue,  7 Jun 2022 13:54:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 16:02:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a770fa04de65850170dc5d419e28c18b6c150800
X-Git-Newrev: a53b92293ee33b5b056d54cf41e4646503c9b25c
X-Patchwork-Hint: ignore
Message-Id: <20220607135403.4F89F86749@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 boot/arm-trusted-firmware: add -fno-PIE to CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=a53b92293ee33b5b056d54cf41e4646503c9b25c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

By default the toolchain-wrapper enable -fPIE to the build of all packages.
TF-A support Position Independent Executable(PIE) only in few build cases,
therefore it should be disable by default.
If you still want to enable PIE, TF-A provide a "ENABLE_PIE" build options
that will override the cflags for the supported cases.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Peter: Only do so for BR2_PIC_PIE]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1061ed6c6273e90618b05ddc0cb66be17364da33)
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
