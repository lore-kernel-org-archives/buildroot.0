Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E77CCE79AC
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 06:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CCB641EA3;
	Wed, 20 Sep 2023 06:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CCB641EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fks0k33wLWu7; Wed, 20 Sep 2023 06:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4315241EA7;
	Wed, 20 Sep 2023 06:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4315241EA7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF8F01BF3F2
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 06:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98B27404E0
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 06:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98B27404E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQMowxTcPF2E for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 06:55:14 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C7DC400F9
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 06:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C7DC400F9
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50307acd445so6041792e87.0
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 23:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695192912; x=1695797712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oCyM6oNldIp+YAmY8vdPbHrg+hUlRvbyFtsA+P3bcBE=;
 b=JL2EQHKVPYoI9OYrBTKj0jbceniEEsPqf2HamWrGwM8Nst8suggiLUBoz6xd/ZYR6a
 ufSTHxtjluL6JlcjqQfiAGRKHyxlsqJPa5ogP3r0xKc83+YSLkiriLJfovMj5mVG+crN
 8Qadfp2hm492ZtlcUJPqAI8+43p/goDFUHbb/IZTeKJATze3vYinzQ2sEva3WWN6HeUz
 jqGm0C0514VERt1lFYEXFV0WkRgJWVL87o09SyC/W/E19wWdyyRGWtdKh+WHYtWtTRYS
 6Rfu8iZQHSOpwJ7xR6KROH4IBV0XPIPyAZqSd9YnS0+MupVh1cME4bzS/LAlfFraVaqX
 wbtQ==
X-Gm-Message-State: AOJu0Yx8xONPa/AGfHHusyR9wJH1LAktPt54xsgF7ElHJkatAZHcNldr
 GdCFq56K0ejK3nF/BsK9KLh4cPN7/ERapUaR9mvc5A==
X-Google-Smtp-Source: AGHT+IFFCvjumhAJ/5BrL8yVUXnRdxXMJs75Eabw7u6G8718Iqi7T+IXqqBlNivLgyWNa8mmJKFOTQ==
X-Received: by 2002:a05:6512:702:b0:4fb:7559:aea3 with SMTP id
 b2-20020a056512070200b004fb7559aea3mr1339623lfs.39.1695192911910; 
 Tue, 19 Sep 2023 23:55:11 -0700 (PDT)
Received: from angelo-ThinkPad-T470p.. (host185138219236.static.fidoka.tech.
 [185.138.219.236]) by smtp.gmail.com with ESMTPSA id
 f12-20020a0564021e8c00b0053116e45317sm3836686edf.44.2023.09.19.23.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 23:55:11 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 08:55:04 +0200
Message-Id: <20230920065504.2872089-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695192912; x=1695797712;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oCyM6oNldIp+YAmY8vdPbHrg+hUlRvbyFtsA+P3bcBE=;
 b=U/p/JFP0EVuh7MwoM5WRvZfWpeSCr1JpWNukhCTeK6E5Pl18OILMRBRG9w1DTGHLKS
 1TNXyon7Kkz37GuxNvlBece6du/8VTwuTOIW0fpbSNi2S28i7nViTjOxlxvIXnuPeKmh
 BPD3rngHLopqCbOkYdmwOu7yM8biQ6bF7CNqc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=U/p/JFP0
Subject: [Buildroot] [PATCH] package/sshguard: bump to version 2.4.3
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/sshguard/sshguard.hash | 4 ++--
 package/sshguard/sshguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
index b1752f1c68..d018428d19 100644
--- a/package/sshguard/sshguard.hash
+++ b/package/sshguard/sshguard.hash
@@ -1,4 +1,4 @@
-# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.2/sshguard-2.4.2.sha256
-sha256  2770b776e5ea70a9bedfec4fd84d57400afa927f0f7522870d2dcbbe1ace37e8  sshguard-2.4.2.tar.gz
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.3/sshguard-2.4.3.sha256
+sha256  64029deff6de90fdeefb1f497d414f0e4045076693a91da1a70eb7595e97efeb  sshguard-2.4.3.tar.gz
 # Locally calculated
 sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index d27c76e63f..8d03635743 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHGUARD_VERSION = 2.4.2
+SSHGUARD_VERSION = 2.4.3
 SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
 SSHGUARD_LICENSE = ISC, Public Domain (fnv hash), BSD-3-Clause (SimCList)
 SSHGUARD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
