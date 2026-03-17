Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67519FF6E8B
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08E6383EBC;
	Tue, 17 Mar 2026 22:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6iN4vKCFEly; Tue, 17 Mar 2026 22:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8918B83E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773785795;
	bh=VTKZKOaL0q4xxNcYExSyOUANoC42rx3iZY1+/0BXHQA=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MWIm1ouUY0dWhUnUrccB0EYZQE/6gGpXc0X/1/sAv+4vNZtoUukkY9Kk8GDc5y7Ce
	 aFlM8Wg+ozo79pldw/fI17CjaDwS4Cb+6U6Xra+N8Dk2zgaqr1OI+D5WVgWojC/bDa
	 6RrKlJye5M1YBBPh6+NyCAk8tiH1cG8Vc/ql+/bNBCWs1bK1Pvfda2zRXSSAEyliik
	 /xHJBPDhgZfLjSpZ3yWcxXvsg1otXg1Umpo9w3ODHP89fw0Q034rlNLGjbyE3gVwRe
	 9/pPk8aHumeMKxE+YL37CcRy5GVjKMa36IKF7oTqWP+utjDO1SlYkntcrZp/Op6SKn
	 6LBnPhchPxBUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8918B83E50;
	Tue, 17 Mar 2026 22:16:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD45B3BE
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EF7A41058
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q00hCXzfDPMx for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 976D640E6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 976D640E6E
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 976D640E6E
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:31 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-35a1d4a095bso211357a91.0
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785791; x=1774390591;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aH/YXPb3GQFdg5Ap1VkqaWCrOFr8aqOu4mspmsHoUm8=;
 b=Uvu3HgHkrAuJt8mn2jnS2ssCnV2EfYv7KrnBwvDGD+lUSq7bqJXZFM5W1OjKG/F+38
 GoLkhfqO2mdVGpoPJr38e9/Wmk3QIG9OmsVU+qil6u0+f4ZWuRKqFE4yh2MZodgCganc
 IyPBM5dobKuI5LGKTGM2/xt0XXSTlZIoiCAn1o9TTtWNIw6Vrt8zpWscdjkhz05ZpbJP
 c70im59scZPBFDMZzQ39Tqos+113Rm0Zr6qhCTj2bO3ukjCaGb2Thme9hOy5nRmJ+11J
 qAzqmbtsYk/YNTKNBSXlrpN/3beDxVh8LfshR8I5fAlSQE6qiahDKD4SU6PGsykxKiiP
 xheQ==
X-Gm-Message-State: AOJu0Yy7Cfx2SdEEe8mRQ1yqrXJECVQ3eOrL0kfyEe41qGXFBgx500Nj
 VKKDjQmKNpSF3xrE+lBf/LMFVkkkxKxEyFuhM0vZsCh92r+4NWISD2hf
X-Gm-Gg: ATEYQzzm7+G3GugYu+42NHWKXaQM3E7BYS/rcYVKJJrwLQsN+xJ5xw4QF8HNIxzIOf2
 ozKmSTib/NATKhx1DG/KwUIArW/PY5dCx8jtDWv0yFF4NmpiVJA6HHU1NqNd89U/G7pFciT0KoT
 yDk7J12OFzF3qhixgERtsphPzcIBSoPCHxtu1AZh8wbprwqK7T0JEKQ/B14Qr2iytSp2Qld4mOO
 rNzS5bkRIXTaTgmQOqhutBPst/fFR7g2B/q1KvrKt+3TYW8URfqOk3xETQdj5ogo2J+F25Zbh9a
 yGIbVUFGkz+2PcEInVzAq4/FHlWzMXoGtE98OY2yYXQZkH8zFdscGGXepsbcZONYpv6xWcDZWWZ
 ZucvzoiKbkUL1iX6kVX7nkB5dHiXA4eDIFmW1f3X5w5W8BN9CoBI85lBsKuRgGaDokZRjJSODnG
 mk+0OokMwRMQZpwIsgJRnJqQ3aFgM=
X-Received: by 2002:a17:90b:4e8c:b0:359:8957:7285 with SMTP id
 98e67ed59e1d1-35bb9964818mr1016850a91.3.1773785790859; 
 Tue, 17 Mar 2026 15:16:30 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35bada2bfdbsm3997231a91.3.2026.03.17.15.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 15:16:30 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 17 Mar 2026 15:16:23 -0700
MIME-Version: 1.0
Message-Id: <20260317-virglrenderer-v4-2-ed223e222bb6@gmail.com>
References: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
In-Reply-To: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773785788; l=7700;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=oqOBkfjubnFtFyXuhJ0tnuY5g35T0u5oGOQIK3aZCU0=;
 b=/SYRnAgOprQQo+FLMkFsEc5ryRL8oIuK4VKxXpcjimleTNA5LxvI9eIAlyEw0LDdozoTt1pzl
 7Fs/gs+NS+zCl+RTwQ4gqErnG/CGmQ0g3iQbZS7qALVa/8RcGCREzXx
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773785791; x=1774390591; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aH/YXPb3GQFdg5Ap1VkqaWCrOFr8aqOu4mspmsHoUm8=;
 b=T2FJdwibBgruBteIpy+HxK/a2TcliUH6xsbaNug2Vwx/Ixr8aout/aP1XFIoaOiObI
 DmuabZIcY9KEYB4PRYWcepzsIbkTd/o5FChpNPsEzhQ1khgfc+hoMODQ3EM+E37tv+Md
 5Pco82O0n7OwxOu1bWS6oN4P8t2O7y6iU9LWKB1FuGryfeAJ+fePyYb6rbZJltXlATH5
 fyP2u185y5Q4iw/OzGOjX7VJk1GSzNm7ZoYDhbPSpMDmDanEyrw19OTbn12Ijop5RB/l
 /cy1TXPfcjIZlPKZnMeojv4YsD4NnGAHfFQf4yTNob/bMPnrT9dGi2JOHfMwwB6tSBa1
 gtKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T2FJdwib
Subject: [Buildroot] [PATCH v4 2/5] package/virglrenderer: new package
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
