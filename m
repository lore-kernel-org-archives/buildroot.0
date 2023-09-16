Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF33DC2BA12
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 21:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2ACDE4031C;
	Sat, 16 Sep 2023 21:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ACDE4031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CiPzKeICSxHz; Sat, 16 Sep 2023 21:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7972340158;
	Sat, 16 Sep 2023 21:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7972340158
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F75E1BF30D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 21:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28098417A2
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 21:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28098417A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3onDtZ7eNntR for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 21:27:26 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 051EF41769
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 21:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 051EF41769
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-404571cbb8dso33909815e9.3
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694899643; x=1695504443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w7+WWXzOzvYYFY4iwfoY3vFpuASG58VHrHn7Cu6dTNs=;
 b=T5zVvlUSIXhkUBYz3DJb8POZF8h3c7uhOR32ItabmvUn4xmWCYu2CqGl+srsmg4CJo
 7s1nIuCE65Px6JcKGPu6U12O7cevqbakkYkphKDYFlkx6mTJH47Uw/dMfgq1/44E7Y1+
 q1QftUJ2L6Sy+RUWqKOOb6Zg93k51wmQC4QMEn6sVUAQJSkjFI31CZtF+ED2piTyx4Y6
 smriy6l1KroENGp/+ju4T+A3YcpVww1asQdB2qDmXtBtNa8zoq/yhTshi07DwIW8sKE3
 0GI3Nd+OgFKSPmAH5CKb/gSHHl1NGZiGQNtn8sOvrslsNSK4nRXyP846KG9TNKPTMHDN
 aWTQ==
X-Gm-Message-State: AOJu0YwZHi3OMdWUYSODROyvorL+ioWYv2yKiDCJeYnEEgKgeFPt6Lju
 RQ1wf+/N+9QqSN6quDCJAc8k9rY+Qy0=
X-Google-Smtp-Source: AGHT+IG+CYKLZmLgncDdNQlXD++X7jFkfBVo36O3bZ+3D0gnfG5itSCW08N8rE3beOEXyo8qOY5izA==
X-Received: by 2002:a1c:f717:0:b0:3fe:4900:db95 with SMTP id
 v23-20020a1cf717000000b003fe4900db95mr4918741wmh.37.1694899643281; 
 Sat, 16 Sep 2023 14:27:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c029000b003fee8793911sm8204363wmk.44.2023.09.16.14.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 14:27:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 23:27:17 +0200
Message-Id: <20230916212717.1181744-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694899643; x=1695504443; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w7+WWXzOzvYYFY4iwfoY3vFpuASG58VHrHn7Cu6dTNs=;
 b=Cm3nsh5S3S2SiEFDp5KxRa9pjfay6klDxM9kcsQ1aw22ytMS3eFWEyQP+L/vJWy3pd
 h3OlQ6qGaJ3tuMR7GI64U7SMPeNpzdWyXQnQNiutk9FcDaKLCzPAoNZwH8XjY4Z7A/sM
 Bokduk1VxuMeTU2T37+WNIKX4SXlpmiGP4XOegLHkrM9sb4jm41BCCfhnwA0+iItFCZQ
 BoMq3XmZ1vp1ex/lLPfICf3AqItSbPRgyWdzsx7JhILhLkvVHqUlx3qpQDv4UWhDIRtx
 iT0DzK91s1udsGzerNiPMz/zFiJfznbyxxpW2QAZSBrZoI6NjCmftoWE1V86OjJqdUiD
 vZkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cm3nsh5S
Subject: [Buildroot] [PATCH 1/1] package/crun: needs MMU
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with uclibc but without MMU raised since
commit 223596c75d73a7eb29152235d3c5d9bf53bd58f5:

/home/autobuild/autobuild/instance-6/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: ./.libs/libcrun.a(libcrun_la-container.o): in function `.L0 ':
container.c:(.text+0x4e7c): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/f19482753e9262ec806cf550619170467a144daf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crun/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index 1b69034459..f6a1ec7c66 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_YAJL # libocispec
@@ -9,5 +10,6 @@ config BR2_PACKAGE_CRUN
 	  https://github.com/containers/crun
 
 comment "crun needs a glibc or musl toolchain, gcc >= 4.9"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
