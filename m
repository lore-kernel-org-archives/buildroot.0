Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0A5C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6CE8423D1;
	Fri, 17 Jan 2025 10:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSh1RjpJTMhw; Fri, 17 Jan 2025 10:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7212D4123A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7212D4123A;
	Fri, 17 Jan 2025 10:54:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24A15B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59DE6410CF
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9HfCvfRxrlk for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C0FB40877
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C0FB40877
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C0FB40877
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:49 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-540215984f0so2122183e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111287; x=1737716087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqKHfhi9oVtyTwyCmCIX+8vY7dGQS+/RHD3juiLvd1Q=;
 b=eLCmSAmkVCCB7KeSMlUH+Upx446yt5hayIega9K5RkgrQZJLWP6qlNtXjgxgJ3A5FH
 hZVX9/ZdtsxB0gcSfuZAWbh2uDA1NY/oYfLRyoYOSXT8GoiZE/vmB+VCcDrLo/yP3iq6
 PWir08tT1RG7lDwuK5D/NqYz0Ok4wfTZBpSNIRafSGgxHARAcBrdxZcwusVoZIBY5lZS
 m1g7I/06wYu48NFpGzNWXBR3dff+qAfmJauhzZUvUBNoNQsVSduyg/hf9UZMtje/Y1f9
 W2t7uyE/mnLssdKtssXq830qw954NmI65h4/ploIEv44SiST6shZVOTO9aZNAOuPg6Wn
 fbzA==
X-Gm-Message-State: AOJu0YyWK39GH+Hydd+cdaQDClQg/WMjDZjjOC9xwSZZRcup9zixkOjH
 vZ8JsrDxf5ZNQ9HyqzwslsC/0IAUA+/ssJJviW1pT9985naItWFF4z0hyA==
X-Gm-Gg: ASbGnctTivRPAux+S786hgHZjnIekDPuF0i+pGM7tP3SZePmHoMDFxnbWCizb7/m4B2
 ifhgwZiUKhiKpi6tC7oOVQmXnVpRHJQJ93g35PF5VXxbNf0r2GM4yhLIoG+BWQKb8mH6S0idVBV
 zrWw4o+P9SFDz4cYbzi8Fp8+F6GmkaEvKCdVlXIRvL56CFRHx0lD+EBnuqXr65C47RoQm4t8aXb
 lxt0a8O/Kq5wzANbm6TEifW6p2UL6K1IPb1migLaB+35o3tvVwuXpWC2oVmbgxB4aJACtODbUel
 iNS34BIqAq0=
X-Google-Smtp-Source: AGHT+IFtttCyGzIW6evYNFQL/clNGuVkNwsHv8rKnswnZ7dOJUnz+loUPwBkg+3r41JjyMdwmMv0vg==
X-Received: by 2002:ac2:4142:0:b0:542:2388:3f0d with SMTP id
 2adb3069b0e04-5439c287aeemr546496e87.45.1737111286944; 
 Fri, 17 Jan 2025 02:54:46 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:45 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:40 +0100
Message-ID: <20250117105354.618220-17-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111287; x=1737716087; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqKHfhi9oVtyTwyCmCIX+8vY7dGQS+/RHD3juiLvd1Q=;
 b=R6m1NpZ96WBaoE6wtA+ed4gyPxNCBSYvO9ShEj4KqX1X7vBr6+bOpU73CwQv7hb3LQ
 jhym2nQeqAdEdehCiz+b4LJPVHLyeWgUHlkeu+tWW7t4/+k7OgLmh5ICSbfnpGOoHCoA
 6Hn8b+G6kUcn4m1M3y0VeS42VJrWfgVDWkKIGZOWejuqFXZPOjgPl0mzoO5+Yxy8eB3a
 5+Vg2HHsR0bujbIm7hzEgX2zTsIIsoVhFdcNkwcXIr87yMLWV9tUHKheko/8VHe6APga
 vfcsh4h0r8AmExqmuVqDtF9R+sAjcrzcWWel187YoRvkVFY0942lnEwX5XG2T/ETBUhU
 B6CA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R6m1NpZ9
Subject: [Buildroot] [PATCH 17/19] package/qt6/qt6multimedia: be consistent
 in using '.' at end of help text
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index bc57481b13..e3a25c31b0 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -38,7 +38,7 @@ config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	help
-	  This option enables ffmpeg media backend
+	  This option enables ffmpeg media backend.
 
 if BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 
@@ -63,7 +63,7 @@ config BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
 	select BR2_PACKAGE_GSTREAMER1
 	help
-	  This option enables gstreamer media backend
+	  This option enables gstreamer media backend.
 
 if BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
 
@@ -75,13 +75,13 @@ config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_OPENGL
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
 	help
-	  This option enables gstreamer-opengl support
+	  This option enables gstreamer-opengl support.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_PHOTOGRAPHY
 	bool "photography support"
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	help
-	  This option enables gstreamer-photography support
+	  This option enables gstreamer-photography support.
 
 endif
 
@@ -95,12 +95,12 @@ config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	help
-	  This option enables the linux dma buffer support
+	  This option enables the linux dma buffer support.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L
 	bool "v4l support"
 	help
-	  This option enables the video for linux support
+	  This option enables the video for linux support.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	bool "pulseaudio support"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
