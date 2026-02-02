Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CD4E7315A
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7F9883C61;
	Mon,  2 Feb 2026 11:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FksZbDmuJrR; Mon,  2 Feb 2026 11:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5261583BA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770032588;
	bh=FZVvHGzBlPN8L42v1sIa0un7QU0nowEKkd+N0YHy0R4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y2lYGnyMNUKq9ett+vW6GfsBO/Q9AJSwfB6e95C56XajbmGAN8CCOZj+ZbgreEejS
	 cfsmJcmb/1jkLcZWwZfuUtb04c/niTiPX/SzsMCjz7LF27PCO0Ksbth1nh2Wsb18bK
	 yeN2rIjKT92u97WV3eRSMG063EtNTlAy8Yrjx/3VqJMSWLbF22N+7BPZq6x5xUfLV4
	 j++CIeV39ottexQa/RrRBkdQCeiILd/8+8r+ecCPCrCXMiuRLkS/qwhlER87rvFuOs
	 +Y7cqGXF/aozB9qW1hjqHxpOWkggmpKJ58tWIlKZSWCCJHEuojeapRGF/0wySfLO4l
	 7IlSl16EcySKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5261583BA7;
	Mon,  2 Feb 2026 11:43:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C402C1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA8E260BD2
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrJdomkTSFKQ for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A68F260BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A68F260BBD
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A68F260BBD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so2314904f8f.3
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 03:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770032584; x=1770637384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pEajMr18/rAKFjOChrMLjVz4KQ/Bx6p6xqHVgxD0ltY=;
 b=oJSbX50pyKA+GFN/txHMuPPzGPQ/ee5v/kZYIgg//o4w+6gkxyA/KrH5U2rjqg36jD
 /cPUmrLfOSqBEaBYEL/WWkUblmu8GwcH3Qm6y/ReATdqu+QXt8W7iTks1N/KybSrwWh2
 UNW13hGxmYWuT3AiQwt1d92k40PEz1E9tdIXZCj7yFB+ua6BGmf+vtHbWIJwcnEsih10
 CWVtXGvtOTJZvPByCZ3LFEynG+NZiwtxrcp7l/S1Nv+q1luNBrFNrBOVDK3dMIaqsPYA
 Pkdh5uTBROVEnwZMFNNbBnkA1CVXsfFSbbb9BFE5aoU1LeEGN55g7I/bFiehEu60WX9/
 YY2Q==
X-Gm-Message-State: AOJu0YwylMZvezyHgrixUB5Dqk3MKJdvqAfrexkQhvHo6i/gNk/GjT5C
 s4aXxdejywu7WcAI+GKm2swxeVgyZ4rgKXG2urEhEFQNjHiGNeDhl4DZjYrOqw==
X-Gm-Gg: AZuq6aJy3vImPkItRrxMV75s0kbSUgRbYrvjEbrCV3sOLusXRzFXxvMOhKU82IVxH38
 1ALYOcsuLeoUIVt0uoB0HibbJdMWepu/O7soCuY1+BmaR+/Ke7X7TYmVPTK68FXUW4N/2sfK9Hg
 SM29Yk58JXRY/SYCEcpK7/XLJWnPznW3jklunhE82D31W0zK4tk2u9R3v+DoKqg85rq/JJzaYs8
 S5lpkF4gH8kX8+U4Qz4kfXdJi1mpw2tjmGjp7nrZiJxtYjp1WDm/qtSUxCTqH9yY7MawIeSDzWY
 2wQhRBPPJQOrAw5GuRF+Y+J5rU6OC0aolI10l5FenszjCkd+usIdH5C2VQ6vtSnPz909AFiRt3v
 f3toG3eyekeos0g5ciCe1nyFcLd7fUkceiP/3Qr3sZoE73VIMxo4pBEArqNLk2PKzGyJubwuc6G
 YXgl7O0Z8UMA+NRw==
X-Received: by 2002:a05:6000:4308:b0:435:8f88:7226 with SMTP id
 ffacd0b85a97d-435f3aaa871mr17954123f8f.40.1770032583461; 
 Mon, 02 Feb 2026 03:43:03 -0800 (PST)
Received: from freepad.iliad.local ([213.36.9.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf4asm44246777f8f.28.2026.02.02.03.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:43:02 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: olteanv@gmail.com, thomas.petazzoni@bootlin.com,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon,  2 Feb 2026 12:42:51 +0100
Message-ID: <20260202114253.283868-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830173313.164981-1-olteanv@gmail.com>
References: <20250830173313.164981-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770032584; x=1770637384; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEajMr18/rAKFjOChrMLjVz4KQ/Bx6p6xqHVgxD0ltY=;
 b=l3HTo+MEXy1vrIemHdYWb7dW1vhjKBJNd7gf5dDfMSFfZUldAgJjPlLgEVdzMp8CO+
 ZOwcLpazE0PiEYGQe8Q16L1b27Iepx5mzL6LoVHn6l+vcFKqilT9F7R94QgHFw6GeG+z
 pK2c3eqriZ+XARpBv9PwSehVP0ACusCgh9WuMxPotIvWt9CJDz0ufwc2eLk5aQOd0JIh
 Q2V73wYX4/Oo1HHQJfrNY/P/rK4B32xtwHG1vUbD4wPGxusCInYLumPKeKTBAF8K83eN
 6UlkwYlnevZa2A8mkt6+7EC0K9+QhWb1CjuwYvNofaPfSBS0AzaKGpgA4I5nhw1Nlj2K
 mSGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l3HTo+ME
Subject: [Buildroot] [PATCH v5 1/3] package/qoriq-restool: add runtime
 dependencies
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

The scripts shipped with restool require:
- bash: they use #!/bin/bash shebang and bash-specific
  features (shopt, declare -A)

The ls-append-dpl script also requires:
- dtc programs: the script uses dtc and fdtget commands

Since dtc needs dynamic libraries, add the corresponding dependency.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/qoriq-restool/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qoriq-restool/Config.in b/package/qoriq-restool/Config.in
index 600c2c958d..46330e8cac 100644
--- a/package/qoriq-restool/Config.in
+++ b/package/qoriq-restool/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_QORIQ_RESTOOL
 	bool "qoriq-restool"
 	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on !BR2_STATIC_LIBS # dtc
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BASH
+	select BR2_PACKAGE_DTC
+	select BR2_PACKAGE_DTC_PROGRAMS
 	help
 	  The DPAA2 architecture in Layerscape SoCs consists of
 	  networking resources that can be assembled into various
@@ -19,3 +24,7 @@ config BR2_PACKAGE_QORIQ_RESTOOL
 	  that specified in the boot-time DPL file.
 
 	  https://github.com/nxp-qoriq/restool
+
+comment "qoriq-restool needs a toolchain w/ dynamic library"
+	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on BR2_STATIC_LIBS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
