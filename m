Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD92CAC5B9
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 10:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F0D6605A4;
	Fri, 26 Sep 2025 10:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEtrUWlqwvDu; Fri, 26 Sep 2025 10:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 850D461B78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 850D461B78;
	Fri, 26 Sep 2025 10:06:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25ABC12D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C0A440CCD
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BL_gE6w_oryj for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 10:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28FE940C3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28FE940C3C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28FE940C3C
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e29d65728so13166365e9.3
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758881175; x=1759485975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1el7bOVkNSVJsNehCRG7KmaeYnDUnG5W7mKeC1dFfY=;
 b=cRd+JGQBw+Ea19v9+G8JK1blcBo4/v/RkwWKDdgfHc71ORNWDD/IgBaFvx/Pyo29+N
 FNsJLGpTfzQdD72UKdXKETWLkE8bvY0w/HA9Hu7gqUQQ+tzg42TT5JXpix4M0fCf4iTn
 6AVPiMxUr5HlPx9cy9rd+f5DYgYl35xMQvivuNPtU13kwSd065iRPY+ihXSGDsoGv/0P
 IRYaOHLOA2N+fseiKbt07FwZNowaOS/VUiRQ54IktIr0TU31JhUJ2w/2ydBQWucpCNWI
 boFJKK1MfmgVoWjyP/SVBM0osu6aocJbuo7vVkGfPdctLj7J3lFVj7WaQONEEXQOn2SB
 OoRQ==
X-Gm-Message-State: AOJu0YzztweFhhrtcB3fyRGGkh0vDSD7o0qCtNIJox3lsYo4+KKNi55B
 0fhNnRbsE0u6ZvUcaLPMGFEWIwW32mdISfG+BC+VBXXXD0rBbssdpdSvWV8V3seW7i/Vx0jAROT
 dEpMMgQk=
X-Gm-Gg: ASbGncsBKsLReSd56S8FmHymb0PkViy1kPqWnbb+Rjej/EEa9YJvDOjDir1drSzl1tb
 xQau1gEniowqga3qApOEb9m2a3jYZgi2zrVzifSeoCCINn2LBehm18Pz8SOrE/HC/56s3RQPJRh
 Hhm26YwmHrbskF4cLj5r9QQVK8jPZc7gX/PdkVMQL5f4/udVOCt7bkzXynisUsVrByoTQ5Z8TEt
 YHToKks8kYBayZMtH3Jz5fTTIGfp37XQLHxI/D4V/qnui9WMm5HJIOyeoxzny26eqvylJ5yhhq4
 BU/wYYE9oMZnZ9/74pcrkDKARarBW3KshdWn4Z+usRLIhgGVoh6voKbR1i3GaQcAASpVnxGafiV
 STIGLKqOHoFb0c95pY1tg1uEsmr6cptCbub0hUS+3jbS6ObG7v6VuRy/4sXVdCNg=
X-Google-Smtp-Source: AGHT+IHwEGWOJliUqycNNbfkFroFKolNjEaivdNit0YbqJo4DuMSUX012B/M6GAz20OOvKZTZVTv+g==
X-Received: by 2002:a05:600c:6306:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-46e329b9bf6mr64140785e9.13.1758881174622; 
 Fri, 26 Sep 2025 03:06:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab62233sm112622825e9.21.2025.09.26.03.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 03:06:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Christian Stewart <christian@aperture.us>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Sep 2025 12:06:06 +0200
Message-ID: <20250926100609.4158676-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
References: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758881175; x=1759485975;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1el7bOVkNSVJsNehCRG7KmaeYnDUnG5W7mKeC1dFfY=;
 b=AmKo4Yyf58TBz2E4zgNoSSpp443TWDyD+F/wpUiN8Ss23xEOluDy1A5HVgBlNb7zYh
 KSXtZJv3NXoCzXWr5Mm4ENjxevWNB8FKNW0Og0wzozeFdOENcfGuZf3xryuHvhfgdDC6
 pkwjzMhlf4gztV1baB3sQ36MpvROksmwQONUc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AmKo4Yyf
Subject: [Buildroot] [PATCH 3/6] package/libcrossguid: fix
 LIBCROSSGUID_VERSION
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make LIBCROSSGUID_VERSION compliant with release-monitoring.org.

Fixes: c61d7d61b1e3fe143569938f7c63b01a24169830
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libcrossguid/libcrossguid.hash | 2 +-
 package/libcrossguid/libcrossguid.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcrossguid/libcrossguid.hash b/package/libcrossguid/libcrossguid.hash
index f65c25732d92..e0725bfacfe5 100644
--- a/package/libcrossguid/libcrossguid.hash
+++ b/package/libcrossguid/libcrossguid.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6be27e0b3a4907f0cd3cfadec255ee1b925569e1bd06e67a4d2f4267299b69c4  libcrossguid-v0.2.2-52-gca1bf4b810e2d188d04cb6286f957008ee1b7681.tar.gz
+sha256  6be27e0b3a4907f0cd3cfadec255ee1b925569e1bd06e67a4d2f4267299b69c4  libcrossguid-0.2.2-52-gca1bf4b810e2d188d04cb6286f957008ee1b7681.tar.gz
 sha256  779e58787f966a1552f68d5ec041513cef68785dae4a519dbda7bc0b86eda20e  LICENSE
diff --git a/package/libcrossguid/libcrossguid.mk b/package/libcrossguid/libcrossguid.mk
index c77f21ab2605..4afea680de5e 100644
--- a/package/libcrossguid/libcrossguid.mk
+++ b/package/libcrossguid/libcrossguid.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCROSSGUID_VERSION = v0.2.2-52-gca1bf4b810e2d188d04cb6286f957008ee1b7681
-LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,$(LIBCROSSGUID_VERSION))
+LIBCROSSGUID_VERSION = 0.2.2-52-gca1bf4b810e2d188d04cb6286f957008ee1b7681
+LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,v$(LIBCROSSGUID_VERSION))
 LIBCROSSGUID_LICENSE = MIT
 LIBCROSSGUID_LICENSE_FILES = LICENSE
 LIBCROSSGUID_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
