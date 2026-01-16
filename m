Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F55D47CDA
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 11:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A134085A93;
	Fri, 16 Jan 2026 11:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ocar2Dvo4l8T; Fri, 16 Jan 2026 11:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7558185A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768561579;
	bh=bn1yfqVfJ5pjBzbOm7p5iCsZH4qV7tqetmmg4XN0LEQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZgYHNK4FQk1yqY+Suq9JPzgo1tkCvSyHmczuWJgazudPkWad9qqQvBhaFJkxWyH1q
	 OstDA94C6RKBnIRoFlwkjbF/5/QAO2ScefeN+UIgODoHKM0sTGtevAKDATnepssl5F
	 t4RFJjTq5DuIUSzVnVX6WuTtyUjZtRiq6hOYNjpj0T5Rixe9+ZlfHhnyJCfDBwJZsr
	 D3FIUmWhn4HoecRNLs4NpvYFA3wAN++Xlmmjd6wjlr+FmLn5/wn6lMqzjbdVazu4U4
	 VfqhuNamF0NInBPFIQdSDE8AfJCgiPYDqswk5k4fgpf74rncgF6dcW7+QqLm+Tne0s
	 M3P6OzLB0lzNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7558185A8F;
	Fri, 16 Jan 2026 11:06:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 408A1160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 11:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C54185A8F
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 11:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWYiofN0HHFf for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 11:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C1C785A88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C1C785A88
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C1C785A88
 for <buildroot@busybox.net>; Fri, 16 Jan 2026 11:06:16 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbad1fa90so1713218f8f.0
 for <buildroot@busybox.net>; Fri, 16 Jan 2026 03:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768561575; x=1769166375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1EQt8vpmPIoMXFiZr3mu+X3kpQ5VfPdXILavMjPpMWc=;
 b=doP06PLF95N1uAydKYPBFp7pVUR4HRnr/3A9T8xqfiMVGNJ4TjLcwxyTa+2QppYUis
 mqFD9XR2dtAgeJ1M1y8GniObz6VT19W7iCI8HQRWhTIfq55XlXa+NM3a5gGA0jlkE/L6
 FEFIJjEjtetk/cOeIVFUwSRS7tzOAOKanHwXpSjVH+l9e3qtxaoURaxLFlkv6R3BZYXM
 felXZSM7kJOSEWfhlvwj4uxzfrWCDx3GkvI6hmr9UsNYiULE1kRYTrw8x/9/u0xYMvY7
 baZGqvDgFcG+rRT03i1x1bkKoqIe1amUaLa670aJtZKENZmcqOQSXmVtEli3DbS0ed65
 C3cg==
X-Gm-Message-State: AOJu0YyvsoghH6DPSZ6i1S/u8K42svFBr5HfGMUdnGbPCkAF8XAw9zI1
 zzdQZmU20WFfCwv3SE4BftnXBmUi8hwxn1b2t9G7H+ac435Nlqof9PsfpHdojtVqbJqvGFJUpJ/
 W6SqyQg==
X-Gm-Gg: AY/fxX49sPJDXfXm4chlbVi71mYjfyRtIE9XWUIEYcQp+P/MonpFRJ6YsP6GCNsKlRx
 wo30CiJruCb6eGMnGpVWPBbGN9bblOqZqaBNmfnJwBGjjfZcFi/EJiBNevPnyB2r8+Kys8iOx/e
 poX4Jn3edjaD6R6lAmc3Xw7tlgHknHkydAKTR1dN+E9clQ6sWuTPE+2y4LqRU53reQDaO/wYIZd
 9OBMmwJZcxHi+VERP/LlxC6oJtk7bpa1qMXbWr3JxgmK32vYsFo7F3SZy8HZkyfjdQPiwFoRQ41
 X28zj4PlmuPm1dH3+wW0dJnbkauPWpX5uttWy20OshY/4srrnRhwh2mXF5dCBhgs4YNP/jMp7BI
 MV5wueNHdfOjrT8h2UWl0fLaj0si10yxoS0sCACjnDL0N/typDY3/oikS8tFyzyyJ0pURxYZvrj
 83qO8cq7JomkIKUkq5dhKdMHhobieVFI9TgEKszA==
X-Received: by 2002:a5d:584d:0:b0:432:84f9:8bea with SMTP id
 ffacd0b85a97d-43569bcf38emr2935206f8f.51.1768561574655; 
 Fri, 16 Jan 2026 03:06:14 -0800 (PST)
Received: from vm-2404.. (249.184.66.37.rev.sfr.net. [37.66.184.249])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569926ff1sm4535202f8f.13.2026.01.16.03.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 03:06:14 -0800 (PST)
To: buildroot@busybox.net
Date: Fri, 16 Jan 2026 12:05:59 +0100
Message-ID: <20260116110600.809065-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1768561575; x=1769166375; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1EQt8vpmPIoMXFiZr3mu+X3kpQ5VfPdXILavMjPpMWc=;
 b=oSrD847wsWMTfqpTYx+M12XTfYpCM/EvYZ7cayFaU+fuCvhNEhrHRd8Z9lHj1CqVUs
 RqD5o4ZYaW1UWmBOOOgDypdsgheqtgDFEuckVjbsZuNitwHbgT+lTGPE1p5vyhi/zQxe
 qxeTOg4OvyYUp+WZMwaTqJdLJVCxp476wDRArTOAFUWsDMfV3kIQVCoqYsBsYUI8Iqf3
 d1w3JI+uDrWJhzC79J4aibU5zGIjNZk+06TO0ZgX60GYqP6CqcKETFCxi70yDu2cV7Nu
 xahoF/V6RahZzybPRW5mp5t1s1TTNaOKFRiPakPINirtbmUg+6tmreDC0cGFpTLHut+S
 QbJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=oSrD847w
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.40.1
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 15516a4cd..02dc550db 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a43489328b88846e5cddbdad9274f25ee9854e337e52490a74bb7955de03c650  janet-1.39.1.tar.gz
+sha256  e7fdcb7ccc83a3be6181f7d7d71f0ea027a000e0eefe9bba3b8373c05eb5764a  janet-1.40.1.tar.gz
 
 # Locally calculated
 sha256  805858acec1df54018879efc78ee3ff7bab5e69908c58e46bbc2d94520f29023  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 4e904e7b0..c7255394b 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.39.1
+JANET_VERSION = 1.40.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
