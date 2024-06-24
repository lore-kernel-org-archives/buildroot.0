Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B27C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 09:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D217381DE5;
	Mon, 24 Jun 2024 09:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sk2iJnsduN-T; Mon, 24 Jun 2024 09:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3982B81DA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3982B81DA0;
	Mon, 24 Jun 2024 09:43:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7644D1BF48B
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 641D3608A0
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Idccao5_Cmk8 for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 09:43:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D0F26089E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0F26089E
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D0F26089E
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 09:43:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-363bd55bcc2so3346742f8f.2
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 02:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719222181; x=1719826981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=47IZRqWqF1eMEaOd6HU5JyqpagQLzs42FNRoie0CH/E=;
 b=oCB3/7huxca7DXGGQQwqXFIlvIiRaRjJVDMJGz4VoLHuVK0zH1BqMZvMXJYQu8HWxM
 Q1DR11iV+cok8LHrHrD9VGC7grPtgHf+k2ABtDUfiKv1am4occMtXVxm+O/hPuX894nh
 sV6s0QgAge2MzqRkUdnqB/j/Wmwkx9YouHfySyJIethePSHjZcVIh8V89ZiTsx9E0WJF
 psdCX/J0Hh0R5oyO3UA6qFzsWaCOyfnS8wVICuN0+cN+pAex69HSkkOknpCkGeXFHj1Y
 qb1D/qYLaZPpvZXFRmqxgUgw93Bt8aOSAy4v8m6Isvf/ckwHbOmzlh7lwQbKten30lrT
 lulg==
X-Gm-Message-State: AOJu0YztV15t15SzNlc0Dzp/3jif5Eh5iiLAxElI7FwsA/lIhzBEfouB
 UGlrM63WbvkefHE40yvv7w9+S0Wha8XrHmhKRMm3bib8FGtX+3vYtVUuyUlx5j0S+qHVzLiu5jI
 h
X-Google-Smtp-Source: AGHT+IEKTWJj+2v12hWEyJei7CittwKHzOjSyjMWl0F2P+pMyLP49tiLgpfyqn9XQXCH3WwrsncP2g==
X-Received: by 2002:a5d:6c68:0:b0:366:eab1:6736 with SMTP id
 ffacd0b85a97d-366eab16777mr3030239f8f.12.1719222181128; 
 Mon, 24 Jun 2024 02:43:01 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366e88c0c38sm5148383f8f.32.2024.06.24.02.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:43:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 11:42:48 +0200
Message-ID: <20240624094248.22807-5-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624094248.22807-1-arnout@mind.be>
References: <20240624094248.22807-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719222181; x=1719826981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47IZRqWqF1eMEaOd6HU5JyqpagQLzs42FNRoie0CH/E=;
 b=B24HqdjR+M6GGtcbbnlR/5d5kkRku/OKh7g3pwG1Aw9k6jcH07tB5tEahhHvGLYwYG
 YTEQx7scq/0eSucGB3L3HQNIePxuLpMnTlKWi24ONx2LniQsqdSW1aDSWBJ+b75P9pxy
 p+Jlkx9iuJmJMBjP/S6ydsl53vJ06c/MMTnk61UONLOhAbQxB7ZTNfUIvtFkJb6uXbki
 gGVSQtP1+mzO/l10dYyJfsOLZC0exhqC7ZxRvv488fs7TRhWeonmF83PeqvB/FDoroDO
 KmEHcfjGA9UJaQbG9CovYT/SbNa9LdbLtJ6xZXb/jz3/Q8JQJfyaMbEildX1lvH00wxT
 24YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B24HqdjR
Subject: [Buildroot] [PATCH 5/5] docs/website: update link to mind support
 website
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Mind website changed more than a year ago, and the link on the
support page no longer works. Link to a different page instead.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/website/support.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index a94e5ef780..96b9a60b18 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -130,7 +130,7 @@
 	    <a href="https://bootlin.com/engineering/">
 	      <img src="images/bootlin-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
-	    <a href="https://mind.be/services/buildroot.html">
+	    <a href="https://mind.be/about-us/#anchor-open-source">
 	      <img src="images/mind-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
 	    <a href="https://www.smile.eu/en/offers/embedded-iot">
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
