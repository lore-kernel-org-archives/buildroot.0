Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC3FC001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A04D410B7;
	Mon, 31 Jul 2023 14:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A04D410B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3aJcrJPKmpN; Mon, 31 Jul 2023 14:02:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D356409EB;
	Mon, 31 Jul 2023 14:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D356409EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DE801BF38E
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1743C81779
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1743C81779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQvF1L_fS4YG for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:02:38 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F0F281773
 for <buildroot@busybox.net>; Mon, 31 Jul 2023 14:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F0F281773
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so480994366b.3
 for <buildroot@busybox.net>; Mon, 31 Jul 2023 07:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690812156; x=1691416956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DmW99FwNE5yekawFuSP2qqGpQciT6N9zdf3skha/ydk=;
 b=ijIqkq1Zqvnb2871jrV0srG1Z0hZ8hcTm5C1Ptx26fQiSfUR5NgLvN6Op7pzHa+o1t
 jgk6iUIPUfmRGrRj8HO25fdV3avr/EVX7G4IIf53XRkkgA3oC2Vb/IAHi87Ph7GgA6Xb
 4ogrl3SoM7m+NQkJrbEjPrSsmkpHKSMS8TnDK/Z/OPKwhQL8+WMo4lAEte6kQ9O4aiyo
 /Cf+7Tba6g9S3yu5FUfqatOIvWlsgDy+69ERPt7F0FfAAP93zGRlY3/CbwuImXnbhJRf
 ex5JvsFT1XmvBGRVt9371FhDBHb8k/GLiPU4JPWyAs+AtvsLcBY6f1o4FCBg1kBEiaWd
 tH4w==
X-Gm-Message-State: ABy/qLYc27yZhnKb1L3uCikeOwrLIUcbV/4mVbiEmD7BFYd8ZGldyViQ
 8YiJrRxSCrDWmK3nVChYzY8+m631szE=
X-Google-Smtp-Source: APBJJlFnQyJpABY5oLE1QpE7SwDSEiVG7272G7IV4HBNCHVoz7pudUKpIim6Lm0pWun9r7pM+qFUSg==
X-Received: by 2002:a17:907:78d3:b0:991:e7c2:d0be with SMTP id
 kv19-20020a17090778d300b00991e7c2d0bemr8149308ejc.63.1690812156245; 
 Mon, 31 Jul 2023 07:02:36 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 va16-20020a17090711d000b00992aea2c55dsm6246074ejb.153.2023.07.31.07.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 07:02:35 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 31 Jul 2023 16:02:31 +0200
Message-Id: <20230731140231.73516-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690812156; x=1691416956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DmW99FwNE5yekawFuSP2qqGpQciT6N9zdf3skha/ydk=;
 b=a8DXsQEr8C9fgOO9iW2vpmBlhIbUw68x3EJWqTgU8KxLoSDj0W0N8wsrn7aJ0GMNVN
 k1jiMpdXkXoJ242E9+Dm3zb2OgSY78GcxycO9JgpGo5ArnSEm3FzuhjdlG+FrHxez4sQ
 qbXwOM6wyMvu8WAatlL2peDjLsFFZmfghBGPdmiTTcWWEx42UcPmR0xbCCdi6Dq6Kyrs
 EKt6pdcuoM8QR0DJJkHUF8Qd4/KJmOJfkzA5ey5ZQxM/ZYaA96iqMexSlLLOoTSB78hH
 6J2aLyiDDwEwr8rtO/F9JU2cKzNgp5dPpg7goDEn/lNJobslBGhv/adwDsrxYpDshk4u
 4SRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=a8DXsQEr
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.15.1
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
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 155c29ecd..0397efc54 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  1e79f1dd60eaf79645c21411c4a7028c97b5e745ea677ac5bda747c90497a785  libfuse3-3.15.0.tar.gz
+sha256  cb93e170288804d2e83da9b69925d968655ed75883476773ba5268d08bb1d335  libfuse3-3.15.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index f1b294f74..32e35ff32 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.15.0
+LIBFUSE3_VERSION = 3.15.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
