Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C437ACD343F
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 02:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DA324207F;
	Sat, 16 May 2026 02:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsBZACUwD74b; Sat, 16 May 2026 02:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CC7A42084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778897012;
	bh=XZonMNKzo5V1QGffwSakhG6Cdxgv1tehduu210ylvHU=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q0SkAe7QoU1/EDgWaITHsQV5Rl7kEp1CcDWi8OYtoyk4WQzeftHoK4KPIDIQaJmoH
	 uzsYJeQT/Y7XMBuWv4B43ScoLs+av9hwU0BEw1GiDiiECAx5y0lgqZL9zwY2xKHjA5
	 rcpKBJ4QHnJPewnvQqW81IjFZg9qE08bSU1LFmCQBTpeQOYShW4NLPoHjBrx+PN1tr
	 eLyrQNNu2sDyGzoxmYc1O9smjz1Ft7mjI1Hi+kiqNslse9CS13UsRH0wpN0jt67BOp
	 MY7GWXgckTwQ9GSXu/jhJR2Iy0iJ5vm7yeqdHEHnnCz/ZBOa/wKhgKi4OSNhUlheIc
	 MNJTP4tS2Ahbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC7A42084;
	Sat, 16 May 2026 02:03:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EF83206
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E0FA8490C
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxGDcol-LD20 for <buildroot@buildroot.org>;
 Sat, 16 May 2026 02:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 118A484710
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 118A484710
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 118A484710
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:28 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ba4a1a0325so3645025ad.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778897008; x=1779501808;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Mgw2qZy8QNOJhmYPdmwCvkTd61cVvuOXAyW1EbSOdr8=;
 b=LayRkrdLCe3Ikgb7MbucGiX7wf0MubV1BIZQkpUo0uV0N3kkbFWlZ2SuPaSnSexwjg
 CzOqht3bK6RQUbGbBNnzGq0UZtvb+uNYnTKthkegC8ZrTVJKPTOWRees+VPbVt4Rr72Y
 E5m+51kIOdV7YkfwBllRI0oYoOHeHA+oOPQAhHCD2pgEo1ANuAjPIxbefIhZVPRe4zqG
 nowFbrjDTFmGGnYMRwMDd0siSc26rsYyAfGdyHPMUtC3B8BQ/HVLZ9qqBhZe+a0E/viO
 /y/5s0KMnDRaT15wy3JPFiQJUUF3bBTU4f8KrINubQ4ZqhCYirXHrYoNbX3zfYazxtou
 NqMQ==
X-Gm-Message-State: AOJu0YzKSuBLaUrYyxHF303DGZoG3FRntlgMDQG3G+RTHSK6XJ+gMMLh
 dBTIwuD8s16WJbBKPRkAWxfl0qHBfwCBtkufWf3IU9f03GJ67+4U79dL
X-Gm-Gg: Acq92OG/rOIDO7numj70hbcMX8dMi7IqDP1NT66/bmTBoprvqb7cJFd2rXW6LwEYzD1
 EazL1WU4aCYzn89q6iv5YCGHvNrYehFfJS3R+O9T3SVTSyKej2nWTUcuRfz+NAM7A5qbNtEMuIn
 CU8omHbmxQbKCwo1Km7rJK+pGntW1D9+GqUI8C1xjYt/ifBUVRAI/9gn9Wmiaq8wLXzwLqHyPI7
 m1CsMwC+OcLEaX7bDD7nTRxbEXjIE3Q1ZW0FTaLdEsfGGDRb3VFMhgNnBjQB8yHtgOGLqGkzRP5
 zuBYptOqH+C1DT2CL2JkywwgGCPtyIROTj+4CJq9nhKuywiYDCLtIv3Oe4gIKl8/ruVnzBHzotV
 N/NrBaf0NypZBpWv8zHnI9+EMUrYq8lFfI+wupLm5ToNoKbgNStsp8M9l220DdyBijSA4Rrdmof
 MF8jDhTXqS9nwXMa/uNjJhEcwx
X-Received: by 2002:a17:902:f144:b0:2bc:b141:8551 with SMTP id
 d9443c01a7336-2bd7e87ed77mr55500135ad.19.1778897008232; 
 Fri, 15 May 2026 19:03:28 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c16ac4asm68201375ad.33.2026.05.15.19.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 19:03:27 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 19:03:13 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v7-4-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
In-Reply-To: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778897001; l=8357;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=YKnHj90OON1oYIQFG+z2zeOKZFXCMd808fCzdp/3WYE=;
 b=R55qwaiCCfpcxVt4iMyLTpCbviGN3S5nl2qrVVn/oVhtZ7HMiCt2oomiH9WEB+QCoSbjdXS1e
 YKBTu0PHzupBke5n9D4kZVb4jou/Y3l/oq6y3mF6JvqT7qxRPnpqUKB
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778897008; x=1779501808; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mgw2qZy8QNOJhmYPdmwCvkTd61cVvuOXAyW1EbSOdr8=;
 b=fsCLmuQ4eqL/VJ8tu7HZ1donVxTAaspa2xg8InjSI2atKgMTbss4swxr6k0YEVl48Z
 9MZvMdMnn7ScfSTpu7W/zifus+qTS9tSlLz9ab57yQK0OR4H656Gh8fR7NC3Uplpz1xL
 LgtTLCyXkZPTx2kb62/iE6vgJ4JatXp4W63COmPUwmBydEGNnZDmndbbuTECaswttYqN
 0zdO8bCZuJCkBeh3pq/4Z1bY0fW+iStfdmSS2dN/dvl4yEPiHE+tHzv3q8BQedvcA9ZD
 qjIA8s4WI+smeFj5b8MBxY3QxDMhfJ/GC/dx6TEKdFwSLToEwAU3K9mWMkvwR5VT+iBo
 Wkvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fsCLmuQ4
Subject: [Buildroot] [PATCH v7 4/8] package/virglrenderer: new package
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
 package/virglrenderer/Config.in          | 117 +++++++++++++++++++++++++++++++
 package/virglrenderer/virglrenderer.hash |   5 ++
 package/virglrenderer/virglrenderer.mk   |  60 ++++++++++++++++
 5 files changed, 184 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 25a047cb3e..774eb0b746 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1765,6 +1765,7 @@ F:	package/python-xlib/
 F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
+F:	package/virglrenderer/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/package/Config.in b/package/Config.in
index 9cae377fb5..01263e4c44 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -365,6 +365,7 @@ comment "Graphic libraries"
 	source "package/sdl2_ttf/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
+	source "package/virglrenderer/Config.in"
 	source "package/vulkan-headers/Config.in"
 	source "package/vulkan-loader/Config.in"
 	source "package/vulkan-sdk/Config.in"
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
new file mode 100644
index 0000000000..041bb63a1c
--- /dev/null
+++ b/package/virglrenderer/Config.in
@@ -0,0 +1,117 @@
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
+	  virglrenderer can be built without virgl, venus, or DRM
+	  backends, although such a build will not provide guest
+	  graphics or compute acceleration by itself.
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+if BR2_PACKAGE_VIRGLRENDERER
+comment "virglrenderer needs virgl, venus, or a DRM backend for guest acceleration"
+	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+
+config BR2_PACKAGE_VIRGLRENDERER_VIRGL
+	bool "virgl"
+	default y
+	depends on (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGBM) \
+		|| BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
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
+		|| BR2_PACKAGE_HAS_LIBGL)
+
+config BR2_PACKAGE_VIRGLRENDERER_VENUS
+	bool "venus"
+	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
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
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
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
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Enable DRM backend for i915, used by Gallium i915/Iris
+	  and Intel vulkan drivers.
+
+config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_MSM
+	bool "msm"
+	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	depends on !BR2_arm
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Enable DRM backend for msm, used by Gallium freedreno
+	  driver.
+
+config BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_PANFROST
+	bool "panfrost"
+	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
+	default y if BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
+	select BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Enable DRM backend for Panfrost, used by the panfrost
+	  Gallium/vulkan drivers.
+
+endif
+
+comment "virglrenderer needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+	bool
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
