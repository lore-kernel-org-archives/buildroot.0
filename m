Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E729DC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 16:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DDD0606CC;
	Wed, 27 Mar 2024 16:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEQ4eG7pwqKu; Wed, 27 Mar 2024 16:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6621606E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6621606E0;
	Wed, 27 Mar 2024 16:23:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD1891BF342
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 16:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5983606E0
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 16:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mx6Idr95Ual4 for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 16:23:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EADB606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EADB606CC
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EADB606CC
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 16:23:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4148c6132b4so6664365e9.1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 09:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711556602; x=1712161402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mdIj9zqK7DOEVsHBKZUx3vMWBGEpouMwKYnuKQhLPsA=;
 b=rbHEQNVyoCtBqBKm7epEAWqMCor1Nr9bbvgjl/aLUxiGT0nDnideFYgXQv83OI8gkK
 GCEQ4prZHS3JNE3ClFgtrJyFdUCWeeqpTgXtOpiqVtKp83GbFfgxbAf9UHq58kj4yhbQ
 npPEG/LJ0WjJBXTaNPMJWhtqcvKyPvhV94QHdzwnSQ6Mtzsx2Ui/6n30/vH6LQWE8sS+
 f25IooZHWY6u1DNNSjF3RU4+HafSXY04f3TeelLHH7KSNuIHJcmhWARpVpy9rhbVBuOn
 YmKcLGV3HnRAtmnoPzcxNgtw2OtVA6KFI5D0RkdMuwgCI+Crn/y//B4/wcUtDx2gdJe6
 ngcQ==
X-Gm-Message-State: AOJu0Yw7+m3lgHZj8/yUH4WXGQRJujV3PZx7A16h+aZKK22vSbpEjfrM
 +0zu0feRwbVxq8CBOSINR2iO5QNwLc5wXzxR8VpqAn4/I+qZqepz44DYYjw69PcnCNryYYo/kHm
 f
X-Google-Smtp-Source: AGHT+IGtnJnxRfh8ASndCNTKI3n9x5Su/EHWMUqf1sqss1htKfWRE5fq34BIge1PVXpJvsu9cFaS/w==
X-Received: by 2002:a5d:598e:0:b0:33d:8c9d:419 with SMTP id
 n14-20020a5d598e000000b0033d8c9d0419mr52127wri.24.1711556602511; 
 Wed, 27 Mar 2024 09:23:22 -0700 (PDT)
Received: from P-NTS-Evian.. ([2a04:cec0:1036:e822:923a:5222:7523:f9f7])
 by smtp.gmail.com with ESMTPSA id
 k13-20020adff5cd000000b0033ec9936909sm15277362wrp.39.2024.03.27.09.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 09:23:22 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 17:23:19 +0100
Message-ID: <20240327162319.149021-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1711556602; x=1712161402;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mdIj9zqK7DOEVsHBKZUx3vMWBGEpouMwKYnuKQhLPsA=;
 b=UnNe3YQc2U4Vb8Wy8+lho+R/XzdH9w5F/QaZEOFWpO/ER1+qkWMC9S25AoeJwP87tk
 oKUYiGa8e7QbUrT9ue37/dsgsLau3F7w2AOQCmj2aNAUgEACFoz+BWITCzg8exf81uxR
 Bq97LclVsh20MFBtF/YdpW+UMSFbdgSvYIA/fLhlc8jikbhGfmTRh9kyL9YCKwURayMt
 sY0/r9OlDNDbHoS4Ho+u8rGdKejkZBMfFaBIPOifhj+Wu3Pd1Mjqv9SE0k4patn1TzMo
 JuF0l4ph7G7+0nosbeHrnOV2AogDWxOKnaUShRlJICbV1EUmMm66Nrql6IKmBsyPEJwV
 GCYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UnNe3YQc
Subject: [Buildroot] [PATCH] support/testing: TestFileCapabilities: update
 kernel to 4.19.310
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the toolchain Bootlin update to 2023.11-1 [1], the arm Linux
kernel build is broken with binutils >= 2.41 with:

  arch/arm/mm/proc-v7.S: Assembler messages:
  arch/arm/mm/proc-v7.S:640: Error: junk at end of line, first unrecognized character is `#'

A similar issue has already be fixed for qemu m68k [2].

Bump to the latest kernel 4.19 that already include the backport
of 790756c7e022 ("ARM: 8933/1: replace Sun/Solaris style flag on section directive")

[1] 7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
[2] a1ce9474e40f731f327035d8c0962abb16f00ff7

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6414160106 (TestFileCapabilities)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/core/test_file_capabilities.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index fe21d76c94..e2600ae794 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -13,7 +13,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.310"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
