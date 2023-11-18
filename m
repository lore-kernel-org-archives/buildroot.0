Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8848FC072A2
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 01:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F30842D5E;
	Sat, 18 Nov 2023 01:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F30842D5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtYbE7XqCwWK; Sat, 18 Nov 2023 01:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DAC742D42;
	Sat, 18 Nov 2023 01:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DAC742D42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6F561BF329
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABB8B41696
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABB8B41696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbLTZf_wTYhv for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 01:55:12 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE8F940168
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 01:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE8F940168
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3b2e73a17a0so1656778b6e.3
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 17:55:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700272511; x=1700877311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l3rT5J68+Zx6UwLr2ix4QRacREHnq8/6za/SG5d0xX4=;
 b=gUDnDlrTQLqQzLRywy47ywzi8XfoiYZsxe3nfavV1BEj9nhHtjes4A5e4i9cuJxTrL
 Zwt4WQGdTqSHrfTJ9wSjdb6cC5KbA/lz2+k0RNJt8/c5BxD17MOUXrnBP0xuDYQnYYuq
 5R2s2JI+JgwlARgH6+046abtW5jIOnBFzYt3bmvgnM1fE1zmtMcLHYV1wow27e9u8M/v
 DkU/7fHxtvtl/w05y6Bsp8ICX1F3330p+QUL0KDPRLvpL6aPxW/CZFhxymZiTzf4W97u
 P4lyMTjZZTDS2mmTs6iqHyDiLhkKcNWMSX7dZQCfWpHSiIvJ4fODnwyuGDLWq3mcdIvo
 MavA==
X-Gm-Message-State: AOJu0YwAl9tOUN/gVa8T8x05g9TGBYbcoLb+eGHdEXlkV//WP2JmZkKJ
 a6u7PZORZ6yn+AG6bz9y/NWTDsfs0qidMjnaGJ0jcg==
X-Google-Smtp-Source: AGHT+IENInAI/MFGwQiU1vNnoN1cMl9kNqqXNe6wPHPL49ZzmxNvVsAurchW2k3Q5U4SiokthJRdNQ==
X-Received: by 2002:a05:6808:2009:b0:3b6:ddd7:b19b with SMTP id
 q9-20020a056808200900b003b6ddd7b19bmr1620687oiw.15.1700272510932; 
 Fri, 17 Nov 2023 17:55:10 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a63e64e000000b005bd3d6e270dsm2025704pgj.68.2023.11.17.17.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 17:55:10 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 18:54:53 -0700
Message-ID: <20231118015456.2629144-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
References: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700272511; x=1700877311;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3rT5J68+Zx6UwLr2ix4QRacREHnq8/6za/SG5d0xX4=;
 b=b0T8DvDd/rTPNaezrLCyJ8RIQ9W6dl2TRFapBLNaCYcjmILeK1awQmROVSKkx+ihrD
 1Dyt+Gg5if2sRHtZuI69HO2dbLkm3FRf5fg3qrTPtLgf4ffC1E7JDOOLegGnhzhRZ1h/
 hV/3AZtpl83mjb7/5Dl/c7uIg67ID7jqVBYTY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=b0T8DvDd
Subject: [Buildroot] [PATCH/next 5/7] package/flutter-gallery: add a
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

To clarify the next patch, add a configure step to flutter-gallery.mk.
The `$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle` is in the configure step
because it generates several files needed for the flutter_gen_snapshot tool
to generate the target .so file.

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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
