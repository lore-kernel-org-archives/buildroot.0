Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8175BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 16:59:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF25611BF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 16:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CF25611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC45340428;
	Tue,  9 Nov 2021 16:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4A-bdJYvg9mc; Tue,  9 Nov 2021 16:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4252B4041F;
	Tue,  9 Nov 2021 16:59:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4614B1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 16:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35272605FD
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 16:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQpDAWAUH4Rp for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 16:59:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69FC5605F9
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 16:59:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b12so34171773wrh.4
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 08:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ABGp96ToIx1t3Nv2NNeqGgqBozrBkMp0QdSpeA8ZyKo=;
 b=fQX1W9vhqtnDukutYK9cy+Ym0mlKHqnmTjVO/G6Fv8v/kIUTKBL2TG5nJfbluGrhXf
 NQl4gVlvUuxcLFNh1WFMCDeElX48DgCQplEzH7E8fEAcr0XGA0dUnYSwcrEQNE55t55C
 werzij6Eh5sJ6EFTVis7Fhslhg0UzaSJoAxXmlnqfZ9Z0fe/9tuOKvH4EsxJ8PsDU06V
 A2JUN88nqUhKtj3aq9ChCnj2HyaZPjmiMA91dspy1JQIJ9mf3EMNKXuCgk6EzOkOJxZA
 8X3s9F0u5d6cYgmg/WRE/w/FUv5p2BsNu16FPeA/h+DA01l8+ig9s6hzKyFtlJ27+C+1
 XrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ABGp96ToIx1t3Nv2NNeqGgqBozrBkMp0QdSpeA8ZyKo=;
 b=cHmWHfbT8lvh4dCIqauJrpIR/R53SNEnS4cTuRuH90+vE98VVvm/l8f6TSuAnof+KN
 FbZtiFwUtpmsSCZpHSMVY0nRDGrlvHsJFcaWDZeCndd/Pcw7J820A9AitKCysbtDfSKv
 QMhigL8zlSLn7RFGbMSIIZTvhCWq/5MYf4JlrT3UIZE4P91n+IgSmv8MuUAlyT3TYsI3
 etojKto9gleWxwA3WP2xi7+OGW2ExB7DaDYr0F1Ld2KrhnS/YuVSpp6498Dag4ljyiTR
 ZsjGC3oLOQoAh22LVodfMzpWZ3+532E3ZBEraS+s9FZJlDRxAJk4DGuZ7vF+rMB0RJbp
 cPOw==
X-Gm-Message-State: AOAM530Xa8G9cEQEUMChdP7+bc5ihb0FPgFqbEilYciEkiPvMiir25P0
 JXxsVbAx6UHJnTHeiPuKvSdlYYJItPichQ==
X-Google-Smtp-Source: ABdhPJzBzikPwXOfEQWZxZ5JhocyUXf0xRxYJ1S19b4vN8qwr9NYbhPGyP5zsrbSVmXRhxKFyYTxcw==
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr11382912wry.424.1636477155497; 
 Tue, 09 Nov 2021 08:59:15 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:710f:610b:602a:e07])
 by smtp.gmail.com with ESMTPSA id b10sm21480384wrt.36.2021.11.09.08.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 08:59:15 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 17:59:07 +0100
Message-Id: <20211109165908.1942790-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/kodi-*: run pkg-config at build
 time, not at parse time
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When calling 'printvars' on a just-configured tree, the output contains
many spurious warnings about pkg-config being not found:

    make[1]: [...]/host/bin/pkg-config: Command not found

This is partly because a few packages call pkg-config at the time the
Makefile is parsed (really, right when make evaluates the recipe before
executing it).

It is customary, instead, to defer the call to pkg-config to the actual
shell running the recipe's commands, like all our other packages do.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk  | 4 ++--
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk  | 4 ++--
 .../kodi-screensaver-matrixtrails.mk                          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index b78646b9a9..21def8ca4c 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -11,7 +11,7 @@ KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = glm kodi
 
 KODI_SCREENSAVER_ASTERWAVE_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index c6dd26a89b..6f462e7d27 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -11,7 +11,7 @@ KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = glm kodi
 
 KODI_SCREENSAVER_CPBLOBS_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index ac4303a719..45d3e46b4a 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -11,7 +11,7 @@ KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi
 
 KODI_SCREENSAVER_MATRIXTRAILS_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 
 $(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
