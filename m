Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BA8CD4F49
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 01:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B72C8849F7;
	Sat, 16 May 2026 01:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XuwvAIK75ZN; Sat, 16 May 2026 01:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75A3F84A07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778895841;
	bh=xE7lW8ku5UZshcvze1gzChqTsSKD/zzWJiHfwAK42AY=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lhis5bu5cg6eUU6pulamkjfmJ1SUimXGaNE3r1oQtOc7z0FEQ8naFQRIbx3plXX/c
	 jPRdazS8WeMrmbFzRFaZBGcoEEQTZRsuv5HPY2GN1RLQ8nogD96TxewGCnF72XHYPQ
	 Zf1vP7hgbuLET8GKdlsOHt2cOlchWynNH45P6kW2Z2MaJR4xtgmK2Fxqi5EfKRnpzf
	 AdQB/VPJcseKLH2j5Lk1fYDwl4K0f9eGNOQlHElfSvAMBwzyQZB7kZejlnjKfsJqLK
	 MudTHbA9ByIAw74lcaLueB9arlCyekoUHgkyweT5G60gnVuWg4nmofgJUw4NI1M5JN
	 ffsiQfy3/m+tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A3F84A07;
	Sat, 16 May 2026 01:44:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E91F745B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAC77407B6
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5qtokGNSb48 for <buildroot@buildroot.org>;
 Sat, 16 May 2026 01:43:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2B7E4005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2B7E4005B
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2B7E4005B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:56 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-82fa8d6425bso237615b3a.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 18:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778895836; x=1779500636;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7YdA9YT8wA26jCPhesxlK0BXUif4yM9PoK64s7au7I8=;
 b=G1ElorHNMI7znXzEFVwLBXMOMq+dBv9gv13RQOUrmu8dfEOmzc42KtckrD0x+bhu/C
 z16NoJNAtk+5rOKf3u/fquxTwGinHKcMMsGugm4HBKfG/OVRlV0gGcDXFXwMYqwnDvvT
 I5pQCiu2hahky685/kujJO5OUNYWlxulFS8IgaEGTs7TLDqJIXs7KZNaV0umc0IMoVfN
 S2cfNTf4NLnOX9mGGWj0rGDBs0Yh+AkWQpx9IgxjyQZNqjX86ckKfUjNMcV4/fsmP6gA
 LTo6v7x7IbufCTe2EtkSkpajUsEs77nlqd9XmOZQ7/UASNjQkNz1X3w/GtusEXe8hKzg
 iMcg==
X-Gm-Message-State: AOJu0YxasPt9tlTtXdWkeHbYPjnwlLIUs+sSbndeeAAmd0AC+seVT1mK
 kMdqvl1QDP6agsEKO5E+BENURPr8FHQ+CGyRr3cGyWAB/d13snmoHDFg
X-Gm-Gg: Acq92OHQ0EQ0wRhsFTb20Lb4lXncjVzsCD7JaN2RGijGfFxz0S8A856IkexmEoF7PHD
 zxVeJ+XyBtOQ29ZmYW5s8c6TCvY6fhpCactbo3wzJ6th3wVgh5ChFRYQCYw8vHMgzRqf0kFGHLP
 x8pkxv8tbyVe+8PTHwPKXSYaakfxaT6p+Tl9ylmq46kI8CmCjR0YqZTYVTwxZIfbuhN/Qg78GP5
 SiMuq++zffj7sSSR/gQ2Y1FAs39alN1UWR0RqQNfJdq0u7jYhy8jXRrmpNsvaucjauIFTCSJh1W
 gUm1MRm83PYJmfzyEblVCzhr9k8QfVW8SEJaUSjGTzR4BL4TKp+XcHvN2zDdUpBTue3YniwJX/f
 eizOi9x7QDBMvfX6jM41H4KrPjYoQt+vcMPv1S7wym89bhIyYTxQdPwEMXz62E/jKlO9YA2j3my
 DU8ruRI5JGlKbBnGmRjYobYhY/
X-Received: by 2002:aa7:8882:0:b0:82a:6f69:7f72 with SMTP id
 d2e1a72fcca58-83f33f0fddcmr6780242b3a.47.1778895835712; 
 Fri, 15 May 2026 18:43:55 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19c5ceb3sm7227670b3a.34.2026.05.15.18.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 18:43:54 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 18:43:35 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v6-4-d9081c13baf9@gmail.com>
References: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
In-Reply-To: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778895830; l=7700;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=rpalzaTETFDvi/s99OvRs0NmqlmDQ1400PJdN51Fbs8=;
 b=uua546EHrpEyyyEiQ+n+GmZiV2nswcamooc1InWE+XZSvzn3RzMB5fmS7lt3tNiPPvRlqQTAC
 joHyxUpwaq2BvDOGX3Fr4kPFXr2ToWdU7DkkhYeoThJnhsEsrChNbH5
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778895836; x=1779500636; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7YdA9YT8wA26jCPhesxlK0BXUif4yM9PoK64s7au7I8=;
 b=sqLpIHya6SuEIOrS120ImJzLVpzcwnpZsqaJeRQMw43t8idiPXfkmdYTafmymwv+v+
 BCi1oYnNya3E0SmKVV0cqRA6nqlfnTGQ2LwHowNJzsUPrP6hFMRJgKKklhHrXMHHQl3O
 AeUwPJCE9cDHjg2v76TbeuMR3YqwZl4ikXZMFv7Mw7Wh3rLDpywm11mDUUUMpnZ8Cvqp
 e7kgLfyP9TVeNCjmBlV1ermnUEybEhddy5h713gCVa9hMdiCNeLhcpb0VhC+XvgSwkS0
 s08xv5tJnbgsD4xqWruHfyEQ7NcTpCz6JV1VG+vFgXEE92jG8KyT4E3Vl7w7lBKiJkw/
 CIqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sqLpIHya
Subject: [Buildroot] [PATCH v6 4/8] package/virglrenderer: new package
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
