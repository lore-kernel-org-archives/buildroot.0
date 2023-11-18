Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7DCC54E76
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 22:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36EF60A5B;
	Sat, 18 Nov 2023 22:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36EF60A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYRfV_wQYFKw; Sat, 18 Nov 2023 22:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E15560E6D;
	Sat, 18 Nov 2023 22:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E15560E6D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 471AE1BF354
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E6F9401B1
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E6F9401B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDreUWxYcvzL for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 22:14:27 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41CD940129
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 22:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41CD940129
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-280165bba25so2350776a91.2
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700345666; x=1700950466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l3rT5J68+Zx6UwLr2ix4QRacREHnq8/6za/SG5d0xX4=;
 b=Ahy5ZwHYbLLg6e5nnTpSW6UdQbyUcmoyakiVXRKZKk/q+jFU9DeRH/Bz0K4QQPsQSJ
 zB1W+YUL9anYllzl3I6M/g0Zb1uk70fjGpHPk6sTUo2N6AVmkLrroG7esrLPTrvM6H9b
 kkWmua69toPJxIUnIT630aom2gKTV7OgS4C2Ht/XDlOBJwOTFMkC0ZsfDccs1YDSMFRD
 VA7TEy1LEZwwfDyWCP/5VDTssdwM+tjJ1XY7xCA1zJmOx8DkdAyYdcVHodX63Z0nCh+c
 hdngDthfOvPc+bF+GMxqBGpnZIdaiYFTDNJUKrMNc3mXiezR5NHt9edfr5MEOVuofTaF
 f01w==
X-Gm-Message-State: AOJu0YzOOHTiCrIovOQD6CVR77ydlZP3cmqmKWwRpmev3afq5XXQEWC1
 iaO82Equj8xWfNLv652WjyJIsFAzf+uDEZWjljQsVA==
X-Google-Smtp-Source: AGHT+IGWEj7H++GHUZyq1zb8i5+sc7YiYQtRMOoQNGdG0s3w39aNR2oc993iLTqtXtUyMBHs/auHmg==
X-Received: by 2002:a17:902:8646:b0:1cc:32b7:e5b9 with SMTP id
 y6-20020a170902864600b001cc32b7e5b9mr2464517plt.67.1700345665792; 
 Sat, 18 Nov 2023 14:14:25 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a170902ea8600b001cc20dd8825sm3403361plb.213.2023.11.18.14.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 14:14:25 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:14:12 -0700
Message-ID: <20231118221414.1369987-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118221414.1369987-1-adam.duskett@amarulasolutions.com>
References: <20231118221414.1369987-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700345666; x=1700950466;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3rT5J68+Zx6UwLr2ix4QRacREHnq8/6za/SG5d0xX4=;
 b=ou+vaiXfdzElaAjLDFA+ZwixTHRsM+scu/VI6t9tbTlQDYldsQeNplk1zA+QzXJWTM
 YAnjO/BVA7gPZDmQNMKGQEDF78+mavh1KmxWiLB/bLkV8PfKs6/Sc/gpZxwvNZeu1y8g
 jIThgYKxFkDnfi26tpfSyJWEo+1Vmze07SW6Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ou+vaiXf
Subject: [Buildroot] [PATCH/next v2 7/9] package/flutter-gallery: add a
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
