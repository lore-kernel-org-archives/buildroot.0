Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDF5CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 12:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8918E80E0F;
	Fri,  3 Oct 2025 12:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zI8BR7swmJPi; Fri,  3 Oct 2025 12:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05ADB80FB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05ADB80FB5;
	Fri,  3 Oct 2025 12:05:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53D86226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46110409E9
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADGvXmNhYpbe for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 12:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65594409F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65594409F5
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65594409F5
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:05:21 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-62fb48315ddso3766518a12.2
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 05:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759493119; x=1760097919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFNFk8pB/MIMQEonBp97XHRS6m3drh+m4xtw2n7eMZk=;
 b=shi+8G+58BsnxMouzO7b05mHbSaNUNH3aGNdgRkpkefgJUVdgtJu65UGZd28ThE3BM
 KFxCkAb2kdjPPcxFrP3RZyD2XKwxWLIqHHH01YIEXKk14mvXCIIhT+yEWUmJLWPIXsA7
 M7Ikz992Pq4oQW8zcNEPWaAjQl/fvzGrZx09bYb1uQ5NxieEmioLxtOE6IAhjE7zM3e4
 jglPjHya79o3hY/ynWFIWpLED9kADnb6NMs82Zu1xnUybahS4mGvIvW1LpS035uKie2p
 mCqKnsnL79rszPJ/X0Bme/GjyhdHialTHTMLC8mishq4gvAwka2QtcogI+2hOnhAoRDn
 9i5g==
X-Gm-Message-State: AOJu0YxXWpEkUXsFRO00CTjnicGPy4kEYMjgTG4VPnubcIfZYEUOsMNt
 rnnwHH7HkEBviNIJq5a1neGOuEEE/e2jaJUye6omXNe0eJzJSGgVuwUA+YmXgcg9hBY=
X-Gm-Gg: ASbGnctaeXo2YYXLpsPXB9MgPacHsnA23Ax3hMbyax7VS18R/E2NGUFsP1JHgZ60oth
 5l5UrrrxWJ89GmXrCHYqT+Dlyi5A/0E6lkLY8CAzGthRCSoeCZ6fwymD+Nexs//m4yplH6MXpNC
 NevPVguUNIB4zxucepBW+EjOoKm6ybFxSy98k0VcAEZAiQl/8kdqyuKY+FKdjVkknB76EnlGI+I
 lK+IrwwzcSLdU9nDaIoLxTKjBuJAkwkIZximedO+IJCb9GgcfnsYEQAAlxnNHFO/nHZYCJT9B29
 wzFtwrKeq1rgYqZin5qvhb5QouvY/1R8Ta2ApJRbcDhsuU6DliSCZP2t9IW8Y+qKnGXLPtgagNY
 UH0F5+Pcv4C81uEz5MGzpzSiMzdT0Yx8g5VKh
X-Google-Smtp-Source: AGHT+IE4Lc8bJ8gP1iYqkvOs6lvaI6ohDebvqmruH5AgG47nSGoeh4n6uYLHdRX4jfx41P8GU3IObA==
X-Received: by 2002:aa7:c3d4:0:b0:62f:9cfb:7d34 with SMTP id
 4fb4d7f45d1cf-63939c3cf15mr2135597a12.38.1759493119044; 
 Fri, 03 Oct 2025 05:05:19 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3b74dbsm3788639a12.11.2025.10.03.05.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 05:05:18 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri,  3 Oct 2025 14:04:08 +0000
Message-ID: <20251003140408.1252604-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759493119; x=1760097919; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tFNFk8pB/MIMQEonBp97XHRS6m3drh+m4xtw2n7eMZk=;
 b=nsCtLSz9U4iWwXh71DYdaglUJhhZauL/Vj5lI/3dyIKAcu/PggdoDY8zR10uwR0lER
 QdHTz2TH2IrOV5YS2sX861NGkV5pEZlvZaNAMmxgRq6BnGSI6V0kRCrDm7y/PMnrbSXe
 9wepnBPypnqgQOj4VLsPEedDatsKAyK6Jc+Ro/R/cf4CnDah7X1l92poatfzGUlQmEgg
 FpNIlAd5Iu0GNc92cXN01755C4+6JiUnWnSRhoxG7G8YJ6nG8972vHZixL+TNVCZx5Z4
 Uw2HBUCXVEXIgik3zmNjtbGaXuCo2Ue8riJKxrDf7Vdq1SUPGthHxGnsL1vyHTuK00gZ
 U63g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nsCtLSz9
Subject: [Buildroot] [PATCH v1 1/1] package/nvidia-persistenced: bump to
 version 580.95.05
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

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/nvidia-persistenced/nvidia-persistenced.hash | 2 +-
 package/nvidia-persistenced/nvidia-persistenced.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nvidia-persistenced/nvidia-persistenced.hash b/package/nvidia-persistenced/nvidia-persistenced.hash
index dc918f1a95..f564451015 100644
--- a/package/nvidia-persistenced/nvidia-persistenced.hash
+++ b/package/nvidia-persistenced/nvidia-persistenced.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e4b85c7ada85010212c45b84582f0af4aaed795335dcc7c0ceea9f274a8b7eb0  nvidia-persistenced-560.35.03.tar.gz
+sha256  ad4e54757c743256a8129c9b543eb6f2fb27cd6b7b20a5ac201330aed90aa1ab  nvidia-persistenced-580.95.05.tar.gz
 sha256  279d814320adc07ca5a4ee101a0b428ddf22a6f3513b8c051f9eb7be47b2e797  COPYING
diff --git a/package/nvidia-persistenced/nvidia-persistenced.mk b/package/nvidia-persistenced/nvidia-persistenced.mk
index 225c26fd3b..5dbc0c3b73 100644
--- a/package/nvidia-persistenced/nvidia-persistenced.mk
+++ b/package/nvidia-persistenced/nvidia-persistenced.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_PERSISTENCED_VERSION = 560.35.03
+NVIDIA_PERSISTENCED_VERSION = 580.95.05
 NVIDIA_PERSISTENCED_SITE = $(call github,NVIDIA,nvidia-persistenced,$(NVIDIA_PERSISTENCED_VERSION))
 NVIDIA_PERSISTENCED_LICENSE = MIT
 NVIDIA_PERSISTENCED_LICENSE_FILES = COPYING
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
