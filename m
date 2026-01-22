Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DE8D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 18:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8107840797;
	Thu, 22 Jan 2026 18:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2Rr6Wpd3ecw; Thu, 22 Jan 2026 18:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F7A34086D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769106892;
	bh=tBj4ySw+jIg1l+gXL8AHzYRZ2e14wXMi76nGTzhrE0s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V+uh4o6K8IclhpiztoYr9xIg6hcxODAyMivdN4FP9XXo8rDfmicfJrGKoY1xdNLTB
	 IT9LMycQnWCEDPqkJjSBlxi00hyAii1ouWqrLdmL9uLN97ERJgsFoL/pTNgaPO+eei
	 dQAeZ9X8vEw2GcadKMLo/ihf7wJtf+b9AI6Kg0mMF6gvViw6OFCkQjllTVN4xVDDbX
	 PzrUSJvWn5cMLpIZPFqTrbIOAzSXmwUcmlUAJmAd/D/mEcwoslqmYBxz034pGdE78O
	 DjF9audV+H5kr5Wwv7qvYzWNC3FRUMI1iOkx2Dl1uCj1zjsTCukht1jOnpvm2kBL2i
	 qApfMpENBy4Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F7A34086D;
	Thu, 22 Jan 2026 18:34:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC516122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CB44605C3
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smLBj-x33Zvx for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 18:34:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1E136067D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E136067D
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1E136067D
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:34:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so1280051f8f.2
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 10:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769106888; x=1769711688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6WOLuFSrtKhxFRJXnz2QzRDcf4ijQmPJ4XBjRQWAV9w=;
 b=aSMiMGXOYaFhIWmwtvTERe8HcTySMA/ENUhZwUh4zPpxCstos4Ug/XPSuFmnymSOUa
 wpun4jYTi81ny1CYf3eXt/51bK45nu6zl/uE/OIQEcMjVNuOE9v/Q6p6lqIwyA0Dd/5S
 nu0iNgGA6TVT49EC0WqAD8lhTJ6pm2BgYZ6LegvnbDXFyN/TRWC9fqkcRP4I+x9Qrpgx
 mMcZvHfr5dLVaj7g6+YjI/EUHnl8Ljs9csOY9bBB167LHNWece+yEQydhvI/EoW8pDGX
 O6EfnpqxPFmMDZdDGgqctFXv3feXE9XqJ6CaQpnLHTr3QbVy3mWrKsGMEb523muJgFZD
 spUg==
X-Gm-Message-State: AOJu0YxwCTU82ofwNQONsU3kkbn3/RtLYw56eJtyRNO4cGaSo1kg7hEw
 gQ0i0v/opmtfWbo1/6QvFAZGqCNzKQ2LNCCCL7oA7dUwi6+kAj/t5ErUik3eWNOFJAm1xWLN7tp
 MLrjM
X-Gm-Gg: AZuq6aI6tfdgSJHqKpJEFz60aT9TiLtIRHbSeRTgtqHLblxv13nXvevpNCIkxi1NQbR
 xHdUk2bhK6deSlP6/7/lQL7TT2CU9vew9jHklJKrdfFmW5dj70VJGE+7+7ur7DOBuTbuwA0xOZk
 /sOrf6r2HC1WSZ6BGSAU+VxNbe7FS1etwB04JgnCs8zWM4QxapLUiBAWpjFxKc4HsTpjfXLbdNe
 gEOxUCzAmd6/lr6OMAfqkNzZUHX3uvQn4l8Np7flPDS2nYQ3MaeKcHtgL+e+KAggXHEfh71knaA
 tOO8qka73vs8mzz6/ij/j4VwFYpxpq8PRfX2w2b5a2jJ+hOtsphP2VMhRFR2UBsv4EnG8Can6rA
 Fkk/wCo3Mg0njyZ53oiP88pELm9+3zpOU7rdlZYQaANoDVz938jme6Yo7yVe3H3o5792B+DoFfM
 3vHZRT0WtR2kT/CnUQxSuE7U0vVIWk7cy/YiaqvHZIPPxx/GtXt3T/5ZrrD5fWvZaKKHnWJftkf
 HsxEf0FwaoWq7pjauKS8/ZbS78Qp4WmRMwx8713tnVN
X-Received: by 2002:a05:6000:2886:b0:430:f494:6a9c with SMTP id
 ffacd0b85a97d-435b159cac4mr794949f8f.17.1769106888011; 
 Thu, 22 Jan 2026 10:34:48 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24f15sm532896f8f.18.2026.01.22.10.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 10:34:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 22 Jan 2026 19:34:44 +0100
Message-ID: <20260122183444.475411-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769106888; x=1769711688;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6WOLuFSrtKhxFRJXnz2QzRDcf4ijQmPJ4XBjRQWAV9w=;
 b=iMfNqFVtNyf75him6qEizHrcm+AhOCrLNXq5BR5ds1/9lk/zeVpwI4kpy6VbGMgBDw
 QXqerrm/KTmfARa2aeM0jgfWjyLpJWLeuwiUtX3i5Psi/3a0Nnq3p/tYKvG09pPqF/1x
 rkmKFdJe2ANeMQIDPFmgsdQiubdje3s/X1rWc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iMfNqFVt
Subject: [Buildroot] [PATCH 1/1] board/stmicroelectronics/stm32f769-disco:
 fix typo in readme.txt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a missing space in the "Creating SD card" section of the
documentation.

Fixes: 1a1239fd286ec5602e6ea29a1799e26b6254202f ("configs/stm32f769_disco_sd_defconfig: new defconfig")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/stmicroelectronics/stm32f769-disco/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/readme.txt b/board/stmicroelectronics/stm32f769-disco/readme.txt
index 8f4f79a86138..5b8fba7099ef 100644
--- a/board/stmicroelectronics/stm32f769-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f769-disco/readme.txt
@@ -20,7 +20,7 @@ It will flash the U-boot bootloader.
 Creating SD card
 ----------------
 
-Buildroot prepares an"sdcard.img" image in the output/images/ directory,
+Buildroot prepares an "sdcard.img" image in the output/images/ directory,
 ready to be dumped on a SD card. Launch the following command as root:
 
   dd if=output/images/sdcard.img of=/dev/<your-sd-device>
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
