Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6B4C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477E360F01;
	Sat, 13 Jan 2024 20:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 477E360F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gc5QZf4TwGcv; Sat, 13 Jan 2024 20:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 917CA60EE9;
	Sat, 13 Jan 2024 20:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 917CA60EE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3E271BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CF33408F1
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CF33408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2VnbcyGopkm for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:35 +0000 (UTC)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B5A5402FE
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B5A5402FE
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3bbd6e3795eso6114986b6e.2
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177233; x=1705782033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDjNKiiFbJUq2JqtaOS9FnZQ+Cn1wxByRZI4q3+oXNk=;
 b=eSwjmQs5/XCjaUfFDIxDugZPhDa4NgPN+E2n/+ugWE9NsA7XVjmqpp8UAjVe3fk48H
 OLbzPhaS0lP2jeL6kfb5gUW2CDvOVkq6gTHtWkF4yKkmPXq0Ud/TyRFuOAFaa0BSm/oK
 U1151i0IPXXfpz5qec8ZD0tUxZUDOpQ+Crwnd0PcIG4XKR2+IJrd26E+3JVyrh0f0zT2
 J9NqY/ZER2949lBpoHyZ6TQ5ueGZcyWpe5EiigyF0+OBjDYBRQfWW+1Pq8WQ5d03O1S+
 6saGq7kPvh4WtaBwcZcieK1d/FoipthaNIKTRf68NiwM2CCD7XDoqrAgN5/wOPdsR49n
 HwLg==
X-Gm-Message-State: AOJu0Yzd876/unnFu29D0qlQ1PwMQ4L+0f7ArTU++i06lSXrx+aYkMKC
 gJkuwaIVIRHxEi7to7xZ3b3Qg3+4Mu8cnMNvj0zEoHGvB4k=
X-Google-Smtp-Source: AGHT+IEjq5H3Egmg8aDw00pc8LJ87diYki/kuSyud/Kr3oLPqcP64mzmsXN8ib3TtVYEQIxc5t/BVw==
X-Received: by 2002:a05:6808:114b:b0:3bb:c6ff:4513 with SMTP id
 u11-20020a056808114b00b003bbc6ff4513mr3544445oiu.98.1705177233362; 
 Sat, 13 Jan 2024 12:20:33 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:18 -0700
Message-ID: <20240113202020.21747-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177233; x=1705782033;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDjNKiiFbJUq2JqtaOS9FnZQ+Cn1wxByRZI4q3+oXNk=;
 b=XMhpYml6MlQCYyKzqWZIdOz9BiL666fFN+cJ1nzDWzitXTcwYnhrPEtfmXS5lRb/WP
 yB4VxdHQP3L5rslaA9N4Q2SgKUaHeKBlHEyzkQ1d1vWm2vSixY3HMhj6FF1dyzySzJ/L
 qptbXk6ygYiD+HBippFbrh4/uAIKD54PLrkII=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XMhpYml6
Subject: [Buildroot] [PATCH v2 08/10] package/flutter-gallery: add a
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
