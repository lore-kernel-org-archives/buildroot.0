Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BFBC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 16:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 782D0402F3;
	Sat, 11 Nov 2023 16:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 782D0402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6VBiCIhYSnK; Sat, 11 Nov 2023 16:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C27D40293;
	Sat, 11 Nov 2023 16:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C27D40293
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C998D1BF38A
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 16:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B07D882346
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 16:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B07D882346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id laFGASU0e6_p for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 16:19:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97E0A8232D
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 16:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97E0A8232D
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-32da9ef390fso1900527f8f.2
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 08:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699719582; x=1700324382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JWrhmUplZcGkY9feZrBqFUjcPwThtg0acPtt+dLo/Y=;
 b=maJC1LWYfUB2NoATJ4TFDWDRi44EiKcg749a1gN/I5NJGunUl0NeIsdy3NUyjdXmk8
 4Pt0yw6cJloQwjH9F+97cYzAUORvOAikiFxC6ukq1st4p6oWQvc3x0jJfc9W4+2sqXhS
 E7sMqDAJt8FaZOEFIWSeSr2+iDhhmDeFPpa9+FsVIQm1iwgoioAOeivxWosMErP/srh7
 MMyhq5/9R6EyB5jWsmAyGf4bCJR1bWVu5YUj+Q7t2NHaOwC2AEKFLrSQB2C7GzT/lk3X
 9TjLRSkUYZprdgrHHPhln3NYGz9Omky/th2B+gH6yHiGKA1Rmys0zImIf3QunTzf59n5
 Z/MA==
X-Gm-Message-State: AOJu0Yxx7Hig3vNpcShADkCssoVjM+13P0Lss8Ko6Q7j0M0ipkWNeTPX
 FDOsPxMeMswLT4kxgQWceFLZMS/jZZN8/Q==
X-Google-Smtp-Source: AGHT+IFn4LvLyKu1wCW1hAaAL4x+rgbSsEbB72d1fRiQseFfTQaHuMURWgmz/TnqTHD5Ibs5+fMiDA==
X-Received: by 2002:a05:6000:1567:b0:321:6bed:1646 with SMTP id
 7-20020a056000156700b003216bed1646mr1999544wrz.14.1699719581919; 
 Sat, 11 Nov 2023 08:19:41 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:ddfd:ab02:5d95:c69d])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adff246000000b0032da40fd7bdsm1743380wrp.24.2023.11.11.08.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 08:19:41 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 17:19:32 +0100
Message-Id: <20231111161932.914611-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231111161932.914611-1-thomas@devoogdt.com>
References: <20231111161932.914611-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 2/2] package/at-spi2-core: bump to 2.50.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
 - https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.4.news
 - https://download.gnome.org/sources/at-spi2-core/2.49/at-spi2-core-2.49.1.news
 - https://download.gnome.org/sources/at-spi2-core/2.49/at-spi2-core-2.49.90.news
 - https://download.gnome.org/sources/at-spi2-core/2.49/at-spi2-core-2.49.91.news
 - https://download.gnome.org/sources/at-spi2-core/2.50/at-spi2-core-2.50.0.news

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 8f856e1cac..4257ba03a7 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.3.sha256sum
-sha256  37316df43ca9989ce539d54cf429a768c28bb38a0b34950beadd0421827edf55  at-spi2-core-2.48.3.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.50/at-spi2-core-2.50.0.sha256sum
+sha256  e9f5a8c8235c9dd963b2171de9120301129c677dde933955e1df618b949c4adc  at-spi2-core-2.50.0.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 0ca5bc1817..828280de1a 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.48
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).3
+AT_SPI2_CORE_VERSION_MAJOR = 2.50
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
