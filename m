Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4B4C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39DD441846;
	Mon, 18 Dec 2023 18:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39DD441846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZuYVSkBLJkWR; Mon, 18 Dec 2023 18:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 750E641960;
	Mon, 18 Dec 2023 18:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 750E641960
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6380C1BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C59D60AE8
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C59D60AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vk3C003gKE5O for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:53 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8665F60AC2
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8665F60AC2
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-28b7a0d1665so727810a91.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925692; x=1703530492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qxFN7LCqOjhpr8iEIh+38ehCyayv8ydwXMHJh7JmMgY=;
 b=K+Tx9yDDy0aUonxpw3Rl6Iwuwy/Vg2mkojBXzGMBXIAc4XH4yfqaPKtlBpi1YwHyOB
 qUe+7+LLt34tVQ1t8zli9IHCh6kpTjDGX/aQIq91B0jsgLFS0ELskjKvfArGmHtr4ZLD
 eJ4kXVbeAs3ULVRf/TVPsPBmreQz61JNtQfpDeCrLqWGe9Xe1m+JMS1vqsoQAd/l4l+9
 GWsTzpsCtt63GWTcNdKfjudD+/F74Q9lTaAWc5eCZAxXoQuL2RxlezMOR4VzdQLDTFpp
 t+MiW/FNu27Cu9nEBDCZfYevH5mpYYedNheD1RE8S0FcGaGyzE2T+Dis8BX6M1Gy7F3v
 4ztg==
X-Gm-Message-State: AOJu0YwrXWLY8sb7dkplqFcPIzSoTEu+V3h6WAd/bCBZC6HcL1ZZiy6/
 MJUg90W0GsPNkn53gL0/4dS7g2Jdq9eyLkP8tHY=
X-Google-Smtp-Source: AGHT+IFXKCTMBpHJ8zbXYQBWZWxaSg3zhGtYnlI8+eC20SyrPxEp+NrMWUJrKNtxAxlNlLsDMlMTcA==
X-Received: by 2002:a17:90a:b290:b0:28b:249d:64e6 with SMTP id
 c16-20020a17090ab29000b0028b249d64e6mr2545874pjr.84.1702925692376; 
 Mon, 18 Dec 2023 10:54:52 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:51 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:35 -0700
Message-ID: <20231218185440.506995-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925692; x=1703530492;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxFN7LCqOjhpr8iEIh+38ehCyayv8ydwXMHJh7JmMgY=;
 b=h6Kt4AlN33HJLivTEeG9NPrnGcfVZG5apovb2p/I+1d2rDF4h4v5VJOJwlAEQsSyHV
 2+Lrihunj+yQubNW0DC5k/FuKhP4TpMbMR4lwCv8FEUKjLV6RwwxPBaaUIy46MkRq4vd
 ygSxzTTA+4Cue/nXqmxYbldRflHKxZqoh4mC0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=h6Kt4AlN
Subject: [Buildroot] [PATCH v2 09/13] package/flutter-gallery: add a
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
