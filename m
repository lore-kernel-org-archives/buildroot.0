Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313B3CFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 16:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E482D60AD2;
	Sun, 23 Nov 2025 16:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id riuVTLgT0baU; Sun, 23 Nov 2025 16:25:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB3246086C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB3246086C;
	Sun, 23 Nov 2025 16:24:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDA68E4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 16:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF4428386E
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 16:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3XKSiMlooXn for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 16:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE00183857
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE00183857
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE00183857
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 16:24:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-640860f97b5so4969049a12.2
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 08:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763915095; x=1764519895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=byybfzJYD5TXlY+JX1c7X5q4QfgdEIakN123uZxQWNQ=;
 b=tjepneZSo7r5gus9MszkOW4itpH14LQV+4o/mQgA1vcvnrBsldY3xf8lj9U8qzG6Bp
 CyjjH8ft3GeVODxx1r66bzst5JZNSYhWuwKjk+ItQ1Wi/Jl+OQGLN3oZu2cFg5rUP73F
 Z285mfRwUShRgcH+vAnni87S3+8jaetEzUDlqxZAqo7b4tdH6l/yTrh2394H1HVksukv
 VRRF2hxNt1TTEYW1HWx0lPI8ywIKsdqNLpe3kr/tzACtKgyAPcErFa94G0kAsQ2omFCy
 iMFnnRsKMOtoTjqnyG+iZDeL3zsdpLeDsUb8yS88SRmd2Dlh3dlQ/VWV6Gv7Sy8GS+yw
 MolQ==
X-Gm-Message-State: AOJu0YxYITsYjbySkKMkh0tboKfrwplBr2rVGYedLaWMxfFijje5/pAk
 qGiv6bKbh3kJJ+aG69okwIzCLj1BtCD/sTyc2nadJlPWre2HaXrdbkCCUhshwUKgzxcidfyguWq
 h6D09
X-Gm-Gg: ASbGncsqKuCOnBnKs1iZ4iQF1DIbN/ni9oxudOyj/ewrO29epw6cRzpGahF9qv4Guy+
 GtI/C1o+OyX4D9Pfab8zAG7yGT5WJNi1Y0TyCT1GPAhuDJ0tujV0ekrQeDiZPucrz9faQe0+O4S
 7AKRFoexlqrD1pithxbM2u/ELvAQpPj3ABoFJTQ+G7pbl2JijKRcTaFq1zg7yYcpUNbscQirgNU
 pWthx3vDPC0LEOeVB5K/yL1xUGGhKo65Mw/CQFAcuS4QOdXx/d2dozqq87aJ0MN3t7/NXE2we/t
 UysKB2VKossueMEL+avnwCuJKW532ZR8eb1kkRFM2Sjs9XoVRJpIvsirPenx3Genu7UTdpbbIFx
 SeBxUffsT1Vdrdp2W0Ta49iJgf9/8caKVBIQwCBq8/9oTpMcjOD91Ps8BRwsbJD5kPMHv/dVg/L
 +MsFfahakqXbXdii5m83ctk9a7UkfX3HDKcPxMzU02DS/n98WOEuNLEpS2VpKDKe3HAkjZ633r8
 yO2KWZS7INf5LSTwA3woeqts4LkjT4aPkTwUsYQvNgUfpyHYnl9dq8ywMY/
X-Google-Smtp-Source: AGHT+IH2krrNApSw+QQyNh1zH79VuTNBwGt47mHEHNzubG+NrINc60qZetTXXpU+e8IoTbN3JP/ACg==
X-Received: by 2002:a17:906:f58f:b0:b76:26bc:f95f with SMTP id
 a640c23a62f3a-b7671244c1amr836910466b.0.1763915094643; 
 Sun, 23 Nov 2025 08:24:54 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-232-100-193.retail.telecomitalia.it. [95.232.100.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd51fbsm1009334266b.33.2025.11.23.08.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 08:24:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 23 Nov 2025 17:24:51 +0100
Message-ID: <20251123162451.597914-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763915095; x=1764519895;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=byybfzJYD5TXlY+JX1c7X5q4QfgdEIakN123uZxQWNQ=;
 b=d4AKXqRvkAplKxVul8L+WSlF39VkmkqFK1hk8ExLj379x3pkd+ixIbrvoMmTuiMcH+
 gLILD/HBiGcIdHTj1jGpN/TazZXU3wGum3ZiGuplydM2B2V1L9Brho9pEAWxMFqjZgoh
 lkATLXQI6P9XrsxfNdA53S07L+yolTSrfRnh8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=d4AKXqRv
Subject: [Buildroot] [PATCH 1/1] package/at-spi2-core: bump to version 2.58.2
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
https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/2.58.2/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 780456dcaf3d..bcf3de9a4401 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.58/at-spi2-core-2.58.1.sha256sum
-sha256  7f374a6a38cd70ff4b32c9d3a0310bfa804d946fed4c9e69a7d49facdcb95e9c  at-spi2-core-2.58.1.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.58/at-spi2-core-2.58.2.sha256sum
+sha256  a2823b962ed16cdd5cb1fc5365029fd218394d852acd4098b321854bd6692f6e  at-spi2-core-2.58.2.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index f6d2b5264f3a..72703e923cc9 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AT_SPI2_CORE_VERSION_MAJOR = 2.58
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).2
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
