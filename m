Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8F4C46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD53E404DD;
	Wed,  3 Jan 2024 00:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD53E404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hGs57OgVsNY; Wed,  3 Jan 2024 00:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83C4240A96;
	Wed,  3 Jan 2024 00:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83C4240A96
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5381BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAB5B416D8
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB5B416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ksEBEPwmSfR2 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:17 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE1D8416CA
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE1D8416CA
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-28bc870c540so7668784a91.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240016; x=1704844816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FHOSp3dvYRiD+vUlqpssdOjSboJjR9VOy1YMUHr246E=;
 b=V78CZncZ34xLElt0P2T2QYw1Zx0YDjCoYjc/1AmSDZLbCy50IUyb0w5tXfM5dweuRe
 3BOX21BGh7CjeGNrXkyjJiEZW8TfD20jhhb33A8eFyKst5YWaPfP9jIodNeiFOVmCVrx
 TWZWYew1Htl9sZC+LTHe5WgDKT4RzvbTY5vENlCnDzGDfCQdIAhy+XMSDa5nhmWiafI9
 5PJ6KAZUg89oRe5E6XaiSe17NYf7Seh636Uu25TNVvf8cPRJbgq3sZMKcZzwWg5V+pjz
 DVRiEsUMVJmcd97ByH7WyTqwa/2+LPzhkzF/OTOv89qH/52nI6tYLZg/4hbTzVDktHMi
 5DSg==
X-Gm-Message-State: AOJu0Yz7QVr5FOWdfjQfx6r2HJyug7b5mUjNDr/bbEvnylqRbPx6sUhk
 CrtXt/5K/MC5WPqaHewW9iouur3GXT1MZDNpr3P9Wof4F6k=
X-Google-Smtp-Source: AGHT+IHd6L5WDVdNsvEe0tYgpKaS8jH+LDcIvLdhAFDG7hw7VbHJ+pgs4TKFR74acwFdu681oW77Sg==
X-Received: by 2002:a17:90a:d90b:b0:28c:be67:2e88 with SMTP id
 c11-20020a17090ad90b00b0028cbe672e88mr2218719pjv.47.1704240014932; 
 Tue, 02 Jan 2024 16:00:14 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:14 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:30 -0700
Message-ID: <20240102235957.3072102-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704240016; x=1704844816;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FHOSp3dvYRiD+vUlqpssdOjSboJjR9VOy1YMUHr246E=;
 b=FuQVlsy5M4uy3xkyayU1+mWmdtC8GS41uM1/JKV7thcqsZGzrbGeOBrYfTFFUwfYbe
 oExlymeiux6JJJe0LjJ8qOR3ANr7WF28DBEj9iZYLKhrDNVHE7s1RYOZPpegCNjmmYv7
 v4bVMVGj/gDH+GKgJSCLn3BF59dmD0IOFgXzI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FuQVlsy5
Subject: [Buildroot] [PATCH v3 08/11] package/flutter-sdk-bin: add dart
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

Now that profile mode is an option for the flutter-engine package, the logic
in package/flutter-sdk-bin/flutter-sdk-bin.mk is no longer sufficient.

Add an ifeq statement for FLUTTER_ENGINE_RUNTIME_MODE_PROFILE and set the
following logic, borrowed from
https://github.com/meta-flutter/meta-flutter/blob/kirkstone/conf/include/flutter-app.inc#L239

```
HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS = --track-widget-creation
HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = true
```

The FLUTTER_ENGINE_RUNTIME_MODE_PROFILE also sets
HOST_FLUTTER_SDK_BIN_SDK_PRODUCT to false, and the
HOST_FLUTTER_SDK_BIN_SDK_ROOT to
$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk. Which is the
same as Debug mode.

The -Ddart.vm.profile option is no longer hard coded to false and is set to
the value of the HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE variable.

Finally, add the following new variables to HOST_FLUTTER_SDK_BIN_DART_ARGS:
  - HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS
  - HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.mk | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index a28cf645f3..e7fd09cb56 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -55,13 +55,20 @@ define HOST_FLUTTER_SDK_BIN_INSTALL_CMDS
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
@@ -73,8 +80,10 @@ HOST_FLUTTER_SDK_BIN_DART_ARGS = \
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
