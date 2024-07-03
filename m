Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B8FC30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 954C360FCF;
	Wed,  3 Jul 2024 15:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdLCGdPv2iJb; Wed,  3 Jul 2024 15:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0549A61001
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0549A61001;
	Wed,  3 Jul 2024 15:14:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 939DD1BF2FC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C8FB41589
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRyCHQQG3CPl for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3020C41591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3020C41591
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3020C41591
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:14:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4255fa23f7bso38902315e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 08:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720019661; x=1720624461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=47IZRqWqF1eMEaOd6HU5JyqpagQLzs42FNRoie0CH/E=;
 b=LAFsp4lYtlIkvgtAciSFwROlUMKaN7ha5/ziiYePnaUSCmzVEXBcJcfJgKUUppitDt
 VbxZ8DCVJS2uXVq0vwvUVteKVSCrMHkX+J13jAKQPShe6bYrKXBgnaeR5aq8GdJiZWkl
 f5LT8EyfpDWV3oz4bcymfqBNm6hg1wUn9zM9B8wH6XhQma2EjzZ5QCOiIsUAsYhHoBlS
 qQTKdd3atdVUxTEakmrF5B/JB1h9zT8K2r6Tr1G41F/HK1jK26MNWpOn5zUEiiZFS8HI
 Ie5I4cfWzgWvq4N+G3xaSjnZZLBfNIyLuL2YxtvG32TVvUbYL9v4dcOyMflJs8HL763U
 2G4Q==
X-Gm-Message-State: AOJu0Yw047dxeBZRbDs3L6tz9ObVLJ3ZnGG0hhhwfamql1Dpi9UhUZrf
 kihNGoM4A70Z0lxhb5LpYgCYmYIH4lpYr0s+X/u6NEVHzwpthLeObZgLAqsUKLJ9NJYRVR9kxqX
 e
X-Google-Smtp-Source: AGHT+IEBXWMRntbmpFiMH5tBO7vFQ7v91dlnCSdBBIi0sYN3QmEjshADS0CaXFlirgp6O32xInkBtw==
X-Received: by 2002:a5d:64ec:0:b0:364:94d6:f654 with SMTP id
 ffacd0b85a97d-3677569d7fcmr8938953f8f.9.1720019661312; 
 Wed, 03 Jul 2024 08:14:21 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fba2dsm16176620f8f.73.2024.07.03.08.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 08:14:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 17:14:07 +0200
Message-ID: <20240703151407.1827264-5-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703151407.1827264-1-arnout@mind.be>
References: <20240703151407.1827264-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720019661; x=1720624461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47IZRqWqF1eMEaOd6HU5JyqpagQLzs42FNRoie0CH/E=;
 b=G4P/qdd6m87bP1WP+K2/BfB8xkHgf79H0Or7dUDUAHFDq7BEpQabyztrcpHR75dNK4
 CbeOEcxBNaLwEAvy19pHiEGs74PlK7xZI4IcVE8pb2CnKSwTXIoAkgS7wPjbKXtejraH
 T4f1LhSowQU+W4b1j1pwBbuXdeWLWbtrSSyy+zNLN0XcEyLQO+S25P76IQMpaVsWs5L7
 51/4aWSWX1hB4ay67v5AY26VD1OaqneajPHPM7Q7JdYwgGyDvD2geBgXHtYU8U8l9rDo
 UAPdoDDeqyyR0mLdKQLwq9qrcq40S72UgJ+cfc9fJ8wjNQMHrwOI9xx1Z7HQM0J4K7Nv
 HQmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G4P/qdd6
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
