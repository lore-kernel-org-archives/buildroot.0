Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DD1CD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 22:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D704F4110E;
	Tue, 12 May 2026 22:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6bSaenQfGBj; Tue, 12 May 2026 22:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D383C410FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778623498;
	bh=PgWS9pdzkJMgw3FC2LV2sZ06YVDuVw1yB/U5AKfprs0=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=He/Jq1CV8hCN6VjJ1O+t2jJt4fIMn1v7HOnMefTHYL/jr8VI7IuctFXHXsyhxlxVe
	 RGWQUgPjH3EVWZ61tc6T1VjI2xMF/hQ+9SkhAONzgfHa6rK1GDnTFCP5byNFr7RjQI
	 S5HzPYEZ0OftIhx02Rdi8k1pXXBU0NhW3H7FZjnK/gqZE28CdtKkFv8R4Y0BdBUgHk
	 4KrAgrniAElt3jRa25CiQK98CQvJndN2xxIHjWzSisDVkC18QVpEiuKIu5q3zUPKc5
	 tHUYlQfH/s+6AKVWtK41/AaqgEY1XrqhYbt0iOUrMIXcqxFpvwX6wUlSNcUb/sNStq
	 nFh5ppYJwYttw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D383C410FB;
	Tue, 12 May 2026 22:04:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6DB15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED50B40D66
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3A-P6-WFF5vN for <buildroot@buildroot.org>;
 Tue, 12 May 2026 22:04:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 647AE410C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 647AE410C7
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 647AE410C7
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:52 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-837dfccd950so2955316b3a.0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778623492; x=1779228292;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FXl5PPEdsY8X8N9ROaZYvEO9aecvAQxtTXg6XZ6gR+A=;
 b=N5li/RqbwoIfcPOGsjkmLeglB/IKAY34ZU2B+5XCQISBE7X3hIWJIU1E/WWYqxFkGd
 MiS1nAxHqGwIgUgDSnt4PnvplDcohYFbEUc+xZmvdwADMkJGj69tg4DJAn0VuVPjnbRd
 F8NavEc4q47r3/+YOS11HRr3iIPJ6kHVsPO4rX0MvkHgOSxx2ZHCp807O3EIMaJqiTzB
 V8mRZ4GE5BjJnvQKhD/2BC+npTaS/2CZcso3IpW7+UBoc+QFPqLwA5V2ttJ7vrTpwGgT
 +CjWp04mYJSQaURUBx7ZFMexDs3Artb0HhzRipEQOwHq0oVVrarpPzN+Flck9VuCwbmK
 8YRg==
X-Gm-Message-State: AOJu0YxmaBBd4z+lUNaHZgKTXTvBLgJ/TpSWqr/ye23ONxZghka6p121
 /YyxNPYlvfBi+DWC95pXDf3UNWCArUsOaBU5yo27Cq7epc+W0MMsE1fCikI5kfae6ZI=
X-Gm-Gg: Acq92OFKm4NK3PX9zDaHZ9cwv2l+8qHnqZEGFsSnJxh7+Xd1bKtSM4SzHdlARH2AYdP
 jcg6sOSSiSIc9nL4rj1E8GKXVNHHdod6DgMiyyl8893tUSvhc624AkPe7Bgw0foq4Fm5WV1RtvL
 2yHnqUVT6nHnKUlnCchvIYePy0y5r1mZXjc1qmNeLlg7S+XfJTTLrAF7LNE9MgxAuHYLdwVVq+Q
 u7aNfM10xsBvhwuABxwGmMCeUjyXhTsbO1QZ2+YpaXX1ZUt7frPqNiUP8uHmp2QOZU1fB6Ya/B3
 /MZ6CA+TGKOxuC+2WgdwMMyRr0ZEinzrRmZv+/hewWlKdT0LnM91SzP/SgVqE49YR0wV0y5bX9w
 Q/C3LMhfo1T2BNhBr2XbE7JQmaJ5W5gOkASxI1Cu1vehdBWN13CAEsCshHqMe9uutvDED450HnH
 Vgcr/B2we+SlvnXtyJI8ZeLTq91YDZ/Q==
X-Received: by 2002:a05:6a00:3d16:b0:838:c01a:7a4c with SMTP id
 d2e1a72fcca58-83f05c17193mr128793b3a.33.1778623491486; 
 Tue, 12 May 2026 15:04:51 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839685a8125sm24388390b3a.61.2026.05.12.15.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 15:04:51 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 12 May 2026 15:04:46 -0700
MIME-Version: 1.0
Message-Id: <20260512-mesa3d-amdgpu-virtio-v2-3-30678b797df9@anodize.com>
References: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
In-Reply-To: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778623489; l=2458;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=m14mPqS0x6lXjp8c2qxKNDCk5m3C8LkQF32sDqiJkwk=;
 b=wiAmlSXsB4Z4QcteQaA/LDiADdqDFy3Q5Xblc+zUo90xxZKDutqHwfAioEIGpJss4GgmcYa9p
 WHachN8Alv2DPoaiVRsIJ4UuNijNOI4ZnY3lGu5csJ205jX69LbOoTR
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778623492; x=1779228292; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FXl5PPEdsY8X8N9ROaZYvEO9aecvAQxtTXg6XZ6gR+A=;
 b=Eii+pk7wkcLnOeHgq2FDBBrg2mc5gOSxgL5isDTHm/FsXHC7qBW42McuCjCU9EmCj3
 D87oyJVea30tMdHDWNNyJ7fb9uoE95Y7PS6YbnCKPL1uyaqYKXR3V9EE0Ra9KgtrgXlX
 tL5fT2GfjU70gZJN9WiCf6uNUYQzPhsO00JiCg3WsXNqfZhC1OSpHKk4Z0Eb4nAOmL29
 RrI/zw/fPjBc5sLCjLiAWDF4V0LNPaAGH4urhslCe2WLitYJLdRHwhintwTeqv21YeLw
 sCsIsuainJGkxaCkFgsBfQsr1x5+uAYIqk3udXfs+Ou0iNj4aQ35TC2nwfFGXqSLdllY
 Z2Mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=anodize.com header.i=@anodize.com
 header.a=rsa-sha256 header.s=google header.b=Eii+pk7w
Subject: [Buildroot] [PATCH v2 3/4] package/mesa3d: add freedreno vulkan
 driver config
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

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
 package/mesa3d/Config.in | 10 +++++++++-
 package/mesa3d/mesa3d.mk |  3 ++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d4e0987a9c..9ac92ee2d9 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -356,6 +356,13 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	help
 	  Vulkan broadcom driver.
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO
+	bool "Vulkan freedreno driver (turnip)"
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan freedreno driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver"
 	depends on BR2_arm || BR2_aarch64
@@ -431,7 +438,8 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
 
 config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
 	bool "freedreno-virtio"
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO
 	help
 	  Enable VirtIO support for freedreno native contexts
 	  used by the freedreno (OpenGL) and turnip (Vulkan)
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d9916ca359..a0be555860 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -130,6 +130,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD) += amd
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO) += freedreno
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
@@ -157,7 +158,7 @@ else
 MESA3D_CONF_OPTS += -Damdgpu-virtio=false
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO),)
 MESA3D_FREEDRENO_KMDS = msm
 ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
 MESA3D_FREEDRENO_KMDS += virtio

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
