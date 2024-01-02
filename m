Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2A4C46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE5B840ACD;
	Wed,  3 Jan 2024 00:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE5B840ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdbxRRd9nbWD; Wed,  3 Jan 2024 00:02:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B27CB40A88;
	Wed,  3 Jan 2024 00:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B27CB40A88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD83B1BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B466416CA
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B466416CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-l1rqJg8yd8 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:17 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7318D410A0
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7318D410A0
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-28bcc273833so8130058a91.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240016; x=1704844816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDjNKiiFbJUq2JqtaOS9FnZQ+Cn1wxByRZI4q3+oXNk=;
 b=Dd+9qNuILUG9t/EdUKnnycguD8LzIv3QIdO77FSxXPIdZH3YrMWRjd+6hhhol/3qA3
 SI3DFZuwS4bRbWe7spfF7emeRhUKVtGxRvU7Fo3v9fspzfq+h1O1dogE4QrkD6S7hVHx
 TlVVW2aTFixGiW3sHke9Hy+ScNGy1T+Rlu/QPvadU37jQyb8eQ8pmsVCtzQK53vSWIqA
 WQWn0jM7yQFUgCvJA5SESjSWEodq07XG0Ut8aSSX8J/WbZHzuFIeKNnNvIHg83v8lVdM
 Xk6UDSVzxYSiokfg88IVbyjphLvyboIglGdlB7tA+flRxRn1mxUP0F1TH7D1edaAmaLc
 gHBQ==
X-Gm-Message-State: AOJu0Yw2fqBMD9rEvPQlbp7CqKRRZHbUnswJKayvExZ8DSzJti4pkCJc
 cK9tqtpLELqrqtyNsY+UagkpR4WyWNccGCQnZyKjWFKnXZo=
X-Google-Smtp-Source: AGHT+IFAROEoWFT2FaMEC3mV623pCpf46qC4OnxM+j0dFsDqQq74A7fs8IEipEaGe1/buzDLgILMoA==
X-Received: by 2002:a17:90a:8d13:b0:28c:bc0b:2f24 with SMTP id
 c19-20020a17090a8d1300b0028cbc0b2f24mr2818551pjo.89.1704240016214; 
 Tue, 02 Jan 2024 16:00:16 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:15 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:31 -0700
Message-ID: <20240102235957.3072102-10-adam.duskett@amarulasolutions.com>
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
 bh=oDjNKiiFbJUq2JqtaOS9FnZQ+Cn1wxByRZI4q3+oXNk=;
 b=mBSJtUUvlR51VpFgHQ8GfOW1trYXhC74wnhnM0L/fRW6owWdthh48uAQ3IFeRM83NC
 dYgLeLI+gkcirKuvgsGijQsVwq5AOMGiEt4Y9Ql/Kf4RGz8lT856bNC0VKJviwMZz2lI
 uimEm5tGdG6C5V9Oz6Z5oghl3FYiqek3TJM/E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mBSJtUUv
Subject: [Buildroot] [PATCH v3 09/11] package/flutter-gallery: add a
 configure step
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

To make the next patch easier to understand, add a configure step to the
flutter-gallery.mk file. The `$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle`
command is placed in the configure step because it generates several files
needed for the flutter_gen_snapshot tool to generate the target .so file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-gallery/flutter-gallery.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
index 57a476b1ab..50ddd9ffba 100644
--- a/package/flutter-gallery/flutter-gallery.mk
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -14,12 +14,17 @@ FLUTTER_GALLERY_DEPENDENCIES = \
 
 FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_RUNTIME_MODE)
 
-define FLUTTER_GALLERY_BUILD_CMDS
+define FLUTTER_GALLERY_CONFIGURE_CMDS
 	cd $(@D) && \
 		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
 		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) packages get && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_GALLERY_BUILD_CMDS
+	cd $(@D) && \
+		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) package:gallery/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
