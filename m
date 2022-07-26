Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC1FC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75A6E4174C;
	Tue, 26 Jul 2022 16:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75A6E4174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QY83bbiyw74k; Tue, 26 Jul 2022 16:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83ED241751;
	Tue, 26 Jul 2022 16:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83ED241751
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 837471BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 490C241BE3
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490C241BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ThTWSYiFgPW2 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:40:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2FBF4221B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2FBF4221B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:40:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 9F27C1BF206;
 Tue, 26 Jul 2022 16:39:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 18:39:48 +0200
Message-Id: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658853597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4QGXF+lCEouYig22Sh8Dj/4fPovl0qldzYW0iIgxHCk=;
 b=koINTriXP9C43WlxG3GGDfxs3XGjH7DKOWjCvkwrm92Gj8x+8Yx72VT4GVXso1hB6BN8Cv
 XdUR4NNySg8eZn1FtYjTaMtsM1y9alhaByas3LLOgCdBmMS9VhpJowv7T5krgdML2N969p
 RkzpqJ5SQcCx90i7+I9AouEoqNIC9FArZOPZ/f8n+UVaIz61chPVofI24Eyok+zdZvqcTp
 2oD3thGDKZ0Mt5/BMMJYNB5q+38YJZn1zXxcodHoZasCVGNFf+K6Ix0X3fTPHMU6MGuYDV
 uU303MEYmgSWnDb94XjazKKZ1qYKa4Pu0JinlRFnwxKwgQJ5Ghq202bNXb94mA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=koINTriX
Subject: [Buildroot] [PATCH v2 1/4] arch/Config.in.riscv: lp64f ABI is only
 supported if MMU is enabled
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
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even though that seems weird, the LP64F ABI is only supported when MMU
support is enabled. Indeed, as per commit
9a51381cedc16e6d70cb85e1144f6e0fa89af69a ("package/uclibc: prevent
config with unsupported RISC-V float ABI"), uClibc does not support
LP64F. But uClibc is the only C library that support RISC-V 64-bit
noMMU.

So the selection of LP64F and !MMU is impossible. Right now this
selection causes a build failure as no C library is enabled.

This commit fixes this by ensuring we cannot use LP64F when MMU
support is not available.

Fixes:

  http://autobuild.buildroot.net/results/6320dcc655f1871eb8bf6a9689bddde7447385f5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.riscv | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 288ed833eb..30bdcaa80b 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -108,6 +108,7 @@ config BR2_RISCV_ABI_LP64
 config BR2_RISCV_ABI_LP64F
 	bool "lp64f"
 	depends on BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVF
+	depends on BR2_USE_MMU
 
 config BR2_RISCV_ABI_LP64D
 	bool "lp64d"
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
