Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91A0CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C99D41015;
	Tue, 12 May 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGo_m6ByPBlZ; Tue, 12 May 2026 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DC9841006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614626;
	bh=5ru56uRkj8sLtHZAYx27f141OFShvM+mnWmBpdbFo1Q=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jEnYYMZY8mRhJF8AcW4wJCC0vW+TgDsySgkgF58gKge5Hgwv2q/nIJOrd7Te/P2rX
	 5z4JyeoK+Iq1iRoyCHJ7q9xMhujb1f1TK8ZuInM8NDSPgoFQpq2CmQZQWJaaMsUnwT
	 dw3XDcypmAew3uY5VrdK0KlnidrWfe77Z/1ShiSi1UN37DkIN+SpixdnWweHX35bCK
	 mNO6+piq751PQwYWOpjRuM8Km628/9/3YjMlyLbEJyRk1UjE60KzHBBzmpCiCNWAnQ
	 xIlWPuchYGHsOA0SS/LAhHllzfdY2zUiyoJG+ZCj8ROXc8ueJbqvvfUl6PY6x8dDsA
	 BBqlvwyRm4N3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC9841006;
	Tue, 12 May 2026 19:37:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBF0715F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE4EF41005
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKPR8vNh-x1n for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:37:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C34C040C1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C34C040C1F
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C34C040C1F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:02 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-8383fb7143aso2862657b3a.3
 for <buildroot@buildroot.org>; Tue, 12 May 2026 12:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778614622; x=1779219422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S98Nc00G74wjnqdC5XOuU2zeYFJXQJajuhmVBg+zNdM=;
 b=To4gZXHXR6KjrlUyDkgC8pBQTn/wcXXu+yOiIjbSHhYhxj4cFJxj4YYbyUQFa6/VuT
 +UKCh4Ipq3LRbqRuTLzTHhdiFDGqtaGHfHyDVwyIznHFCWuc004K4c11oO1wOfLjftsW
 PV9QPCxkAzHP825cF9Ppgx/buHY3jbVMvKTnkkPTR14HiERHg/laZa5yozbchMaTo43U
 aWPgIfxw0PmxfbIu/jkATUtp0hQvWcMDOi62hZz+EHSgZgdZdBhTRCq3bZRM80jkNezO
 50KzmcxaR4Ha5daAZyF9FFkYbrTPYTQEotSHu7KGWW9Z9H0Tw+PYAe+4KB4gjmiB1Y7L
 l1AA==
X-Gm-Message-State: AOJu0YzUMWkdEr9IQ2dBjJGbxAs++fveHjBvZwbFJ0hUAdFT7nDQI3UM
 du+I9IDIA3WiEX+Bm4LH6XeN4W7WPwFslghQ3/hZLFprzKQVRc0ZYEV/
X-Gm-Gg: Acq92OE2ft3TkGjTjBiCN/9vggiJPIqzUr0nrtum1s6h0aHigYu+LpxIr7KDaonLcTs
 WtlWViARuVFor+mC46nDgPV7PADS1Vk1BzWBpfz890Zeu5WasC1HTGth4M+c/BtKnODiU5gmkFQ
 SCvqLf7orF1AnFJGLrhYS+ryZmWWjXjMTw2O23gmV6D4zuuRYLG7nXYyubDSFV1MokIYKdvLuJi
 ViHjoUFuDueJF3Ijy07/Atq4xVtbjZsrfIIV/irhwWmQFSH7XRpzW4p5b9ikyAOo4iMDfQXcWRk
 SyAgOv+jayQ2vRzhSw6LuOt7Yzvkt0qTw5bMZtPyfy5ObtwarkHYHHiCAFE9KKiduSScr4AEVnW
 z5zO8dxDUMt68LRg1zQMuPkNj63uP9GHPquEPTgHqTh9TdYlqoNWH33Sl02ea8CZer1etsnw6NO
 GWs+gWBaJXbdWEoRzf3MIATxi5
X-Received: by 2002:a05:6a00:244a:b0:834:e5a2:d089 with SMTP id
 d2e1a72fcca58-83f042a1671mr51585b3a.33.1778614621787; 
 Tue, 12 May 2026 12:37:01 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839679c8634sm28932799b3a.39.2026.05.12.12.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 12:37:01 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 12 May 2026 12:36:31 -0700
MIME-Version: 1.0
Message-Id: <20260512-virglrenderer-v5-2-1806e588eb59@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
In-Reply-To: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778614619; l=7700;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=4g2WDVWyYU2C7OMqSnduMZrDWVZyQL3SCPfZzL/WW2M=;
 b=QRru0q/S05zGXaMmd5Kv70/4f2JZQBkbvurDUZ0Mgx7c2R//Fu36zdMgB+cdB/1xXirTPQYoc
 VmLo8ejbbJMBM0AVj8ImkpOEoLbaSOQmCykvg4HyXqy6vmQOaHVBP1H
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778614622; x=1779219422; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S98Nc00G74wjnqdC5XOuU2zeYFJXQJajuhmVBg+zNdM=;
 b=ScJ6fFOEyaHHHVJ/gcPSQViZ6nYDDUs/PoNkjpXx4P/viCfgAdAmJhZV7w6cmoP3Eu
 SHM6F0eAuIYjJdIJ9+nwYWLheSRG+VPY1CL3w98LwrrBktRsd2+P/hmaHxUKhXy5RpJy
 SAgWYfLZm/lFIrZ4ZXpZervJ1yrQSDu8D8dUIKEOGgetmUOkbvsyq5fSHII3bBVIZObk
 LtsduMR2mSS9+7k4SHkH3jXUCtdDtQV1sBYODD0I5W/7xLV+BJU69L7To4jE+9josoDD
 DVdo/UKFQeA+rvhqtMD9u2DcD20Dkf7bDCsgOQpeOhH1Bv2ILxgvPoKJ/i7eDLIsNq0S
 PQGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ScJ6fFOE
Subject: [Buildroot] [PATCH RESEND v5 2/5] package/virglrenderer: new package
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
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
