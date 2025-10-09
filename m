Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FF5CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 16:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD5CE6130C;
	Thu,  9 Oct 2025 16:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6isSAzDiW9r; Thu,  9 Oct 2025 16:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BEAB612D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BEAB612D8;
	Thu,  9 Oct 2025 16:40:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18BD2226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 16:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B511C612D8
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 16:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xh3uZ22RuhyH for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 16:40:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8825761288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8825761288
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8825761288
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 16:40:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b457d93c155so187722366b.1
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 09:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760028023; x=1760632823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cKbm5+8ndu0xlDX5+E3mqQZtG5p5ExXa/rwJT8Pw+Ug=;
 b=a7VqdqtH1X8SNp+YvqFvmREa6CTJcR13Lp0/7V1H6Udm8C/x6MEiPuVT8vTDAMk/yi
 m7ViDdydoJERdDNgE8+/rE15qKtdiBaZeCui3Yzq+kuBvvoWIwSonxcsNMUfUqJCNm/W
 KJiogCQpbXPHKZ4U9rzSf+tLpF0SLatUKxE7PWbjbK0GBb0k0X5JkCe7W2LVWTHoo3ni
 Nw4ykiLUbrtNEueRevE7mrvWsMrpPeGqOKk4P7PSp1/Z5YeVEDfvzyrlLUJE9/Uxzgz9
 a/IYOSOkRD+9J8uJYthuECR3dc1+4PRBHSbjP1gOSTfsp9ef37hVaf1jmb9X6I3ph1QI
 woSQ==
X-Gm-Message-State: AOJu0YxLIHaq6LNAE3oIBROPEnAKcXeoHeWJhZyo9yO/HrVfOiZnmlmF
 +G4EiIXo57UibOy/RPQREu/fyNmeQ7+l8vqqA4uy3NlE/+IG7/YU8biZIBaM4fgpGFeP7VORhi8
 wuSY4j6o=
X-Gm-Gg: ASbGncux6D3LKMVOi2vVCVrx6ZNHC5AB+iEPQKMURWvc58JmVwCSBNPefLO2krF9unU
 Jjg1Z4C+EOh9T+zRuy7FQvHn5q2+R6b5d82hqy1de/vbGQ9W7X9+AF0Sv3g0AxahbEHbVMjWpor
 /gcd6Qq+AoiyaYysuui9vnlU9SwW4rRIWA9k62njtpWODtldHMSMwL8jz9jM/K0tTJmaZbqPjNl
 z4JtfFUGR4UclXIFsjCcGvft+x7NBiQlQ5HKGhghKkdS14x5aqTs8ARreFvjL05T0LUdBYEYvn8
 mTGBcgxHVKv3TGIMzNu5hurpoZD2TMrcv4Tiv2zHkimm5DQslLIHl5v/tEsan5jPlD+MnJrVHXM
 4sXMoJiOAFpvBfP6527AqR918+FwpAB2FfWtVGu4851D8Sh5dzeyTHJ8wDyNWL6QjQn2c4gaCWh
 UeGEZwO/yWvm6DV4xrOt33TNfY2ahJnWk2RKlXo0MFl78A
X-Google-Smtp-Source: AGHT+IGfpEMdhTTwZk1XR423dgfaCeJk9fBoJuKq5Pj2ER4u8ZZ+aqHxMKwVbLuAmBoJBet+P2zqWQ==
X-Received: by 2002:a17:907:807:b0:b41:f729:77b0 with SMTP id
 a640c23a62f3a-b50aa1869bfmr921163366b.21.1760028023039; 
 Thu, 09 Oct 2025 09:40:23 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.40.35])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b0f42esm190834a12.12.2025.10.09.09.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 09:40:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu,  9 Oct 2025 18:40:12 +0200
Message-ID: <20251009164012.4185381-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760028023; x=1760632823;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cKbm5+8ndu0xlDX5+E3mqQZtG5p5ExXa/rwJT8Pw+Ug=;
 b=ONSjjU92wsOY8Y90DmyxCPKgPoMbR8Bao/Dx8j/qXu1FWWZJnQTw3J/Pvb0zlNsqK+
 NLGO1t5prh1vzLf/QhsFlOZgHAwNpxKtvaAAFUIf/StaMTyjKmsjjN44Zz2mCGmcmMhT
 CVwEaJq1hR5RgZr3HUCXvOjYDzCvp30rcP5Ks=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ONSjjU92
Subject: [Buildroot] [PATCH 1/1] package/gsl: bump to version 2.8
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
https://cgit.git.savannah.gnu.org/cgit/gsl.git/tree/NEWS?h=release-2-8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/gsl/gsl.hash | 2 +-
 package/gsl/gsl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gsl/gsl.hash b/package/gsl/gsl.hash
index 153ae4131d44..d6a3307e4344 100644
--- a/package/gsl/gsl.hash
+++ b/package/gsl/gsl.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  dcb0fbd43048832b757ff9942691a8dd70026d5da0ff85601e52687f6deeb34b  gsl-2.7.1.tar.gz
+sha256  6a99eeed15632c6354895b1dd542ed5a855c0f15d9ad1326c6fe2b2c9e423190  gsl-2.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 575cb754621a..f5d22caccff1 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSL_VERSION = 2.7.1
+GSL_VERSION = 2.8
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPL-3.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
