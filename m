Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1E6C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 18:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBEA960ABE;
	Tue, 16 Jul 2024 18:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ans8cv6ETK8X; Tue, 16 Jul 2024 18:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F32EB60B4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32EB60B4F;
	Tue, 16 Jul 2024 18:34:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EC121BF3B5
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AE2581351
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Kbxm5qSqoYa for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 18:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 610ED8134E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 610ED8134E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 610ED8134E
 for <buildroot@busybox.net>; Tue, 16 Jul 2024 18:34:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-427b1d4da32so249345e9.0
 for <buildroot@busybox.net>; Tue, 16 Jul 2024 11:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721154884; x=1721759684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgdlkFp2+aNexorHwo0R1CMi/R7Xz5qnVyi9U0tL72c=;
 b=g1BBpk1xaBcTgQ++4pQA40hGS6FWjV4MfLQjPFmnax2PjbRUq86Sd2+3pF9rjHTCOK
 JvDkp/pagYsyio6PdML4x3YKRgH50EC2Z1QSqfJWM5pVc/igVn/4c3is2B8zXLBr1UR4
 1eCMH3GWu19RJRfM+7Fz5thdJH6TgHLaGSxsXEnZlnUOTX0bdxqxHUYhSArAlJT3L3C3
 q2lriNpr0EUVZ781gPPGi5W4x2ztoQcHDDA8Xj+piLDuFSe5T2yzTmPPw4ifLOq0A+st
 LqaW4LhUQO6IlW+A0ifQ9qn5M3KnQUi2g7XYSa7IGUIte2iKeZz5TZLElRn5Sn8YV3/m
 SqAA==
X-Gm-Message-State: AOJu0Ywv6z7NSQO/g8/Nd3Xc5Rnv0MBX0faDIPod5Zho9gqNPJT5U0G3
 JAkPYxAb09JH3TAI8t85AJGj/iEiUSCiyki2gVx0cRPMTAx57Af2RwRaHFCMbKc8Y2VVGb9nhUs
 =
X-Google-Smtp-Source: AGHT+IE8c0bpIYo1SHhn0l9fY/mfm7GsFdSoCbmM3Jn3R8RnTgQuGWPShk+7CBH3QCT2PRahWhmFOQ==
X-Received: by 2002:a05:600c:3c9b:b0:426:5b17:8458 with SMTP id
 5b1f17b1804b1-427bb6d3d6dmr19185665e9.12.1721154884404; 
 Tue, 16 Jul 2024 11:34:44 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427c0019f5bsm15440825e9.27.2024.07.16.11.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:34:44 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 16 Jul 2024 20:34:40 +0200
Message-ID: <20240716183440.725816-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721154884; x=1721759684; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sgdlkFp2+aNexorHwo0R1CMi/R7Xz5qnVyi9U0tL72c=;
 b=cerQlkG6bwkAUOeVFKvl4CeVbdibkx6aZnQyevTmMsCRmoCj/JqYWUR7YUVI6ztiah
 /VP9y3Dl2FDwhGmpm4CBBjV+Mkt81dtLB6+ekP/mrcbkA9dOB0YuRP/Q7Yt3BSvGK9ol
 6SuP8fjxvIWtmAMgL2Y/OIia+pT4R47W9WdOtv6D63+rWYDBiFbwieWwLbtpsCwgakce
 9qqQ1HH7LQNUBEJ+ScXzIuQ71EdO13uP4HYZMbm/0GmIhNzfMj8I2rAZ+tpL9t3gbP23
 10IhsRa++aGjbgMRn/zhhiDLJp/VLA3g+EaxhrTiGsGxhmqvf+aNd8SzIyApjY0KzqOI
 Fd4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=cerQlkG6
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.54.0
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
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 69b6b0adf..9f321eea6 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pango/1.52/pango-1.52.2.sha256sum
-sha256  d0076afe01082814b853deec99f9349ece5f2ce83908b8e58ff736b41f78a96b  pango-1.52.2.tar.xz
+# From https://download.gnome.org/sources/pango/1.54/pango-1.54.0.sha256sum
+sha256  8a9eed75021ee734d7fc0fdf3a65c3bba51dfefe4ae51a9b414a60c70b2d1ed8  pango-1.54.0.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index ec0f5127e..df82b456f 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.52
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).2
+PANGO_VERSION_MAJOR = 1.54
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).0
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
