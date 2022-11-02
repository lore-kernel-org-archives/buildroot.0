Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AEBC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D8FF60F8D;
	Wed,  2 Nov 2022 22:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D8FF60F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qahxI_oPCUeC; Wed,  2 Nov 2022 22:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6646160E4C;
	Wed,  2 Nov 2022 22:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6646160E4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9B271BF966
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B26A541717
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26A541717
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqLj0bqKhulN for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:47:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B461340871
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B461340871
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1DE287AA7; Wed,  2 Nov 2022 22:47:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 19:58:39 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 27fdbc129b53e575a3bce9265ed287207ce4e848
X-Git-Newrev: 9c545f74c598ca1e988fbb11338db152baf6142c
X-Patchwork-Hint: ignore
Message-Id: <20221102224704.A1DE287AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c545f74c598ca1e988fbb11338db152baf6142c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index ad87909bbf..ee009ceb57 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -199,7 +199,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 
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
