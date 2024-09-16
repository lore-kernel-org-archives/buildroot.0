Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C007C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B77340DFD;
	Mon, 16 Sep 2024 15:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WV3Ol3wG4gAg; Mon, 16 Sep 2024 15:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6ED040FF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6ED040FF3;
	Mon, 16 Sep 2024 15:12:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C72FC1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B634C81151
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9o1ZyTlQfqY for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFE0A8108B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFE0A8108B
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFE0A8108B
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-374be2ad12dso284681f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499541; x=1727104341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLu9PIcl7j8NKyeiOJbGZscM55rP9Is+bCT+L1ovEic=;
 b=On4jT5RdEF9IQQnF+y5bQzDwIDl45f1KA7UWvtxngCF2Lc4ld+ZYbv940nrIBm0Uqz
 YtVTsHNVE1HQ/dAyDfJ/lZB+o2TmTfEm48WxEhyULD6Sna72grjrrnqNqd2yOhsQJ4d1
 hCGFCT0xdGr2PHnHkLC8kyR6zOog6qEVqSEhcB0FxL+04YRCXYySb3HkFozmTK7Ouf9w
 S6Om7sQ6fuOFiUaqEKF/yUlZYy/iMfXKiNTEkG8UHR61+kfOY7t3h2VO05BCsDPQU2b/
 dTvOOT7mf4b7FclruTmTJt9castdTUJlWwCeX2YM86UYGwfv+jH0lwUBx31TPKeFo9nb
 QpcQ==
X-Gm-Message-State: AOJu0Yxx9mac7/s0ldD8u62F3pIW5K058kTBbAJwnY7GMGpnIjpn+X83
 Wsyrs4rXXp2cuke5sh6NFGp9ZXmomchUxnfGT2twUDJhaMoMv7Qow8RvnKW91SYWt5bHWXQtcwr
 Dx0PS5lXD
X-Google-Smtp-Source: AGHT+IHXL1wSWDOjl7At34v9c3h6LxmIDKA8qZ3M9lLmBtkcRZ4sRUuwZRKI01PYFfd8IgYthx+/xA==
X-Received: by 2002:a05:6000:1543:b0:374:d124:2ab2 with SMTP id
 ffacd0b85a97d-378c2cfe96emr4707914f8f.6.1726499540435; 
 Mon, 16 Sep 2024 08:12:20 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:12:04 +0200
Message-ID: <20240916151206.947484-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499541; x=1727104341;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nLu9PIcl7j8NKyeiOJbGZscM55rP9Is+bCT+L1ovEic=;
 b=r0OWgWHqPuRAaqvfT+WpompPz9L+u1u4FXXtgPZgtvkrMi865/+WXEGnKvIr+2PBO8
 ecZKMJtelyPXdWVzQuMjRSWcaKCR0iYnmUEU5JuufJug3OAcJC0DZHKp54qTFN2aXuha
 dbn3IuFP6HSujCzi73cfqT6aOIEFFKcky/cH4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=r0OWgWHq
Subject: [Buildroot] [PATCH 11/13] package/polkit: bump version to 125
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also, change the url to https://github.com/polkit-org/polkit as
https://gitlab.freedesktop.org/polkit/polkit The new address of the codebase
for the polkit project points to the github URL.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 5eadc89753..a3855adecd 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b69278f6ea0eac406350c45f5720e2fe5e4beaf9f53c16d9902e025965418864  polkit-123.tar.gz
+sha256  ea5cd6e6e2afa6bad938ee770bf0c2cd9317910f37956faeba2869adcf3747d1  polkit-125.tar.gz
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index cdbbf8f9b0..fb49f6ce2a 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 123
-POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
+POLKIT_VERSION = 125
+POLKIT_SITE = $(call github,polkit-org,polkit,$(POLKIT_VERSION))
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VALID = YES
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
