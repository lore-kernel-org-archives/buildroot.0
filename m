Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5828C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 08:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F9D94025C;
	Thu, 25 Jul 2024 08:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5txXzr8JrZNC; Thu, 25 Jul 2024 08:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70E8240DF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70E8240DF3;
	Thu, 25 Jul 2024 08:06:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 651FA1BF98E
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53DBB407C6
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzn4zXx5tupk for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 08:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6C75406C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6C75406C8
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6C75406C8
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:06:46 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so4558825e9.2
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 01:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721894804; x=1722499604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lq03KY+wysZNE/Etopv3yzEAUvBmWCTdGeGoRwe+V8Y=;
 b=b5EXk7LsKFmFwxUxq3kSdYhap3Mw9h2g5nlnpSMlp5XRZqfoIj6M7/4L2dpFuPIBKF
 CNTOBE+6KrLDE6TIBqrLgCGaFpqoezZaHSziX4Us9bf6Ool+9NG12o4aiUbjt7wiSGie
 zPWxy7cW4WtvMAxiZHmdhseoiRnQ0Ozwr7aAIJ0/LtxORanWVgDl2eGREIm6N3yi0d+C
 HJGFkoNgqJMiDnOV2fI0nO1nwMJP2LTj8Ux/wNKP7V/ktbiqthe4PX4OZ5bGJF0HfJna
 mJVVk6hr+hrUOD2/vGma3SBgLWhxoE4Qmt9nbBV8n2+/uWVgZc3OqixqfY8jVeNZs11j
 POxw==
X-Gm-Message-State: AOJu0Yx0aX7bXT5+GNHjTzBNu6R26B9Ugvz2+lyCeX0oZvrcPd9GrxcH
 yFrxfI9YoVgBQAnM3JuBQm+Fp4xKXq1s2j0iQhTizvymeQQNzmCEZB8M9iK4DL0kh4mzj+hKpe1
 g2Tc=
X-Google-Smtp-Source: AGHT+IE40qVcAfVO0DDfJwEvLDgTppu517BfcFdtMQmzWhM+kq9QqUq7udHK6TlAkLiwAq9cSYaDEg==
X-Received: by 2002:a05:600c:350f:b0:423:791:f446 with SMTP id
 5b1f17b1804b1-4280546de1cmr10363305e9.7.1721894804505; 
 Thu, 25 Jul 2024 01:06:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.5.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280573eb8esm22216255e9.11.2024.07.25.01.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:06:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 10:06:41 +0200
Message-ID: <20240725080641.303312-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721894804; x=1722499604;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lq03KY+wysZNE/Etopv3yzEAUvBmWCTdGeGoRwe+V8Y=;
 b=JyfSREC76rrIi4rSF5ObFx5YeedmON0myrIXf4aJSyiyzZ8VVaAmv7Y0NQhw1t+xva
 TlJdmU1JpPYHjFO2a2bqDTAHZjxf2sRhbRNavhyMPzyqI5lUXIvbSeI2R3WJPCIojZ1x
 Dt9wDZP7y0pGOxAGTVITeSG3DsMCx4zHVS1o8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JyfSREC7
Subject: [Buildroot] [PATCH 1/1] package/elfutils: fix build on microblaze
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on microblaze:

dwelf_elf_begin.c:62:1: error: symver is only supported on ELF platforms
   62 | OLD_VERSION (dwelf_elf_begin, ELFUTILS_0.175)
      | ^~~~~~~~~~~
dwelf_elf_begin.c:62:1: error: symver is only supported on ELF platforms

Fixes:
 - http://autobuild.buildroot.org/results/5ca2aa5c76415690ad4a85837ba47e7bcfbdbcbc

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/elfutils/elfutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 4d8cc43342e8..a648432ed38f 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -45,6 +45,10 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
+ifeq ($(BR2_microblazebe),y)
+ELFUTILS_CONF_OPTS += --disable-symbol-versioning
+endif
+
 # disable for now, needs "distro" support
 ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
 HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
