Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C133CCD8C92
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 02:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB9A40857;
	Mon,  8 Jun 2026 02:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLCQVAHGrVqj; Mon,  8 Jun 2026 02:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 372AD40858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780884384;
	bh=OvjQ5hS8UfBeS94CkBASvkzedSpk0dxVK/CPDpfrjzs=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QgENV2IRGahBGcCj2vPa9eMqzFYvAHJUDu2fM+Na1+4huiJiXQW/vuOO9sJ7JbFPN
	 OSWhIGeFe0N0LjiROdD62oxVWGs9c9gj3MAttronsBWDEGGmEotYuurk0ZzvJLXMRV
	 8frX6M02bOEfOCbEv5O5BTtFAHZAgQF2b4ZeooaRvmg697/D8G3jAdInG1w3ggR2z4
	 2/zeL83aHWsTFU3lw2dMIV93yi+NnkIXWKr5utfdADfgtpF3N0hEYjG/mrp7OLgZUj
	 IvS7ARBjwcVZFyhcWsnCbGJ/gYzWwmVcV/gmRv6gn+ge7OwwlKwbPQEuUcaCVUyyZ7
	 C2Ym2oMcALM4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 372AD40858;
	Mon,  8 Jun 2026 02:06:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C377B2C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8E46405A5
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sUAuLAltFVH for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 02:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 704C5403F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704C5403F0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 704C5403F0
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:19 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-36b8e1760ccso2172956a91.0
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 19:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780884379; x=1781489179;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/TGQFuQJnLTu5Hz1Rm+rixBshEf1dQ7rIlMEGuk/wCM=;
 b=IDL+s6nuNQn565wEjw3lkskSJz6p6cWYwlrrJo37JDEVwKXw99WZyIortIM1/ht28V
 wFS9yw6sTJD+KQXhe+LtYCCsQXLcQv7EPxhlSsW6a6BwtXvvQfvV0lY1tYcxQ0uMMz25
 ZbmJyFsHwp3aNei+o7ZbGexLe7D6mneQtzWDKGqTkWxZj3i6QT7+Y/e1zj6fOpCwTULY
 ZFfutue2+r0n65HFz+CNpEN0nLRT6fphKX66RVVvHEN9Uiek0atdhdmTcTGEJb4kVm/k
 RYJnchIxZZ+Aj4cr+9MXE0d2sLfEL21c24nXPj8vx17CqCSr66c9KWmII5R93Hi5hGMt
 mOig==
X-Gm-Message-State: AOJu0YxP4avbRO+hOpPOmpsyFckYqaouP1Vglv+YzqX7iVzQh/PHmHU1
 px72y8BlOk5NJD08e9FvLiUmifv15UHwUykcps1zZGu5PH3KM52ztKx9
X-Gm-Gg: Acq92OFl345Yu2BitKLOM1X3GHoM328ewiSmGVgNHWCcW0x7EIEbvNpO0dp0hhUeLQr
 oMJvmSvfl6gIQiYdzKR7S1WaYlEOX/kXTwbbsTjjx2zPEBq1bMI+nqo77YCdi25djXIyZKZXJmo
 /HLbXnDlNLk4Jggxdj+MQUQFE1XSk3YHcAC7r4Mog5DH3JwXYf9VzwK59MBlGuVfNGeQ4/3qwdt
 pX3VytFHf9naC6hWpCwJIplmUwuIuE3U14sTljEUci2DF8QEf1oaYo9ib7E79noaxvHVznKTTx0
 mDeYbpoQkb54nSc1gouww3o0KedFCEHkustYdq3jVSND6TBE5hlR+b9VpaigFnL/O4/L2JY1vPo
 4TtiiQzYPg4Tk0eBOB7q40hLywAN9Jd9OcuHVvatHbOcR/pEDiHMdP3GrLlEMSXZEUqwfgg5p0X
 DBvSvHo9T3JVaT9hH5WL0ceQEiAQiXY+joiutA2ng=
X-Received: by 2002:a17:90b:3909:b0:36b:bb66:fbd0 with SMTP id
 98e67ed59e1d1-370ee33d069mr12868355a91.4.1780884378668; 
 Sun, 07 Jun 2026 19:06:18 -0700 (PDT)
Received: from wash-34.local ([50.47.124.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6d109dcdsm15500399a91.9.2026.06.07.19.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 19:06:18 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 07 Jun 2026 19:06:07 -0700
MIME-Version: 1.0
Message-Id: <20260607-b4-virglrenderer-v1-4-15cd736c623c@gmail.com>
References: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
In-Reply-To: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780884375; l=10119;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=rYZO3XXX3zhQk5kwEikiHmcvi7SIMi12coZFNU2GIAI=;
 b=MYNs47HcXssjQ3tyLwZNHUsi/q0z/rpT5nmK4mCoL/NxZeEBoRQnusf3uqYQ8iVNb6WbQqkZ9
 cbPXTyMGlTeCEMec776PWA+FmNgAKStBYTnEbKZCaLtK76VUToc+Ik7
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780884379; x=1781489179; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/TGQFuQJnLTu5Hz1Rm+rixBshEf1dQ7rIlMEGuk/wCM=;
 b=E4NyK6tJIPVqKdUqC5KMayx9R5o7LVK3wG7UYe2fahijvQFuOojwMUtSrLcgtu4i1B
 o61HRZSoDUQZN+HiKL798iluPB2oCWO3wayqTlYEQHeUbQ3S1GtJIA7UdAm1kRUscXkq
 sHHZXWf/hlq9Hmsd4w/ZEAQAyqr+Kcw3GGTh3rq3PLIbc3IIOlKH4Yj6Xo/x8mb392fs
 QcEgWrDgxoj4LnqSQE8R2EkIK2OqzH6ufYzeYmpgx1VgEL51Fy/XixO1F87ZdJ7wTbMT
 7V9t5WB9cwTyuQrY3QZ398Sh5UbbcdTLQN9a14KNWlmR3zR0EWztYRv8sjmBHc6FTjdj
 d3Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=E4NyK6tJ
Subject: [Buildroot] [PATCH 4/7] package/virglrenderer: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add virglrenderer, an optional dependency of QEMU, which facilitates
acceleration of rendering and optionally video decode through
virtio-gpu.

Add an upstream patch to fix the build with glibc 2.43, not present in a
stable release yet.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 .../0001-fix-build-with-glibc-2.43.patch           |  39 +++++++
 package/virglrenderer/Config.in                    | 114 +++++++++++++++++++++
 package/virglrenderer/virglrenderer.hash           |   5 +
 package/virglrenderer/virglrenderer.mk             |  62 +++++++++++
 6 files changed, 222 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c71640b6b5..e3f0b2a562 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1772,6 +1772,7 @@ F:	package/python-xlib/
 F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
+F:	package/virglrenderer/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/package/Config.in b/package/Config.in
index 166b666ad8..cf67c7cc1a 100644
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
diff --git a/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch b/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch
new file mode 100644
index 0000000000..fda1d9b218
--- /dev/null
+++ b/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch
@@ -0,0 +1,39 @@
+From 986b5fc57b07c06b5e0b3a3694d06898ebc80163 Mon Sep 17 00:00:00 2001
+From: Maximilian Hofmann <maxi@maxiicodes.dev>
+Date: Thu, 26 Feb 2026 23:28:58 +0100
+Subject: [PATCH] fix: build with glibc 2.43
+
+Several glibc functions now return a const pointer if the input is a
+const pointer and a non-const pointer if the input is non-const, causing
+a build failure.
+
+Fix this by declaring the output pointers as const if they are never
+modified, and for the lone failure where the output is modified, instead
+make the input non-const.
+
+Signed-off-by: Maximilian Hofmann <maxi@maxiicodes.dev>
+Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1599>
+
+Upstream: https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/986b5fc57b07c06b5e0b3a3694d06898ebc80163
+
+Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
+---
+ src/gallium/auxiliary/tgsi/tgsi_text.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/tgsi/tgsi_text.c b/src/gallium/auxiliary/tgsi/tgsi_text.c
+index db7d7b95..7e37bf79 100644
+--- a/src/gallium/auxiliary/tgsi/tgsi_text.c
++++ b/src/gallium/auxiliary/tgsi/tgsi_text.c
+@@ -84,7 +84,7 @@ streq_nocase_uprcase(const char *str1,
+ static inline bool skip_n_chars(const char **pcur,
+                                    int n)
+ {
+-   char* str = memchr(*pcur, '\0', n);
++   const char* str = memchr(*pcur, '\0', n);
+    if (unlikely(str)) {
+       *pcur = str;
+       return false;
+-- 
+2.53.0
+
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
new file mode 100644
index 0000000000..a60ae15b6c
--- /dev/null
+++ b/package/virglrenderer/Config.in
@@ -0,0 +1,114 @@
+config BR2_PACKAGE_VIRGLRENDERER
+	bool "virglrenderer"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # needs gcc >= 4.1 for __sync builtins
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBEPOXY
+	help
+	  A library for accelerated graphics and compute in
+	  virtual machines.
+
+	  A backend must be selected to enable guest acceleration.
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+if BR2_PACKAGE_VIRGLRENDERER
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
+	  Requires the host to support OpenGL.
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
+	  Requires the host to support Vulkan.
+
+	  https://docs.mesa3d.org/drivers/venus.html
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
+comment "Other options"
+
+comment "vaapi support needs libgbm with dma-buf"
+	depends on !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
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
index 0000000000..835390919e
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.mk
@@ -0,0 +1,62 @@
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
+VIRGLRENDERER_DEPENDENCIES += \
+	libegl \
+	libgbm
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
+VIRGLRENDERER_DEPENDENCIES += \
+	vulkan-headers \
+	vulkan-loader
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
