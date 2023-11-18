Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAB2C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 22:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E3C60ABD;
	Sat, 18 Nov 2023 22:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35E3C60ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjz8ufpnVTlF; Sat, 18 Nov 2023 22:14:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B57260A65;
	Sat, 18 Nov 2023 22:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B57260A65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 222161BF354
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFA0E82078
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA0E82078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1-GVfYPn9cx for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 22:14:25 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6CEE82073
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 22:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6CEE82073
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6b709048f32so2817954b3a.0
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700345664; x=1700950464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XT50srVCG0iUEEm6jh0FYmUfC5sM6mE6bk3+UjaWjYc=;
 b=THf9CwBTq96Hkvt5HM/QyAUIbyhvZOJ6Cae28NSMj24LKYy7Nag/JwKcaEyerOLIrz
 tbDZOUkSVHHnv2JfDWglUVB/FKoCotpKy/tHkQC6IyGxHwmdRMCb/8cnieS8kRDPjYiS
 CI1NOmOu1jIT7JOdIvdqk5F+GP2JPu4LfTgvFl/WL0ZI3ssKPNkVQqDmFiHYTc6zlaFA
 6kSS3APSRVUTR1bjiGAHhcmYiTiehVOC1jpRUIPqBVAyAiwQOH9gucQsvhHF5qXNR+UF
 1WbojSjrli5tNfLUNY9vd0iSAYjrf5gBCaOsHYQhgF9zR7SwmSNV74MapEjxwrsBRpy1
 vB3g==
X-Gm-Message-State: AOJu0YxaNXlpwQR5yW3QvMQc37dnp1dFXvk11/XMKrwnWcHmuuR8ued5
 ADtCEMzPXqm3myt3upkX7NPmBcwvJZbugofUjqVIsg==
X-Google-Smtp-Source: AGHT+IFeWozn4+PlDFGPXwqrQ5PeCQSwdYMCspolx3/rqIJvWXgK/zpJnlEek4LNMWGynSqLs4QJhQ==
X-Received: by 2002:a05:6a21:33a6:b0:16b:80f2:f30c with SMTP id
 yy38-20020a056a2133a600b0016b80f2f30cmr2787858pzb.26.1700345664418; 
 Sat, 18 Nov 2023 14:14:24 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a170902ea8600b001cc20dd8825sm3403361plb.213.2023.11.18.14.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 14:14:24 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:14:11 -0700
Message-ID: <20231118221414.1369987-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700345664; x=1700950464;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XT50srVCG0iUEEm6jh0FYmUfC5sM6mE6bk3+UjaWjYc=;
 b=k+dk33Ubnwdv58Jis+ftDcpgZImZZYyP6sczY0e3dgSPyVVykNgDLNmH3N9rta0p3n
 Fpl/vuMPiC2Uyt3GcDWR1GYSCVpe6MDIwGuY3jQljZNWOSpdsuQ0Fad96DEkzBfYkv2C
 qYoH/PWn+k3Wi32+//0TsvnJZJFIFZWXyu9pQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=k+dk33Ub
Subject: [Buildroot] [PATCH/next v2 6/9] package/flutter-sdk-bin: add dart
 arguments for different runtime modes
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

Now that we have a profile mode for flutter-engine, add debug, profile, and
release dart arguments when building a Flutter application.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.mk | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 6471c11d4e..821dffa7c3 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -54,13 +54,20 @@ define HOST_FLUTTER_SDK_BIN_INSTALL_CMDS
 endef
 
 ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
-HOST_FLUTTER_SDK_BIN_SDK_ROOT = \
-	$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
+HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS = --enable-asserts
 HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = false
+HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
+else ifeq ($(FLUTTER_ENGINE_RUNTIME_MODE_PROFILE),y)
+HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS = --track-widget-creation
+HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = false
+HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
+HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = true
 else
-HOST_FLUTTER_SDK_BIN_SDK_ROOT = \
-	$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk_product
+HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS =
+HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS =
 HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = true
+HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk_product
+HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = false
 endif
 
 # The Order matters.Taken from:
@@ -72,8 +79,10 @@ HOST_FLUTTER_SDK_BIN_DART_ARGS = \
 	--sdk-root $(HOST_FLUTTER_SDK_BIN_SDK_ROOT) \
 	--target=flutter \
 	--no-print-incremental-dependencies \
-	-Ddart.vm.profile=false \
+	-Ddart.vm.profile=$(HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE) \
 	-Ddart.vm.product=$(HOST_FLUTTER_SDK_BIN_SDK_PRODUCT) \
+	$(HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS) \
+	$(HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS) \
 	--aot \
 	--tfa \
 	--target-os linux \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
