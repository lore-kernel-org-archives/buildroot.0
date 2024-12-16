Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07A9E77183
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 18:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540F54063B;
	Mon, 16 Dec 2024 18:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LABENifP9mKs; Mon, 16 Dec 2024 18:17:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9CCA4056F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9CCA4056F;
	Mon, 16 Dec 2024 18:17:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8D7BC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 18:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9990E608CB
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 18:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kk0hZkwiPab for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 18:17:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.47;
 helo=mail-wr1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 603C1600C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 603C1600C6
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 603C1600C6
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 18:17:29 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-385e2880606so4140351f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 10:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373045; x=1734977845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6/u+cYahwGGWxbutZtKlZMbh3iLIhoRQcZteRKXmfOQ=;
 b=FquFxZl6cd4PFuxEFTEMVX+GYAjVXvM+4xzNC312CiQqr2U1shVGAP+1y0V1SyjO9e
 amTXO10Gc446EZ4rCk7rpILCMqJa8wtXNCYuBHBRWfu8YtyZUIfazMsDucZdZUjL3TLG
 G7apSNz0Ga5owN24IHC8/RvwqQjcZZhSLZbaCehUWqz7Y08+F5qC7KRW4CHC17aQTdKg
 f4VHjaWam/6+v5V0d8ghziVFu6JdttWf6MDyxZG9UMTP/zoyye5M7OIsh2NvUOsPq38w
 JknsFppORZ0GHGiT/1N0NKyaGc5Bvo5fGTNXfF2D2AOSqwxzp/DZ/M5m4hMTXUr+gh7G
 CN6g==
X-Gm-Message-State: AOJu0YwAS1gqioSjHxtIblsRX47qGaTUoKDbCVEEKcJN9LvRPFGpFrsH
 yMEWAVCLPjU5Z2WGT6EJUjqpE3iQULzSQdiY2aq11YSydlgLIRKbgcrhMna2
X-Gm-Gg: ASbGnctVdXbRJB0tmLq2yuL0ldtRDhfX5pAavELhm64nsmtpUJsaazKOTr/EZfSRQ2A
 guG7jvLJuB40AzYJsDF2W8FXE+RaSlpPakDLmhdhjzk01Mwfx8I3BUG9O0faVSt8YyvVGa1E4QB
 eHmI74TJy1pxaQGG/Ytd1JHfw+yC84nAk4Z9oNUdnBFiDF1DmPLRPERsLbrp9g8Aoh+rpsZSH7v
 qEGKNGYsydS/u37ILhogQGoyj6zsCt5F5bKGlvv0/jH1Qq7Q8LabOjlepD/j+of2si2vHrm5qvr
X-Google-Smtp-Source: AGHT+IFqjAHNPDxpDs5inNgOTe0SMwZCWr9XEhfCxkOIvQ2M9+E9z4eQMQne8Wu6wyuEpLxANFKnkw==
X-Received: by 2002:a5d:5f87:0:b0:386:33e3:853c with SMTP id
 ffacd0b85a97d-38880ac5f48mr11203132f8f.12.1734373044902; 
 Mon, 16 Dec 2024 10:17:24 -0800 (PST)
Received: from thomas-Precision-7670.home
 ([2a02:a03f:eb68:2f00:9c94:3a1:94:d6bf])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9608834fsm355109566b.86.2024.12.16.10.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 10:17:24 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Mon, 16 Dec 2024 19:17:19 +0100
Message-ID: <20241216181719.770389-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216181719.770389-1-thomas@devoogdt.com>
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3 2/2] package/webkitgtk: bump to 2.46.4
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Stable release to the 2.46 series.

Release notes:

  https://webkitgtk.org/2024/09/17/webkitgtk2.46.0-released.html
  https://webkitgtk.org/2024/09/30/webkitgtk2.46.1-released.html
  https://webkitgtk.org/2024/10/21/webkitgtk2.46.2-released.html
  https://webkitgtk.org/2024/10/30/webkitgtk2.46.3-released.html
  https://webkitgtk.org/2024/11/27/webkitgtk2.46.4-released.html

Added BR2_PACKAGE_WEBP_MUX to fix this error:

-- The following WebP libraries were not found:
--  mux (required)

Added USE_SYSTEM_SYSPROF_CAPTURE=OFF to fix this error:

-- Checking for module 'sysprof-capture-4'
--   Package 'sysprof-capture-4', required by 'virtual:world', not found
-- Could NOT find SysProfCapture (missing: SysProfCapture_LIBRARY SysProfCapture_INCLUDE_DIR)

For now, use USE_SKIA=OFF which is the replacement for cairo.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3: only because it applies on top of "package/webkitgtk: bump to 2.44.4"
---
 package/webkitgtk/Config.in      | 1 +
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 4 +++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index dca62cf0f8..3594299314 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -53,6 +53,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WEBP_MUX
 	select BR2_PACKAGE_WOFF2
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 49f758d6a8..96100d4c7c 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.44.4.tar.xz.sums
-sha1  3699ff9c9b84e755a0736e72dfd6e5a13151f7d6  webkitgtk-2.44.4.tar.xz
-sha256  2ce4ec1b78413035037aba8326b31ed72696626b7bea7bace5e46ac0d8cbe796  webkitgtk-2.44.4.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.46.4.tar.xz.sums
+sha1  10d4dbd222acec30b1d20ee3b7d02c0d9727c5a9  webkitgtk-2.46.4.tar.xz
+sha256  0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176  webkitgtk-2.46.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 49a532d9aa..ec63d093b7 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.44.4
+WEBKITGTK_VERSION = 2.46.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -30,6 +30,8 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_AVIF=OFF \
 	-DUSE_GTK4=OFF \
 	-DUSE_LIBHYPHEN=OFF \
+	-DUSE_SKIA=OFF \
+	-DUSE_SYSTEM_SYSPROF_CAPTURE=OFF \
 	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
