Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007D3C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB8D440B49;
	Wed,  2 Nov 2022 22:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB8D440B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kp0qzap6naC; Wed,  2 Nov 2022 22:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6B1C40AE1;
	Wed,  2 Nov 2022 22:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6B1C40AE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 080D71BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B493408E5
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B493408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brNz4v5JH9Vb for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:48:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40D3740B2E
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40D3740B2E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3045387AD4; Wed,  2 Nov 2022 22:48:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 19:57:58 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: c6bdf8ad0e10e9669eb6d29bfb9413777f64e9db
X-Git-Newrev: 1331d2d3ee6cd7cfda2bbd13cb18833cb53d2e0c
X-Patchwork-Hint: ignore
Message-Id: <20221102224807.3045387AD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 boot/arm-trusted-firmware: don't enable SSP by default
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

commit: https://git.buildroot.net/buildroot/commit/?id=1331d2d3ee6cd7cfda2bbd13cb18833cb53d2e0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit f03ae604510bab7f7f7e516db96a6f880dd86688)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index a87181d0db..079694ffb4 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -204,7 +204,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 
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
