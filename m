Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75196C531F7
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 01:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D4C80EC8;
	Fri, 20 Feb 2026 01:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mx__eI_uWxUC; Fri, 20 Feb 2026 01:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C2D983CFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771550641;
	bh=G9RMSprZOVYwCrshNwM9DrBbH2Z6SEeO+N1frYVtdkg=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JJlZ349HsZirLe1uT/7mYDxrc3cEV6bjYtI53mW4L4gi9S+I1V+p6kZACdHL62B8L
	 wNXyZDYpnz0gFVbpQW/iXhFQ41RHQePrHKwWo4+/vaI64b89GeA9L2tyVc940NuRy4
	 L6NdJwYsPkqVChUA39b61EZXUtmbrTn/lc6wl/75AjCoDlWMagi15dcql3jFQV9HW8
	 2o/veyavKJQulNO/k+t8vIh4N51V/DeiJ2ICOwPbHfDHPKoIcvp38CxM+cR71qqDSX
	 btbKQcBjYAuBsumI68P8irJp+5uE8uDN8O4ukqofk/T7CKU32Stlp9ejdjepViqI5O
	 Fq2umfEI/lfYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2D983CFA;
	Fri, 20 Feb 2026 01:24:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6767B183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C78A417DC
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRcPUgnfeIeB for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 01:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5083A417BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5083A417BD
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5083A417BD
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:23:58 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8230f8f27cfso826078b3a.0
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771550637; x=1772155437;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SPoc/WnBHEdElxmdcMH77Msz+ASVDzG+pMJGMohveVg=;
 b=HH4G3Z7lS457lvyBf7ZbpXHZm6wAB292qWYYmNpINSVpFVsohnw5EkPwVdUaM5KkXM
 S3hqO6zTEEI7YlGJR2tg0LSzpmCxqSmQrA4BbXFu/A4EX6+woZDQ0sY1wM/vtDqcMCsf
 MjcmYuInbL4I3pWTKiIf7abQtV7p58X7R3ecp9CSvN7+YfLW1I0SVjTkdkf/CykzBC3s
 dIxuhzFGwLF7e1DGaUfBr2CzFVq8DVjXB8p+lptlUGYFR39g1WIs3ZGWolMD1rBj+8SY
 eluZPAod2Y+mj2uzYftVPzweuKS7QFHM/5b5njMfP1eu2feMZmHiVY2J1FeTD9jOkq++
 0Jqw==
X-Gm-Message-State: AOJu0Yzk8ClT2+ccY/MFVfgaXTL2Qzrv2Up3iy8123j/BF0VD7HLClTk
 WB2l8OVHq30UomtLcd8orgJSuNd+mE/9NrbCS7AnjigzWmHJws9hMFA1
X-Gm-Gg: AZuq6aLc3vW0lt4gg6JN3VnCl7nGVP+N3JNLDQa9rltaJIHlhX0156KlCnOuCLln9wQ
 VKWXPQ6oJ+LuDlW90olgrQfu4XExn29rkx9NqXhOHZ1cw0Q502ZFmsWctE8x/R7w4qJKGw+cJYo
 tcpOOrAtkyUtrQjVgyIdbhkj5rEbwXyLMmhhizewqaVNUtIX+aBHZL6kjgHPpmJu3xkDriphcK0
 zWz5DRhOolpDM6jx6Ye1Ma7v9Wk72csl4aOX1jvVR5LwZtW3ykkJDbmQVM406Wudu4/2+eQzQsZ
 npAQQEWRgW6v/n6iIWJ3viwiZEL6vsKEq1hQqa5F2zz3TwuFsm88UXcIT5Pys9LczsYujp438e4
 yKj+7SlhlqDc587gSMVJWpI3B9sfHIkW9uX2CGCH09wYhuGvpQ6xHbbMgRmav8uVFdqlQNJ7Hv+
 TccLJGHGlkfuViLexnRGLVp6hr3Q==
X-Received: by 2002:a05:6a00:2e85:b0:824:40d8:9d68 with SMTP id
 d2e1a72fcca58-826d09258acmr4037b3a.32.1771550637386; 
 Thu, 19 Feb 2026 17:23:57 -0800 (PST)
Received: from wash-5.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6a627a5sm25606758b3a.27.2026.02.19.17.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 17:23:57 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Feb 2026 17:23:53 -0800
MIME-Version: 1.0
Message-Id: <20260219-virglrenderer-v3-1-e2ff1a23be3f@gmail.com>
References: <20260219-virglrenderer-v3-0-e2ff1a23be3f@gmail.com>
In-Reply-To: <20260219-virglrenderer-v3-0-e2ff1a23be3f@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771550636; l=5486;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=LB26QMTUjjhqGvl4be7HySoE0bxG6BEU7W/VNYR3qyY=;
 b=5zo8LdaVRd0o4gEP17pXgyM0QW+E9HyNiNriyw+FqeIk/3jvyzl8RYY+37z78PMHPmPDjCkbi
 7RxeV10WgGCBnyZLZ8sgBbNuSXUtAg39L4XiuVlKlc5W5lGC62jidEK
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771550637; x=1772155437; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SPoc/WnBHEdElxmdcMH77Msz+ASVDzG+pMJGMohveVg=;
 b=ZcU3RhnlBD9sK8Fo5kH5dJUrwMpQuH9Sk5tMZXfuF4YxUXGS/KPIqjmik7MndBDGxJ
 FZhnKWFldvSg0H1Ub0PQ92Fzm0tyn+kCXujVQooJjm1sus623CKQPqZ814Se4a1uXOtL
 zzcr3G0I2hk2bxq2cHwYBtS/FkvlH9dIMZpQJdxJzMwMNOHQ9a60U6pMtI6cc00D85PQ
 n/V8PZA2+cEXGJjGvOaPM+CcgV1Nv2lDKFJsEUIMS1LvrwoU8bKNnA+/SRHfbxcSR6Ar
 JW+KzXc6RwqOWRbx7/PpmH/RoZsOrTw6ROyyIgPjHQgFvgKkBSGRL202ojgCr4myru0e
 AHcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZcU3Rhnl
Subject: [Buildroot] [PATCH v3 1/2] package/virglrenderer: new package
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
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/virglrenderer/Config.in          | 49 +++++++++++++++++++++++++++
 package/virglrenderer/virglrenderer.hash |  5 +++
 package/virglrenderer/virglrenderer.mk   | 57 ++++++++++++++++++++++++++++++++
 5 files changed, 113 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..2c5624c1c1 100644
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
index 371a1c33e1..15a1bc7a25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1793,6 +1793,7 @@ menu "Graphics"
 	source "package/stb/Config.in"
 	source "package/tiff/Config.in"
 	source "package/unclutter-xfixes/Config.in"
+	source "package/virglrenderer/Config.in"
 	source "package/waffle/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
new file mode 100644
index 0000000000..81274eef38
--- /dev/null
+++ b/package/virglrenderer/Config.in
@@ -0,0 +1,49 @@
+config BR2_PACKAGE_VIRGLRENDERER
+	bool "virglrenderer"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_USE_MMU # libdrm
+	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBEPOXY
+	help
+	  A library for accelerated graphics and compute in
+	  virtualized guests.
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+if BR2_PACKAGE_VIRGLRENDERER
+
+config BR2_PACKAGE_VIRGLRENDERER_VENUS
+	bool "venus"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  Venus is a virtio-gpu protocol for Vulkan command
+	  serialization.
+
+	  Say 'y' if you want to run applications with Vulkan
+	  acceleration in virtualized guests.
+
+	  https://docs.mesa3d.org/drivers/venus.html
+
+config BR2_PACKAGE_VIRGLRENDERER_VAAPI
+	bool "vaapi support"
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
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
+comment "virglrenderer needs EGL and libgbm"
+	depends on !BR2_PACKAGE_HAS_LIBEGL \
+		|| !BR2_PACKAGE_HAS_LIBGBM
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
index 0000000000..3658d4c239
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.mk
@@ -0,0 +1,57 @@
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
+	libdrm \
+	libegl \
+	libepoxy \
+	libgbm \
+	host-pkgconf \
+	host-python3 \
+	host-python-pyyaml
+VIRGLRENDERER_CPE_ID_VALID = YES
+
+ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VENUS),y)
+VIRGLRENDERER_CONF_OPTS += -Dvenus=true
+VIRGLRENDERER_DEPENDENCIES += vulkan-headers \
+			      vulkan-loader
+else
+VIRGLRENDERER_CONF_OPTS += -Dvenus=false
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+VIRGLRENDERER_DRM_BACKENDS += msm
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915),y)
+VIRGLRENDERER_DRM_BACKENDS += i915-experimental
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+VIRGLRENDERER_DRM_BACKENDS += panfrost-experimental
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
+VIRGLRENDERER_DRM_BACKENDS += amdgpu-experimental
+endif
+
+ifneq ($(VIRGLRENDERER_DRM_BACKENDS),)
+VIRGLRENDERER_CONF_OPTS += -Ddrm-renderers=$(VIRGLRENDERER_DRM_BACKENDS)
+endif
+
+ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VAAPI),y)
+VIRGLRENDERER_CONF_OPTS += -Dvideo=true
+VIRGLRENDERER_DEPENDENCIES += libva
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
