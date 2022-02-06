Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EAFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 05:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAEF160B03;
	Sun,  6 Feb 2022 05:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahmoWIvOQIEh; Sun,  6 Feb 2022 05:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D5F460AA5;
	Sun,  6 Feb 2022 05:53:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AED361BF85D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 05:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A610F4015A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 05:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dkv1PD9r-yQq for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 05:53:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2615400E6
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 05:53:35 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso2312050pjg.0
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 21:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bVN2N6ho91N3IX/zpnPrIwheeUdAqZ1m8rcqGlR14Ic=;
 b=J8fPqit7nKu63EEN03wON7LO4ifQm5fa+FMoFbBQYlmsG6FLJtshnsnZdCqexwezIn
 cXVerquyuO6lYyH5qaIiFlGym3tDvTz+h2UtR0GI5pjT/7cV/JyaXcgrcGRsc+O5JpVm
 8ZZGyfOnZ8smPeGq/pKrBHG9YJ27A28NOBn07g4046quwXyyaEpUaTfthsb9/1tcI6e0
 i9PECUZrLeQYx0wNsmrXWgFzfOeTzrEIUrNcpyDTasmL606bsyMugeeRAQCHYWOxsUgP
 jrQ1bbZ+vy/hvdDWAejmQXUyfcchYg3KMPOFJy6kyPISCKU17hSKdX8U8W+wv3cCF0gA
 awng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bVN2N6ho91N3IX/zpnPrIwheeUdAqZ1m8rcqGlR14Ic=;
 b=5fWzDLknKUgW1BHdqCeexniz2HDmwUEWUVgL6PD6AY8tovYgVGuixD4E9CEn5wWuwO
 WwTqm7rBoBSxrrDtBOZZfbpKQ2eL0dKC5H0f0/O1uxFaIkuTej7NoCRKVtd4PXiT4M7i
 9WPdVDhcpZMWlGxHAqMIc7nn2wo/jN0O7PF22+8zc6Vhai8YzNpAiw0h3pmv76rnPQD+
 hC0CI/9ECLxcux86xzYWu1fO7eF7Kx0WSH2eFLauhbFxwKAjGwAAjz1RiYkPfJ/mDAtw
 S9hB+btdURXbegEPNsnfJ0EZx7Gtu+QG77APIP+CEfoAfqgJRI91WHNpHFmuCTflDKvm
 nW/A==
X-Gm-Message-State: AOAM530f1UGX0pYm2tMR2MwRTfqdpq3tuU4fPh+rLUbg52L3kOJd1DIZ
 o+qIEHuHYZ43cIz+TaRwX5SWNIx6+iOXqA==
X-Google-Smtp-Source: ABdhPJwFMr1kp1dnla22Qm+gyuASCjtWsc/KCT4H1VKvivHKqVKkpcLtNRw2GAjemfgG+sxPfSSxrQ==
X-Received: by 2002:a17:902:ab55:: with SMTP id
 ij21mr4166114plb.50.1644126815031; 
 Sat, 05 Feb 2022 21:53:35 -0800 (PST)
Received: from solsona.hitronhub.home (S0106f81d0f601923.cg.shawcable.net.
 [174.0.44.90])
 by smtp.gmail.com with ESMTPSA id l4sm7847350pfu.90.2022.02.05.21.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 21:53:34 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 22:53:30 -0700
Message-Id: <20220206055330.11218-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.0.18
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
Cc: PeterThompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: PeterThompson <peter.macleod.thompson@gmail.com>

Signed-off-by: PeterThompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 16459e4a59..a490b002b6 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
-sha256  f6370809c9f644760920d9945c5be07aed17664975f2e4741013d4d9a2ec696f  COPYING.txt
+sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
+sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 326cb99366..1fe7c0a075 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.0.15
+SDL2_TTF_VERSION = 2.0.18
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
