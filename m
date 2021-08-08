Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A194DC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:55:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3492860EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3492860EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00D116069F;
	Sun,  8 Aug 2021 19:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GIEfFl05-BjV; Sun,  8 Aug 2021 19:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6323C6059B;
	Sun,  8 Aug 2021 19:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E76B31BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5E9482948
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6n9-krU1oAa for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:55:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 056AB828DA
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:55:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A29E88D2B9; Sun,  8 Aug 2021 19:54:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:54:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c91e82b25f8d8f2eb7985ed2acf9d5577b5f892a
X-Git-Newrev: 5f432df7e2d26d6d57d750cbee1a573c1f886e26
X-Patchwork-Hint: ignore
Message-Id: <20210808195443.A29E88D2B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: change
 ENABLE_STACK_PROTECTOR value when disabled
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5f432df7e2d26d6d57d750cbee1a573c1f886e26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit
cf176128ec4ad60c29c8828cab1887f69edb9473 ("boot/arm-trusted-firmware:
add SSP option"), we are passing ENABLE_STACK_PROTECTOR=none when we
want to disable SSP usage in TF-A. While this works fine in recent
versions of TF-A, older versions such as TF-A will end up passing
-fstack-protector-none in this situation, which fails as this is not a
valid gcc option (the valid gcc option is -fno-stack-protector).

To solve this, we pass ENABLE_STACK_PROTECTOR=0 which was in older
TF-A versions used to say "don't do anything with SSP", and is also
still supported in newer versions of TF-A.

Fixes:

 https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738580

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 7e46a10270..9e171f414f 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -204,7 +204,10 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL
 	string
-	default "none"    if !BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
+	# While newer versions of TF-A support "none" as
+	# ENABLE_STACK_PROTECTOR value, older versions (e.g 2.0) only
+	# supported "0" to disable SSP.
+	default "0"    	  if !BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 	default "default" if BR2_SSP_REGULAR
 	default "strong"  if BR2_SSP_STRONG
 	default "all"     if BR2_SSP_ALL
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
