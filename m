Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081CDCD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 21:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28284833AE;
	Thu, 14 May 2026 21:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVPI8exvPUFj; Thu, 14 May 2026 21:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BA5833B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778795038;
	bh=AjzYb2mZyR6UO8ODdTRtm79rP2mJXA3yqS30S6g3w2I=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iXy7hMvOoWsmqd8IuLGvv924kZywzOoENSD6QqTME9dxJlQPbXJvrN07R/EOy+PoW
	 1S+72AdWxdNLK5UWD/UdScfgyvgZBmdifDrqgNkgr5hv+bINEVia1FQjOfOR6ybQJI
	 jzPmiHcVEdF5yXHnj6/ciClyKNOir4bgtGSVOQw4wpVsu2WTk/WQJxebyzEG4AnaTD
	 gbenlZHUNPpJJlaTAHbj7UjaoVqPE+hgP0vsvtCtADv/WAPS4Cmj061MMAz7J1x0Fz
	 ThiD2yo2E1UBBcBMg5HqyARR1gM5fWSNsxuRWtfQ/YxgZtETUyHcZx+p5kMxeSuh5P
	 JLTGZ7okiGA7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BA5833B7;
	Thu, 14 May 2026 21:43:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1310237F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1067760FDC
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHAUJ5Z8K90L for <buildroot@buildroot.org>;
 Thu, 14 May 2026 21:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4520E60FD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4520E60FD2
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4520E60FD2
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:55 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2ad9a9be502so52435705ad.0
 for <buildroot@buildroot.org>; Thu, 14 May 2026 14:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778795034; x=1779399834;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yxxSzYPDvC3aGiD0SNojiIylGGQHMo5dn4y8VLd71N8=;
 b=IX8ovDW3sIfDJAx7/iy0+q/R9ngJoNTOl5w+A75UJeoMglGgHKKAd64n+ffYj/L6qW
 rUllJnpb8IcbwhuoBg8dJl3W6mCNULl2Isn81Nypo1tXQsQJPGV+877htxKyARL3GBS3
 EO/+aD54ad2FMmU5y7bg1xRoNonl7KVIWjLY/fxtOPRYI1qUMEDWwn4kj7yC319CflPW
 YdXx3eec7kfivLUMYwGXzGCH9Hmxitcpn8WKsBfEMlNKKVsNUQarTJAWEH46QZlds6OL
 6UpDOlv2hJvg9jOqehdVwuptHt6pdFCuzH5arbc8Z5jD0vBt/KIvp8Nn7HtjnFgohOd0
 iQpQ==
X-Gm-Message-State: AOJu0YzG/UR6flHxR8KnnRyh8othXwzfPhsox0P8nIJCTg7UpQk9cwgl
 A0XDzrRW7HGEdIsLiB0+kL8q5awsrE46TRnETbe9csz6CpAB8h3my8ZKf7jOUhNWQ0AImwDgq3Q
 C7wdn
X-Gm-Gg: Acq92OGHxGpIGrpcDjJTwJml9njv55ItsfHuRlld/YrJCxnIg8zo/FhWa3o+JgrjyYv
 xLWysrYju3BhcZ/1GkgAZaN+tbpaSs9GRODEuUQ1qsI5yqy+ungwgG6cYGO6UOVVFNcQs09q+cb
 EsaxBRKY5YmSV3HIQfi4M6ojX7DPJCjSRGUG5zVs9tL4OLOqwNsEczXBZR3XfUQi/oHkzAFVlNQ
 G32hrhq20D0pwVPzzq6yXmDHDovqPlie9wiA4kAknzXJY5xBsu4vxzdbjyqKylSJBsXeJqMz6Ag
 RaMR2iTuyfT9uwCsTXpvRj8niT7y1ogS9kPzy0q+wqczZRbUpcPG5bjdOOJfaEV3V8YGan8j/dc
 JxQNUscSNUEMNA8YXN4mT1jaRNFR6M/wmiBHl9CWFeELjqHmsBqdIzKouKFUsqPOaWvSzY8sSzB
 UBSEDlOySb+pqssZSYQc0=
X-Received: by 2002:a17:903:3b8e:b0:2b2:50bd:83b3 with SMTP id
 d9443c01a7336-2bd7e82812bmr12736455ad.10.1778795034458; 
 Thu, 14 May 2026 14:43:54 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c05f287sm49907305ad.24.2026.05.14.14.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 14:43:53 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Thu, 14 May 2026 14:43:37 -0700
MIME-Version: 1.0
Message-Id: <20260514-mesa3d-amdgpu-virtio-v3-1-dd75eca7fa50@anodize.com>
References: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
In-Reply-To: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778795031; l=2823;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=He4vJhPa09xM0RWqNEaIBd4Cec6Qg2DQdMD4v+tZczM=;
 b=Cfos3DYjy14rU0WLd5BF5+K1PxU4Qdx1w68WSxUvqY/zS9E6zyqiAiboSxG4eCWrIPBjFquV4
 eHM8C49giDKDdWvwA7JMqu8ObeHf5HdrCEUsGUXFDvSs1rTsktwqCiM
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778795034; x=1779399834; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yxxSzYPDvC3aGiD0SNojiIylGGQHMo5dn4y8VLd71N8=;
 b=GJGe4T9dKI9EgUvT4rDk64HGH512GR2sSkmjTy5tBtZ8xQeCyEmuawrR03r7AW4mo1
 A+BUTvnzpJjAvEU3pA2NiLxSeQpynci5w4OvJ60wfZdXEaprZbCCSA4Vt7JG871AeYjg
 7sFVNbqWHOecSjJIBn0u6z8a+XDeYqbJgpuAH+DnRHSIQILi3XgHGZhHQNgqDQUAn2hN
 c0xHftTtdisPR4G/nFiKrOmF2K5BLCGL00cVE/Vcs2+Pv8E7ROqo3dNrqMXR5sCiha4M
 nCtC3h2/My2ET21Dnj0GZhRrXSMKudPDPYJP7/SAc07o6FEMJCXNQN1VgoacVo87d5YG
 6XaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=GJGe4T9d
Subject: [Buildroot] [PATCH v3 1/4] package/mesa3d: add amdgpu-virtio config
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
Reviewed-by: Romain Naour <romain.naour@smile.fr>
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
