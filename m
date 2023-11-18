Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB1AC072A2
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 01:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5730142D3F;
	Sat, 18 Nov 2023 01:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5730142D3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4KclcP0sBfg; Sat, 18 Nov 2023 01:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4B4341939;
	Sat, 18 Nov 2023 01:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4B4341939
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3211BF329
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 117A14151F
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 117A14151F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KNZ4eAI9GPF3 for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 01:55:09 +0000 (UTC)
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FC5C41778
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 01:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FC5C41778
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-581fb6f53fcso1490244eaf.2
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 17:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700272507; x=1700877307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AHspa+MTYqwQBjl7u7JHBafwrMWwPXAh26A/LtReHjM=;
 b=AJZ/wc8YxWI47VrnTiZarERvm1sq0xNZK1DIMEev3Ar8RlTL9DVwYONqgpVyBck9fp
 QXW/525wtGMbhzAx1ZbZnWCNTXy8FB8RO65cA3U3EoIb7UJAh3vK+r8T6OU+WzQZlF89
 Gz6OU5LPp3055aD9wxWqwYzs+9cK02QbPdZ7DopX8VH5jk7gJUew4sMv2S49xJUXF/Ux
 GrhpqLZA/nYxFLnebXNrgolCMDOWu/+3RozpkBRW54kxRUFNegK8SQTzzoJ+HznTtKiC
 vqFhZErLVoFTDmJzxY3qHopigng8dwxtULW7CIkh2bFQ9h7m/BRedkWjRPa0IgyzNcJ2
 uRRw==
X-Gm-Message-State: AOJu0YxQBwB+gywFznfo7UcN5ImvcYA1Q2VYvfPuSYofne/5gfpLrQtV
 dW4sE+x/A+YGqeJIuvP0ZL1z2wogc5VOyke/L9oY6A==
X-Google-Smtp-Source: AGHT+IEXOPFHZSpGrWQC+kLO7sWWJfHFZb5p97+0YGAOjzwTE9cFAp5sxWrp1BCdfuaJmTdgn3PvWQ==
X-Received: by 2002:a05:6358:7e47:b0:169:a9d4:3faf with SMTP id
 p7-20020a0563587e4700b00169a9d43fafmr1239136rwm.11.1700272507430; 
 Fri, 17 Nov 2023 17:55:07 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a63e64e000000b005bd3d6e270dsm2025704pgj.68.2023.11.17.17.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 17:55:07 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 18:54:51 -0700
Message-ID: <20231118015456.2629144-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
References: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700272507; x=1700877307;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AHspa+MTYqwQBjl7u7JHBafwrMWwPXAh26A/LtReHjM=;
 b=bExIw1b8iucV0pYjEmlDn1cTPxxkLk3gOhoz2bg5WdUxLaXJXOcTx6jBvcX267NcXj
 qtFeAOD6KJyei2Zr8qC6CVcy6+EZOF+D76qa0ctvq0v3ksLoRHm8XY0eHIwm9w1E7euR
 WkiGn9iLtsE8KunYihPYSIVCi+/BS8vYzG5lE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bExIw1b8
Subject: [Buildroot] [PATCH/next 3/7] package/flutter-sdk-bin: add target-os
 as linux
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We build for Linux.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 17cd3523a6..e8e71b6ab0 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -77,6 +77,7 @@ HOST_FLUTTER_SDK_BIN_DART_ARGS = \
 	-Ddart.vm.product=$(HOST_FLUTTER_SDK_BIN_SDK_PRODUCT) \
 	--aot \
 	--tfa \
+	--target-os linux \
 	--packages .dart_tool/package_config.json \
 	--output-dill .dart_tool/flutter_build/*/app.dill \
 	--depfile .dart_tool/flutter_build/*/kernel_snapshot.d
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
