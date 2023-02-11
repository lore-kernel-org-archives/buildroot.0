Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A77C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 22:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4302660A69;
	Sat, 11 Feb 2023 22:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4302660A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtdJofrwxxt1; Sat, 11 Feb 2023 22:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 924C660BB3;
	Sat, 11 Feb 2023 22:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 924C660BB3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2641BF588
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 22:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE8081E6B
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 22:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE8081E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aucaO5Yt-iUr for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 22:48:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E7F81D3A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1E7F81D3A
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 22:48:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso1126768wmo.3
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 14:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bLbTqO8GS5+VtpWT/aFaHs1x16dGbwyAkEG6riGZsM0=;
 b=76ZpTE9OCaxV/Yy5GKsBJ7CldYsDPn9c7eykPAeLI70AshkWbSVd0nvhOYNT9FizGF
 3RGl2REx6V1ucHFdHiKS2LbKVyWIVDRx59GFSMKGBNJlJxa6yAS1MVDhuMfZDA24GOpx
 n7oo/FfdicUHNjsOKlQjYe3cXDiMsiQDn+uIwxwxzAt6ddmZaYg6Fv159RTXcICOgSLf
 jumIgc0oKHWPKayXWXKQsGTq/4Mo0ZFprybuFlRmeEKqdQBVX9gyqTL93g28+ly9bo+Z
 44A2J53Zmo1zF4RzSdkg6ai3jb9e2GLOWE6/bj0W+i8CLxMvTym7bK0M6boV5vWlHMq2
 NLUA==
X-Gm-Message-State: AO0yUKWyxQ9h0X8bXDMOEQ8MfdgLSVCgpqqT/HqHx+eiHta+8nrI7Bu/
 JjeIPtgPoUa+ZtkLI3jZbdyA5K8PIAs=
X-Google-Smtp-Source: AK7set/pJJQENiFsEtbiasa4f0zvY4j4gICcGR+UB3YHrvZUqcD+vk1w8zkuz8eWKTAR6BMgh4dTwA==
X-Received: by 2002:a05:600c:43d2:b0:3da:f5d1:c677 with SMTP id
 f18-20020a05600c43d200b003daf5d1c677mr15933379wmn.35.1676155697826; 
 Sat, 11 Feb 2023 14:48:17 -0800 (PST)
Received: from comet.lan (lfbn-ren-1-1841-207.w83-199.abo.wanadoo.fr.
 [83.199.27.207]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c2f8800b003ddf2865aeasm12826171wmn.41.2023.02.11.14.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 14:48:17 -0800 (PST)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 23:47:55 +0100
Message-Id: <20230211224755.13044-1-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bLbTqO8GS5+VtpWT/aFaHs1x16dGbwyAkEG6riGZsM0=;
 b=FmDLk1cZkFnLRnSs2ZAScsKZq9uc0dOBv3ybpUgxJDMKbBwtHt5HDHnrdWAq5kgDxE
 Vfju+Ehs60M7wmHe9PM3D9idNopRtAE/lVpytaUsZMk2aabniGAgaa2wWlFy1PNYaf9x
 YKw6asN96oVWjSh0fzUrvQ7m+IZk5SGVNwc8p1PRLogLxgsZ2otEEvONw6JuFXnbzs6M
 zPnFzhvAIJfbFVvNdyq1uDqXTgXuwQzuRZVYR2RL6rHbWiSWVIF39lkV3pdpc4Bv2+H6
 G69qQx3cS0n6SFigjYlkdPvFJIpfL2q1tIpLn3uHhEGeOHhyyHqNdtD7zoXB2zjS/rgD
 mokw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FmDLk1cZ
Subject: [Buildroot] [PATCH 1/1] board/visionfive2: add link to documentation
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a link to RVspace Documentation Center, which did not exist
when readme.txt was first submitted. It provides datasheet, quick
start, schematics, and so on.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 board/visionfive2/readme.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
index 2da98f3847..1924cbc12b 100644
--- a/board/visionfive2/readme.txt
+++ b/board/visionfive2/readme.txt
@@ -4,6 +4,8 @@ Starfive VisionFive2
 The VisionFive2 is a low-cost RISC-V 64-bit based platform, powered by a
 Starfive JH7110 processor.
 
+https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
+
 How to build
 ============
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
