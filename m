Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44A6CDB474
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 09:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 454354155A;
	Mon, 23 Oct 2023 09:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 454354155A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0EbIdNuFq6O7; Mon, 23 Oct 2023 09:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C13041552;
	Mon, 23 Oct 2023 09:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C13041552
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90BA11BF35D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 776DC80FF8
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 776DC80FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQbtJ5w-HeQ9 for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 09:25:12 +0000 (UTC)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4E1680EEC
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 09:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E1680EEC
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-40836ea8cbaso22519205e9.0
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 02:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698053110; x=1698657910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3hk3LA68Yq5D/JIMXh0bfP6NOdiaVIlPLiRxqt5ZrI8=;
 b=xBPgNmNOe6Ip7iVX1nKYCog47FU30AO97S9uKI7uMcTkkIldu1DJXKgkTw1mPFMx+9
 peMppHVcFBU+T5bG6563E+qaKtRTY2G2RXXdrvUNDNOr6rBd0oBDiHEssPS1ZRHLS/jh
 xiAnurrMfT5ER2y6YnevPFB1nArqn2tZSbPxHo/rRkqF9+gSlO19YB6Vpfj3dd5cN7mp
 6/oxEejAF5vxu72eQtYmF2iZDE6MAM77ZJyaiwPXDF2p0utpbarcNQrqPCEOScLoeHmV
 ogN1xVFd/Xivl65RfMzXlZC594oTOwZOvDy87RVl2rPaGUZioY7tKBMj5RfBM7vnNHav
 vGSw==
X-Gm-Message-State: AOJu0YxAKdtSEupV9Jz0FA/8VDnjUlrprXLI6CUBf92XXx8XB/CgtciZ
 zL7mzghEdPWZaEFKt5WrLpTOGTmfsOy/yVBbK7YlVRR3zXK9uw==
X-Google-Smtp-Source: AGHT+IHc3xBJTyQATYBuicI0VJkGAR9qW7ymJFQbs22WF5T4JNZMyNVP9QiE2uBSsGgRMXTCb9UT8g==
X-Received: by 2002:a05:600c:4714:b0:406:7d74:a29b with SMTP id
 v20-20020a05600c471400b004067d74a29bmr6712761wmo.13.1698053110316; 
 Mon, 23 Oct 2023 02:25:10 -0700 (PDT)
Received: from fedora.. (host185138219236.static.fidoka.tech.
 [185.138.219.236]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b004042dbb8925sm13911859wms.38.2023.10.23.02.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:25:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 11:24:59 +0200
Message-ID: <20231023092501.481436-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698053110; x=1698657910;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3hk3LA68Yq5D/JIMXh0bfP6NOdiaVIlPLiRxqt5ZrI8=;
 b=RlxsTcbrvIn2AZyqIVGBm/Qgf/fWDr9mIFEuYLvAISQ0HPdYuIner7R/w3qhLCk8Hs
 naluNR35UYp0eOQlETBZZuf7weitlBw/TdauufYphxO3VNXXKKayucB9HFIwZjItI1EQ
 KdBW0RTO/JsAnLIAaPWdldV3dw+O1nqQhJMYM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RlxsTcbr
Subject: [Buildroot] [PATCH 6/8] package/opkg: add bzip2 support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/opkg/Config.in | 6 ++++++
 package/opkg/opkg.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 69378c0de7..7bc02e429e 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -32,6 +32,12 @@ config BR2_PACKAGE_OPKG_GPG_SIGN
 
 comment "compression support"
 
+config BR2_PACKAGE_OPKG_BZIP2
+	bool "bzip2 support"
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bzip2 compressor support.
+
 config BR2_PACKAGE_OPKG_LZ4
 	bool "lz4 support"
 	select BR2_PACKAGE_XZ
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 270a7a1a75..ee14e774e3 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -27,6 +27,13 @@ else
 OPKG_CONF_OPTS += --disable-gpg
 endif
 
+ifeq ($(BR2_PACKAGE_OPKG_BZIP2),y)
+OPKG_DEPENDENCIES += bzip2
+OPKG_CONF_OPTS += --enable-bzip2
+else
+OPKG_CONF_OPTS += --disable-bzip2
+endif
+
 ifeq ($(BR2_PACKAGE_OPKG_LZ4),y)
 OPKG_DEPENDENCIES += lz4
 OPKG_CONF_OPTS += --enable-lz4
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
