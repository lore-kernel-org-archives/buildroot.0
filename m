Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C2ED6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 18:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74EDC811E7;
	Thu, 22 Jan 2026 18:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tz6QpxSe3FKM; Thu, 22 Jan 2026 18:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A9A811E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769106958;
	bh=k0JlPCU0FNitl11blXhl7af+W663f3L2lMzBdV16WPs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TMP56UoPwk6SA4uN2I3/HYVpYqjoquH+gRP5NA8TBpU+9ovG1I6KPkygw0/RhnLTb
	 p11Vqnmy2QupuRRAzEDoo9X8hHx+P3sRylye+TFOmAwEQC+XzdLC9C+SKhhHQfBEe1
	 XUz0cGbPwAUh18nm/0RtruPNwhIP9GI1PYqY5b8WWx+MBs/qEWelGhxNo8nVxkiVu5
	 fcUtrX1PyZGkfRGXQe3DeD2gQj/BqMccobSPGJ5VECXJCm2amOZG7SVuhdCAbqh3WI
	 K8Cfax4NNAalMWeTH60g4yRFAupoh4/2Adihyh3BGc1q8jIiNmT+K4HK8bABO2XJeJ
	 PUY3KcslzGrBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A9A811E0;
	Thu, 22 Jan 2026 18:35:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19A00122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 098646067D
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7j133tj7Cwdq for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 18:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 042B36067F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 042B36067F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 042B36067F
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:35:55 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so13122845e9.1
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 10:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769106954; x=1769711754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQtYAIx2Mi9KTd7r0atqXFKmvD+RLpiHsknuGRvrSXA=;
 b=wY1gCAV9mcweLumLOhMv+i7XhGCs1lZ2ywHQK6Nca/8NLJsUgsIkK4u4ezMRim5bt4
 iQqNIl/Dy1O8m0hHAhlY7b/ToQnqGbc9cjQGg9n8dtXn0n1i3ItTzDEbHnNKvBSVZNXR
 32CnvKJxQSHzrV4ifbrWTOdok9V6DbwvH4qaRh3mQtl00qh0eXkpeZFxnCGURfwYS3NQ
 j/S7UMHZkRjjD4HeFl80ZjOSnwqIOvmLQmysCZ6pg6wldNLZequOCJCo4PJUosn/7yCe
 D9W/+VQfHiSWzuspZMT1vMkBoYVdCXVfzvuGFzj4VCbrngzkyf48lnSBnwAAJARosJ+M
 egMg==
X-Gm-Message-State: AOJu0YwRupTdFw+9iH70mMXWed9LPH7UYuTjw1uFRiGoK2TzGTkKNwVl
 6okmw9EshglvaYq1HT49XJD86MaZviDi9LbbGilJNU8cnefN97UVFPUptCg7gIitba/x2Vt2YGD
 UHxh5
X-Gm-Gg: AZuq6aK9tquh/WboH51aAvDB5frWqni3HiqD1SXQuUsYoVtbMQTQX2OvRonBnt0glxk
 13OTkIYVnjc0L7Unfcg8m1u2WvJZt+jFuvyqgBF4/L7K2mbAdgonBpFB8kylqNDPlN+1ZTIivma
 eDdvCkozESkaWqGZsqjIWmyhKrIdzw4Px3L17O6betttGjGoBldtPunj6bCeBTCBSgcpDc/dxtZ
 Yrn38AIecq1VBsveCc7H2QVBxcMzyxc2uFYrANbQhjYWzomYRV/xSaI0v8k0AHIWWIgWyOKGGMe
 2DY6F6R3V0YxgjZs2BjhB42QFUOTjPGNnZvd4tjmrJ0EcIb54ILnUF6Da8BLXx/vx01SotuXSjG
 F9Ha/uVJINuBaZPUF+/XaB+NAIqCzQOgslhWEQiHAh0gVvG8ViIsR99cNg9F8mPODHC20ACBykc
 /C+F7Eg3LU3Erjv7pt1TjZUtk55jlAKZiq0SYqAg4oAUsQL+HoWKOOBEuojAOl1Vee2sVO/s9Mi
 rUz10OVmot1TnlVPchDMdZSG9yyd/Frfg==
X-Received: by 2002:a05:600c:46cc:b0:477:8985:4036 with SMTP id
 5b1f17b1804b1-4804c947c6dmr9999095e9.1.1769106953772; 
 Thu, 22 Jan 2026 10:35:53 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c01783sm581399f8f.3.2026.01.22.10.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 10:35:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 22 Jan 2026 19:35:50 +0100
Message-ID: <20260122183550.475600-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769106954; x=1769711754;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cQtYAIx2Mi9KTd7r0atqXFKmvD+RLpiHsknuGRvrSXA=;
 b=BF2ILFQ45lMEK7rktA73KVgcaiB1WciYigN1NDPzD80O8qlnbAZmgqXqynUscijbXo
 thN7RpUEAEBCsFT7urnDaOJjLJbQuPzrpmqvkQyYt+zb1jwL//80ny/YGJvs9ApK0tqB
 UOyxRhof4/Q5U7mH+MwQUIrvcPhYoXWcEAKOc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BF2ILFQ4
Subject: [Buildroot] [PATCH 1/1] board/stmicroelectronics/stm32f469-disco:
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

Fixes: 04a0094f0ef0778d1f3c4056ac0005218126147e ("configs/stm32f469_disco: fix kernel bootup")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/stmicroelectronics/stm32f469-disco/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
index 99d26ccb66fb..6d46f7c31aed 100644
--- a/board/stmicroelectronics/stm32f469-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
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
