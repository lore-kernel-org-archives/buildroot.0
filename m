Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D16DC44503
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 11:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0263184542;
	Wed, 21 Jan 2026 11:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hH7K5EbSqJV; Wed, 21 Jan 2026 11:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C2284539
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768993344;
	bh=OQt5r8IPy+AbP9HFUxd6YMWQJRxc6zY4w/795Y69/oc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XDCMt4OEYB7DZnMq1sHljgwEAPikA/AiiAPWO2eAqXtEJ+Y5QsiNr5CGI/m/X+Gxh
	 eYkG9vJDsfYse+UQsz704OmIHhuDD6wui4MpAkkSsXmeZZpYkPySjNCNe74bmXaE4X
	 QaSPWvMtCU2bHsf4C+QWyANfrfGS4oqM4s5rMljV1fvcfcz/2swivure/bCFGMR07+
	 eC59A6pnsDe6XtGTpw1yh/NV2x3hF73NNuBpWhxuRAh7assSIJ1W9/YolqPLLwUHE5
	 q9PC11hwQVcESsXS6pmSb0hBj6Xrb6N/9aeYa7/onk3NSgSA/yM7MArvZpAhbpTn0+
	 +BXULycaIW9+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C2284539;
	Wed, 21 Jan 2026 11:02:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B61D169
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25DAB84538
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uo-c2pcFhEOv for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 11:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A989884539
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A989884539
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A989884539
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1581870134; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Jan 2026 11:02:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1viVyY-0000000E4uu-3HNL;
 Wed, 21 Jan 2026 12:02:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 12:02:03 +0100
Message-ID: <20260121110208.3355429-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121110208.3355429-1-peter@korsgaard.com>
References: <20260121110208.3355429-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=tYabR+UHKtB13t5gnnhG0u+50y5H83jCAAJAUyRJ4x6EGuxl+2smZj3vF43rHqHHyCK9mOjUPiPY9c9K/zS4ONPJkTE1OdQR+n5Y0r7xQqnF+BhxHd/mE5PQ5mU8OAQjM+h3m65T6MBosOHTjKCm89xhkFJU+OV7mrrohjBNgWKqgssSOIO+WOZpAvkMQJZeUSnA/pdA8gRdWfRpJU3jA5oTuAIVlJEqw1xq4EpylWPORguuAC7GfWwuIhIJhsP4cK6IACCm+LSaD+g+eUAK1OZ8nhOJQy9x/ndjN6nmwspQCoeUf2yLomnso4V1HyAMbSSMZ1Y7CAEv+M31M4Bbig==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=eDvrsHeQndygD8FIMCvbWFoM6unvkaCRaj9D1H6sAMw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=tYabR+UH
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 3/4] boot/grub2: fix 'targeting' typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 3a50ec0ad7..8cd56cad00 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -118,7 +118,7 @@ config BR2_TARGET_GRUB2_LOONGARCH64_EFI
 	depends on BR2_loongarch64
 	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
-	  Select this option if the platform you're targetting is a
+	  Select this option if the platform you're targeting is a
 	  64bit LoongArch platform and you want to boot Grub 2 as an EFI
 	  application.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
