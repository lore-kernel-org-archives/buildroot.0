Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53EDC54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 837D9400D7;
	Sun, 24 Mar 2024 21:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHvdWi2vc4TS; Sun, 24 Mar 2024 21:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99EC1403A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99EC1403A5;
	Sun, 24 Mar 2024 21:30:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0662B1BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6380405A4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrT3JoKNckyg for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86DB54059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86DB54059F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86DB54059F
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:30:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41485fe355bso4417875e9.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315846; x=1711920646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6MQCcHz2Bx7uCQS4nFog7CcsWl6K9flKO6qn4iQBG8Y=;
 b=IH5Q/Wdh3FO4cyaN5NS/57quWjdMgQAvORB4UrNgEOwgBrd+JtnSZDctxwSOMASijM
 1DyEISml+DN39RcIjNhWOrFJVp3LjUF47mInzR9Uy/HKlRdnyu2CmorAVcE8CQQYe5Q1
 F1oVl0W7tfj+TMp89Ru7UcPMRUOohrDPv2v+Tv1NqN7r6f3J7p8jmO7KAkCdFi/Azbv1
 WbtTSl7AuCXe6SIUbU8KEN4XXekioGjVwCoA98Ln7O9pBNRHEoE5T/XK4RjnNlBwQmc0
 1alfm7HnJcfnkAJSetfXre/8pyhFcJMT7H0o3Nd+1kKQSLUDzxrnvVbty9+fXktuOfvu
 Nfvg==
X-Gm-Message-State: AOJu0YxRq+lFt7rWjZqOgLLEPHiGj2FwmJxv+PTtAHHBbgLJyhZ9sWfs
 Ym8O5s0FHhtjmL3u6MVNp7lG6eWliiD7kAqRKN9qSTzfNwgiUkQCYBdB103V
X-Google-Smtp-Source: AGHT+IHNREylGez4nOzdyX2x9Md/UMT0zke/B5BhhbS1dtVzv1PNAV+ZZC+fsyY0LQSg9Dyr8zI+KA==
X-Received: by 2002:a05:600c:450a:b0:414:8a28:6c82 with SMTP id
 t10-20020a05600c450a00b004148a286c82mr144825wmo.2.1711315846565; 
 Sun, 24 Mar 2024 14:30:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m15-20020a05600c4f4f00b004146bce65f4sm6196087wmq.13.2024.03.24.14.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:30:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 22:30:42 +0100
Message-ID: <20240324213042.756402-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711315846; x=1711920646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6MQCcHz2Bx7uCQS4nFog7CcsWl6K9flKO6qn4iQBG8Y=;
 b=gWavQL9PdwtWLI020EWQETgMaIciRRquZhD3vleyVS3xYG1onnt3IyQZ3dexKJYp1x
 Ph2/t1bemusz9prgmEvxxwV2pFLOP/5ys/dDloCuBuC7jr6WD435E8H9/xfUSa+zSpWl
 FOswdb0zZuDmmZJ40f0Tx6feaGrzlw+Qi2n+Aex5pV3a75IkvPtFTDTco71nK00/Aujj
 4Yr0ieFdn7d4pxCYx2eJfb+su9mmoRhhPpzxFNr17sSwET4ousXhZzvCQaRGEOl6Gy9R
 T2YkZEYrIdwesx/647lvZuVVf5iqXgcPl8b7h6dVvOZa+vJC2cXbgbdFiVSSqZ9W2lHC
 EqSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gWavQL9P
Subject: [Buildroot] [PATCH 1/1] package/redis-plus-plus: bump to version
 1.3.12
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
Cc: Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.11
https://github.com/sewenew/redis-plus-plus/releases/tag/1.3.12
https://github.com/sewenew/redis-plus-plus/compare/1.3.10...1.3.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/redis-plus-plus/redis-plus-plus.hash | 2 +-
 package/redis-plus-plus/redis-plus-plus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis-plus-plus/redis-plus-plus.hash b/package/redis-plus-plus/redis-plus-plus.hash
index 1d88365bc0..4cdc176025 100644
--- a/package/redis-plus-plus/redis-plus-plus.hash
+++ b/package/redis-plus-plus/redis-plus-plus.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  85d9d9ff84c873c4a14bd28bee569a1f311285fad8d4f2fb0e472f65d4bb842a  redis-plus-plus-1.3.10.tar.gz
+sha256  26c1e45cdbafe1af4d2cf756957b2268baab6f802b53bcdd435864620e2c03c7  redis-plus-plus-1.3.12.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
index a286e2de33..167d8bfa01 100644
--- a/package/redis-plus-plus/redis-plus-plus.mk
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_PLUS_PLUS_VERSION = 1.3.10
+REDIS_PLUS_PLUS_VERSION = 1.3.12
 REDIS_PLUS_PLUS_SITE = $(call github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
 REDIS_PLUS_PLUS_LICENSE = Apache-2.0
 REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
