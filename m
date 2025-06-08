Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C739C5B552
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 166F8612D4;
	Sun,  8 Jun 2025 20:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYkWPLv23aVG; Sun,  8 Jun 2025 20:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46E7F612AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46E7F612AE;
	Sun,  8 Jun 2025 20:10:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35E721F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2737240773
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 20:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfsRjPFcX25r for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 20:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CD7740762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD7740762
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CD7740762
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 20:10:23 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ade4679fba7so170184266b.2
 for <buildroot@buildroot.org>; Sun, 08 Jun 2025 13:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749413421; x=1750018221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=muBv/rshD9NG+jB07BFJQ/S6Lq1nRkvscF1nrTNjtzQ=;
 b=Ckw3FNPv9osj79CZKtn4rffzXR3H3/BAXPf/YVYONd9nfQtzC8UkuSMr0np4Ru4236
 ABsG1o2PT597gye7X/q912YRu4VfpEskrbL7pAoGCbr0HYDnwTtFW5DO1YMp/JwvcsqL
 1wqUvlDLvO3fwz59wbfh0DamLgbAiYFK6dMM87OiHPrTwTWSBqTRj0yIYPnf4MHQ2QyB
 O2Q7f2Spkd+x+AqQD3zvSj1tkhBGYjDH4khayH7eZftwCwlQ2oiS+e4NdKE6KNVJYHX3
 fP7O2gEW5vYQ/q8/xUikA+/qUwwFKLu+b2EW+HFk7gzsOi+Rpa+GGQRSHRMc9mFehyIh
 GPjA==
X-Gm-Message-State: AOJu0YyUd+rUnGtds32m9RqwwRQqBglyOnKvRVhctqRPt0Nzt3Rs53AZ
 Yku3ZGNfj+NzfSm2vtyjNOVx1A9JADignBADhs3gwQ30roOpR5FbHh02koPg7w==
X-Gm-Gg: ASbGncuYg+v6NdM5NQbTHXRjlGqrlFePZq943x5S9gSP1ruilD/te0NvfJgE/2qtp7l
 feytgFxkpeoLOn8DcEEss89T/KexPE2wy5qspfvNpqMbIYKaKv0S9HH98YNiNa+erjuthQy7jsy
 dPksf26yMSuzT+a35tFg1w7PVk4pc/wCQZyYfLLwIvsVfGXD1FFnyLY9DKyqN/Z6vbdt1SDNM1o
 DEuuqMaPfQZ0nq4ILFUEaaSnmwJuS2959Y4WHFbe0RDzUSo4bWdIJxNTyNN3EigStQVde9yzICL
 nqUp0RmLc3t2wetJzczI/CI1NWAzLY66b03FoY5/hu0vaK3KaFv7QXapBiR5Bix4VXprkiREaq8
 tXFjz/VN4Dzxf
X-Google-Smtp-Source: AGHT+IGv16//ioToePRfmCGsnswOHdELGoAVKi6mWLTjr8Kngm1kydsaBkg2a8j8jtp4bkinyyDvmQ==
X-Received: by 2002:a17:907:9720:b0:adb:413e:2a2f with SMTP id
 a640c23a62f3a-ade1aa0fbdbmr837726966b.9.1749413420844; 
 Sun, 08 Jun 2025 13:10:20 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d755484sm459809966b.10.2025.06.08.13.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 13:10:20 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Sun,  8 Jun 2025 22:10:06 +0200
Message-ID: <20250608201006.1377973-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749413421; x=1750018221; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=muBv/rshD9NG+jB07BFJQ/S6Lq1nRkvscF1nrTNjtzQ=;
 b=T1yhNk/KIHrzvr0oZJYXUDjAprQZQqc26d+ifYGdOizCmJcz2JkugsRoHY2AxWGI86
 6QLtrK2a+SCiC16f81eyML8+M8IfLs00MYekQisbBm1pcy3upM0v/3WbsQJuCOezV6Az
 OWMQd4Z+6WzCr0525ZQsl8lHkobsnuGFyo2YFMGChhOMv3/IHIugnNdPGrZYMEaSWlpr
 nKCWt4k370SaHYBISzKwCmkFDrErnwGsGWknmgmJuPfKxi0yJ4v4oAQYmpW/txiE3iTC
 vssIGh3U9qBkCAXfeB/q7nErSIY9zKzf+u07PWwA0e5UL74fu3R0vYZDaT5Smp2GP3DA
 nwMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T1yhNk/K
Subject: [Buildroot] [PATCH 1/1] package/iputils: bump version 20250605
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

Bugfix release:
https://github.com/iputils/iputils/releases/tag/20250605

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index daa5f81a85..2f83d397ce 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/20250602/sha256sums.asc
-sha256  178f316c3f102f7c7445dee8bb851838f11214a68b3d5d4788972d8b35dcbbe5  iputils-20250602.tar.gz
+# https://github.com/iputils/iputils/releases/download/20250605/sha256sums.asc
+sha256  475c643e5f55b302286267b97d3ce0f47ca3489ced8aa0401b1eeb1e68228d6b  iputils-20250605.tar.gz
 # Locally computed
 sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 391f0e1938..842fdb8478 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPUTILS_VERSION = 20250602
+IPUTILS_VERSION = 20250605
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
