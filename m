Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D56D41C07
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 06:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52FE080A6E;
	Wed, 13 Nov 2024 06:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyetwTTBLc_c; Wed, 13 Nov 2024 06:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6189B80A80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6189B80A80;
	Wed, 13 Nov 2024 06:04:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29ED7E11
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 06:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17701808A0
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 06:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSCKM4OTiTFB for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 06:04:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56260805B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56260805B4
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56260805B4
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 06:04:38 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-72097a5ca74so5450078b3a.3
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 22:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731477877; x=1732082677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vyQPgt1gKYMJ/lKuewhlgGIM84ajUd9iO3vV5M0USxU=;
 b=DlSiKJFL5lcf41r0lTb3U/TLV//3dvfD77xibYcJwjuEn3SWzxOexUD9Jo7GEuO7lx
 3027xfn6fY7taBqyCs+Y6PqOAepU/MnEtNwVEnQnj3OcVgHz3FAN80H9OmtKM4nJH10s
 qhCreupZgSN0Z9hGrj9rLxhp5anhsDUP9ryOhFVrES+SBD0zyF59tbd2kPnX16Ysqtyx
 bJTwP4kEfHEN0u95PaSJfgNp8C5+FHIYy0+1oh4y3HLVgwBsMXBGPMlmk0m5Y+uz+blj
 tTOCbue85sYMbPtwnDjjsbGNBpJCNomfEOsaVhrqD5c6vTNw/DAZQcCl9bkK0Pvfo1b7
 +eZw==
X-Gm-Message-State: AOJu0YwRLGcI2DaAoiJNnAG4Xf2l8Zp/Emew0aMH1OCJxscTAp+EX6JS
 vy3o2tTMaO6+2rbqatieekk0ez2JZIK6yMTUVs6wWRSfJ5lDPZuVcgJphg==
X-Google-Smtp-Source: AGHT+IHv4c+beY+hzBPS6H3I1GuxniD8TIt6npoUIv/R48vbmBa7SS515x7UlIIQnt0ZAdhKfftFAg==
X-Received: by 2002:a05:6a00:114f:b0:71e:b8:1930 with SMTP id
 d2e1a72fcca58-72413380e98mr25873559b3a.16.1731477877014; 
 Tue, 12 Nov 2024 22:04:37 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407863dd8sm12715620b3a.26.2024.11.12.22.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 22:04:36 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Wed, 13 Nov 2024 14:04:15 +0800
Message-ID: <20241113060418.1207859-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731477877; x=1732082677; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vyQPgt1gKYMJ/lKuewhlgGIM84ajUd9iO3vV5M0USxU=;
 b=KM/C3ruLkGEpFAHz9eWLhK7qaRQ5VHOQxOJ1OAMoS3JChyS9jL8hqj7qz/4CvbH/GY
 /LFV8RNcYBkI/2JYkOW7ep//lmmZk6vTe9a2IAXj9FfuFy5PqW2sEzHawY6O+4QNWEm/
 oVh+2pksptsJ+u3HP7fbpEig5AD/2B9gHVHhwINTK1FiM86DHTEkdhHxhYQLeVz9EMJb
 3TocK3rAB74nK5f03MMtmoRru115hOYeCGkHQfJwGEFLDLA+rRdNLNTy1BCr/rESn0X7
 cTH9FxlNLcSuyVPs9whRCfft8PSwgtCMH27IbT52BxYkakMJNNgrvG5E1xQ3Tf1QzlbD
 frIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KM/C3ruL
Subject: [Buildroot] [PATCH 1/2] package/rockchip-rkbin: bump version to
 7c35e21a8529b3758d1f051d1a5dc62aae934b2b
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/rockchip-rkbin/rockchip-rkbin.hash | 2 +-
 package/rockchip-rkbin/rockchip-rkbin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
index 3e25ffac0a..56e229371e 100644
--- a/package/rockchip-rkbin/rockchip-rkbin.hash
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bb548b8c4dcd0f7d6b75c13e20d48eaac77f6218ad74e8a34c7f2097e793205  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-git4.tar.gz
+sha256  cf71af9a5b9abc2a4c8df2065b3393e345bbeb251fbd5f8538191257f21fbbf4  rockchip-rkbin-7c35e21a8529b3758d1f051d1a5dc62aae934b2b-git4.tar.gz
 sha256  1f2e25ae65f3af774e6f141f84253d6a05d489fb0b88b311220d70471c023c9c  LICENSE
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
index 49271084eb..07e7523430 100644
--- a/package/rockchip-rkbin/rockchip-rkbin.mk
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ROCKCHIP_RKBIN_VERSION = b4558da0860ca48bf1a571dd33ccba580b9abe23
+ROCKCHIP_RKBIN_VERSION = 7c35e21a8529b3758d1f051d1a5dc62aae934b2b
 ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
 ROCKCHIP_RKBIN_SITE_METHOD = git
 ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
