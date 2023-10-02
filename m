Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4976DE784B6
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 14:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36126125D;
	Mon,  2 Oct 2023 14:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F36126125D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfxVv6vNKL38; Mon,  2 Oct 2023 14:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E146612AB;
	Mon,  2 Oct 2023 14:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E146612AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3006B1BF947
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 175116109C
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 175116109C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCC4iyfM25Rx for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 14:31:31 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A549260F8F
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 14:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A549260F8F
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so19363775a12.1
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 07:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696257088; x=1696861888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0VZNS2o4t6O/IxAVV4Y74qPTKfsRrnLAasLxngk3AE=;
 b=lhqjWTq3NJ/P9dd6mtTu6u9M6dyIYXwzCxUcuEz5d9gbDkD8Q2rlA/kAwCnj9tQeDH
 2QkLaX2aL5I4V9WalZUUXqOm/ZiOFS0bADyp8IEV0THTLAQztHNoWDOmIT5YCa/QEY86
 ftRhCO3VUhCpRiK+HvvNeCbM2bb7LyMfck2SW45+h0jgvtTvDT6LV00UJy1a6nqRXWOk
 0+ltB1+SWcS48Nvs5fBuQq33B6brpY9c9VMaA2UMDwksEyxNB1DbfXu3TzqujXzBWNUm
 CJFgesNQ6eCY/0OwtaUgjzyoP959An0MjcaX7E9ecqOA5yfSCOAq0S97yZ9wa0ijZByQ
 mFbw==
X-Gm-Message-State: AOJu0YyV5IxoRhhZgl8nsMG0tj7UF7ZS8gizKXniAOGUmubnZMnKvbwd
 JQpCpdT89Xs8if3QQK7M59gzHLR+Rb4xFEcBuUPv+4Mn
X-Google-Smtp-Source: AGHT+IFdxHjGhAfy7MYKkmZtCfENiaf+J9m5QURnCi0tPsNkWY7PA538+D5NP0VwFj0H75Bf2ZtzcQ==
X-Received: by 2002:a17:906:209e:b0:9a5:874a:9745 with SMTP id
 30-20020a170906209e00b009a5874a9745mr12541123ejq.26.1696257088161; 
 Mon, 02 Oct 2023 07:31:28 -0700 (PDT)
Received: from fedora.. (146-241-223-149.dyn.eolo.it. [146.241.223.149])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b009a1c05bd672sm16917735ejd.127.2023.10.02.07.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 07:31:27 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 08:31:22 -0600
Message-ID: <20231002143122.257820-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002143122.257820-1-adam.duskett@amarulasolutions.com>
References: <20231002143122.257820-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696257088; x=1696861888;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0VZNS2o4t6O/IxAVV4Y74qPTKfsRrnLAasLxngk3AE=;
 b=L/RhkrEGFOGpzDLlZ/mrBysg/Q+3V821Axnh8jBtAAocDEHloI+ULHHFWo8MZXEfVS
 SAEyo68snbiCAh7KjYv416BJDtP+dALjBnvPsTLJ6pTUvFZUeB01sJekwSqAf+LOICPp
 +VYEm0pvozPzfYutaqiIy6ge12yZ1WMgZMCk8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=L/RhkrEG
Subject: [Buildroot] [PATCH 4/4] package/flutter-pi: enable vulkan support
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/flutter-pi.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index dc825c95a2..d297ada747 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -24,7 +24,6 @@ FLUTTER_PI_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_TSAN=OFF \
 	-DENABLE_UBSAN=OFF \
-	-DENABLE_VULKAN=OFF \
 	-DFILESYSTEM_LAYOUT=meta-flutter \
 	-DLINT_EGL_HEADERS=OFF \
 	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
@@ -82,4 +81,11 @@ else
 FLUTTER_PI_CONF_OPTS += -DENABLE_SESSION_SWITCHING=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_VULKAN_LOADER),y)
+FLUTTER_PI_DEPENDENCIES += vulkan-loader
+FLUTTER_PI_CONF_OPTS += -DENABLE_VULKAN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DENABLE_VULKAN=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
