Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28615C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D214E41960;
	Mon, 18 Dec 2023 18:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D214E41960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id paqUuVot_Chb; Mon, 18 Dec 2023 18:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0CA4190E;
	Mon, 18 Dec 2023 18:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D0CA4190E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB871BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20C4482236
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C4482236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93X8zWdECik6 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:52 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F65982202
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F65982202
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-28b82dc11e6so654252a91.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925691; x=1703530491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhMtMbKtunL7uxzaCysZ4z8ZGiBBd9k5XjRX8i/Tw40=;
 b=jscZtKwptEqhzC8q/TWTEE9tRgFzZabHc06Hhilc88QyLHCr/tm3kEgWcQasH/P+s8
 wrDxist9LaGJ3s5C5YSaWDKQaRb03j0U9r60KGyX7bzyvh9sLQEhR3RGCkAKvrnJN96v
 EiJw1e26UPO4g3BGuGbShWEc/6PzW4O/6zoAyWdnhsNOS8znIxEQwrglS3h7GCeu0YDr
 J7jXMj3Y0bQ+EHOtRWqob3QZpxRrYgyydpSdsdHuDNkKMR+3yKPW3m/3So/Zun5dd55n
 KtKI55Jl3leXhMOUEN2PIjLgOQ4cGCogYqUwwz9epbexB9/RCqmcU5Ufaj8hPDRk3OZW
 O7SQ==
X-Gm-Message-State: AOJu0YwjcyXW3yYe/qJXl9lqs4oHyHWRfvaC3TkV4HkW30qkskf3JxzP
 tsb3lG1ae0bYwfCdhjNmXgNzb5CcegBwBVR+WxE=
X-Google-Smtp-Source: AGHT+IGOsFqftpnMSVsXEmrLJyEf1ExEs8KdMKeylz1ohxAIWPNe+BwIIKjMhMTGFtrzNfcYjPMNmw==
X-Received: by 2002:a17:90b:ed1:b0:28b:68fa:f460 with SMTP id
 gz17-20020a17090b0ed100b0028b68faf460mr1169774pjb.6.1702925691046; 
 Mon, 18 Dec 2023 10:54:51 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:50 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:34 -0700
Message-ID: <20231218185440.506995-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925691; x=1703530491;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhMtMbKtunL7uxzaCysZ4z8ZGiBBd9k5XjRX8i/Tw40=;
 b=Zo7jhZyWJ+ZsacWRmBH/f9BZWK+J6p8YxG2CI1Y5gMFbMU/CRahXj1v3DRyCh3cO/V
 DcnjL0FYrEUWxh2i3uUzRapsVuY1UZ2amDORls+BpALevrXtTKk9UW71LDLYPXBzPqNj
 buVpOe/TzH1/umYfyfJ4YIIhj1yhAF62im898=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Zo7jhZyW
Subject: [Buildroot] [PATCH v2 08/13] package/flutter-sdk-bin: add dart
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
index e1292c154c..0c33d25089 100644
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
