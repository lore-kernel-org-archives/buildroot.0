Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A017EC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 12:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7202640F0E;
	Fri, 11 Jul 2025 12:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEQ0JgnWxQEP; Fri, 11 Jul 2025 12:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9877B40A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9877B40A77;
	Fri, 11 Jul 2025 12:06:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48FE4114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AB6860D50
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C44ffS5JaEG3 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 12:06:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88E4760D4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E4760D4E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88E4760D4E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:06:43 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae0e0271d82so368468666b.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 05:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752235601; x=1752840401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dG/RekkPIhbPpmn+7EEpaidH+VSjPlJGCLVotdQsUdY=;
 b=jPqVinDeOTvuIlL6PuaZeTMOp2FbDdy7sfTpgOBj21sWVSZ7s2XIHvCjtwyUfuRMfe
 AMiMABm0vg/kKWSGHS2/8fbW8f955tAmNS8KKEadA4DlF1GjiXyz6ffLOfFZ2FfYktjf
 /oiIR1mUBW/10dp2d23yqR359kyxQ7FoJk/qt/3d2Afg0MuS+5zIopSFZbcnBLQcyjN9
 /PgyPSvdDjVOue6fsy8LPC8FkF8p9cmz9x4qO7o+SvRwL+w2HrKo6vnQisJZSpKOOUz+
 Ejy8Yf7kwdfzR+Zar3skHej70KKOgp4vyWthGT5rK6+yHUdBbDfM/lNwG0NyEgKzDm+f
 gtug==
X-Gm-Message-State: AOJu0YzCCUcSTDzR/d5w6cWebB8csbRQ6frtReANS5i/FqMfq++AMXoH
 xJrJqZrzUTRIcArs3QyxRXHYDa7G4GEk+aJnDZR4A1fvzodsCxeiWJLgCqd+jA==
X-Gm-Gg: ASbGncubPC+6g90qsjOY9ue2BNe2+a54sWQKdMghVJaREbNZZU0ZGx5LEsA6hoDJC2L
 RTsmpEWLGKGVq9Jes+teBMeqL3wgLDob7njIiy8/QCtq++n2U/bzOW7qbQ7geBT3xhwXps8EMTM
 FoDOKLr0mfba0MxAii7QGz5HZBZheKLt9Gb2ez01joBPhb6iXXTOd0cvTixqPT2NbhltEQ0j/Nx
 24R+hBZmwXxrEOuQHy/xgI/yH8PMNugQvxoVL0lqqO01JXFxjScQ4yM63GOvJZqltQLwPxYsWJQ
 kR1pcDtZtn7umoQsKhR3BvtLihOzvurs6dNbYZtQ2cHOMJvEbEHnMhakpc+dK0asmJZReR0MBrh
 XFPUUHkYU2g/FMMdzgdF/c1XZhdj+cLOfnUeqBQ==
X-Google-Smtp-Source: AGHT+IE2kKJdndi75z9Juvgpvas/c/p62QCBDEojZiIPn0/7BvDbx2LvJm0FYNM7AI78wi5FxRpnag==
X-Received: by 2002:a17:906:c115:b0:ae0:d201:a333 with SMTP id
 a640c23a62f3a-ae6fbf20e11mr304104666b.30.1752235600867; 
 Fri, 11 Jul 2025 05:06:40 -0700 (PDT)
Received: from hthiery.kontron.local ([77.21.162.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8264fbcsm285331666b.75.2025.07.11.05.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:06:40 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Bryan Brattlof <bb@ti.com>, Michael Walle <michael@walle.cc>,
 Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 11 Jul 2025 14:06:26 +0200
Message-Id: <20250711120625.316250-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752235601; x=1752840401; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dG/RekkPIhbPpmn+7EEpaidH+VSjPlJGCLVotdQsUdY=;
 b=k/cXIhkrzm/m0tZ6HAGvptxlFlLtKtrniWoBvUsgmq0gOW5zSK5kielOL+QeID2HX1
 QCdeOLHzPn96/wgHcxH+XFhIV6NEhyhdvCFoGXdfGke9nvMLBYt2lZ/UNH7J9aX9FJqA
 5EoB+rsUrOez/Lv4NQVdhgmQDr9gVE6ReQO7YzXTDlk29XfSKfEAq1e9fMreho0278Qb
 GFGsaZLFZWRbKSWFoPPDQw4SINZ2FPIyZUwuTuje0HBC7XpqBOQAKzI7K9MvAkX5h7yW
 UrGASde9DWAhp7oida62w5V3cr1SkJqw5y5VAoqvfDfp8/ef9AyB3OA+l4es4O9UlEvN
 UmoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k/cXIhkr
Subject: [Buildroot] [PATCH] package/mesa3d: add support for imagination
 vulkan driver
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

This adds the experimental vulkan support for the PowerVR rogue
architecture.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/mesa3d/Config.in | 8 ++++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b5c1d92d68..7ec8fd2f76 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -359,6 +359,14 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	help
 	  Vulkan broadcom driver.
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
+	bool "Vulkan imagination driver (experimental)"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfence
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan imagination driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 998fd25584..716e11044b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -135,6 +135,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination-experimental
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO) += virtio
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
