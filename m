Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7936DC0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 10:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C44C417F4;
	Thu, 30 Jan 2025 10:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMQwdXpJkriQ; Thu, 30 Jan 2025 10:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 178E4417F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 178E4417F8;
	Thu, 30 Jan 2025 10:59:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B831129
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 10:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68B88417F4
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 10:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6p3t1hFxeqw for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 10:59:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 177A7417F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 177A7417F8
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 177A7417F8
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 10:59:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385df53e559so491943f8f.3
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 02:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738234775; x=1738839575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dqLsVM+0Fj9DX94CrZv6sTQ199AkYVQKNeqJyj8gwAA=;
 b=C9rSTltobMDt6GZ6qscQickBXzI2TwClv3I/fduZXKS5XDxSYfO7pJcAGcNePPCJIQ
 tnxHADByuzRB6AvoWFpTmgj/3XXRS+RaldUSwACKYZAuVvfRsbRHcoGpnv1PkNpmf6yY
 ticUsh1J49vIwCGh1+Gi3a6vpkKZGYFVfxRkda/UgOla+oM/ItrhSRero9MTN23rbaRT
 heldp75IZSww7NXYW4GgcSZBoff9iznt77UcGOV5ER6kEI7gMaXQu1YtQGc4OkAOqNDW
 Yvts0qTjoLdsbzCn5r1bOR+eH5sRtubxfgo0HKJwhH0kIKtyKNkLuh/dx7g72VajMn90
 HQ9w==
X-Gm-Message-State: AOJu0Yxir36Ii83omIiw0+R9180YIXTTnja0KckPqHvtUOeYC3E8M2Rk
 kkfmE/og5FBfIEEEY3QeiqpSgFoIW42BPdsmONLozfTXvjPA97FoyCMvpGU07f3LrAJBp6uD+1D
 h
X-Gm-Gg: ASbGncsRPmhtkaGJIoAwMHzbqGjwhxCyt03SwYf8GQB4TcvFcZRGwAmcfV9tcxGlrKk
 WN9kizlUPP+yFTNFS6g+x2Hgb/1E+J31DcRMhY72zlRQftdUdEv7zjFZApGl9ANnv9ltZ/KI3cz
 knTWtRuoG1iyvUmsbNKrQFPmgYThCbbNc+CVYU8Laue3rWlshhFC0LgY5V8yL0WjcStm6780e1d
 8l0ScId/A/ZTAeairjlH91MU4HqleVEDH9WiC+c8g/SO6sxAsn32dFwQM/P1l53bRVRHKld10DB
 U3wp9NzpYVqpzzsndnQnGLvv7dY13tWinDp1pLrE1VUKJAoXMKf9gjnEVZ2M2B/C3C9iW0FHu7O
 9HeAv
X-Google-Smtp-Source: AGHT+IHmMcD2+lEz4hdRnWzLLaR9Ch3uLuHvM/o6EqaQ8Vt01KFkAhP9KKtc8Il8YCW7a/xXrASWyA==
X-Received: by 2002:a05:6000:144d:b0:38a:88ac:ed0d with SMTP id
 ffacd0b85a97d-38c51941b32mr5281898f8f.12.1738234775611; 
 Thu, 30 Jan 2025 02:59:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.88])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2e239sm54187205e9.18.2025.01.30.02.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 02:59:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dariobin@libero.it>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 30 Jan 2025 11:59:31 +0100
Message-ID: <20250130105931.2096913-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1738234775; x=1738839575;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dqLsVM+0Fj9DX94CrZv6sTQ199AkYVQKNeqJyj8gwAA=;
 b=JH1Ec/sB5exYiaL77v98fDcBnlz6svmnOQ9RsycWwfNz76XlhyN3YoEeEpBOBkzwBd
 YNeAp0xfw+kojfF9MC85XyFOAX1UD32rx/Nstt1b2uVSEA1I2KmgAxn3kuSMJnwMiiL2
 fvzbLb5WPzhgxnENvmY1PeIxwVw4COs8xfPMU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JH1Ec/sB
Subject: [Buildroot] [PATCH 1/1] package/uboot-bootcount: bump to version
 3.1.0
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

Support IMX93 platform

Release notes:
https://github.com/VoltServer/uboot-bootcount/releases/tag/v3.1.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uboot-bootcount/uboot-bootcount.hash | 2 +-
 package/uboot-bootcount/uboot-bootcount.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-bootcount/uboot-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
index 7f46da22ebe0..aaf702c789aa 100644
--- a/package/uboot-bootcount/uboot-bootcount.hash
+++ b/package/uboot-bootcount/uboot-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b26b9135716afb2ea967edc2327d1d307cdd15a643bd105dc223d062e18f2dda  uboot-bootcount-3.0.0.tar.gz
+sha256  dd74a806c779c3180250ca2fce68ce9dc59f9d5fa1cbd170212cf7878c56d348  uboot-bootcount-3.1.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
index 48a45b91aae0..2c75f8f5642f 100644
--- a/package/uboot-bootcount/uboot-bootcount.mk
+++ b/package/uboot-bootcount/uboot-bootcount.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_BOOTCOUNT_VERSION = 3.0.0
+UBOOT_BOOTCOUNT_VERSION = 3.1.0
 UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
 UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
 UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
