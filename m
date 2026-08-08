Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D30C5AD44
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 09:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF8B80F90;
	Sat,  8 Aug 2026 09:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zfILoGjeVqU; Sat,  8 Aug 2026 09:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4386B80F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786180024;
	bh=H0x9cyawaAbnmjEIvS3OjaQUfmJfA7I8ptk0idHlAcc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ogtUCl3FKH7JLKuOUdSnoZoQ9/AdjhMVxpTeCp60P/1Pbt81RyNZ2u6a1wZbohAUm
	 QWZR6qS9i0YPnZq6zqzs6YmF2eYBqjqDWUgdhrlPGPu1PxBlKT5gDwWl5XyKwmjx0n
	 jgdHtxImo6fLjG+ugp2LARVSGGwkKX0TRnBVrYwZtEo8i1xSSDpEqO+e1Bw18KOqx4
	 UI1c2fblj9rd1iW9Byd4Aw8TXao63l/SPR1axM6iAkyhYu5h1aIRAWHw/jlvgc29qI
	 uv84yCbo2NhTboXfmo/gL9UneMjGrslTUeTq6oTUEuAQ69/6YcWvGlj2xgkqZmmstV
	 Tz1CfPJ6a12Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4386B80F88;
	Sat,  8 Aug 2026 09:07:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 864442B6
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74AD480F70
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7weVPVmA7AgX for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 09:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F56880F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F56880F88
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F56880F88
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:07:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2D20D4E41158
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:07:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F16516045E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:06:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C9DAD11C4836D; 
 Sat,  8 Aug 2026 11:06:54 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2026 11:06:41 +0200
Message-ID: <20260808090642.785882-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808090642.785882-1-thomas.petazzoni@bootlin.com>
References: <20260808090642.785882-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786180015; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=A4fdJYjTmHnDCleTdYcrvP/+p8uzBXWn6Dsmwk/MNbI=;
 b=JmiALPh0kN4XYax958zOFUn4jxJIwQrGI3HMm4G7aWt1O9Ygi9h/gVaudaUJvEqi1gnJXL
 MyVWbvdU9m29GYnUYME9oDK20TEGb7Ix7TX0zDGX5YqiKuvyCk+6xpewetw6qDHS33s3uM
 2osjsIu6BXUYhWX99I4hIGj5wsj5Y6BV/61Fi545Ts+TMxNsGzcp8W4C7Yhy13adKyKSZX
 2k7JW2NZo8mrYNsnjwYX5IUuFQXb9+xutr5Iyt07YkEzQi212ASYgtHUsBp9Hmch5faHjN
 eibsXcTHlZHkzZmZjPVoURyhfD4JFhqQOBppIgenOB8jaQMXkOc0bud+6pbQtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=JmiALPh0
Subject: [Buildroot] [PATCH 2/2] package/tpm2-tss: do not show comment when
 dependencies are not met
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 5394df6400912efa7da4f97c7ea68a81a9f77c1d ("package/tpm2-tss:
add Mbed-TLS crypto backend support") added a dependency to
BR2_PACKAGE_TPM2_TSS_FAPI, and a comment about this
dependency. However, the comment is shown even if other
architecture-related dependencies are not met.

This commit fixes that by only displaying the comment when relevant,
i.e when BR2_TOOLCHAIN_HAS_SYNC_4.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tss/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 91337ce48d..f4bd8c3cdb 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -56,6 +56,7 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 	  https://trustedcomputinggroup.org/wp-content/uploads/TSS_JSON_Policy_v0.7_r04_pubrev.pdf
 
 comment "FAPI not supported with Mbed TLS backend"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_MBEDTLS
 
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
