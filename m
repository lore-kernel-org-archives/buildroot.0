Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64A41077617
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9F3E81990;
	Wed, 18 Mar 2026 20:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epxNeexkhxaj; Wed, 18 Mar 2026 20:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87D868194C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773866312;
	bh=VTKZKOaL0q4xxNcYExSyOUANoC42rx3iZY1+/0BXHQA=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULlYGu5wFY8OW98p4oeFxtVwH9Gg6fiMKuJ7yd8YqFvLeWJijBN/RyPUOkztPAzvu
	 vsPHNizaXv52uOkoFJhOvWPP42yjjJ+xFMR2SYkwnGB2KaBRQkcfXtI5DyqmtFLPvA
	 eHrSjNc0tApAdwBvHPbxSZbmNQ01WkSgSYLBXC85pxYcnG2NOPZAPq0blbb6CZPRTb
	 D0fdSDoyPMY/ncsbb61FWPRmUgEvmbMsgS6dh5/Zbt67jvU2yBfLc1YnAKLeAdPvBd
	 eFTvLRUPpGB3p+qmjhbvF7xmRecG76m6NIQokzxFBuPph/ptKI3iEHCjtTQAGmw4YO
	 6LcE3xPWPZwAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D868194C;
	Wed, 18 Mar 2026 20:38:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C56C11B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B548060DA9
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uc0o8J_lHmiR for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:38:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5A7560DB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5A7560DB0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5A7560DB0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:27 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-829a568f3ccso285547b3a.0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 13:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773866307; x=1774471107;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aH/YXPb3GQFdg5Ap1VkqaWCrOFr8aqOu4mspmsHoUm8=;
 b=HeijxQfXJ5jYN9WQtcJb0c2Z+udrMMZ2mJYNqtluIR0l4y8khtwC5MKYH0jymVnQOm
 HiLiFOrW+tomfzz9ND36wUIZMmxD7UWNMuFaWfpBlitkp7Z3jvVvYKSxxPtejYyXHIVZ
 WwY67aCI5neZHOfSmV+Bkb6PrRviY2kJJT/i8PAI10mc6ZQJewX0wvZCuuMFczSsFJy8
 8Hp3R7cpn+ObK+VeTSpj5t/aM2ccWnaU2smJFnZvIdgDgT9KaRFQnv1rPO2VREKztBJL
 2oBitFWqftYcrX+dgYhXD1099RkSr6KgReJUB4HXVNXbMLf9zWKNuU5T81d/DAA2lpWv
 htCw==
X-Gm-Message-State: AOJu0YxnTSJnZwJOuiJQ1D4cQrCkNg0Jr4QuR8JEyjTQO7byrWIyj45b
 BUznxUftLhONGPOghpmUrADrwdmf0RIvhn7g4ucbMzRIQQ+u0/tMCpD4
X-Gm-Gg: ATEYQzws6b/bDsXvYoXiKVRnGnY0ZoMTmz9peb1kDZJ1FRuQvmIf/ZK1jeXVrZU40ps
 f7UW3gkNQY/IKfFNijm6im+/9jgVKoQcZJrsVbKCKeR+WsniAZVuJ7siIWYxeAIZoZ/iFMy2GnK
 L6Rg6B89PXfOnriUG3oCorFu7EFTBfJ+T69f13C9Gd9csFlkBUytFsAc8q+vA/lWpE2bdTVawaG
 k213nS0pRD/sW1p+S9VkB6finSmzV3tU7XLQpEhhCnKkKmD3okOQYMOqg7wq1/u92G0FxFGpf7Y
 JyoAjUDwAizIknmXWYEOkFsK8uNk5U4HEx9HYH5BBVPoGkk1WoLmaMiY8E417J6ueVXWsNPaUDT
 BYkrNmQeBqzWL8kRjcEyBdIqLgI9seTSLo7p5R7HP0f+8WjzFKKVIEUVRsYR3Gx4xU+0yweNkn4
 NFgPzUceuGB9NJkmK5xtu0fUQmz74=
X-Received: by 2002:a05:6a00:f96:b0:823:9b7:9c0e with SMTP id
 d2e1a72fcca58-82a6adea06dmr4560891b3a.34.1773866306810; 
 Wed, 18 Mar 2026 13:38:26 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6b56ac50sm4636143b3a.16.2026.03.18.13.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 13:38:26 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Mar 2026 13:37:58 -0700
MIME-Version: 1.0
Message-Id: <20260318-virglrenderer-v5-2-09a3274852d6@gmail.com>
References: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
In-Reply-To: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866304; l=7700;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=oqOBkfjubnFtFyXuhJ0tnuY5g35T0u5oGOQIK3aZCU0=;
 b=2FNWPiKkByKOtGXQSxlJzLEvEpTUoHDUVWP66p/hI2nuvQFzrIyOv7maUROgLMXln5x3LX+e3
 C2+HKfOW4nRDRv/fkrrk+4zPuGY5dkejQpsaR96r14Zf9ecK8W/ZBQE
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773866307; x=1774471107; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aH/YXPb3GQFdg5Ap1VkqaWCrOFr8aqOu4mspmsHoUm8=;
 b=BCLhcZR/3YKCb4Mm3WmSpmujs+Ugu2PNNBTJK3k3/xLV+LmYWQbpwGQwBmw+sqZ2GU
 aSiDoM6gxfvAJjVkeiL7k0lj0ugrvWcULSoc2ByiAinesdyuSlbvyGpgpW6tAu6hH5gN
 dmIRwCQdkhT1ui40Ceh3w9hcNBa01w+VPDXLmjWO3kXWgkVPsIIsmDYtsEyXgxI3Kgm4
 sofVyCBClxAbPJmoANwwDO0OYDh7nI0Z6v2K2B2zbyWZ+fZspHeYdjEnaB/nkfvHfwZ0
 Khehm0wkQg8AzGjFyIzu+qt3RDW3h1Cqy3twMBytLSpi0cAvxDYRC5oxw77A18mWHCTV
 Ob0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BCLhcZR/
Subject: [Buildroot] [PATCH v5 2/5] package/virglrenderer: new package
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

Add virglrenderer, an optional dependency of QEMU, which facilitates
acceleration of rendering and optionally video decode through
virtio-gpu.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                               |   1 +
 package/Config.in                        |   1 +
 package/virglrenderer/Config.in          | 101 +++++++++++++++++++++++++++++++
 package/virglrenderer/virglrenderer.hash |   5 ++
 package/virglrenderer/virglrenderer.mk   |  60 ++++++++++++++++++
 5 files changed, 168 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88a684d9ac..a34cf57923 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1766,6 +1766,7 @@ F:	package/python-xlib/
 F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
+F:	package/virglrenderer/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..da54fc2704 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,6 +366,7 @@ comment "Graphic libraries"
 	source "package/sdl2_ttf/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
+	source "package/virglrenderer/Config.in"
 	source "package/vulkan-headers/Config.in"
 	source "package/vulkan-loader/Config.in"
 	source "package/vulkan-sdk/Config.in"
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
new file mode 100644
index 0000000000..fdf785288b
--- /dev/null
+++ b/package/virglrenderer/Config.in
@@ -0,0 +1,101 @@
+config BR2_PACKAGE_VIRGLRENDERER
+	bool "virglrenderer"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBEPOXY
+	help
+	  A library for accelerated graphics and compute in
+	  virtualized guests.
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+if BR2_PACKAGE_VIRGLRENDERER
+config BR2_PACKAGE_VIRGLRENDERER_VIRGL
+	bool "virgl"
+	default y
+	depends on (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGBM) \
+		|| BR2_PACKAGE_HAS_LIBGL
+	help
+	  Enable API-level OpenGL acceleration over virtio-gpu.
+
+	  Say 'y' if you want to run applications with OpenGL
+	  acceleration in virtualized guests. Requires host
+	  support for OpenGL.
+
+	  https://docs.mesa3d.org/drivers/virgl.html
+
+comment "virgl needs OpenGL or OpenGL EGL and libgbm"
+	depends on !((BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGBM) \
+		|| BR2_PACKAGE_HAS_LIBGL) \
+
+config BR2_PACKAGE_VIRGLRENDERER_VENUS
+	bool "venus"
+	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  Enable API-level Vulkan acceleration over virtio-gpu.
+
+	  Say 'y' if you want to run applications with Vulkan
+	  acceleration in virtualized guests. Requires host
+	  support for Vulkan.
+
+	  https://docs.mesa3d.org/drivers/venus.html
+
+config BR2_PACKAGE_VIRGLRENDERER_VAAPI
+	bool "vaapi support"
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBVA
+	help
+	  Enable hardware accelerated video encode/decode through
+	  libva over virtio-gpu.
+
+comment "DRM backends"
+
+config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_AMDGPU
+	bool "amdgpu"
+	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_AMDGPU
+	help
+	  Enable DRM backend for amdgpu, used by Gallium radeonsi
+	  and RADV vulkan drivers.
+
+config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_INTEL
+	bool "intel"
+	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
+	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
+	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Enable DRM backend for i915, used by Gallium i915/Iris
+	  and Intel vulkan drivers.
+
+config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_MSM
+	bool "msm"
+	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	depends on !BR2_arm
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Enable DRM backend for msm, used by Gallium freedreno
+	  driver.
+
+config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_PANFROST
+	bool "panfrost"
+	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
+	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Enable DRM backend for Panfrost, used by the panfrost
+	  Gallium/vulkan drivers.
+
+endif
+
+comment "virglrenderer needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/virglrenderer/virglrenderer.hash b/package/virglrenderer/virglrenderer.hash
new file mode 100644
index 0000000000..03da595091
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  065bc56e89e6f631f96101cd62eba0748e48eb888b434edc86e89d05395e76f3  virglrenderer-1.3.0.tar.gz
+
+# License
+sha256  3b32caf16e2402c2aff2b716858713f3e1feded85c25e71bf829816ee5009402  COPYING
diff --git a/package/virglrenderer/virglrenderer.mk b/package/virglrenderer/virglrenderer.mk
new file mode 100644
index 0000000000..4e7bcbb849
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# virglrenderer
+#
+################################################################################
+
+VIRGLRENDERER_VERSION = 1.3.0
+VIRGLRENDERER_SITE = https://gitlab.freedesktop.org/virgl/virglrenderer/-/archive/$(VIRGLRENDERER_VERSION)
+VIRGLRENDERER_LICENSE = MIT
+VIRGLRENDERER_LICENSE_FILES = COPYING
+VIRGLRENDERER_INSTALL_STAGING = YES
+VIRGLRENDERER_DEPENDENCIES = \
+	libepoxy \
+	host-pkgconf \
+	host-python3 \
+	host-python-pyyaml
+VIRGLRENDERER_CPE_ID_VALID = YES
+
+ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VIRGL),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGBM),yy)
+VIRGLRENDERER_PLATFORMS += egl
+VIRGLRENDERER_DEPENDENCIES += libegl \
+			      libgbm
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+VIRGLRENDERER_PLATFORMS += glx
+VIRGLRENDERER_DEPENDENCIES += libgl
+endif
+endif # BR2_PACKAGE_VIRGLRENDERER_VIRGL
+
+VIRGLRENDERER_CONF_OPTS += -Dplatforms=$(subst $(space),$(comma),$(VIRGLRENDERER_PLATFORMS))
+
+ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VENUS),y)
+VIRGLRENDERER_CONF_OPTS += -Dvenus=true
+VIRGLRENDERER_DEPENDENCIES += vulkan-headers \
+			      vulkan-loader
+else
+VIRGLRENDERER_CONF_OPTS += -Dvenus=false
+endif
+
+VIRGLRENDERER_DRM_BACKENDS-$(BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_AMDGPU) += amdgpu-experimental
+VIRGLRENDERER_DRM_BACKENDS-$(BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_INTEL) += i915-experimental
+VIRGLRENDERER_DRM_BACKENDS-$(BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_MSM) += msm
+VIRGLRENDERER_DRM_BACKENDS-$(BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_PANFROST) += panfrost-experimental
+
+VIRGLRENDERER_CONF_OPTS += -Ddrm-renderers=$(subst $(space),$(comma),$(VIRGLRENDERER_DRM_BACKENDS-y))
+
+ifneq ($(VIRGLRENDERER_DRM_BACKENDS-y),)
+VIRGLRENDERER_DEPENDENCIES += libdrm
+endif
+
+ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VAAPI),y)
+VIRGLRENDERER_CONF_OPTS += -Dvideo=true
+VIRGLRENDERER_DEPENDENCIES += libva libdrm
+else
+VIRGLRENDERER_CONF_OPTS += -Dvideo=false
+endif
+
+$(eval $(meson-package))

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
