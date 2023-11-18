Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4138C54E76
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 22:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAD1D60ABD;
	Sat, 18 Nov 2023 22:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD1D60ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3qFCcQ-0kaV; Sat, 18 Nov 2023 22:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 306D760E72;
	Sat, 18 Nov 2023 22:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 306D760E72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCF101BF354
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A18AA40129
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A18AA40129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRPd-xAYHeEh for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 22:12:13 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7193D40106
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 22:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7193D40106
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6b709048d8eso2876797b3a.2
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700345532; x=1700950332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2I97mIMWiPHOMEcp17eiVOdyEODlEXcaN4Er62fGokE=;
 b=t+K8mPsjT0S9CLM+6K0aN2g6VtM4kBIos32RghnT/noajAvjEo5SQaLuzg33HzvzuZ
 IjsV3dxURtkDa0VfHBS/PiwOkM/6OklseB8efHwg3v0Zf8/Yn1WeGgUtY+ykahDPKN79
 lCceBsUs14BK8t1L2eRu3d+/avYNwK1XMWRdRRvjp4YKJOD/HeMjcaFVhnRjznyFwLug
 TRgOyKGGQf7snboDKE0Ye76I63DUos7RZp0PBrE8C4TAD4c7jVTAMpUSdQA6ewoT7yyB
 4m/NHs+8MXpFEQ6y84CYDG1PuGQ/onbIAmSvzsqn4fc0nIQOdIoTfT4I2OXJGSEM0rPa
 8VdA==
X-Gm-Message-State: AOJu0Yw690s6A2N2bWViWINVuCNsFWRno/PTz4OmejmK1ILfARN7Mn+o
 AiHF00PoL1Tbo1Ln1HoacLCG1REPbpG/oqALPIOuEw==
X-Google-Smtp-Source: AGHT+IEm6HJjoe1GlCi1t2Sp/dJRR/qVXWHUJM2yS1x14Iv6ajrIUn7vvQmHtE/t0LhyjVRxkV00yQ==
X-Received: by 2002:a05:6a21:3294:b0:188:2637:9245 with SMTP id
 yt20-20020a056a21329400b0018826379245mr2786439pzb.55.1700345531814; 
 Sat, 18 Nov 2023 14:12:11 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 jw19-20020a170903279300b001b9da42cd7dsm3423699plb.279.2023.11.18.14.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 14:12:11 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:11:58 -0700
Message-ID: <20231118221206.1369389-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
References: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700345532; x=1700950332;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2I97mIMWiPHOMEcp17eiVOdyEODlEXcaN4Er62fGokE=;
 b=ny5n9jG0XQJpsl4FK4oBXtvRh2TXBwb2+XGEWVYBpi/eNAui3ApHJOcX6NzFy3BLqY
 +1PQ2TCr6XKvPlt5TIQ8p3g6b+2XmG5IdJETgJ3b2X5XmTWHfHlsWeYHSQlHg2AU15sa
 7P2/qACww9dUbaV+Rz8Gu8pIZoxKr3XmotDOI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ny5n9jG0
Subject: [Buildroot] [PATCH/next v2 2/9] package/flutter-sdk-bin: bump
 version to 3.16.0
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--no-analytics and --disable-telemetry have been combined into
--disable-analytics

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index a204de1807..b5e8f38dae 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6bc6f93423488c67110e0fe56523cd2260f3a4c379ed015cd1c7fab66362739  flutter_linux_3.13.9-stable.tar.xz
+sha256  5f36e985500ea66e6076d47defc294e4c856f2d9545ef6582af05294687b942c  flutter_linux_3.16.0-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index e8e71b6ab0..9461148dfb 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.13.9
+FLUTTER_SDK_BIN_VERSION = 3.16.0
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
@@ -24,8 +24,7 @@ HOST_FLUTTER_SDK_BIN_ENV = \
 # The following config options must be ran one at a time.
 HOST_FLUTTER_SDK_BIN_CONF_OPTS = \
 	--clear-features \
-	--no-analytics \
-	--disable-telemetry \
+	--disable-analytics \
 	--enable-custom-devices \
 	--enable-linux-desktop \
 	--no-enable-android \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
