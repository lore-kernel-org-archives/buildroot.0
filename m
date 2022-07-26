Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9183FC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2A8B8479F;
	Tue, 26 Jul 2022 16:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2A8B8479F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZKMvbpj4iQM; Tue, 26 Jul 2022 16:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 116D284775;
	Tue, 26 Jul 2022 16:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 116D284775
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8501BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5245E610FD
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5245E610FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CBiGsIQgiqJq for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:31:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B6A610C4
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8B6A610C4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:31:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 89F07240008;
 Tue, 26 Jul 2022 16:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 18:30:58 +0200
Message-Id: <20220726163102.2107923-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658853074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4QGXF+lCEouYig22Sh8Dj/4fPovl0qldzYW0iIgxHCk=;
 b=iaOkL9Guvw7GE56UVeT17I3G3IWM64FbK4u9hwd+/ZHqNYlDTsbeBNcNFVeBJifD/p69ZR
 seOMLdB91VWwWvBfZSMrwbtWQa5o+ej34quPaEL+uleF7lVDSSMa+UrpmVOEOs87ThamrR
 Hp7s5YK2lYBC8gYKVdCCf1RrpvRh0TyCmcuJZlVJbjw7xBHwYzCxfliVcHh+59zYHGag9z
 jJAVDA+cRN33OJ8FhzsXS8WvqmB9Y1VTJxg7cctzlg7x14p2aCddKXEhheoqDqgnUsXu6n
 QOkIK0qTSBnA0jYCWCjForqhITtqDh4OQEk4ZMHdGR23UODoVZ/3PqMMWqtzWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iaOkL9Gu
Subject: [Buildroot] [PATCH 1/4] arch/Config.in.riscv: lp64f ABI is only
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
