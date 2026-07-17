Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010C9C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6209408CD;
	Fri, 17 Jul 2026 15:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mVOtj8V2l7D; Fri, 17 Jul 2026 15:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCBF0408DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784300589;
	bh=cLcu6uAUn6vvi1kFkQp308HG4B6R9XCeEvhEKxNI32I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gjPA/ThVcAlxbmxi2pBFzNUD/Y7cL66uPqUvNqjNLUEVsahxWPRSryn0VlsoBHALj
	 /SzE0z+jzx65RxDyzbrL+7c2GsD8bNcG5P6lszd8reUkbDdjzp7RAciIAFTGlLEXGe
	 gDt3FzMyNStAgZSUjAahs/OFY58D/slMRmDjFnVG8UIY6+CmmdgTgozXMrKfFkWRHR
	 xdY1/FajDJ3RX8lDkxJSHQwsYltAjc4WPrhQ6/mJtsWW9PFxuARHhmG0PVA6bjwBsA
	 /4wEDLJkcnS01wyFW7nxsQx/REOQNNXhGHyvwASDWfYiw4hxgZhkmkFrQU/zBx39ou
	 wYThSIrAIhkbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCBF0408DF;
	Fri, 17 Jul 2026 15:03:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6D9A1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84A3860AC6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dinOSJuL_7DT for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D72660697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D72660697
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D72660697
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:03:07 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5b01910b499so1552175e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784300585; x=1784905385;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KcXrdpQhLXP6QSUjDp6lY4WOSGbIN5++Ym2lfDA2Iok=;
 b=fth44v3a53luOtgKaDhfnqdxTVv2e1fzqRBdkoSZPnBPXYZJKpG+rAOu99i+CmY7wB
 5Wwm3C4YziFMw4z6xyArx/an6Eb6xhV27K6hx9LS7p5WRBR6Gd6BFnDkkFTwVdsBGKVq
 +R3S0KLJDz8wpX3v/uHqHH1FS0WmAp9hePCqQEyai6mETGnjqukCq3Hy1JipP3Ee81xW
 2V77JpArObsYf32iEvcMI6u//qoWMWLwpDOXxfRlAdNx+10ikRlWC1jzSbcQrvctYoEb
 5F7xwYB1fv7sTxMvf3XkJtlzRpQAbjluNRgQrMDU3bbxTTYb06h0dYpIvRXyZN91gaPV
 GFzw==
X-Gm-Message-State: AOJu0Yx8YyLe8HFJIESflbRGv8BSSGd34NOkkcPUldGSKRMPC8cPrbpF
 P9/820X38irlnDuLUx/xmAltMqbwL70/mciIM4cszMidNqFFt/bMHt3e+bNLHw==
X-Gm-Gg: AfdE7clfl/vNQU7z3FdrgsN/v5TsoVz/g7KM+rMMKZVBjpP8QVG1Vxhlm4hwdDrpUAT
 OQ+mmyI6WIFpKgImeN4Q0M9g/pD1nMnGtkJYiSnUeoUxaLyjvC/7viV7/qyMKKJhjljtOLqYcfg
 L6NqRQuZ+z0CAwJMHA1vnxZ4kcr6fQCk6gT1coBtfrTi1w8iAmZLIj+ghYiqsF+SPHM0S2gT0DX
 XpGSovigt8X3BIm7BSV9vY7zAn+UCq5mJNQFjtt/yfxjb9RVAAKnRHWBBSWvCukcUOQof7q9kl+
 pWBmWR5vUlRCRPA80HSQVydSsJ0PIEYPFH5rLNsGgOZfrCiGZoLQUdqEdSJ9vzcp3meTrYepZjz
 RTCYaTf+6htSvGWiRW3EX9viUEF6NqvXullTtHCIewn5CogF8P9t7pmZOYz4dO+aFWxT7fkX3Wz
 4Twu7LXiUl4ImhBdfXWfOXkxSxfMIdLQ==
X-Received: by 2002:a05:6512:b9c:b0:5ae:d72d:1000 with SMTP id
 2adb3069b0e04-5b28a15cb7fmr1520779e87.1.1784300584640; 
 Fri, 17 Jul 2026 08:03:04 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39eb4ff7b52sm2827121fa.33.2026.07.17.08.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:03:03 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 17 Jul 2026 17:03:01 +0200
Message-ID: <20260717150301.2829199-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784300585; x=1784905385; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KcXrdpQhLXP6QSUjDp6lY4WOSGbIN5++Ym2lfDA2Iok=;
 b=Bo9FwkJizFkzS7Xxg1HBCMMth45rhYUhjQ5uO6ZDXtQ/j8lhoZYZ2TW1VxPBZzn5Xh
 JWwpRFODMTaMLNENR65rBG/QbVsQ18eIevJJOIZQ74PybeqZWR825rjmaH5zPS00q79M
 LiZJMqHNGsOvE/UNBKQw6WXTTn03pzms5Kzz3zq40dbL668Lr3quTaW9U8FTKVrIgfMp
 2b+IycRpttPotE+UYeif4cA2f0zNwgEITujmu+2quQHGPKKD+uYgac37E/OkbHijDz6S
 EKPnf6lr+FafkiUgmFcPe+VUl9t3srpHsquT6aZ0Wlfge/sKc1Ao23jfM4jC/2wG+oUS
 dn5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Bo9FwkJi
Subject: [Buildroot] [PATCH 1/1] package/mg: bump to v4.0
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

Major release, multibyte text can now be typed, displayed, and edited in
UTF-8 locales. Also, syntax highlighting, a visible region, and side by
side windows.

Release notes: https://github.com/troglobit/mg/releases/tag/v4.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mg/Config.in | 2 +-
 package/mg/mg.hash   | 4 ++--
 package/mg/mg.mk     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mg/Config.in b/package/mg/Config.in
index 11e5bdb273..35e0e6f57f 100644
--- a/package/mg/Config.in
+++ b/package/mg/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MG
 	bool "mg"
 	depends on BR2_USE_MMU # fork()
 	help
-	  Emacs-like text editor (130 kiB)
+	  Emacs-like text editor (260 kiB)
 
 	  Mg is a MicroEMACS clone with the goal of being compatible
 	  with GNU Emacs, because there should never be any reason to
diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 6a3e3465b8..147809f719 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v3.7
-sha256  05101360d2194392da0950e8b6f18d067d8af0fd2f572461ba4d4e7b4ccbb4c1  mg-3.7.tar.gz
+# From https://github.com/troglobit/mg/releases/tag/v4.0
+sha256  7040117fc8177b73038027fc59e62012c77842e4ef40ab07e57f7b69832446e2  mg-4.0.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index 59f1d1e316..0b5c14d8fc 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 3.7
+MG_VERSION = 4.0
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
