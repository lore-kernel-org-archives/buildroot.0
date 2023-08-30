Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0D3C83F15
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5489E612B8;
	Wed, 30 Aug 2023 19:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5489E612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhxBOJz7H4qN; Wed, 30 Aug 2023 19:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FB5D612B4;
	Wed, 30 Aug 2023 19:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FB5D612B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE6981BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D510D61259
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D510D61259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNniRVyzPFCz for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:54:59 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E3F461257
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E3F461257
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bee82fad0fso278665ad.2
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425298; x=1694030098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJhR446C45eXkFvIwPcaZBqvDMgqK/Wm77uaYBEGDcw=;
 b=IVd8w+HUluvLYeYkVKEAlZl8of/JakTnfEfh4xr5+ncWop0Kc1clg2v9SCHfCPkhh8
 5QItzhVWwzzrHH5yZFeNN+Bot7CIuhOT2jgwRgcxf6ea9Hhi5PYyrKqmiT8SEWG6bSva
 K89VJbs1o1P2ijHDNWGr7+j+ZKnYDiyiblblFqkjOjQENMXxG0gLAdpZI3iOljN4loQT
 r/keEzeyzDjLX8cMhLkvDlAuvOhlqT82yM5ODmPT66StetDMl/kPEeF5W0usdfrdt2c4
 UFaCsOYIV3nEaosj6+Anv7zYyn50/GmDDZUcju2atwCvnEEtKHqYajkw9CFX4u8bLqe+
 5/6Q==
X-Gm-Message-State: AOJu0YzUY1FC1BdOHnk9JMws8PttEevJy5sNEJjpFmGSQixcEUCiun+u
 9Qg7v5SFSc09GJaXrQd3DYBMigzxjXk=
X-Google-Smtp-Source: AGHT+IGqb8ChbUm1v2+fbcux5Ufs+aQUPgx8AbMrW9gt0+l/Xv2+jxWjCKQkMZAaUy66Q9RYpXmkSw==
X-Received: by 2002:a17:902:7887:b0:1c1:f0b3:e903 with SMTP id
 q7-20020a170902788700b001c1f0b3e903mr2641980pll.48.1693425297944; 
 Wed, 30 Aug 2023 12:54:57 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b001b8a85489a3sm11345492plt.262.2023.08.30.12.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:54:57 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:54:44 -0600
Message-ID: <20230830195446.3958486-5-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830195446.3958486-1-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693425298; x=1694030098; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJhR446C45eXkFvIwPcaZBqvDMgqK/Wm77uaYBEGDcw=;
 b=amElDyQ2rHvY1UtSe3fUO29rHs/KXVZjbwOR3/jfznszw+0nwOwIo6l48q6t3+6IVu
 njDv1YamcDHRgqYovBRCayhtGNqCi31pGoZ/Zms9yXz4zbywq5L5FvSykSmY0pMxbT5Q
 ldW21lk/+hZNLh00RIT3mYUDWFWG9dpJ1/iwqWd5Z186ugUmxU7oSUvX72tn4XiO3zkD
 onJR6uUZ+noRCKDBQ4iFXLca90rMe8zMEeAcvvHnl4Gg386BvPuGdJCvc7YqwfOCNuAz
 C9nbnbMHe95+mdAndLCXv//aEf7Dlbcgl+MIog/lEN5MncqOT5jpjDRBxYpC23fE8xUm
 CZtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=amElDyQ2
Subject: [Buildroot] [PATCH/next 5/7] package/mesa3d: add vulkan swrast
 driver support
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mesa3d/Config.in | 10 ++++++++++
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 11 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a32fce755f..0340b972e4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -326,6 +326,16 @@ comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
+	bool "Vulkan swrast driver"
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan swrast driver.
+
 comment "Off-screen Rendering"
 
 config BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 67573909a3..f86140f17e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -121,6 +121,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
 MESA3D_CONF_OPTS += \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
