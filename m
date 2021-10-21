Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271E9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:00:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7561961208
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7561961208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CBB760619;
	Thu, 21 Oct 2021 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RFtecolRol1; Thu, 21 Oct 2021 22:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C18DC6061C;
	Thu, 21 Oct 2021 22:00:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB0C61C1135
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA82B40298
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUmyq_VJJ3WR for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 22:00:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1735D400C9
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 22:00:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dg6pm7gvAXRKtdg6rmSRyJ; Fri, 22 Oct 2021 00:00:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634853626; bh=VcSMarA+uT/wrBg7P/pOhab8mvUuimqqHnUJPLx2edU=;
 h=From:To:Subject:Date:MIME-Version;
 b=Rku2cX3UNWoYyXBZpfSUonWetn9JvmVEbwc/Vzbwjb61mrsfH8xGj+zJNEnviaQbm
 dvc5AUl6Al9X7tvTLM4uhJ4s1U6UFQU0rol3cxq3NXMKcMZxo+SRhfNQx8duA/s2sL
 9bzwesuG3/VCZShommdasD2B4P2+j9WWKhHAI3lDtW1qR6fQC7FlzGzRR8tV6ekQjD
 qNsP0OxN9eBiPMJcZOCQzdvbDLLFwWJsbf1VAjz5PpsvMt/YjsQG80fkDZ6ke2gJ1L
 iidsr1Rf5IGFyeXEdTGXLE80Jx8sS4F9IlXy4M9mRSflnUrUOV1lx1KBIglVM8R52w
 dmr8bF3hDtb2g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 00:00:19 +0200
Message-Id: <20211021220023.68288-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
References: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBepXam1VQFHToa14nI3i4LpWd7+yw2DmaRt6ksWrsrvD5tzpb8xF2znxH2tYemGH4mBj0+sPp7L4rZVt9aaTDBt36wXjHzosCPPPaWgrrTrrhqTS5+b
 jVPHhhRxHmW+PTD1XyWTZ+xI2kgNAYKirMm2Wb8/tiJgJKLdJ04d+EiLdzRk5NpCiH5xUQKPe2MtedYxdsr1KxfyBJsfyLOjRs3AkmrpPszgQw6wDTlyqPt5
 ienL9nKWnwJKBmIXxS31TaRVX3PI/E2XLiT/06fH0cPn+QOoWZuIdji/zHB9v2/C0meFEyfVXxKzGqMcC0Wl6+RX0ULQcIXJirfuuQL+pH70xF8r6Qlpe/QC
 7QcRNB2DCV5eVb/0GL/sRtlT/QY+JACz8ifLzD8nPzeULbm/7PIZAlEFAZyPp0NS6v5AVEYH
Subject: [Buildroot] [PATCH 4/8] configs/olimex_a13_olinuxino: use FPU NEON
 strategy
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A13 supports NEON, so let's use it as NEON strategy.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a13_olinuxino_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_a13_olinuxino_defconfig b/configs/olimex_a13_olinuxino_defconfig
index 14cec97d49..5412596441 100644
--- a/configs/olimex_a13_olinuxino_defconfig
+++ b/configs/olimex_a13_olinuxino_defconfig
@@ -1,6 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a8=y
+BR2_ARM_FPU_NEON=y
 
 # Linux headers same as kernel, a 5.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
