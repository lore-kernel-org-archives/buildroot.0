Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B4CCCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69EF82241;
	Tue, 14 Oct 2025 18:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLlKo9detpFp; Tue, 14 Oct 2025 18:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7F2082243
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7F2082243;
	Tue, 14 Oct 2025 18:30:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ABA1294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 811D84110B
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxgeFVRX2rPY for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:30:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F0FE405AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0FE405AE
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F0FE405AE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:30:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so34569285e9.1
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760466644; x=1761071444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y/3AhRw6mYf/pP5c6wIgy3DMwtocdRbastwsFsnOxGU=;
 b=hTV/Ix5JSmBJAULf+b+GviMuCanm5sioqSLpPmXozmds8FhBdEjyAo25L6WEQJLGFG
 m2D7vRRo+rP8QNeFLG1h9SpPclFOroZyp9/8vKa1gKfUNna0zP6rr8zxwhHvUVsH6247
 N0vKw6+nIWRkDLIubvyMmYLHfNw/XHBTXO1oqQ9hHh/F5J9FztIkPjhqv9o1Q8G25zWG
 H+3Lc55UYIPAlJylnwvcm9AUN5kOfa1YdMeBckoNP9zNZSgmoahsw9zaWYAGN/0UFeTQ
 Gmtq2pmzQKHdtm02CfANo+twQhbSf2463FmDOySgHMiskcWLABDumR/Bjrt3nMKM/QGl
 nIVA==
X-Gm-Message-State: AOJu0YymfkIVeN/qJsevndZI8+qH0atHr//WyL1P5b7GratueFGZcrqD
 uUNwuu3drCw4NHleUyapMhUv4sAvjTEL3oTHtUmnDItAG/N7d6hwttapbRzxEjkzIGwlAwDyPMm
 2KSa+hEQ=
X-Gm-Gg: ASbGncswyTrsQNu/aKDBHbWMs6cXRzT99cusqC9bdXwWiFNP10SjReZIllT8o68ZeTI
 ec44J5UOFo5pIcV9ZfY0/RnCOvjZK9GsQnXZcmk4J//5pbHcPcDvSVLZf5wzxZQe9vFXQ2byQpY
 YY/F68FIZf2OmYWwLvIPnNW3McPOSC9EnXzgNA64pGiEQVF2J84hhU6KcTyKIx3sDPApJi4eUZM
 9C/kiJXN4FrZryghATHau8vwZ/lRUCt4/RieYCMcw6Ua6xkj/Hh9mESnD8VxEJSbHleOV6EN72H
 wWRkWkA1YJzIuczq3grfRKEG26o8ZempkvrYYfNfpJf0ZFaumCoHkM5wn8k4klq9SkRToEWVouK
 N9xfrGwpjYVRrEk6iRgrZ2KmE+fQUF9HkcAjEMMqpvfka2gzXaD7jiitwMK4fJqKxmonrp8TfNK
 zT0FE79T0g8MoeyA==
X-Google-Smtp-Source: AGHT+IGrrJifiDgMI6u/Q6x/P4TpsBF5UTBlF83S0mlrDq8YZcNyckGIXmzJCvfVvMMdRdCVCOkr6g==
X-Received: by 2002:a05:600c:444d:b0:46e:6d12:ee4a with SMTP id
 5b1f17b1804b1-46fa9af35bbmr149554725e9.20.1760466643885; 
 Tue, 14 Oct 2025 11:30:43 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf790sm24061616f8f.28.2025.10.14.11.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 11:30:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Karoly Kasza <kaszak@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Oct 2025 20:30:39 +0200
Message-ID: <20251014183039.644968-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760466644; x=1761071444;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/3AhRw6mYf/pP5c6wIgy3DMwtocdRbastwsFsnOxGU=;
 b=NEGL30vw+I/oDL3YvzHpxG+DpmHgpehinRH9z759pCJRAtBT3/YmXHF7A4dNqSi5zE
 AxRbFYLAqRqudsa1Qmam0bb8ImxI5JNFeNsraJDpT6qUlBsA7eddZFPphgWTBxgyLgLO
 nMdaL2sg2+r57yRVXytw5QpdwDFkAseNHruDQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=NEGL30vw
Subject: [Buildroot] [PATCH 1/1] package/irqbalance: bump to version 1.9.4
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

Release notes:
https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/irqbalance/irqbalance.hash | 2 +-
 package/irqbalance/irqbalance.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index bf33e71e485d..c9d1acade84d 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8d698799251ea8518f342f36be26f2f092df51189f6777db33116d40cf0dae6c  irqbalance-1.9.3.tar.gz
+sha256  f37bb2e27c2e9ec609131d0ee3f770185d3845f79ee6ef11477ea0ffb600a561  irqbalance-1.9.4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 5d1bd4800216..173c7d8df07a 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = 1.9.3
+IRQBALANCE_VERSION = 1.9.4
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
