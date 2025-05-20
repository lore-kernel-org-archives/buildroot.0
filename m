Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7598BC3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4232F81CE1;
	Tue, 20 May 2025 11:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3B18ah26DpyS; Tue, 20 May 2025 11:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A52C581B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A52C581B04;
	Tue, 20 May 2025 11:34:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95625D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86FC1400C8
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAuuLIWQ32Sa for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:34:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51CBB400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51CBB400D6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51CBB400D6
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:34:06 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54298ec925bso8378003e87.3
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740844; x=1748345644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+uBvZzHwNYTNGm5MmkNG2DaPFRVM4Pk5VeXlpwPksg=;
 b=kA5e1SaNjCm1mhSqj9YVO0kFEn8lmwCK2oYvjI+uNfq1XhXdXYe6NPfjkrw3XLWzr6
 Wtu5DqEBUY+s9V7vos0eyTqVrjq18LYFPUZalf0ZbGgHY58CefqLXGjbtO9mnGNVKcLO
 OvcdMQqVdpHh4VMhfHr4yQv+GvpMsox3jQcTO1Ss0hh2tynt8eopmEhS78yqwMhZADHS
 et2PpuUpI+bfeDzxsjGgUtVQMeFFH7ZPDL5IfhL1P6uAhJ4lRwVysYnjT2YLGJmnz3zC
 Dwv/NfeMeJZBio9Lu5JZ6JNC9KntCxrE7tWO+O0yfbqbeRYC2CoLO+ZMkurXagBd58mq
 xb1w==
X-Gm-Message-State: AOJu0YynDFqA/Oyk+duiLU9oSo6BZ9qCBaVFXr4XOiaJSfRry9BVPU5a
 YRre24VIyIKssPJM9FLV3vStA/rWYTfpun8Mhd1AG8e9i+YhLntX/LjJarf7fA==
X-Gm-Gg: ASbGnctZZ1CsWwl+mDH5XWjSBFCN6Ra9mS4xwyBkw+gx/wCuhAg1AzagSyQT67aEmRG
 rUzvHoLtMf+KQexzH8V5ZYUcmK7Y+PD3Q9jwqJZnBnIQV+3yB97Hdz43eWuA2DQP4uvwqDAsvHJ
 E2PusNgCCLXSuQ3ex2ERYCEFoFYMGdhSipZnK0gmA/ilSuw6dt6iaeKQEK4sbC69/IuFXue4Oh3
 /9cYO7QKRC54Wd+3ckhdpCOTiM89I7nczxQoCgZQN+xOabU8SE42hallqL01QRlINoJox8jHFIW
 aogClvqa/8bKt1qUDStokaWeAZ3/CDJ4Ktt8jwlreXidWxuI+yogtuglxZndvZ32vDQS0ogaxDv
 vbnztwA==
X-Google-Smtp-Source: AGHT+IHuCPGNreiOqGTQBAc7qIsl8cfF1sJAGnosfd++sYEGcCWk7RjBLtlEQSfC6wAEKhpgILbKrA==
X-Received: by 2002:a05:6512:22c8:b0:551:f797:ffec with SMTP id
 2adb3069b0e04-551f7980031mr1731534e87.42.1747740843891; 
 Tue, 20 May 2025 04:34:03 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:34:02 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:30 +0200
Message-ID: <20250520113339.2525537-12-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740844; x=1748345644; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+uBvZzHwNYTNGm5MmkNG2DaPFRVM4Pk5VeXlpwPksg=;
 b=M8avmeie3YFpk/Qdza6SyM54YZYcz/nRuEg7GfCdocSekDFiQFGdHkZkCsYnxkRdfw
 GKAin/e+LHhsIks7hUaIzO336QAzvrjfPbPlhXgpKrnv/AbfDeI4if2X7fdXu7V7xVfL
 W3/I8+I/48vXow/nSpI6hughueIMq0ike0PG6e3Oie2ai7EygJdQ8jZDXcEsqrk5irxF
 qIY9S0tLj4tJrknzVBYgjEbhldmHsAnb2N3NgynN8qe/FtiBzwtZFhzOagyDmectpIu8
 TN7NhQBZo7fX31wShDSZ4qyjx1yuPwWdlKOsQ+Pn9ZYEt5/51gTEoUdrQpcXFatE2BDp
 3fEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M8avmeie
Subject: [Buildroot] [PATCH v3 11/12] package/qt6/qt6tools: fix assistant
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
<...>/output/build/qt6tools-6.9.0/src/assistant/help/qhelpenginecore.cpp:11:10:
fatal error: QtConcurrent/qtconcurrentrun.h: No such file or directory
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
index cc0c507b86..f03990d9f5 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_QT6TOOLS
 config BR2_PACKAGE_QT6TOOLS_ASSISTANT
 	bool "assistant"
 	select BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT # qhelpgenerator
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6BASE_GUI
 	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
 	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 6517d3f1ef..17afafc9a9 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -15,6 +15,7 @@ if BR2_PACKAGE_HOST_QT6TOOLS
 
 config BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT
 	bool "host assistant"
+	select BR2_PACKAGE_HOST_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_HOST_QT6BASE_GUI
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
 	select BR2_PACKAGE_HOST_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
