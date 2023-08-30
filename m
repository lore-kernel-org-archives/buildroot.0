Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37128C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E30B961286;
	Wed, 30 Aug 2023 19:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E30B961286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SguwcxlixilX; Wed, 30 Aug 2023 19:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3598B6128C;
	Wed, 30 Aug 2023 19:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3598B6128C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3A71BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70D8B418A1
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D8B418A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CyjNqkm2IW6S for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:55:00 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B5514188A
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B5514188A
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1bf092a16c9so385635ad.0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425299; x=1694030099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NmnH7x0dI9Y1ZZFangFHAdpzAA95D+1WT/rn/Fz68GM=;
 b=ZAdQIE9nAYFggoOLkV2am62oFNRTogSZTDgHQKZW4DXrlQsVfGC08leFvbsVojVX+S
 94IE/9PtHEVbZYW/08jwk7PuDetb4XV0KwAmjprN26wXPwOyECScCe8hSTqp0VhMmN5X
 bIr8/3ruv+9puLbvpGHijnzN3S5qmsFY6Y/DjfpyzPi+gzQwa0oPhrTP6cDuHUkRM2sx
 vA0taTQz3OymqXmdlOuQTLZSRIPvI2B7W4zaw9lZbyBEk0OguQ8RKAqrEfS/gKoI/EI1
 vc7QMmzUh9qpjjI0j6nXTSaPEMqyGGMO5ZSgwnqcU15Ul/o1DQMj0T9DEveG11GapLKw
 hhcw==
X-Gm-Message-State: AOJu0YwpAySYND014eTeH9MTITCrlXNBiLazpAMou519mepEOzoYuhUt
 WilF3XAvZa9jTmO7lFYIA5FIMGcPCgM=
X-Google-Smtp-Source: AGHT+IGwCyf7A91FrMwn7c5heH6Pa3VIMzzkklve8VQKxBVlbwmB/CkGom6QCYcDefn8gDV3Xqnavw==
X-Received: by 2002:a17:903:18a:b0:1bf:826:9e30 with SMTP id
 z10-20020a170903018a00b001bf08269e30mr3278722plg.16.1693425299443; 
 Wed, 30 Aug 2023 12:54:59 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b001b8a85489a3sm11345492plt.262.2023.08.30.12.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:54:59 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:54:45 -0600
Message-ID: <20230830195446.3958486-6-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830195446.3958486-1-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693425299; x=1694030099; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NmnH7x0dI9Y1ZZFangFHAdpzAA95D+1WT/rn/Fz68GM=;
 b=h5ksla6bpiTQLxeXqTwUKeQxaapA1Q1uLbetZtu7cEAwP+wabKWRQY0BAVrsLYGUcU
 Nb+juZciMMrbncRuFyZTW6YZGr6rSJpHxantXOCb3yfgPRi0vUBIt2uV68FAwU2028pB
 xCaCFVrtLda7Rz8x0QniqEvZWzoKA/4K7muDud/P5uwP4qZ8iXPZfThWQ7ZkyRV9mmD8
 Qyb1jtSTVLukNzhEVmMvPEzAqy07SxdrFJ2Ri0OAN9+we6bwXmquFpAy3jnjysn8hska
 /zBmZQ4AG+3Wm6zcWMUq35d18IYR7EyVWoXmlXgZoLM973/hC1vLIhXxp9ax+OsV8fAN
 3xdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=h5ksla6b
Subject: [Buildroot] [PATCH/next 6/7] package/qt5base: add vulkan option
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

Notes:
  - eglfs/vulkan is only implemented for eglfs_viv
    (see stub implementation for QEglFSDeviceIntegration::createPlatformVulkanInstance()
    in src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp and
    real implementation for QEglFSVivIntegration::createPlatformVulkanInstance()
    in src/plugins/platforms/eglfs/deviceintegration/eglfs_viv/qeglfsvivintegration.cpp)
  - or for xcb (see QXcbIntegration::createPlatformVulkanInstance()
    in src/plugins/platforms/xcb/qxcbintegration.cpp)
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/qt5/qt5base/Config.in  | 10 ++++++++++
 package/qt5/qt5base/qt5base.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index b876f1948e..0c7ed41c46 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -180,6 +180,16 @@ config BR2_PACKAGE_QT5BASE_OPENGL_LIB
 
 endif
 
+config BR2_PACKAGE_QT5BASE_VULKAN
+	bool "Vulkan support"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  This option enables Vulkan support.
+
 config BR2_PACKAGE_QT5BASE_LINUXFB
 	bool "linuxfb support"
 
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 028236d2ed..cc29f5523f 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -206,6 +206,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-opengl
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_VULKAN),y)
+QT5BASE_CONFIGURE_OPTS += -feature-vulkan
+QT5BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
+else
+QT5BASE_CONFIGURE_OPTS += -no-feature-vulkan
+endif
+
 QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
 QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
