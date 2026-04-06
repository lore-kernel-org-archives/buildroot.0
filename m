Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4C7EF4ECB
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 10:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00A1D6083B;
	Mon,  6 Apr 2026 10:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rMVd5SvSjrv; Mon,  6 Apr 2026 10:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01CED6088F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775470116;
	bh=iDnw6YjUXLZ3RB12JaWGDo5kp6FYgeN6ftySji5nQNE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g1Hjj3E0SahfW1Ef6w3T7Ah6/bTRvHgIveKKD58LDQrglL3PIkBCrnv4Bgqi4+GtI
	 2/Z1hXdh5AJVyHkwr+vTw8iveQBF83JnD7yZREfjSQfZtXXBmAjjIJ6+fVGOdB9Ig0
	 FUkYaTvhCn5q9IUZmtn9gstqLQyjopr7hxuwsDsmSx5ie3aw6CeTzUUYxUOTrkB9os
	 R3A5xm/ZIXt95S7s06FI+Vmt/fEO/nXdm48xPNiMeZso53/U4OaYgOnsdsJg6Ywh7C
	 J237GBatMfhkQI1jugITzKGUTTYZaTuOVJUcqSEVaMH9pqnIdPobCkqicOkhwO5oZn
	 pxwRob/WAknoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01CED6088F;
	Mon,  6 Apr 2026 10:08:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A967D1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 10:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E87E80F2B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 10:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wjt1JiStyclo for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 10:08:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E2F480F00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E2F480F00
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E2F480F00
 for <buildroot@busybox.net>; Mon,  6 Apr 2026 10:08:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43cfa33a983so2232343f8f.1
 for <buildroot@busybox.net>; Mon, 06 Apr 2026 03:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775470111; x=1776074911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pXDP3rQC35hCLjs83INODpWHdyOCTBh4nOsJcWlHltM=;
 b=cEubAm6p2DdJlwdwReiLLKbIWC01MEPnHDVzN/8hsS/gVPF1Qdyx+YnAJJDUIfboWA
 ybGhRjk6Zm+TmKK9WDa7XC76LjRBd3KoFqwlcsw2/4KJ+GyJkcoAzOs/aBhqlR4sdACD
 IZNbc8LtVnhDfVJDANLoY4Sji/vdZEln5xhH+tAoKyMBTvG6QJxuP4ES3fdZdSimDHAs
 AuGy0+N9eyYvX6sUrjCng4WMllxVRImfHWCARm2nt6WnTjivPwBFryaXhl2CewyKkI9f
 +/mZhRlmIC0Qe5kyUGbZr6s7zq9qSZd9sfyhoHnE+bzGHuNm+9jsHbg5FZ8toG6apvQj
 75kQ==
X-Gm-Message-State: AOJu0Yy8Nz9KFAXvQOsMNKZzOKj22ZYjY+n/Eyr9o0b6B7QBtqTPhaM7
 W72sdU6b7NzEG0Mfvic1+WnNQTTzlaKHKK6pJzCEiDN6fpgf906geNWM//jp5jVjqr3tECHhYyw
 XXHY=
X-Gm-Gg: AeBDieuLZGmFgLriaPnrT74X2iJVFfVeU9AJ92kjCyP/dc/jn6uyCccxjeDY6xy58SN
 fUREmy7ciptlhhMSy6eYV8Vho8hB6WNBEDxTn/TQZkV8hp42tOo/QHI0O0xHQK92+i3nzjbnI4L
 N++G+XHy74hoVbOiewqb6XjGRidMJX1GWju4mzn4VWijZ9J6elpSd6jUrd9j/MUXOl25CCVzdae
 wV0KyvWUtOXVXZHR2albjNryQDRyWZtdNdMvErThCw4C8oNQfVIw1TZzlvglTWAnelCUhqWoJhz
 lZbRHV07qqxtei0qqEZaiwe/TNJxSW5i3Mb7cFfebqeIJjI3kya3kcIb9rMpEtZbe/PIsUJuz5n
 lWOpr6hCHeekF+w37MVb7RUdXb86IQ1EmeHLHSh6F94HWXkotFVENuYBSLFfhRdWrLkZoUFiDFm
 rQIHmLxreXhT9McyQuNgAjIJ2dVVirQT+KXS4bssCN755nJo4933E99lFdmqpV
X-Received: by 2002:adf:fdc7:0:b0:43d:3022:63fc with SMTP id
 ffacd0b85a97d-43d302264a8mr9241653f8f.8.1775470109468; 
 Mon, 06 Apr 2026 03:08:29 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f5016sm42657664f8f.33.2026.04.06.03.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 03:08:29 -0700 (PDT)
To: buildroot@busybox.net
Date: Mon,  6 Apr 2026 12:08:22 +0200
Message-ID: <20260406100822.7845-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1775470111; x=1776074911; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pXDP3rQC35hCLjs83INODpWHdyOCTBh4nOsJcWlHltM=;
 b=RCbjmV2gnlw05GWUKh1v5WbxMy5D94+uRusvpLncci3wWCydQskqGmSzHaWrmlLgnX
 cNzLWT97KCxYDQUl14lwtVOSOZ03pF9msIRWkkvCBoxvfVn78uICCKrULXkerEisIfzs
 Mg3Tz+kQvGqdACybathUmrS0Qjd1si2BzJ0QWwfyoeUYVTwn1jtcFCehEJGSXdig1s63
 Xqi/KmD6ytcz2dZ1falOD61GETFr5KU7fq/YT6m2vYKXPteD2vAnWtEtV2NP7ZL1MEmk
 1LuzAzZJ1i1oOkPk3JWpnYfbZg+8hbb/sYMA+8lJXbw/znsh86Lk7nPaNtgeypIad1iF
 MXzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=RCbjmV2g
Subject: [Buildroot] [PATCH] package/quickjs: bump to version 2025-09-13
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
 package/quickjs/Config.in    | 2 +-
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index a59d46070..0ae0389b2 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_QUICKJS
 	depends on BR2_USE_MMU # fork()
 	help
 	  QuickJS is a small and embeddable Javascript engine.
-	  It supports the ES2020 specification including modules,
+	  It supports the ES2023 specification including modules,
 	  asynchronous generators, proxies and BigInt.
 
 	  https://bellard.org/quickjs/
diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 798c857a1..70dfb2d19 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2f20074c25166ef6f781f381c50d57b502cb85d470d639abccebbef7954c83bf  quickjs-2025-04-26.tar.xz
+sha256  6f1f322aea3bb3a90858db85c9fe717013fde4df7dfcafe2f57e78f5bb4b4a0c  quickjs-2025-09-13.tar.xz
 sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index e2170b297..511f14245 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2025-04-26
+QUICKJS_VERSION = 2025-09-13
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
