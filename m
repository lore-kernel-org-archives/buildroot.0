Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFF0C369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 18:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE5D240678;
	Sat, 19 Apr 2025 18:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0yB8WNq2Gda; Sat, 19 Apr 2025 18:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1270140653
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1270140653;
	Sat, 19 Apr 2025 18:38:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B923A230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 18:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A96806067A
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 18:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_Tz6dwT8SSA for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 18:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.53;
 helo=mail-wm1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9ACDA6065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ACDA6065F
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ACDA6065F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 18:38:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso20527835e9.0
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 11:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745087884; x=1745692684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juf5WmX+D7p2SVpOfdSNQnwdJqLeU3182uC/amMVD5I=;
 b=ef1xPKc7kLb476wkSazURhnErrHbAiv6OQ0HGTL1pXwurf1IQSagJuXI4w/PSyNuBX
 qiPHm/Wm171tRvrYheEaACTBkK1QuPnFatAf0gwN/JA8pyHkRL9UDRveIz07228FLclI
 AdjEwM4yuid0lZglxIVETc47hj3qfzkUtekjzISU9wxL4Ye9ynEs2troZeI4TETKhUuX
 jUivd8Sk8ZrGnVWaZ1Qbd2cYkwtOh+xThFQrcEt1EnCCyib3Z+YU7fWu3YrlBAcBhQ1T
 5nCydfSqO5NkdCpVFQ2aqDXRpUtAqBKRdwHGD8oXewW6XBjCue0nMORb3Dqi4/MfcHnt
 sdQQ==
X-Gm-Message-State: AOJu0YwDGbTMfQo5yRvu1/3v4HcIkFPIb1RbFU6jxgesSHsFM5pkJI/Z
 i2Xx31wgObcJbbZiGR/Dydn4s+YmZvDXYlRElGfmxjKRvgyLJYNRrhKrzg==
X-Gm-Gg: ASbGncs2QbV7xGNwcEPmxwEvK25yy/pHJ/C6UfYU+gMmAp9dDdvp32CZ8JMauRUp9zR
 VDbvFBsQbPbKKUxtCYtnkXrQLaDYvEeQoc6Wlfeu8/Eu9ibRvflhZ1uV3Ydl4eXa7bmM4NvPVJt
 NEVJYOpYh7lmgv5+Ji67oO/TnrIzeUNeUhzsziV/mcmyFrw/3ZvU/GbwGFdCdL44MGseyJiilge
 WngoFWJv9snepCpg04WRiVhpLRp86fiFpC2aholalx4YibYtoGfdGyMOeprtoRAjuAqktAKfojY
 v6+ezjKsZ+8EinUU4YaaUGf5BUpZ+XRZdcdgvR2+cf4LiXDs1ur9
X-Google-Smtp-Source: AGHT+IELON6Bp4j4S3HXJss3yiHHnbG9HSTz1EYKQtOe9dVcSnX2KygsZLVajuIjvko9EM5omkqbrA==
X-Received: by 2002:a05:600c:1d02:b0:439:86fb:7340 with SMTP id
 5b1f17b1804b1-4406ac412c4mr63800675e9.30.1745087883763; 
 Sat, 19 Apr 2025 11:38:03 -0700 (PDT)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4207dbsm6557602f8f.4.2025.04.19.11.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Apr 2025 11:38:02 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: aperez@igalia.com,
	thomas.petazzoni@bootlin.com,
	thomas@devoogdt.com
Date: Sat, 19 Apr 2025 20:38:00 +0200
Message-ID: <20250419183800.93602-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250419183109.0286277d@windsurf>
References: <20250419183109.0286277d@windsurf>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3] package/webkitgtk: bump to 2.48.1
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

This bumps webkit to the 2.48 stable series.

WebKitGTK+ 2.48 highlights:
https://webkitgtk.org/2025/04/08/webkitgtk-2.48.html

News:
- https://webkitgtk.org/2025/03/14/webkitgtk2.48.0-released.html
- https://webkitgtk.org/2025/04/02/webkitgtk2.48.1-released.html

And brings some security fixes:
- https://webkitgtk.org/security/WSA-2025-0002.html
- https://webkitgtk.org/security/WSA-2025-0003.html

Also,

- Raise the minimal GCC requirement [1],
which should have been raised by the 2.46.4 bump.

- Handle SPEECH_SYNTHESIS, which has been enabled
by default in commit [2].

[1] https://github.com/WebKit/WebKit/commit/682ac4ba74c53d0cd488c7a595096224a9abb036
[2] https://github.com/WebKit/WebKit/commit/10381a8de938024f31935184af470ccbce0b22d9

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: added additional security report and a link to the release highlights
v3: resend using git send-email
---
 package/webkitgtk/Config.in      | 6 +++---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 9 ++++++++-
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3594299314..bcb4b12fa3 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 10, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 
@@ -33,7 +33,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 96100d4c7c..fd9420bad9 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.46.4.tar.xz.sums
-sha1  10d4dbd222acec30b1d20ee3b7d02c0d9727c5a9  webkitgtk-2.46.4.tar.xz
-sha256  0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176  webkitgtk-2.46.4.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.48.1.tar.xz.sums
+sha1  f7939f920f92f6b1395b8573f069d3fb9c085b3f  webkitgtk-2.48.1.tar.xz
+sha256  98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f  webkitgtk-2.48.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ec63d093b7..2c22bfb607 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.46.4
+WEBKITGTK_VERSION = 2.48.1
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -73,6 +73,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FLITE),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=ON
+WEBKITGTK_DEPENDENCIES += flite
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 WEBKITGTK_CONF_OPTS += -DUSE_LCMS=ON
 WEBKITGTK_DEPENDENCIES += lcms2
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
