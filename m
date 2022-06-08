Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C99C43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62E2F83F83;
	Wed,  8 Jun 2022 07:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fck8zj4qu9zE; Wed,  8 Jun 2022 07:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E7A483F68;
	Wed,  8 Jun 2022 07:13:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC5CA1BF3D2
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6E1283F63
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id up14GdK2p993 for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:10:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E582F83F4C
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:10:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id AE9EBFF80A;
 Wed,  8 Jun 2022 07:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654672248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDt5z0tGs89M0r4iqmhmxAaINi4fSl0g7wn1kNNS1kU=;
 b=dgRH76dVC3A1DM0qPsG5RncdkrCCKZtMQdPWfpuJ2MW8T6nyt5DQefrMI2JOn1x8VDJcfr
 7cN4Tji+slZchk5o921F3ovlUsZxpnf3cG5vhPqlI8H3Y0HTAHL5xV6nnwR0sIeGIuspWQ
 1NHgEgN6e0zHRF14R0iXQxyN2lyWcW9seVaHleoSmujRjirYSPVZ+TGBqhlyjHXNz4zeNt
 m+VW2yAHu1mW2wHZx/HKOEHFxsm95ZlPS85OaYBag2Gep5oirbDediwQdGMtmuE67MQ+XD
 GIacmzWnvhtx+sUWY/BF5ceIXRc12e4I/tzMbsO6XqmoPNLm4QQAZWk28RNIUQ==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed,  8 Jun 2022 09:10:25 +0200
Message-Id: <20220608071027.3384469-14-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 13/14]
 support/scripts/gen-bootlin-toolchains: add support for ARMv7 big endian
 toolchain
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This Bootlin toolchain has been available for a while, but was not
supported until now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 5e1e315f6d..257afc69db 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -56,6 +56,11 @@ arches = {
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
+    'armebv7-eabihf': {
+        'conditions': ['BR2_armeb', 'BR2_ARM_CPU_ARMV7A', 'BR2_ARM_EABIHF'],
+        'test_options': ['BR2_armeb', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
+        'prefix': 'armeb',
+    },
     'armv7m': {
         'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7M'],
         'test_options': ['BR2_arm', 'BR2_cortex_m4'],
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
