Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6631DECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0175C8174F;
	Fri, 28 Oct 2022 06:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0175C8174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rmHkHR6I-5A; Fri, 28 Oct 2022 06:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2645E81493;
	Fri, 28 Oct 2022 06:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2645E81493
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E0121BF9AC
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 374C181678
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 374C181678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1CG3LQojKAw for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D0F781493
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D0F781493
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BBB88739D; Fri, 28 Oct 2022 06:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:46:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce2e91bdc53a1daed8ec6845a0fdb1888de87408
X-Git-Newrev: f03ae604510bab7f7f7e516db96a6f880dd86688
X-Patchwork-Hint: ignore
Message-Id: <20221028064624.4BBB88739D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: don't enable
 SSP by default
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

commit: https://git.buildroot.net/buildroot/commit/?id=f03ae604510bab7f7f7e516db96a6f880dd86688
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SSP support requires support in ATF platform code. Not all platforms
implement plat_get_stack_protector_canary() hook. The result is build
failure:

(.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'

Commit cf176128ec4 ("boot/arm-trusted-firmware: add SSP option")
originally introduces this issue. But then commit ccac9a5bbbd
("boot/arm-trusted-firmware: don't force ENABLE_STACK_PROTECTOR") hid
the problem by effectively disabling SSP for all platforms. So only
after commit 09acc7cbc91f5 ("boot/arm-trusted-firmware: fix SSP
support") the issue showed up.

Make SSP an opt-in for platform that actually provide the
plat_get_stack_protector_canary() hook.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 5070849d9b..a9b9bbcc5a 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -212,7 +212,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 	bool "Build with SSP"
-	default y
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on !BR2_SSP_NONE
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
