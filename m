Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7EAC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 12:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6004A417CD;
	Fri, 27 Jan 2023 12:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6004A417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZNB6HdJs7Rp; Fri, 27 Jan 2023 12:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ECDF417DD;
	Fri, 27 Jan 2023 12:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ECDF417DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9FF1BF263
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5992D82B51
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5992D82B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KB824Y2CB_at for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 12:26:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21978823E3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21978823E3
 for <buildroot@busybox.net>; Fri, 27 Jan 2023 12:26:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5307150wma.1
 for <buildroot@busybox.net>; Fri, 27 Jan 2023 04:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFFGtySKQtheoFPcCRiXRAlse1YO6EocpXfYIbeIGrw=;
 b=nbYCckwM7yvFA1Yyxuh24Hyn+5trcV/8kgALBvnpIvmO/jFmQWtM6nKehIZG8V4HTN
 lPYY3TLzs3RybcxF7w8+Le7Q8eTiUBkJ0GsTnHdGKD93swKvsSvk4zG02GP/pvDqH4Gc
 bV3EE2mHvaC/1ie7tb2TeJL6u1M+0DGxsR5DFCrNtPnZtFJFs93RZUSnN6oucBmbbUEi
 8NsiErTmXFmYIP/1inBDtrrNkJLjwmUWKT+8z9k0W05Sb36KOoiJ3Ubeiv8oapSf2mjD
 v0QWhQgq7NfRRVyby5qBAhzBhka/FcysjybSgunocGECWi4mmtY6UfFN1G/IUYKtRhpm
 4tkw==
X-Gm-Message-State: AFqh2kqepaLmb7IWIuHc8/XBCzxnsvMNosqTo3PUwqvDPecEb1NbOjj+
 xgsLVtDEoqYz/mtFWXdEyeEiOX2C0Aw=
X-Google-Smtp-Source: AMrXdXsygJ9njM2quubH3hk6jjLeei22ZzILgXJhznlhZV6i0sneBxlIUGkAUc9MEpYhzIYjCOYV0w==
X-Received: by 2002:a05:600c:3412:b0:3da:f678:1d47 with SMTP id
 y18-20020a05600c341200b003daf6781d47mr38809562wmp.14.1674822373166; 
 Fri, 27 Jan 2023 04:26:13 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a1c7211000000b003dc3f07c876sm915815wmc.46.2023.01.27.04.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 04:26:12 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 27 Jan 2023 13:26:10 +0100
Message-Id: <20230127122610.236075-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tFFGtySKQtheoFPcCRiXRAlse1YO6EocpXfYIbeIGrw=;
 b=GuWtME9jI8i1x0PZq144UDj6du63hLBNyi2JSNVN0T2L3C4Gt+OG+z7x7GzE1V28YS
 LRIQilqOdormqiEdxrOggprkQT2cqR+zq8JrLPlmB7pN1I8SnCGZuK5239qKVaYkfSMg
 dm8Vr0Y/8j10FwuUs5k5uG4pA2kjjkAAHeUNGRG12ilZSLQh9AMDjZxOCwPPo2rPHOdh
 oEpkHLeELir7r706UnLhPA4fls5QlGHR5bj3Z0nFAvYu6wLGMirjULeDyV3YAsq4YHCf
 J8bXC5GgNUYKt66qz0I/fpEqoysT7JPmNOddCGngfjlekqILtQ/Zya4AR2eRTt+8nLJ/
 eiWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GuWtME9j
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2022.12
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
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 45e8b56e9..624988215 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  337ef04d16f826f99465c653b92006028fe220be68d3dcfd0729612f4f6b5b46  MoarVM-2022.07.tar.gz
+sha256  51c3e9c9a7a191c148f213b65ae1f4fcfe5d4b7c16c86300e9ee8e18eaa8becb  MoarVM-2022.12.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 9820f318b..ef9d29d5a 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2022.07
+MOARVM_VERSION = 2022.12
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
