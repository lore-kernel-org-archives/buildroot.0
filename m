Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53881CE8379
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 19:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE143400BF;
	Mon, 30 Sep 2024 19:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-JHKd4yTsU9; Mon, 30 Sep 2024 19:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4186400E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4186400E2;
	Mon, 30 Sep 2024 19:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DABD61BF2F5
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 19:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D73F980ED0
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 19:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8GVy94nDMiH for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 19:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F9F780E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9F780E2C
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F9F780E2C
 for <buildroot@busybox.net>; Mon, 30 Sep 2024 19:02:31 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso612064666b.0
 for <buildroot@busybox.net>; Mon, 30 Sep 2024 12:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727722949; x=1728327749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6iysb/vr8wEQOdTcTn2vJn8vYg55orN87Rv/xB7+Bzc=;
 b=NdRU6Qg0UFlMk+MT02EGOJ6L20RUIxS4dz2g6Xicll+h8RhrQMT83FPdE5lmchqXIO
 sXez96TUUwkkEI85mqdP3/XRjR4taheq4eAdLqPn3CyeigVXGLfpiNMw3UEznqvkdkrv
 ITanzhjnHWodlLjnJJ3WbdjlRfMuo1sodbXVxatmCUD0Zctj9QyGZ8bzQZ1GHET2ZE2g
 u26OMqob9/IgAtZRaOZzypee2AKdSw3XC4fSsf6ig8s2+Z4lbS1AosDsoMxpydeeAy0B
 fWz5qsQ0yBEqTs5D6eTeceOLir2JHH6Cny0b2a4VAZGF84Fq7kBj0ubFf9g9RjnsulEe
 c9Iw==
X-Gm-Message-State: AOJu0Yz+LLYXOU2wzhRlsaf71/xPZfFFkYKw8/wGohIHJH4FR7X1aNUr
 ejvizI1FaNM3GrVI4oTJkZlIdDryHeD/PLN3VjoxHdRQxy0CFsPF16OZRb01GP+PUEj2JEgWB0R
 agQ==
X-Google-Smtp-Source: AGHT+IGZcte+EpWJ5dWe/M5AaXbHrlOsz3vrKXsUMeEjWBenlY1ZorI4PNw3uOoFvUYM1Y7J70KCMQ==
X-Received: by 2002:a17:907:c88e:b0:a90:9fb5:2c43 with SMTP id
 a640c23a62f3a-a967c049722mr66973066b.34.1727722949244; 
 Mon, 30 Sep 2024 12:02:29 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27756fasm581547666b.18.2024.09.30.12.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 12:02:28 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 30 Sep 2024 21:02:25 +0200
Message-ID: <20240930190225.3923277-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727722949; x=1728327749; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6iysb/vr8wEQOdTcTn2vJn8vYg55orN87Rv/xB7+Bzc=;
 b=Bga+UIgLvxnVuvVTXljSmNf+/TsWsm2YnDAniAElfTAYD3N7ipLSmnmllNoJXrFXAs
 qddi1vB0ygAevBfyXSpWb6rsQ8SeQ9mrXB+4by7maDPwwFF+9TLMD4UHXPRkDZclETWA
 mItspgZ9pDmG58AxPR/KYhoCPp2WG45NDXjqMc7s0i7EQNELkz+1ZxRQZ1M+0jZCPJ2X
 34fL2kjzT8yrjpaKIjBJsfZLGTzPsFvrxcaW06gI+rBg+kuCoL3XpNnn+Hlb2OGDT+YL
 653fsKFLA48KvRqQzswgnkxW9mMavCpAvy07s5++YLyRq+n2Q6C4FhE0UwrqdMwMdXqw
 cpQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Bga+UIgL
Subject: [Buildroot] [PATCH] package/libfribidi: bump to version 1.0.16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libfribidi/libfribidi.hash | 2 +-
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 29948fbba..9da9281c8 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0bbc7ff633bfa208ae32d7e369cf5a7d20d5d2557a0b067c9aa98bcbf9967587  fribidi-1.0.15.tar.xz
+sha256  1b1cde5b235d40479e91be2f0e88a309e3214c8ab470ec8a2744d82a5a9ea05c  fribidi-1.0.16.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index ab7fe7030..ca0a39ccb 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.15
+LIBFRIBIDI_VERSION = 1.0.16
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
