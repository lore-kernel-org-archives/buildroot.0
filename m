Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33CACD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 22:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3C7541118;
	Tue, 12 May 2026 22:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeUHA3qgh1XM; Tue, 12 May 2026 22:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9540441106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778623494;
	bh=At5P/sSgj8BAm0s/CZLbc8ZtaTkBUpmqGtKPpjvWwOA=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hlRyFwMUrHm1/DB6FXlYXdpY4A3qr1jy7xiiWjckZ5T61ju1VwGf6KKFi29KC0GGE
	 hEwlsZkrOKjs4w0vQFK0xt9w/Dnr4deVFcc1kDSdwnesZIJwGsGLKRzV0BQlQNG+Tz
	 cXhxsYcQlCX0PLFfm590mP3elq5Lv3l3i98pDCIfk4BtdZv7aL8p0abFvxMFKYjFm8
	 /9LlUbh7osAFvQoL6FaRWBaCYMzc2qVn5Z1NFf5KRkqwddG2s3qy8OM+2/tGDWXCtM
	 kP4AeYQ1lU885Wj6LT1Nxl5UDbKaB7LrAFMNI9Wt0VyR8MOd96KO+6EDLdVyfd3SbO
	 //rtoJEAVnXtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9540441106;
	Tue, 12 May 2026 22:04:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32BA0270
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18AD3410C7
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpfCfVgSQugx for <buildroot@buildroot.org>;
 Tue, 12 May 2026 22:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 245CC410B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 245CC410B4
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 245CC410B4
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:50 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-82f8893bff3so2812640b3a.2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778623490; x=1779228290;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tZ+H5C7kicYKReh07Wykq/hDk6EVtrp91yCmtAu9BYg=;
 b=MvVJ71/gDLSoZeZC/awqmSEnvrDf8x3/fnUMm+5ylczuplrtR1W5q8CKEmGjJkfcQk
 6eGw+Q85F+UwUnCHTB/Zt5iW9QUxuGiF4WF6r4Fab6xIZeT1HaZBcbTkKt1TRt6nKN44
 kzlRqmFCOjXcvMeDx5IIJaXHCuAnHgfhjznwr98j6hZAdPJhJkTxTgaaXv41WuIAhEn4
 AHROBkDWeWLnj0fU7EoLd9PzFVQDVxls/L/PFa1ZSAyRv911rSVIs3tIykLQ3lw1PhUD
 VLXR6miLN72wgKXOMseC+VXNC8jWOKQQibPkLqqwD2C4YMwtNrkuqag6GyUatyraSk9T
 kW/Q==
X-Gm-Message-State: AOJu0YwGpkomvzpwSUD0StRO4vcxD9/tUq2gSulh7rpgJ9r5MeDAgPq0
 UN707ehkiliOZuqKBviLUJIOvlAdHFiuFg5qYHsdahGAHZSF52RLjfExoagLMHHoviE=
X-Gm-Gg: Acq92OH2rEa+xa4JhGwccCzt7E4s+fRIyKWoA7ekLiy3kWnWKpM44p+cBKfU0RrKBQl
 SFa+tj3SdM0ibEdCStO20bQFyScpc9lj4QVRGEPIj8PzYWzosWNN10PyY8aTPSu0RwZ+GPKDEhZ
 VMDJ7I/TgvQzcmLkznZ/9nivapqZ8YSLN2APNOPNk8bMLwDXxFZOEI1qzRH9WXAbfbZ1MbNuqWu
 He7weEEhnq3UkDkAYHBtroTXQy3iyiDtrmiYAuC/xyJIKYRIjJ9Fsx2C2rGbeipQceuYLqOK3ez
 eydWzQBgdUPQAyyleTf6qzD848aEBiQT50kUdZGlyUIrf0lP8AuF0vq5SGzY+TqcfJBXHqmYNSZ
 gWEfApv6UvEKVU2JTNDStTZzHuCFmLetqHTw9tT5ytSUb4QukBrPPIaCjCNV8dMBOtFUfIKuLMh
 pyPCUFflk+b/BQr3emnA+W3buSKNFPYQ==
X-Received: by 2002:a05:6a00:3989:b0:82c:6da7:2d3d with SMTP id
 d2e1a72fcca58-83f03fc27eamr481196b3a.11.1778623490390; 
 Tue, 12 May 2026 15:04:50 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839685a8125sm24388390b3a.61.2026.05.12.15.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 15:04:50 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 12 May 2026 15:04:44 -0700
MIME-Version: 1.0
Message-Id: <20260512-mesa3d-amdgpu-virtio-v2-1-30678b797df9@anodize.com>
References: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
In-Reply-To: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778623489; l=2772;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=XBXZbQsu9tsnbVPYEue6Hcgjzj9O36GU1HGRRC8Ajnw=;
 b=erG1hmlrQX0JoLuEIzszDBlPf0j39M7x3tP+6EZa2yABf76ntvRhxjNtEU2c0qdzB0Mmic8E6
 txR+2y3SNfED5JVRax9jdMFJZ0Zf7z4+qeHYkY3r5ycKJvkrlxs7jus
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778623490; x=1779228290; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tZ+H5C7kicYKReh07Wykq/hDk6EVtrp91yCmtAu9BYg=;
 b=lQ4TKBxiEpv24TdWiQcd33iDPEuONT1vo2hHegooqyDOaz0me/HXsgjaOKCvZGgcfz
 5tXhKsevK36fVUUpjqRQp61GkB5nEJ9vFUJZ5AdhMD7KUEsOmXabl8N1Y18VeTvc9xt3
 ZfSFe8XaJ+U/N9rv6rSNKQ9FWD3knli/n2YGJTEkSDswYr8htE1/zbgBbF/YtA/iSKmJ
 NOFRwq8aCrqvDXRZxtDL9wyfknFAaTevZiCUBjxWSzBivYgrqyNvI1V3fiLhCMTijkkz
 WNFNwJAO3j5mGdLCvJAv4qFk4JZlHauDIV+eqmiZUM9lXm4OYvfcEzbnj4G0v62R/Dcb
 uw1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=lQ4TKBxi
Subject: [Buildroot] [PATCH v2 1/4] package/mesa3d: add amdgpu-virtio config
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

Add a config section for host native context drivers, which currently
use virtio-gpu as a backend to mediate access to the host kernel's DRM
uAPI.

https://www.collabora.com/news-and-blog/blog/2025/01/15/the-state-of-gfx-virtualization-using-virglrenderer/

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
 package/mesa3d/Config.in | 19 +++++++++++++++++++
 package/mesa3d/mesa3d.mk |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 66ebe04394..633f9eec1f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -254,6 +254,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU
@@ -338,6 +339,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  RADV is a userspace driver that implements the
@@ -412,6 +414,23 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO
 	help
 	  Vulkan VirtIO (venus) driver.
 
+comment "Host native context drivers"
+	depends on BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
+	bool "amdgpu-virtio"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
+	help
+	  Enable VirtIO support for AMDGPU native contexts
+	  used by the radeonsi (OpenGL) and RADV (Vulkan) drivers.
+
+	  Select this when running Mesa inside a virtual machine
+	  with virtio-gpu host native context support.
+
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+	bool
+
 if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "OpenGL API Support"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1eaa4c577e..34597966af 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -151,6 +151,12 @@ ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
 MESA3D_DEPENDENCIES += host-python-pycparser
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU),y)
+MESA3D_CONF_OPTS += -Damdgpu-virtio=true
+else
+MESA3D_CONF_OPTS += -Damdgpu-virtio=false
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
 endif

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
