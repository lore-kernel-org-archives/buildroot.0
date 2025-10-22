Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB94CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 00:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B787B8301D;
	Wed, 22 Oct 2025 00:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKYc5ZkEP_K4; Wed, 22 Oct 2025 00:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF5B58303C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF5B58303C;
	Wed, 22 Oct 2025 00:07:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2B1343F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3D158303C
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IC9k9JVM8bgL for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 00:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F00A58301D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00A58301D
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F00A58301D
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:07:34 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-29292eca5dbso36587305ad.0
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761091654; x=1761696454;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p2NDWMxanDRZDlq6vBgj+Bjk+5nM/C6pQlzEzHRuPM4=;
 b=eo95zffsl9B0oxtuID5XbXSkIjer91n/QF+qAd7IfLztPLrJW5nb63qH8VKOWaxl7s
 Yj1wm8VSCvcIB8IdhuZdV1rdifwVcdCC4frSBuPM6Lwou6atXLftiLhyfQE3+qPS8Xdj
 nOG/O20/684gXyLzp4QNJyfEbJWy0Xc8rVx/dGzKeM1IIEDz6DVk2CgNcFhZSzP+NziZ
 gQo2YKqMcZXZ3LdLfZ68qsBa8x/yNdZsSs5gUW/+ZHHPdgEPDZs1m5cVv3NInyULZfi2
 /JSP2aeKXeRNLiAhN/x9Gj9GyOp12C/53RZ7aQu+4YmL0uc2YAe1OW2DNXV4+i8Kr/oe
 tzzQ==
X-Gm-Message-State: AOJu0YybK/1AanY8AByl/B+1nVex37sNRP3UbSnINDdCUOVEbzCyXzKA
 fBRz7dLOVs+kYe9dUM8InKb1QOn1FGAVDV8oWqdSq21yibFeL5U82kXS
X-Gm-Gg: ASbGncv667Ul3woyz+rG/sEUIBIl5iti8KSFbobDX9eAdJ/i15SW+gTPrOrfBM8/eLI
 OO4yhwner7+hKwsxtVLeJlAvPU4ZTir1myjiSd/QQZ4aDzjlyAEnruXYqOZBG++IswzfroxoEBX
 nWDm4ls8SDxGcv66lZLGUjfPAyL4JjBZYdLcZevVibOnHlo1zWExJdAePw3MOrYFNc1C0Cnzp/J
 ILrUhbgMftSA1Z/HahEs8sbVW8FyjZ176ng9exqSWnuZVv6VbfJlgVIXfo7G3d433/HpLzw2aPm
 5/mKK2nLMPRCKKP/mfRxmVGVE/cN5pjy46GHRvMPFPc4dV2NzDvqX6toiRN1U9uHu4ZVIavQ6dk
 +rS2V95ogVqg4WcZ6iwMg2w3VE6HXsCapxIk4EwM5+k+tECbBQkAHJQhqQfh3rn7JpNNchErqTz
 8o/yTA151TuZs=
X-Google-Smtp-Source: AGHT+IGKgbAa80v82iCe3fsHHOyW5dHr2rciGPIDCysAIzlFW+mmqOg14P8/AmBvKOywRbc7+upRvQ==
X-Received: by 2002:a17:903:1746:b0:264:7bf5:c520 with SMTP id
 d9443c01a7336-290cb07cc27mr247277985ad.44.1761091654307; 
 Tue, 21 Oct 2025 17:07:34 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2924721b6cfsm121350075ad.107.2025.10.21.17.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 17:07:33 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 21 Oct 2025 17:07:32 -0700
MIME-Version: 1.0
Message-Id: <20251021-virglrenderer-v2-v2-1-d3ea6ff07489@gmail.com>
References: <20251021-virglrenderer-v2-v2-0-d3ea6ff07489@gmail.com>
In-Reply-To: <20251021-virglrenderer-v2-v2-0-d3ea6ff07489@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>, Adam Ford <aford173@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761091654; x=1761696454; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2NDWMxanDRZDlq6vBgj+Bjk+5nM/C6pQlzEzHRuPM4=;
 b=LyYtUIGZ8TFhpHKQdCBkl1kdrh47AKnbVxt5UQRrwhANtdpiThZ6dGRDAfRyRqZ3NY
 Xuojg3m9Y/b83DqnKARNNx+2hlwnPp57hIVb5FlA5UTW+V/I2aFWZNL4mheBM4XwHlOM
 LOK+L77UI+6hFpaANwEed5jDLWJPnUIoeTPzuMCXtqWHUriHSUyH63nzPE/3Y5NO65On
 TA+3Y920g2IlEKpTG7M1YGVTBWFBLxh7SkqQ3ZysqMIO/UjEqSkhJTb2/sQjT7zQtfES
 +5G6zlHtDoZFkxerc2uBLnpHIGWtvssKnKMvtQdrzkR7zR4kg17g9Mt/febJ9uOLD2iw
 xvwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LyYtUIGZ
Subject: [Buildroot] [PATCH v2 1/2] package/virglrenderer: new package
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
 package/virglrenderer/Config.in          | 33 +++++++++++++++++++++++++++++
 package/virglrenderer/virglrenderer.hash |  5 +++++
 package/virglrenderer/virglrenderer.mk   | 36 ++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fb8eedb5cf..9ae46884c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1787,6 +1787,7 @@ F:	package/python-xlib/
 F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
+F:	package/virglrenderer/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/package/Config.in b/package/Config.in
index 1c4dcf2c75..f7cfffae0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1807,6 +1807,7 @@ menu "Graphics"
 	source "package/stb/Config.in"
 	source "package/tiff/Config.in"
 	source "package/unclutter-xfixes/Config.in"
+	source "package/virglrenderer/Config.in"
 	source "package/waffle/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
new file mode 100644
index 0000000000..8f594849f6
--- /dev/null
+++ b/package/virglrenderer/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_VIRGLRENDERER
+	bool "virglrenderer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_USE_MMU # libdrm
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBDRM
+	help
+	  VirGL is a virtual 3D GPU for use inside QEMU
+	  virtual machines, that allows the guest operating
+	  system to use the capabilities of the host GPU to
+	  accelerate 3D rendering.
+
+	  https://docs.mesa3d.org/drivers/virgl.html
+
+if BR2_PACKAGE_VIRGLRENDERER
+
+config BR2_PACKAGE_VIRGLRENDERER_VENUS
+	bool "venus"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
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
+endif
diff --git a/package/virglrenderer/virglrenderer.hash b/package/virglrenderer/virglrenderer.hash
new file mode 100644
index 0000000000..4df8e3a181
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  8bae92909021ea87e2087ae96df322f90140c414bd5f38810af3f3e5146a567b  virglrenderer-1.2.0.tar.gz
+
+# License
+sha256  3b32caf16e2402c2aff2b716858713f3e1feded85c25e71bf829816ee5009402  COPYING
diff --git a/package/virglrenderer/virglrenderer.mk b/package/virglrenderer/virglrenderer.mk
new file mode 100644
index 0000000000..2e25a7475b
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# virglrenderer
+#
+################################################################################
+
+VIRGLRENDERER_VERSION = 1.2.0
+VIRGLRENDERER_SITE = https://gitlab.freedesktop.org/virgl/virglrenderer/-/archive/$(VIRGLRENDERER_VERSION)
+VIRGLRENDERER_LICENSE = MIT
+VIRGLRENDERER_LICENSE_FILES = COPYING
+VIRGLRENDERER_INSTALL_STAGING = YES
+VIRGLRENDERER_DEPENDENCIES = \
+	libepoxy \
+	libdrm \
+	libegl \
+	host-pkgconf
+VIRGLRENDERER_CPE_ID_VALID = YES
+
+ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VENUS),y)
+VIRGLRENDERER_CONF_OPTS += -Dvenus=true
+VIRGLRENDERER_DEPENDENCIES += vulkan-loader
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
+VIRGLRENDERER_DRM_BACKENDS += amdgpu-experimental
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+VIRGLRENDERER_DRM_BACKENDS += msm
+endif
+
+ifneq ($(VIRGLRENDERER_DRM_BACKENDS),)
+VIRGLRENDERER_CONF_OPTS += -Ddrm-renderers=$(VIRGLRENDERER_DRM_BACKENDS)
+endif
+
+$(eval $(meson-package))

-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
