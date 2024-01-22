Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E15C46CD2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 22:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFD2C41A55;
	Mon, 22 Jan 2024 22:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD2C41A55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kSjnPI2SZUab; Mon, 22 Jan 2024 22:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DACE4040D;
	Mon, 22 Jan 2024 22:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DACE4040D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 775B31BF853
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 511E760C15
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 511E760C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gR1lvAdt90Qv for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 22:30:51 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 808F560BC6
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 22:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 808F560BC6
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d71207524dso12833465ad.1
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 14:30:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705962650; x=1706567450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HBa7Flnx1ADieQqj7d1H/DaKvkdDAmSE0dhLMQAEoRk=;
 b=ZsfAI66QBO9tVsig+WrOKj7mqKaY7syhb0LUHgNRwhAw9MMXVQakGi+TqEeitcBu0G
 ElEgCsLNoqaUib+wY8UL2b59gTPGTq+LJa73HlwZ5Da7z2m3mAWUDllX2AXxI97BonU0
 lWy9w7fH8MpA9cI3omAkYwhJYUy1K3ZFVItWJMsx7o5rThtA+F8KHTXEbM6NZ0qnxsRo
 aEknhjUkDl475G4WSqeUWIF7E4crMyFHcEHbKFy3gncTFC/tAZpPTcQfKypcH1GDtA6Z
 mIxudAiAlcgBK50QQ5ui2RyDxoPzF6iej74pC/mOgdaLFLZw1SRXBBGCpZE6UM2vYZRi
 dl0g==
X-Gm-Message-State: AOJu0Yy1hqtey1vuL+tzoKUdkuW7LtycM5Lzjjcf1I56THNcnw7k0fr+
 SmFLaMtB+bQIJ58FxpesFtbl2IJUNWF11IRnlRsSkKvFBvT2dCbPNNsvVjEj4HhUYIEAd3wzFof
 E
X-Google-Smtp-Source: AGHT+IELeryKzzXmdUwsMkKjlp1umiM59O/wK5DizlhCvjMQK1fphqv2t7no3537tII3GWaGNdljwg==
X-Received: by 2002:a17:902:d4c1:b0:1d0:6ffe:1e7f with SMTP id
 o1-20020a170902d4c100b001d06ffe1e7fmr2823177plg.98.1705962649961; 
 Mon, 22 Jan 2024 14:30:49 -0800 (PST)
Received: from fedora.amarulasolutions.com ([75.174.129.54])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a170902ead200b001d705836d0dsm7528579pld.200.2024.01.22.14.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 14:30:49 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 15:30:47 -0700
Message-ID: <20240122223047.736966-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705962650; x=1706567450;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HBa7Flnx1ADieQqj7d1H/DaKvkdDAmSE0dhLMQAEoRk=;
 b=Y7zRTJMKjz1/cN25pxD3Gszf9TvwcQ6Hj7i6mldBVVYFqKnm9j+MQ7abV55vY7QPkd
 pj1cF3SiaFJFmiS7u0WscTpgeJhbJoBPYO3knOtFHOjRvSb6HueG7XX52cp06CIhA/CU
 ObEjTImiwWuE6LD1o7/dea9orPMtOn6WX2C5s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Y7zRTJMK
Subject: [Buildroot] [PATCH 1/1] package/vulkan-loader: xcb support requires
 xlib_libX11 and xlib_libXrandr
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Vulkan-loader package serches for x11.pc when xcb support is enabled,
which is provided by the xlib_libX11 package. The vulkan-loader package
doesn't search for the libXrandr package, but does use the Xrandr.h header
found in the X11/extensions/ directory, so this is also a requirement.

Fixes:
https://autobuild.buildroot.net/results/29caeed38a6139eb328d3b1df307776e837bfad6
https://autobuild.buildroot.net/results/55ddfd44393e3bcc2f25bad2f9ecb7e1b142a985
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/vulkan-loader/vulkan-loader.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
index f6dd9d0ac3..cf3aedce15 100644
--- a/package/vulkan-loader/vulkan-loader.mk
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -25,7 +25,7 @@ VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
-VULKAN_LOADER_DEPENDENCIES += libxcb
+VULKAN_LOADER_DEPENDENCIES += libxcb xlib_libX11 xlib_libXrandr
 VULKAN_LOADER_CONF_OPTS += \
 	-DBUILD_WSI_XCB_SUPPORT=ON \
 	-DBUILD_WSI_XLIB_SUPPORT=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
