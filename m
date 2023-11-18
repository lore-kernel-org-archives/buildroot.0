Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFA5C197A0
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 01:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC3942D56;
	Sat, 18 Nov 2023 01:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BC3942D56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GdTJUChdREL; Sat, 18 Nov 2023 01:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BDE841BE0;
	Sat, 18 Nov 2023 01:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDE841BE0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E08381BF329
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B951141778
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B951141778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YZ1Q1OPkdDi for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 01:55:11 +0000 (UTC)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09048415C8
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 01:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09048415C8
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-589d412e8aeso1381538eaf.3
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 17:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700272509; x=1700877309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rV6FB0lwN9RBAHufl7z60DE22BXdJU77Oimr24/SfP0=;
 b=FvD7O8VKXSDYM8JSMGLNam3KwVW7ad1fyE2XkpZsDLpMYN+hw3lT36LNuZVDRF8ZbL
 b8xaGBVg736VFhGX3M1Ikj67kElOeJGkDEmjd3bORoDzQ+6g+xyQoG7crJquzWqNqUMU
 3UtTr4b32xDvlIbKZLZKXG/Yk+NW65czhWMxmOb5SjqR0klVXJ4DcJuY1EhsKJUBck/m
 TuAm8qunaWBYquNiUM5QVJFbvCzO84wrRYFtxRmtpWRtkNi3p82j6wKl48M8Q8mGnTDS
 bRK85TAUySF1roVV+GFMXtP0h9XsM7BOtqXeBAnGaj4T5MYieUgjgDRbax4bwcuaQjpz
 /0hQ==
X-Gm-Message-State: AOJu0YyOPnJA5ZmqYFVHqDTgczLFl6Sgx+hUaXeUiRHM/uZV7JxxYbb/
 sy9UshcobVb+IEAU7NLDQalIVAm/C+mRAE+SOG9RfQ==
X-Google-Smtp-Source: AGHT+IEnw+zHe2VUaeGjYtiRdrzrMOsVxW1sZoE3Yre9I1sXGFu8tQw06LiItH2J5QNuF0Pm5IlgPw==
X-Received: by 2002:a05:6358:788:b0:169:987b:168e with SMTP id
 n8-20020a056358078800b00169987b168emr1322186rwj.29.1700272509152; 
 Fri, 17 Nov 2023 17:55:09 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a63e64e000000b005bd3d6e270dsm2025704pgj.68.2023.11.17.17.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 17:55:08 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 18:54:52 -0700
Message-ID: <20231118015456.2629144-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
References: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700272509; x=1700877309;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rV6FB0lwN9RBAHufl7z60DE22BXdJU77Oimr24/SfP0=;
 b=CsOzJ77CfRJ+HB5z08Df+ZnV8t0RZBz6tWc2NgM6DYSrTr9WNJ6Qr4OP+CQnC9DNsY
 /Kd9xoww4eBJ6OJuSQITtn4ICal4E5p/Yz8IM5BjrNK8B+2gFMPbhPExxRfvixs1L8Rm
 b/bp7FtvCDNRdFS7W/DVGLg4fNDMDl1S8x8M4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CsOzJ77C
Subject: [Buildroot] [PATCH/next 4/7] package/flutter-sdk-bin: use
 flutter-engine runtime modes for dart
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

Now that we have a debug, profile, and release modes for flutter-engine, it is
possible to add specific arguments for each mode to pass along to dart when
building applications.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.mk | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index e8e71b6ab0..e3025e283d 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -54,14 +54,21 @@ define HOST_FLUTTER_SDK_BIN_INSTALL_CMDS
 	cp -rpdT $(@D)/. $(HOST_FLUTTER_SDK_BIN_SDK)/
 endef
 
-ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
-HOST_FLUTTER_SDK_BIN_SDK_ROOT = \
-	$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
+ifeq ($(FLUTTER_ENGINE_RUNTIME_MODE_DEBUG),y)
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
