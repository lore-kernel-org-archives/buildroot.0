Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51359F43680
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B8A040CEC;
	Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcKBvTrWoCgU; Fri, 17 Apr 2026 08:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 366F640CC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416390;
	bh=YtoPKXHY3akNknipNcuMzm6NTipIPpjVCtidU1YESTk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EIKNlemYKMV0BDikZ1Ej4OZco17yI5aRvFzHppy1ZbycBd+XPGrhlB4Y6gSJALmlH
	 eW+r9JWMziUANKopYbFNouKgKp3pdEmLlqAiz9uy02zZnRq1ZDYIUG/3jXEfea5aDR
	 n8Eldow0cKE7cS9l5fd2s3JcrwMHoBDMYHSF003j1HwgI5Zwb6yqsDW/XMbVbsQ2ZJ
	 TnXs5nHRMY0Glx0Nox/cfLeHbPtmdAaubKgBkgQcdEopS0SDydHmiz7n1+3mRAd2Us
	 MhWgHVphGHoBWP2I6V2tnYC7AEulO7eKee+dbn8FHtukZ9CoriE1N2ze/lokMVwZSy
	 fYrB+2NoGxJiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 366F640CC1;
	Fri, 17 Apr 2026 08:59:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9AC9396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D36E060D74
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKvzcs9Gnljf for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5595660D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5595660D61
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5595660D61
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso5333135e9.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416383; x=1777021183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=th4HVxSGQ4TxkaV+vSXWW3EOHTLWFgDdcGYg0jkE+wc=;
 b=dMPlsXvYfVbW31c5+QLYGQTr0+T1Y7DL8wmwJHyLuV9hILSfgRo3CbflCc0Uz4qxz2
 0Sd0+tnfJTNickpTuN44+XFO1UmDIqfdkY0fLqjG/zoYAFnmqAAU6Byz2kJ5zqVKzOwb
 KK8yrBqsUZaTCfpOOsRcdszgu6xIxpNyABygdRn5b5p5UqUh+HSfakPoh5dqvuR33uww
 EFHssxioaZN7Y2/qb/P6ATqVFn6lT7yyPUUNCFc3NGTMFtIpDbYzWXGIgGkrepvjzl19
 FTvianCLSvyjBy9Y8bhqdmbPR3/XbET3F7fSifV3N29cKb3q7MFeYX6C4pL72roVkHlv
 nlNg==
X-Gm-Message-State: AOJu0YxjdDiu7jj4wd3YabK2xhdZXyLBi+AVajuxxDGKc6f+GEkJtIuD
 LC/DkOLUaMN5E4+dVck4u0bMbkmck7KK2D4FQzciONfMIQ1pJ2MYc42ZCG/n8yrTvLjK5jrKHU1
 +kyDQeok=
X-Gm-Gg: AeBDietb/x/c3Ya5PS3zVQyplexsmoa1z1CySoj0MLSra3L1U4E9R2wRFOCfM4Wlrkz
 r1oDYcAdMhhbGmLpPBj/LTEhmbeJ1sLNhX7lt/xPIgD/FYTNytOg+sToWLF2HlMbTOWhskJEmBq
 JHWjOmlEY8qi5WVT/6UGseI8JGb4c3od0zqR1ushwfrXMujQfYYIRKzTfmLEA4HsdJ+Y8Qrtife
 bQOxvPu4T5znhD4GcQHij5Tpxv16sO3K32meklkWnTRAwqb0NnZH0EWM9fDUlcFbvDthvsMgENP
 cj9Ac4g4TtU1+9r0Mc8/utLvHCIXYIeqGTfrEqowN7x7rFaCgYhsv5R4sR7gciH7o/16qLwkbmG
 SM/RepDy7uUnDRtZa28KFAcmLsS+iTHNnrZfOLzbNX+K91g5/4hxNQXLH0P3+AVb6BJMy+yWv1u
 8drLQ4zbppNnLOT2TXU50uoone77g3qzuy5XYUjGeEjzcJdAhOmszDkdGRL19TVLIGpNmIS3Nec
 5zQg16jnBSmPItwmNDSCTw+d4aG+eQ=
X-Received: by 2002:a05:600d:8408:b0:488:be58:bb5b with SMTP id
 5b1f17b1804b1-488fb773f0cmr20330935e9.24.1776416383001; 
 Fri, 17 Apr 2026 01:59:43 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:19 +0200
Message-ID: <20260417085936.200528-5-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416383; x=1777021183; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=th4HVxSGQ4TxkaV+vSXWW3EOHTLWFgDdcGYg0jkE+wc=;
 b=LNvZUW3wnZ2gXOcthifJIJ4/okXMu2uL+gX7MlZ4xUwcozJP1QIkzj78pwFldUSH5F
 SO93eIsdxBt8aZ8p6JN6Zg+ybaP1RiRTjFJG19+bQY8zwaPQcFcUWzdP2RPjowKwfzi2
 z42y+/j5VIrXhoEfHIf+hdAv4udbxX08+Q+Hs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=LNvZUW3w
Subject: [Buildroot] [PATCH v1 04/21] support/testing: test_f2fs : Kernel
 version bump LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/fs/test_f2fs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 5918fe8ca8..dee862a9e2 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -20,7 +20,7 @@ class TestF2FS(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
