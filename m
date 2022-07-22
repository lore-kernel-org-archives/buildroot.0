Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFC2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCD660E4B;
	Fri, 22 Jul 2022 07:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BCD660E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6-rUXtS45Pc; Fri, 22 Jul 2022 07:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FEC460AE0;
	Fri, 22 Jul 2022 07:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FEC460AE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BAB21BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4566F60AE0
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4566F60AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ui4Z0c8RE43 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:02:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF85B60808
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF85B60808
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:02:09 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id fy29so6943544ejc.12
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 00:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mG4jMfLucp0+a99Y9aWSY9SRDL+zFF+N7Y9HJAPs9v0=;
 b=U8r0Gjjn0vRp5BGPbygm6FnBTba+NCcg04xf18oOl7gRKPT/hdjktwD9hVI9qD/Hkb
 yCj9FocyHyuVBZAUbqBg6myDSiyPDnRA9apE+l5pGBOGTqqEwbEJqtuNZo3pzemGQ4cK
 3/VwB1as9+QOW2znswUPB6t95yuBX8q6uS/UeeP6wmZPEjfzUkzhbdTWrak32jB2dv0+
 DGI6qOQNkoz7FT2gH4U8gawN8veDbd9q6nHdkS5eUjzSlOsixa0VkuyO3WR5gTw34Bhy
 dhI67bI2v54HSq6OLh1rVOgWxHRkDAEso67uKuvrLeNq5keER3GQ61mDuiYF72pD65yW
 SghA==
X-Gm-Message-State: AJIora9X9HBFjbWkbWzNUFkyOh2av1AUiyBrON/xH0rHM84XJO3uGiqo
 h5RNaVSok/UIxopUS4esjxgPczBnrORl0g==
X-Google-Smtp-Source: AGRyM1uGmHWW+JKwJ5qMbiUZeRxmywDEQ0n8QGDMZI5OQvMxelN1KvW6QeXQ6PWBDcrT+ZUYsfeWTg==
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr1929021ejc.755.1658473327522; 
 Fri, 22 Jul 2022 00:02:07 -0700 (PDT)
Received: from mercury.lan ([5.2.194.205]) by smtp.gmail.com with ESMTPSA id
 s25-20020a056402165900b0043bc19efc15sm2076499edx.28.2022.07.22.00.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 00:02:07 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:01:50 +0300
Message-Id: <20220722070150.40715-1-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721144939.1265027-1-ardeleanalex@gmail.com>
References: <20220721144939.1265027-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mG4jMfLucp0+a99Y9aWSY9SRDL+zFF+N7Y9HJAPs9v0=;
 b=PbCkgHjC2jrY5Gm1f20J6gc/U7t/NhOxHmlbwxYeqBFIlgaX3DRDN1D1IFNrStleXy
 Cqbvsm3cQK6qEvhk22+ae5oVdDCSpNeGTc/9KZqhlY9NiIPBJKnxvUDdZKrg1J3PgPJf
 FLESP1wq9NVkSANr74OQAl+i6potHJM0m+n9bnL7neFV2IyUvzmHvbOzD1+yM8B3mfeV
 6R05819EDAbDqlbbbT+kXJkTlqxV8nAfM2K23m5UouVSuOIb3hrEK10+geYYBRHqno3E
 BHXWeDJulXwDp/6cLJU6a18Ag8QctK4saiWzMdFoMqRHjs6OSyo2mTQrZ1zZuD3gdiLP
 EZfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PbCkgHjC
Subject: [Buildroot] [PATCH v2] package/cog: add libgbm as dependency when
 building with DRM support
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
Cc: aperez@igalia.com, Alexandru Ardelean <ardeleanalex@gmail.com>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with the DRM support, it can happen that the libgbm library
is not yet built by the provider of this lib (specified by
BR2_PACKAGE_PROVIDES_LIBGBM).

The docs in cog `docs/platform-drm.md` specify this dep-list:
- **WPEBackend-fdo**:
- **Wayland**:
- **libdrm**:
- **libgbm**:
- **libinput**:
- **libudev**:

libgbm needs to be added.
Adding libegl as well.

Updated package/cog/Config.in to define the dependencies (for DRM)
according to libegl & libgbm.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/cog/Config.in | 9 ++++++---
 package/cog/cog.mk    | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index d4238750f9..484eb85c70 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -39,7 +39,8 @@ config BR2_PACKAGE_COG_PLATFORM_FDO
 config BR2_PACKAGE_COG_PLATFORM_DRM
 	bool "DRM backend"
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	help
@@ -52,7 +53,9 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
 	help
 	  Expose remote control interface on system bus
 
-comment "DRM platform needs mesa3d w/ EGL driver and GBM"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+comment "DRM platform needs EGL and GBM"
+	depends on \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_HAS_LIBGBM
 
 endif
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index f2ca0af93d..da660eb7c1 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -28,7 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
-COG_DEPENDENCIES += libdrm libinput
+COG_DEPENDENCIES += libdrm libinput libgbm libegl
 else
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
