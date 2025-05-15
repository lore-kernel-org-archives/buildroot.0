Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B64AC2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 15:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F5A415D1;
	Thu, 15 May 2025 15:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsMwgRkaUx_p; Thu, 15 May 2025 15:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74C240DB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74C240DB6;
	Thu, 15 May 2025 15:45:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EF0D13D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 15:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54AAA81168
 for <buildroot@buildroot.org>; Thu, 15 May 2025 15:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQbjaa_pukXz for <buildroot@buildroot.org>;
 Thu, 15 May 2025 15:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6634B81189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6634B81189
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6634B81189
 for <buildroot@buildroot.org>; Thu, 15 May 2025 15:45:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a108684f90so724369f8f.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 08:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747323907; x=1747928707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pM2S/MS0jF2RpaTVTW7OAXjweVq/bbh6GuJ31SH/+/Y=;
 b=CBylJWsZljOV/72SasPtYx1Y3m4RtnbivOz7SKLmFmHJjt8Xeb5TgLAc877lZK46A9
 G2pCuC2qk4Km9kYTtSBWuy00hRGoYpAdFTOoZpKtB+xsHzCZy7g4ER1RX3w5CLMzGJyD
 gBzGUnjl7CsPlYbC8upX2rGKO3KkxD3e5+1u9a8zNaFAYG25/hrmlD5ukzPT9EAX6L5x
 w1KNYk5TZYmYvZ5XDi61Uvn8T7HRgpGjqGocOr4pgkE7/3e6oZpxEdFhanmfNQG9n4ms
 +SvwncVoYNHLGPjQOt1ZugLcsJeoinlEMeh7CR6bweP+OenOWRu3tOuzC+lQtC/9e/6E
 HI5A==
X-Gm-Message-State: AOJu0YzMS5ME5CLkwSY1IIuS9ANVYRmwsMPvAK2Gau1HRfsCGKUNPDbB
 KdJ+k3ENXc7AIW1YUJhBnZHLhFSpox4IXb5w1ve77uiU5+jMXexy7+uXdSXriaZI7+FZ7qf9Kjo
 6z5rWnRvpTg==
X-Gm-Gg: ASbGncvID4cNIQDDR8HV7XdvvmnaB+UBI9aQJdfxupEWubEVfuRQb08pi9wbsOEmTsD
 BR8/E5bF+ySDLcejZHVaRKxNy63w/cFV+wFi8xIfVb4rbRv2ASmEkc9kChfDm58sFGcLeJWxQpC
 PAn426wYAsiCK6hrYnJQ/9F/lGTiiXtZMjvPDKcy+ZJU0b+BF7m/KwJsygQlZN/WDycCBsz6EYN
 /77fGWtfuAXYkf8BfMTQm2VKEjlkH7UgiCHtdsraRre55sKLzJegEQrG3YFYCOc/Ml/+bkalShO
 n4AImmzK6C8WN0/TognOAJDvWYgzORH7qjXezJHOPs6wXIVk+UNlhphRXup8h2JqFGHNAUS8iz4
 d+GYucdt6nxX7mla/lMjDyXUpPQKOOrQKhnUH4+HpovxlFy6z38OKFg==
X-Google-Smtp-Source: AGHT+IFZORywbMOoaYUPHlulvCECDHaJsFo1JznpkIH73a0KJS4D7yTc6nJ5pMOVYIAEpOlQiqaLKQ==
X-Received: by 2002:a05:6000:230a:b0:3a0:9dc2:5e0e with SMTP id
 ffacd0b85a97d-3a35c835093mr295942f8f.11.1747323907153; 
 Thu, 15 May 2025 08:45:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de
 ([46.189.28.50]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebda7d2csm57858225e9.3.2025.05.15.08.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 08:45:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 15 May 2025 17:45:04 +0200
Message-ID: <20250515154504.929058-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747323907; x=1747928707;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pM2S/MS0jF2RpaTVTW7OAXjweVq/bbh6GuJ31SH/+/Y=;
 b=r8Xt8Xy3nX2nqIYPF6iSfNayr3hDuT1/8gyCDZizV8UAj+ZRbh95ebvdqJ15USwOnL
 FM5YJoa++V0SQ8ogEcSU1vmJAZRchxwhg1ZPTuJ5zxhoOLsJ2kzfa8cr3971gbPG32Vy
 SesLysFmguaTRlM/oTykV0Y1q2sd65amFNl/I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=r8Xt8Xy3
Subject: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2: erase the
 entire NAND chip
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

From: Michael Trimarchi <michael@amarulasolutions.com>

If an attempt is made to create a UBI volume and it already exists, the
operation fails. Therefore, before requesting the creation of a UBI
volume, we erase the entire NAND to ensure that no errors occur.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
index c01d2d6c1dac..f5b94c24d83b 100644
--- a/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
+++ b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
@@ -10,6 +10,8 @@ SDPS: boot -f _flash.bin
 
 FB: ucmd setenv fastboot_buffer ${loadaddr}
 FB: download -f _image
+FB[-t 10000]: ucmd nand erase.chip
+
 # Burn image to nandfit partition if needed
 FB: ucmd if env exists nandfit_part; then nand erase.part nandfit; nand write ${fastboot_buffer} nandfit ${filesize}; else true; fi;
 FB: ucmd nandbcb init ${fastboot_buffer} nandboot ${filesize}
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
