Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E12C3ABCC
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 13:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81461838FE;
	Wed, 14 May 2025 13:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQvh4QnUyND9; Wed, 14 May 2025 13:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C322838D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C322838D7;
	Wed, 14 May 2025 13:43:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41EA6153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DB26414C4
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XiytEercqla for <buildroot@buildroot.org>;
 Wed, 14 May 2025 13:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 380A34062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380A34062E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 380A34062E
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad218ed3cf3so89522466b.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747230202; x=1747835002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0rTh5gpBdnPZWhnNCKAhH44/LDU2j4EcjdScb02g+4k=;
 b=Oq2vKLbr1zQjQ5ngtmv2fFyddDCrUL9f4f75/H3IVoh0xoRpnnI+vgSVinFoMzwQj1
 YocVUZVWPtNX/tvZApqtqzJRjADQhbiqt0rzEPqeNuy2gxter4z56fhpCHRGo694v7Hy
 XxRFrtWZSPnmVYAzTg5/1v5CBthj+01dnp74HUezFGLZ5E63hqvVbg6RNlcJgvaH0pls
 GNLHKWwACu8f3fx6LRfwRzG4QVpURcziArx+yfOWSbmmwnvi3h2ETBKSum+xgW8if2Tt
 9mivTmeI9orFSVvAndg7EQrPvSkwDKp9RNxF46hKBEqaE+AA/Sx3dJxVs1AIvuAeeP3r
 0dsA==
X-Gm-Message-State: AOJu0Ywvt4ire+olBu/cWa0lkpJQnQ/6Q8CM7WY5cp79nwoecGLlZHw5
 n15Lj9Ufrtq+btWvYNxuEEgSX8joReHZ8cHVaIGPL3ekmYiQBuYGy/C97KtNd+Q0ZtpmqS1JPig
 D
X-Gm-Gg: ASbGnct3h8AredpsGCpUagp3HcwaZYhpWwyxALqoSLQKi9090PWxlcXKsFiitGiUtbo
 AaR8Fy1XGqRpb4SkV5tG3z/WneQIqA3SwexB0AY1vRk3ClQ0YhwBmxb32Ij8bY+L4Ed2ARMPe1l
 08RTj5zQBwHaMJG56D2l4FplOr+lrTgpgoFOcieLFc0xQgjREnbx4ln5tNl5Go+wzn2Kdx/V/kl
 vSWEv6Ki6J+TRio1IQpY7TbSMrQ/BZO8kzS70BVgtVoaLvwPa6LnKyDD9IUKFGyqMSFZc3F7tly
 8Ep53qJKXTyykOKH2VqFyNvQLKZUeirTBEY/BW4rZ1SQuoP8xj2HHfRo/K6ITZfmEE5VqX1Uizw
 a2B1256LrqHs8nIFCIxwbVoOl38PrKEoyS1c80iIT1FNkm+FcqJSbKiSVl/CCSdfmzwS1K5yfIy
 +BnrnveWPhkII//bi/8u5v
X-Google-Smtp-Source: AGHT+IHeq8aeeozctv+Y4f7lWpF2Tx0kHCgOi0SzvCxyMIH6UYLqMPwKn44U3Dz+LjXrqPJeIL/eiA==
X-Received: by 2002:a17:906:cc12:b0:ad2:4066:1ca6 with SMTP id
 a640c23a62f3a-ad4f74cdcb6mr112049766b.14.1747230201921; 
 Wed, 14 May 2025 06:43:21 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd3a6sm934783866b.131.2025.05.14.06.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 06:43:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 May 2025 15:43:12 +0200
Message-ID: <20250514134314.2405052-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
References: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747230202; x=1747835002;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rTh5gpBdnPZWhnNCKAhH44/LDU2j4EcjdScb02g+4k=;
 b=mZOq/VRpnGzQ6S3eHgCiDXjJIgOT5ScTh3pFUUqaS6Pff5qSJpcKTv9RuIWOv6NGWC
 qh7LV2Cza9Vqc3FQKWzpDg1XpRykmoIh7JamgIKV0VLmJgSU/g6lP0sNWPWvTqsDsFu6
 xiK3Lgzhn83UNgT3SU6n1B0icvVy/pxvLw12E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mZOq/VRp
Subject: [Buildroot] [PATCH 4/6] package/libxkbcommon: bump to version 1.9.2
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

Changes:
  - No longer hosted at https://xkbcommon.org/download. The website points to
    the github repository. As such, change the URL accordingly.

  - The sha256sum is not provided in the mailing list archive, so the sha256sum
    is locally calculated.

  - The license file was reworded as of commit e120807b:
    """Update license notices to SDPX short identifiers + update LICENSE"""

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/libxkbcommon/libxkbcommon.hash | 6 +++---
 package/libxkbcommon/libxkbcommon.mk   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 6cdd79e01a..50bcf52f17 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-March/043539.html
-sha256  65782f0a10a4b455af9c6baab7040e2f537520caa2ec2092805cdfd36863b247  libxkbcommon-1.7.0.tar.xz
+# Locally calculated
+sha256  8d68a8b45796f34f7cace357b9f89b8c92b158557274fef5889b03648b55fe59  libxkbcommon-1.9.2.tar.gz
 
 # License file:
-sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
+sha256  967e97b28658f0037bbe164a237bdfb0c3ec790e67f6c29372ea5b09306f61f3  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index c60580ef84..21a2b937ef 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 1.7.0
-LIBXKBCOMMON_SITE = https://xkbcommon.org/download
-LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
+LIBXKBCOMMON_VERSION = 1.9.2
+LIBXKBCOMMON_SITE = $(call github,xkbcommon,libxkbcommon,xkbcommon-$(LIBXKBCOMMON_VERSION))
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
 LIBXKBCOMMON_CPE_ID_VENDOR = xkbcommon
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
