Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559A8C072A2
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 16:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0BD441EF5;
	Fri, 17 Nov 2023 16:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0BD441EF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGhFlHVWtn2O; Fri, 17 Nov 2023 16:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27AA641E45;
	Fri, 17 Nov 2023 16:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27AA641E45
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71A0A1BF31D
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 16:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A1CB41E45
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 16:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A1CB41E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZ5S_lSVzsKj for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 16:33:53 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2133141DBD
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 16:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2133141DBD
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6b20577ef7bso2002495b3a.3
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 08:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700238832; x=1700843632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IFKHR0/QLYBkByjL8T5GGG+j9mCQiBgFqZXHoXnKlWg=;
 b=vs16ZzIp9sqzKOp8dnHAEMChAt53cVh4+tHTGse9OUjDcUA2H1pG3g+klCMpnDI5c7
 pmi85zSOkodIGzMCvmf4UtxyfWtz7NwJkc8KLg1oOSZKJv6ZrW35aaINdOacOWqZPOP2
 e02JSCqPqgQTt6QaPh//rwuCMQLePrU+53zPYh0Bml1qjZfkZRn8r4j+MvQzeVaG7J7C
 zoXWMH1y8z7NRxM7uAJWW9uFSoS/4KTWzHJFCQJNRMzbaHpjScoHaTt6IS86Gk5CGu59
 WVH9M0iHLLVLDyZWyah40gRwQGGbUdSmhtsCn5513vMvlF+GzdM4VzPeIyCftCNnjRnc
 KuzQ==
X-Gm-Message-State: AOJu0YzGZQx0vxpeJa4n1TEzJUo8RV9hSWKkrFQi70zjxaQWlzDl85mQ
 yCkgmIaTGe0bnnJVUVtzN61g5wPMwcNEP7ukvq+xDg==
X-Google-Smtp-Source: AGHT+IFQVpOp1Z+shs5EEXFumtKsf6gWUKM2BGWYXu73J+S6tVHLqhaoIHC2Q8fUQ6UHYJOQKvUoEQ==
X-Received: by 2002:a05:6a20:9385:b0:187:4a56:99f3 with SMTP id
 x5-20020a056a20938500b001874a5699f3mr12008171pzh.20.1700238832047; 
 Fri, 17 Nov 2023 08:33:52 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a63c010000000b005c1ae0b5440sm1624988pgg.74.2023.11.17.08.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 08:33:51 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 09:33:49 -0700
Message-ID: <20231117163349.1605366-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700238832; x=1700843632;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IFKHR0/QLYBkByjL8T5GGG+j9mCQiBgFqZXHoXnKlWg=;
 b=JIAfktc83q1+Sr75gOWLludQ8eUFRA59d3OqUagS/jKU+JOmdWuiCT3juAmX2iutTP
 imberqWJDPtbrMPW9KVLbLy/hbhPD+xPaaxiMnKvWm3pvK3Jnr+yhYx7Drb3u5QDoGEk
 sixSIUb/68nn0wcDY6y2TMLCDVloxsNWKSnSA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JIAfktc8
Subject: [Buildroot] [PATCH 1/1] package/flutter-engine: set HOME_DIR
 variable when configuring and building
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

If the HOME_DIR variable is not set, flutter-engine creates a .dart directory
in ~/.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 32aaa1cccf..d31d435d79 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -185,11 +185,14 @@ define FLUTTER_ENGINE_EXTRACT_CMDS
 	| $(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 endef
 
+# We must set the home directory to the sdk directory or else flutter will
+# place .dart, and .flutter in ~/.
 define FLUTTER_ENGINE_CONFIGURE_CMDS
 	cd $(@D) && \
 		rm -rf $(FLUTTER_ENGINE_BUILD_DIR) && \
 		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
+		HOME=$(HOST_FLUTTER_SDK_BIN_SDK) \
 		./flutter/tools/gn \
 			$(FLUTTER_ENGINE_CONF_OPTS)
 endef
@@ -198,6 +201,7 @@ define FLUTTER_ENGINE_BUILD_CMDS
 	cd $(@D) && \
 		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
+		HOME=$(HOST_FLUTTER_SDK_BIN_SDK) \
 		$(HOST_DIR)/bin/ninja \
 			-j $(PARALLEL_JOBS) \
 			-C $(FLUTTER_ENGINE_BUILD_DIR)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
