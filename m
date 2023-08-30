Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2C8C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A2B761259;
	Wed, 30 Aug 2023 19:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A2B761259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mVuABL9vLf6; Wed, 30 Aug 2023 19:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B4A6124D;
	Wed, 30 Aug 2023 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B4A6124D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8928E1BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61B34822BE
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B34822BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFMEAZORswhC for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:54:57 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66D7B822A4
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66D7B822A4
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c06f6f98c0so227145ad.3
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425296; x=1694030096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HdfEPiMwaCZ4viatq5oPJ5OkSumdGYqSRrmT2sToj0M=;
 b=PY2yJlzL3nEPH+BXicSugtwK7JrH+iMaxBBKV+TD0DC6iavgWE5uAHA4STQZR0omwr
 flYaqxD92NbSfpzzmO+gLELtQRkIYzAfvYZTc/yvh14B6N41e1ky6pY7tDlxuxNw892o
 xZyAG3r4eUlyh1ps8ck2bgeKeBb6jaYszQdajf5BdMjOPC8ZA7WaHoewk3PxV1oklV8e
 T2yujhVkXA/FJR6EF1Or5ecXQFXkqK84BCpPfpNTYGCetf3UOkELQ/2n5lpE6/5X0DFd
 ozvMt49WOxYSX+jjJk3SGMNJjBKoC3eFOavswYyYeuuhsbD+c337boMIYzwAVYkLYrX6
 dXBw==
X-Gm-Message-State: AOJu0YzgC2ZUlzBdx37Vtr2S3IR9Otm45SlUPk6lzdxkreA6l+drD+yC
 rSsj0/yX7wxq2wkdtaeQHQEZjEsCQ9c=
X-Google-Smtp-Source: AGHT+IHqr8GtqaJSxCF0Pk7F+Dp7Bw7C+xBbnSBJCrA5cNYkUT8u0XzfnpS+QZGIFo2yqUc0wQeR8A==
X-Received: by 2002:a17:902:e741:b0:1bd:c931:8c47 with SMTP id
 p1-20020a170902e74100b001bdc9318c47mr3445246plf.68.1693425296316; 
 Wed, 30 Aug 2023 12:54:56 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b001b8a85489a3sm11345492plt.262.2023.08.30.12.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:54:55 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:54:43 -0600
Message-ID: <20230830195446.3958486-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830195446.3958486-1-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693425296; x=1694030096; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HdfEPiMwaCZ4viatq5oPJ5OkSumdGYqSRrmT2sToj0M=;
 b=Y27JHapb7doUrJhfvzwTWzCILuYsr8j4yQhHU6PC0uMj8Ri67eVrO1Is9d8dJm+IEB
 5D5CXW3gW/vAAcTz/2HEqukVQTqyTLi6ydqILAXH00PBa2/wy0yseaF13QhscGChb6Lx
 ogz2J0hId/MMlGUfbOnYro3XZKE1WRNtWYNI/3DUqJJgHCSU/IoLEImo4xE3Vr5kbYcB
 cBE+NsRsyTO2lPSZW7k8ixk/o6UVQNfwWOIz7gZGiGFCkIORWll7HO9m131w4x0LP78a
 hehx61Q3YqDrSvbJTnKvnCEAd7bUFTGzMA/U+Mi/Kys9mz0xBW2K4RtlLx52W4mdcoBK
 LLNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Y27JHapb
Subject: [Buildroot] [PATCH/next 4/7] package/mesa3d: add vulkan broadcom
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
index c7ee2a8db0..a32fce755f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -299,6 +299,16 @@ comment "Gallium VDPAU state tracker needs X.org and gallium drivers r600, radeo
 
 comment "Vulkan drivers"
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
+	bool "Vulkan broadcom driver"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # dri3/libxshmfence
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_MESA3D_OPENGL_GLX
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan broadcom driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8f3d224417..67573909a3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -119,6 +119,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 # Vulkan Drivers
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
