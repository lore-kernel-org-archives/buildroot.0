Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DC2C25B7E
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 11:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5784413F9;
	Tue,  4 Jun 2024 11:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdN4d0i0wCqi; Tue,  4 Jun 2024 11:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEAF4414CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEAF4414CE;
	Tue,  4 Jun 2024 11:25:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00DBA1BF83A
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 11:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E198684501
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 11:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csG0KshHFCnl for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 11:25:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE8A1844E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE8A1844E8
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE8A1844E8
 for <buildroot@busybox.net>; Tue,  4 Jun 2024 11:25:08 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52b976b5d22so2488230e87.1
 for <buildroot@busybox.net>; Tue, 04 Jun 2024 04:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717500306; x=1718105106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AEzDj6r1P+91dLM/lJWDSHG+CKQX1gkOK399cdm+WFE=;
 b=NPfjp2VcG0IjloZ3eNStUlO5U+cBcW//ES/2c5RLJwwULbwsZ0LX6CxZ500nIPCc9d
 9ncsbwdPlvJmHttptnTVbWalpI/CcinpLpRGTSpnINHf0Lvv7KwB/J6hMMn98UXS1HjP
 hv/TygqphaOYBtbO/4LyP/h47FSgtMw3pSvG3Ta3Zkn3yNYA3qAcPmrR7ryh/BenVEjm
 B4rvq+BE4Ki97yFf2UygHOXHah1s2fzw2OpB+kXHta14hQW4imPctUBB2YvVIwQswESU
 hK+QkCL8mY6g5wjS5DmNKOVrsZ7Q4ojES8FWQOaSyJGd5C0rtM4zrbAfACYahMDG5GTr
 gODg==
X-Gm-Message-State: AOJu0YwJTJKUw1C8/3ZUVimoQyDiz4IfgppK8QiSTh+7UjDO9EtsJAiA
 vT8PCRThnPOQi73hX/xkerV9Z8nb9d+PCgiu27B8rvyR6leF8QCExD44Zd0FYWl7k8riDaLhL9A
 1Pw==
X-Google-Smtp-Source: AGHT+IFfu5dlynBet7UqeK/VkefUHmvM5Y0i9KI8WfMYneP/8502NXZnGFHndz+benOJqLOCnBDPHA==
X-Received: by 2002:a19:ca17:0:b0:528:649b:d7bb with SMTP id
 2adb3069b0e04-52b8949e1a9mr7003541e87.0.1717500305828; 
 Tue, 04 Jun 2024 04:25:05 -0700 (PDT)
Received: from vm-2404.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a5ad20b97sm4547842a12.44.2024.06.04.04.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 04:25:05 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue,  4 Jun 2024 13:25:02 +0200
Message-ID: <20240604112502.1097739-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717500306; x=1718105106; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AEzDj6r1P+91dLM/lJWDSHG+CKQX1gkOK399cdm+WFE=;
 b=gJnM4LPLL0q9jJj4c2Gnsjqn4ehXCb+mndFa7MUuyAbjbqPkBNmiclpLqV+OzZvg9k
 jU+soRCGj1rsEdaXmms4Nv6R+SSxA+/Uyx+lQjog4wx46gFXS/GchBxSt+U5kb9TfZxF
 O8pvemX+4wkie/VMaiBbZx+uHJQ6a7X9+d3YHfg6hxZmMjuFLHGeqGhVZL2JjYzI2vJG
 J8Msea3M6ar6A7ur4paHAx/pcqjJbazuUofFJdO67jREtS3IDtLIsvNp2E5oVClSq4Mc
 aOdEFeywPhY6L6rHIs7z04HA58CmEFurACZwSOAO8TFyZP3IlumU6rGjC9ubiE10L7W9
 eQOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=gJnM4LPL
Subject: [Buildroot] [PATCH] package/zstd: bump to version 1.5.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/zstd/zstd.hash | 4 ++--
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index abfb1d62e..8be85c356 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz.sha256
-sha256  9c4396cc829cfae319a6e2615202e82aad41372073482fce286fac78646d3ee4  zstd-1.5.5.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz.sha256
+sha256  8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1  zstd-1.5.6.tar.gz
 
 # License files (locally computed)
 sha256  7055266497633c9025b777c78eb7235af13922117480ed5c674677adc381c9d8  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e25202fd6..a2da0dd47 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.5.5
+ZSTD_VERSION = 1.5.6
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
