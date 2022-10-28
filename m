Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5B7C38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 05:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3724410C7;
	Fri, 28 Oct 2022 05:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3724410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6x3mRX2C7Hg; Fri, 28 Oct 2022 05:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B5040A02;
	Fri, 28 Oct 2022 05:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B5040A02
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C7C41BF28F
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 05:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52FB58151E
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 05:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52FB58151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQrQbuaaytXk for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 05:38:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6C1F81434
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6C1F81434
 for <buildroot@busybox.net>; Fri, 28 Oct 2022 05:38:10 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7FDE4440E7B;
 Fri, 28 Oct 2022 08:35:52 +0300 (IDT)
To: buildroot@busybox.net
Date: Fri, 28 Oct 2022 08:36:27 +0300
Message-Id: <bab58c04544d0247bce855c8b984ce0d5349def4.1666935387.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1666935352;
 bh=ZkL8Om2HlsH1jLf+/mvHRXaOhqGgP/Q43cTlZCYlpd0=;
 h=From:To:Cc:Subject:Date:From;
 b=fUv6F7u7SAGQLeYzWhJgtTz35+VtrrLx3OJZ4jsuvrvFIsL8JpUg3dBdXSK2zs1c6
 7hIbDekCX8UH/EtV9sBPnIukq65qt3lCSJi01yFx8tWw+0DAzLs/IqIhkN5jGNU9/0
 AfW0G/kzxe87UGR7n7gAKtS3OaBIWt4DHWGAEZyTS1FM4DMfthRKpHtIoZ8+5OoNki
 fQsms9v6EaRf1F815suLICEgYmEx4+itAAETA2rZcExA0Uy79VzlVdufKxCCh61wHb
 2bxvcrG9AvGa8h3ILXi9AqPkm3C7lxEvTZ5pI8SaylozAHGBcFEcie1Teo/+zxN5bj
 fMza+gDe0YFQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=fUv6F7u7
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: don't enable SSP by
 default
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 boot/arm-trusted-firmware/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 5070849d9b43..a9b9bbcc5a1f 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -212,7 +212,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 	bool "Build with SSP"
-	default y
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on !BR2_SSP_NONE
 	help
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
