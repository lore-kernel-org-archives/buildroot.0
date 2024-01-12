Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87223C47077
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FD4D4025A;
	Fri, 12 Jan 2024 00:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FD4D4025A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSZlniI4LxLA; Fri, 12 Jan 2024 00:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 809D742E14;
	Fri, 12 Jan 2024 00:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 809D742E14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE3C81BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F1042DED
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F1042DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krpkyuWwuEHB for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:36 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DBC742DE8
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DBC742DE8
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6d9344f30caso4081316b3a.1
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021055; x=1705625855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDjNKiiFbJUq2JqtaOS9FnZQ+Cn1wxByRZI4q3+oXNk=;
 b=XE39Db+68zB9IUjwhgQBDHlHxIxRebMkqoYprt+6m5+AvL4QoADuqd3FnRwPkx6Q0b
 0Fi/qVQrW+Bel1Ds/CPbThEKL510t8pKCqBjV2M8Fk3nFpCpvzw/MDSEqQrgznG37J5y
 68IICK2Ro+ZJWOdte8ysOcgBGv59nYX6O2VY7M8T4F0fb3cc6SxZJZlQusywBNL+MR2B
 y89o8FiJH5ixkssf4WQUTwMCGZA+OxvOhJLoFYGHXqFfYte7SJRfz3RNzeCaANz7000M
 MM0BV8UX6Cp4tivCJfVeqKhaWowEI1LSXVLagrWKYnFLMgm3qdQ5+qUBnYxWaW0Hb44i
 ysOQ==
X-Gm-Message-State: AOJu0YwewHA5dV9osKuZIZafFU5Ua50JjL8QOaxbzC4Jtf3NEDK+tuOW
 32yWJgZYEoXEQ/5eUkerTSBvqZfnJVtwVlo2r24GhOn5B/U=
X-Google-Smtp-Source: AGHT+IGj8GbyEhq1kW3pEtjtV0yV9CgJ4EwsSzWqwlEdzc+uOesUniD3jarpCFqOazLTbN62A5yg0A==
X-Received: by 2002:a05:6a00:464f:b0:6d9:acb2:29ac with SMTP id
 kp15-20020a056a00464f00b006d9acb229acmr233791pfb.23.1705021054685; 
 Thu, 11 Jan 2024 16:57:34 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:17 -0700
Message-ID: <20240112005719.1082305-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021055; x=1705625855;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDjNKiiFbJUq2JqtaOS9FnZQ+Cn1wxByRZI4q3+oXNk=;
 b=MiO3aUsCYSPArOGj2yVWeLgsyqGvNxfGgdVcmMiaadjF9yRvq0T3IslX2RdFMkAO6S
 KNq3QjCJkB0LqqhcTeayFOlvHymeCPB1qVlinaCI5cTFz+057785heUWTfE4O4Jm0C17
 4jpU0F5FSxQznR0AOJzmSfpeAs1MN9A2Sl2Is=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MiO3aUsC
Subject: [Buildroot] [PATCH 08/10] package/flutter-gallery: add a configure
 step
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
