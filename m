Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA60C5B552
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3608541DE9;
	Sun,  1 Jun 2025 10:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZj2pvRL6s4p; Sun,  1 Jun 2025 10:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D4E241DFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4E241DFE;
	Sun,  1 Jun 2025 10:13:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E21AF222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8847400AB
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nb0lUU12-5OU for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C9374005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C9374005C
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C9374005C
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:28 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5532e0ad84aso4289847e87.2
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748772806; x=1749377606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5naTyxS497QlhgbCfbVrlvbFHLEpVuucSxLIBQhqZUk=;
 b=Lt5aLcyeuCHtecyDD85aIp7FIYaXGALKxIijj/ft50SM3T7xka+cZTTE49RVJ/URxX
 dVFZMIRFwfxi3Ogm5fuutLbkr3C70QDmatuBs345cAiIjgMzugmcZvyzAOtkO1cDYCyd
 0/kMhkVzKOV0GbacYAt4tF6/a+6O4oMiuGeGidwSEmWQTCCf0xrctHYuyJMlUsO2DyU9
 24m4SmY2yKPrpCkMl+lgvNUSBPJ6TKJesvGXfHqr2CW3D2UX30jZ0HdQai4LvfaIOMDz
 t0arLVudHN06jkAly50OKaD39Qzgq6ZBpQJEyVDtpYydW+8X2orN+4aosGMySCNbeSZn
 vVMA==
X-Gm-Message-State: AOJu0Ywguf4pKaUB5uN0Syzz4+5ZFiBc/eeURlkKPRrBLljJvOUypT0d
 ZMuRRjgL0dzEG595kg0vhwN0pIxgrqQh+DPRmKpZMvSnkY4GGQVUTbI6dEUq1Q==
X-Gm-Gg: ASbGncspb7oo25ggcu643YDaPKjs/JLARWNH6k993WYuVxYyXwy1Jn4q97b/RonNr/m
 HU31qpMvfgCoaqYOY5eZoQqSA8zRM+8lXg4V+JE9DFNsw6meRSOq9BaQFyWkB4Rk9BjOsJ3tHs0
 LF0vZQGPfDpfjjl3Tvc5Huw528O/PVfdVp4XheFl3v2aYoVNvFsW6SBaddhySpNxRe/i2JgTbgE
 hkzBRVZJdIxpo/FF+/S92cNkelmahWMZ4Zeih27PUgAiXya4lPym12J3WqDP/9argPDBu58/UmP
 rJlG+JEUPeNObDktG3nm5BWOYv6KpGZgWJFgvWewhBRgBWXBYsthdoqiXpZKjc4Ius/XUN/9/AV
 KljNRQ8XVkA==
X-Google-Smtp-Source: AGHT+IEgYGITHZlylaPHrRG5Oivx+VsvHX/aGoi4r80tALhrgKqEoFCd3b4Yn5YrK5MWJKNvFEhDnA==
X-Received: by 2002:a05:6512:3d28:b0:553:268e:5006 with SMTP id
 2adb3069b0e04-5534318ea8bmr1013294e87.55.1748772805904; 
 Sun, 01 Jun 2025 03:13:25 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a0031sm1237404e87.64.2025.06.01.03.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:13:24 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:12:59 +0200
Message-ID: <20250601101305.3198541-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748772806; x=1749377606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5naTyxS497QlhgbCfbVrlvbFHLEpVuucSxLIBQhqZUk=;
 b=Ndu9snIPffoGSmjnRw1GkgifEfw9OqWVwb3U6NTef2CIcOJPlri08Qvb/LCmMel4FB
 QlBiWx7FU/AmbGYrrZd3f1fcUKKu4ND7HdyuOXhnpcNNEHh8lkEB592MFdY+vnnTNfoU
 ljWS6wZyvCDrzzqWKKjX1HrK+9/YGdknkD+i0BzCJeliQ9aKaTHVpgDAriLNdHln+8pw
 pBQDzTIYBYuH2/MG206CRd/tRWwUhcrJkrKYqBrCgwARGgqeaF0Fuz04vqQasmSDEFji
 c5K7k+SgiMF1I+9poM1Q1HkPXLLhTCf3vUoTLbe3v5q9uMfpUYfKpPZs4iLFmq+eHsY2
 92Lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ndu9snIP
Subject: [Buildroot] [PATCH v2 5/6] package/qt6/qt6tools: fix assistant
 build failure
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

Fixes:
<...>/output/build/host-qt6tools-6.8.1/src/assistant/help/qhelpenginecore.cpp:11:10:
fatal error: QtConcurrent/qtconcurrentrun.h: Ingen slik fil eller filkatalog
   11 | #include <QtConcurrent/qtconcurrentrun.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

The above error can be triggered by the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6TOOLS=y
BR2_PACKAGE_QT6TOOLS_ASSISTANT=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in      | 1 +
 package/qt6/qt6tools/Config.in.host | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index f03ddf29a5..f33ee13cee 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_QT6TOOLS
 config BR2_PACKAGE_QT6TOOLS_ASSISTANT
 	bool "assistant"
 	select BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT # qhelpgenerator
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6BASE_GUI
 	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
 	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 0ea214168d..0e2a13d457 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -15,6 +15,7 @@ if BR2_PACKAGE_HOST_QT6TOOLS
 
 config BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT
 	bool "host assistant"
+	select BR2_PACKAGE_HOST_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_HOST_QT6BASE_GUI
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
 	select BR2_PACKAGE_HOST_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
