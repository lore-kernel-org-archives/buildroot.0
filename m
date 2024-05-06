Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4EEC25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 18:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75D1840600;
	Mon,  6 May 2024 18:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXxvj1ugXjFx; Mon,  6 May 2024 18:52:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80CD440B88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80CD440B88;
	Mon,  6 May 2024 18:52:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 520C31BF308
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E5784061B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-wgpj9fMbti for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 18:52:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5DEA40611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5DEA40611
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5DEA40611
 for <buildroot@buildroot.org>; Mon,  6 May 2024 18:52:34 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7da4373f850so122102739f.3
 for <buildroot@buildroot.org>; Mon, 06 May 2024 11:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715021553; x=1715626353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YxYKhGrapzyHU/iQhDpSjRvaKClcuUZIBfr4d5eVPUI=;
 b=KgTdCWFzpw+jaAw/UNc4sEXVeVN6+LIFd8eiOj1u2OTwPbKvYvrdLPMthM2OcggVRh
 BXKsnM7rzsTIAkPz6876RvqoXfIWGjOFBUcr8HhhLuYhsv1P8Jta8IyGcVZ8qRaoMSGj
 em738eJp3RRMJV2KWm2qrktREU5LqRB5l4HNyXef0oy40fqL8iyaGjYMZPMutNhqqqCR
 Gu5UA+f9zEVfHaG1wD5b/49f4TvMCtYtTYGX1lbAN7l+69W5dqbVFHP9N4uQazp2wWY9
 6o5Zx/QkX+wNHNl+Q1D1V1ydx4wlk6KUZBdoBnmfZPt6ZXC92HqIF0s2YeoDsoKIJPZd
 BcQA==
X-Gm-Message-State: AOJu0YwowAn1ot39JXC5DOgFjDcHzD0A2tOohDTg6g5nqvPNgNVr/Amn
 XjrsnziF+13e2iwhl4ww9YdHidKZ5YReWyOe1qa2kG18TMlx4riZoWa8TA==
X-Google-Smtp-Source: AGHT+IE4hwDJtwMzM8k3A5klDR5uxOTLDAJbcEkr4XVSJONGWg3nd+sOWkIYbDxhLlFLiAUdTJSFzw==
X-Received: by 2002:a5e:db42:0:b0:7de:9669:7f75 with SMTP id
 r2-20020a5edb42000000b007de96697f75mr12615647iop.14.1715021553263; 
 Mon, 06 May 2024 11:52:33 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-151.hlrn.qwest.net.
 [71.33.133.151]) by smtp.gmail.com with ESMTPSA id
 21-20020a05660220d500b007d6c7f42890sm2149535ioz.53.2024.05.06.11.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 11:52:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 12:52:30 -0600
Message-Id: <20240506185231.3470040-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715021553; x=1715626353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YxYKhGrapzyHU/iQhDpSjRvaKClcuUZIBfr4d5eVPUI=;
 b=PGUM2LnD/T0nwjwcPive3i8Efre0ScCktjEps2msUL5YRCodrqB36N09Vd/ER3to8j
 Z7c2tVmwiKmryVUMIeT65u8kbv24QwyCZauWp9TUhYkv9XuV3DvcuBGb4Ri8n3qf0frD
 qDoT1RHlituTwsxvUOxy9XVGmqWoL8OqraqbsRjsJarv+7UfkvxaXEpWItjkjfcp9Vu3
 /17rIhMxF1O7zsLnIcYNYhkRVv9EtFayfDEQbO61dOJmOwG8VTM5vKYN65FuHrABqAv1
 sRNR1+yFsxwjdHVsV4OR7Zq/KDyZ/6KDXOeQEhI1qamlsoNmjGBLUO8eZVF/kBRYCeQD
 SdKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PGUM2LnD
Subject: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.65
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index f5ded676c3..3adca75140 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  7397c76996d7646b9917ebf016cd67586b10166295af2e0e18cdb5b8f6659965  ell-0.63.tar.xz
+sha256  9ee7ac57b188d391cead705d3596a6d3240341786475149db297782a52269aa5  ell-0.65.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index f43dbdb5f7..a682635539 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.63
+ELL_VERSION = 0.65
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
