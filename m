Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914E6C369B4
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 14:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 490A48154D;
	Tue, 15 Apr 2025 14:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8JISph5xuzL; Tue, 15 Apr 2025 14:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6602B81065
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6602B81065;
	Tue, 15 Apr 2025 14:17:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 280D3108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 14:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 193AA837BC
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 14:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Odhxg1TJNAzN for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 14:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C1308130C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C1308130C
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C1308130C
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 14:17:20 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so667114b3a.2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 07:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744726639; x=1745331439;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wwi20q/k0z8LrsaXehbV3ofpOSoEfVzJfTs13MXcxtw=;
 b=hkcMkVZaD94dnI2QrKL5rtvoQ+qw/m3PQNEaqN2SGb+vm01wFAafaK7rBNp8SebNz6
 tBUbyuHde6sVRshYxVJtJW0PBarqzA2Si2gBHfLyXC1lnEf6JiL60aJTJC95ULvHLySn
 mQtq4R5iUIgljOc0Ik8n6olB1zHwkKYCpMNU8+6UL8pRnTSk9bKf0eWhvG3OT4gzbbL4
 w4T/I9fOx8t0B7vMdjsXCyOMDBujvKYeG1/6Ea8K5ANdogkxtTjNfgbpiOMNS0zs12Mr
 zg9HfzhukghXZo5QGWO0qfkR25taR6lOIqgXpocGRtECw6l30k0F0xBbLV7x6tlbx7d0
 EtTw==
X-Gm-Message-State: AOJu0Yw2bg8EnM1mG7X8PqKvLxENKSpQS0VPviBLXRDglok08sjxVG10
 F7sA95Bo6Gn/DGiovV7SN2ETp7ed3nltuvL3J1HLG58XS2whPVWYvR0xLw==
X-Gm-Gg: ASbGnctJ5ixXtP1v425G66TX8PLzx4qBzvmcfSSNWfQI25BuGiq17f6JeluBjkubMXm
 4LbXTOg1G9Lvf9w2anhohv5wjDoXazYvVSAkdyfVGxgM1IPGv9G2MCZxJa1aKorgwSyT65GosFq
 Xefhrl9O82QuqH+0G7Ta8NlrcjpmriHMv9iaKjGSOt2ZNIvAcLmZjUG87eic+b1Nwa8yNm4ZQwH
 akzyUnmUbTEJ6ngwQS816evmoytN2PQ+P9CmsjWC+pIsg+FKZl56DB+ZsEnsduJhRNPjblM2vVV
 bs03/HxEeK29UPRY6dQcvQ==
X-Google-Smtp-Source: AGHT+IHbubiOP7L6psXJrvynUIJpHPr8Q3lqV5262QuC2GdOGYjFo6svX3UysH+KehShs6II4FQ8eg==
X-Received: by 2002:a05:6a20:cf82:b0:1f5:9431:46e7 with SMTP id
 adf61e73a8af0-201799984fcmr23814776637.42.1744726639280; 
 Tue, 15 Apr 2025 07:17:19 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd2198ac2sm8535238b3a.8.2025.04.15.07.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 07:17:19 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Cc: Lance Fredrickson <lancethepants@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 15 Apr 2025 08:17:11 -0600
Message-Id: <20250415141711.1940219-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744726639; x=1745331439; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wwi20q/k0z8LrsaXehbV3ofpOSoEfVzJfTs13MXcxtw=;
 b=PElkZWP9XvXWsxT2Ng2JIjSu3Dx/Jqx41tehV3zhnEq7mU9wDO+xcEIuASaFWMCv8y
 U0W52tEE47Ypw2DkTEQ1seuJyvPpCXqLhsmnC7GwN+eQW0k6gLxjJuI3G3MRoHeftTxL
 C8WkAS5DOiW3eGFdeTirI8UOJurAH2DDDcmnDeL1K8GB6k2KnVvBVFNkYi3eprXnf66Y
 JdtWEjarvzmfLnNX7cuZmX+1ywGpQLfMk4gG05VrPC97zgqemApLKbSHOuCV1OPYyxoQ
 b+Y2n5p6hDwmZbP/8cHjcs0G7M61GGYb8jbyHIEphuojbkV15Oe9Ni6yQi93VRdyG9nY
 ewNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PElkZWP9
Subject: [Buildroot] [PATCH] package/dnsmasq: bump version to 2.91
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

From: Lance Fredrickson <lancethepants@gmail.com>

Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG

Release notes:
https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2025q1/018079.html

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index d11e8af590..212774cd10 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.90.tar.xz.asc
-sha256  8e50309bd837bfec9649a812e066c09b6988b73d749b7d293c06c57d46a109e4  dnsmasq-2.90.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.91.tar.xz.asc
+sha256  f622682848b33677adb2b6ad08264618a2ae0a01da486a93fd8cd91186b3d153  dnsmasq-2.91.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 5dd7ed5c21..abeee36ce4 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.90
+DNSMASQ_VERSION = 2.91
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
