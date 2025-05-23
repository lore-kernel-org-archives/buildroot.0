Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29275C3DA6D
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 07:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFFAA83CA0;
	Fri, 23 May 2025 07:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBSEUeJw3a-D; Fri, 23 May 2025 07:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B07483C42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B07483C42;
	Fri, 23 May 2025 07:23:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8753119
 for <buildroot@buildroot.org>; Fri, 23 May 2025 07:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EBBA402A4
 for <buildroot@buildroot.org>; Fri, 23 May 2025 07:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfFvMcKRGcFb for <buildroot@buildroot.org>;
 Fri, 23 May 2025 07:23:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BF0940217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF0940217
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BF0940217
 for <buildroot@buildroot.org>; Fri, 23 May 2025 07:23:22 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-441d437cfaaso54843795e9.1
 for <buildroot@buildroot.org>; Fri, 23 May 2025 00:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747985000; x=1748589800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GrsTgjw5602FMu6+DN4YfRmVWaJte3h0qmHvc8sLd4k=;
 b=oicSOPEJN4hBAfJKYetBIkl01BJHbLLoHgWidJeTf9Zu+ria7pyv1onCapV8776yoh
 GS8n5qQfVvYSSIvXMfOopG1T28sstVxRwySwvZwh42shPRHpxhw9gJKHFE6L8pkfE6wg
 rgwK3a4S1WFAguI831k7s2c4FlKawjEl8DVB6vdxXtkAjljjIWu4sehinn75aHvI39WC
 ArzCQUzumc5lq3PA84K2FXsgKvKSTL/NApqWoYs/JtNwJuRL42F0NcKi5IzPiVPcqtDt
 GjBzWrBSD2D2YiYpUAnqTKROcw81ZQR+cys4H9eawoJbo0BpGiV9Tag08IKWCtiW225n
 PYkw==
X-Gm-Message-State: AOJu0YxzMlU126i7U1kDvNrDE+Kl5zEQUdyEbOsaAJJKV0j1XHZEtYxe
 lxWg1qc52xRYWW54BC3rPPhKJTpg9lYc/Q6MprQdLtheJWMco1vsJBI6SeDfq3y+Lp8dV1Vmo9/
 xWQsb
X-Gm-Gg: ASbGncuTz90Xn2GjLeanBKnvTrcCGuza1p6WFTzgXmE+at7Jsiv39brrD6uOQahxLdM
 skCsjxxBWkXTNxAOXjBDQwVsEoAta6anFowmqN4b/e104G5eq9S3OIf2RBe0Rqh95QT28RughyQ
 ckYMjz+m3UhGJpRIG3aO9VLDj3eWh+ym8ATJ2fLEM2OyYcihYHgXgsPtp/+D9K6Fd20lmDKuoN9
 wlGj0uC8ApKlXBGCLVWF42wkGjXFQhikKF5TE03uFTlN3x/1hxZ0TRfXlrEr5WHtKFOeL9wUjBg
 lluwDAxHIDLxb1ishsPVklgewkGvY8J7l3+7boq/GuL1myvmX7PF0UcoTiq7WTir0mNhTt9KPCY
 FVfdCbjc4ggYGkonTxpt67tIPaKA+iKmETZrkVBkapRFFwGPSR5JwbYdM
X-Google-Smtp-Source: AGHT+IEG/7E1iZwr6SUbJuqUSb1MMQDe+Cck6bNCtJBAWKgVroLX6abxjVNYfYyaBG1pk77/Sfh18A==
X-Received: by 2002:a05:600c:3b21:b0:441:b3eb:5720 with SMTP id
 5b1f17b1804b1-442ff0396b5mr255247905e9.29.1747985000268; 
 Fri, 23 May 2025 00:23:20 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f38142b8sm128224025e9.30.2025.05.23.00.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 00:23:19 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 23 May 2025 09:23:05 +0200
Message-ID: <20250523072305.2052937-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747985000; x=1748589800; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GrsTgjw5602FMu6+DN4YfRmVWaJte3h0qmHvc8sLd4k=;
 b=HLcBjqBZydaUyydzQ40rxG0SrcW4hihBKCTzWkX6y1aOUtK5nEmlJBgG0ArSquSj7P
 CRWpKKzVVtRzwOp+y0sCBzEb3DHeefr8tpD2hSA6IIFAoggI4dRSfXJb2PII+9Zqs3Mf
 qttoxoL70eWztdvi/P1ytEMIOtrarWQ4SLQcs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=HLcBjqBZ
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: bump version to 25.1.0
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2025-May/000802.html

Note: Mesa3d depends on spirv-tools >= 2024.1
https://gitlab.freedesktop.org/mesa/mesa/-/commit/fe8a0d35485c77efdb3c4cb6f176f2b3cbe4c65d
which translates to spirv-tools version 1.3.280.0.

Note: AMD drivers depend on llvm >= 18:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/82047fa82f1bbbbd4f1a9b05c034f79a00d85e31

Removed patch 0001, not needed anymore due to upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/e4eb5e80c316c0af3fff310ca89e1175d81556c1
which removes the libclc headers include.

Renumbered remaining patches.

Rebased patch 0002 due to upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/6652eb0ec37e3cc3751928cc8180bac0db95f00f
which renamed meson_options.txt to meson.options.

Panfrost driver depends on llvm:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/20970bcd9652ea8727a307ced9b372fad4b89991
and needs the host tool panfrost_compile which is created by the same
method as mesa_clc needed by the Iris driver. Refactor the dependencies
by introducing a blind option BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
which is selected by either the iris or the panfrost driver.

vtn_bindgen was replaced by vtn_bindgen2:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/6d5375017a516f4281ec0b73748582c56a86057a

OSMesa was removed upstream:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/027ccd963b1f8f288bef4224aedcddc1557e4f8a

Configure option shared-glapi was removed upstream:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/e5c76088e9e8834aa277777b41604b2463029a09
https://gitlab.freedesktop.org/mesa/mesa/-/commit/fefb1a6fb3cff1b227e835c2f67accd33fb96b2a

Removed deprecated and unused configure options gallium-opencl & power8:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/a0b457aca6cbe94d555ae75864a47bb6a16318a0
https://gitlab.freedesktop.org/mesa/mesa/-/commit/c4b305079d70790ee9d34a25a2f70759ece96f0d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Mehdi v2: - removed 0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
           from .checkpackageignore.
           - removed OSMesa from mesa-demos and wine packages.]
---
[Mehdi NOTE: I'm working on adding rusticl support, I have positif
             results for now on a khadas vim 3 (arm64). But we need
	     at least LLVM 18 due to several fixes. This is why I'm
	     not sharing it right now. I'm wating for the merge of
             llvm-project upgrade patch]

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 +++
 package/mesa3d-demos/mesa3d-demos.mk          | 11 +----
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...t-proper-value-for-LIBCLC_INCLUDEDIR.patch | 41 -------------------
 ...ion-to-disable-optional-neon-suppor.patch} | 10 ++---
 ...-Include-stddef.h-to-fix-build-erro.patch} |  0
 ...uild.patch => 0003-Fix-uClibc-build.patch} |  0
 package/mesa3d/Config.in                      | 24 ++++++-----
 package/mesa3d/mesa3d.hash                    |  6 +--
 package/mesa3d/mesa3d.mk                      | 35 ++++++++--------
 package/wine/wine.mk                          | 10 +----
 12 files changed, 50 insertions(+), 96 deletions(-)
 delete mode 100644 package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
 rename package/mesa3d/{0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch => 0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch} (93%)
 rename package/mesa3d/{0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch => 0002-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch} (100%)
 rename package/mesa3d/{0004-Fix-uClibc-build.patch => 0003-Fix-uClibc-build.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index fe736e3185..93866e8414 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -798,7 +798,6 @@ package/memstat/0001-PATH_MAX.patch lib_patch.Upstream
 package/mender-connect/S43mender-connect Shellcheck
 package/menu-cache/0001-Support-gcc10-compilation.patch lib_patch.Upstream
 package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch lib_patch.Upstream
-package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch lib_patch.Upstream
 package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch lib_patch.Upstream
 package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch lib_patch.Upstream
 package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 54792bc22f..d14e2a16c2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.05"
 
+config BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
+	bool "mesa3d OSMesa (Gallium) library support removed"
+	select BR2_LEGACY
+	help
+	  Mesa3d removed the OSMesa (Off-Screen) interface library.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	bool "mesa Gallium swrast driver was replaced by softpipe"
 	select BR2_LEGACY
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index cc0121f6d6..fd4805a728 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -11,7 +11,8 @@ MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
 MESA3D_DEMOS_CONF_OPTS += \
-	-Dgles1=disabled
+	-Dgles1=disabled \
+	-Dosmesa=disabled  # BR2_PACKAGE_MESA3D_OSMESA_GALLIUM removed in mesa 25.1
 
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
 MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu xlib_libX11 xlib_libXext
@@ -52,14 +53,6 @@ endif
 ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
 MESA3D_DEMOS_DEPENDENCIES += libfreeglut
 MESA3D_DEMOS_CONF_OPTS += -Dwith-glut=$(STAGING_DIR)/usr
-# osmesa support depends on glut
-ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_GALLIUM),y)
-MESA3D_DEMOS_CONF_OPTS += -Dosmesa=enabled
-else
-MESA3D_DEMOS_CONF_OPTS += -Dosmesa=disabled
-endif
-else
-MESA3D_DEMOS_CONF_OPTS += -Dosmesa=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDECOR)$(BR2_PACKAGE_WAYLAND),yy)
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index cabdbe6595..6817469885 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.0.6
+MESA3D_HEADERS_VERSION = 25.1.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
deleted file mode 100644
index ff362551ea..0000000000
--- a/package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7b46756a99aca7f27a45c3b99460f088570f6f53 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Wed, 17 Apr 2019 23:07:42 +0200
-Subject: [PATCH] meson: Set proper value for LIBCLC_INCLUDEDIR
-
-LIBCLC_INCLUDEDIR is the location where mesa3d OpenCL implementation
-will look for OpenCL "headers" on the target, when building the OpenCL
-kernels.
-
-The value returned by pkg-config for includedir is relevant when
-cross-compiling, on the build machine. But in this specific case, we
-really need a value that is valid on the target.
-
-Those headers are installed by the libclc package in /usr/share so
-that they are not removed by Buildroot target-finalize logic.
-
-Based on the patch for autotools provided by Valentin Korenblit.
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[rebased for 20.2.0, 20.3.0 & 25.0.0]
----
- src/gallium/frontends/clover/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gallium/frontends/clover/meson.build b/src/gallium/frontends/clover/meson.build
-index 62ac5f5278d..ecdeb39669c 100644
---- a/src/gallium/frontends/clover/meson.build
-+++ b/src/gallium/frontends/clover/meson.build
-@@ -10,7 +10,7 @@
-   '-DCL_USE_DEPRECATED_OPENCL_2_0_APIS',
-   '-DCL_USE_DEPRECATED_OPENCL_2_1_APIS',
-   '-DCL_USE_DEPRECATED_OPENCL_2_2_APIS',
--  '-DLIBCLC_INCLUDEDIR="@0@/"'.format(dep_clc.get_variable(pkgconfig : 'includedir')),
-+  '-DLIBCLC_INCLUDEDIR="/usr/share"',
-   '-DLIBCLC_LIBEXECDIR="@0@/"'.format(dep_clc.get_variable(pkgconfig : 'libexecdir'))
- ]
- clover_incs = [inc_include, inc_src, inc_gallium, inc_gallium_aux]
--- 
-2.20.1
-
diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
similarity index 93%
rename from package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
rename to package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index 3b9bca0693..04b33a7856 100644
--- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -10,19 +10,19 @@ to force disabling it at compile time.
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0 & 24.3.0]
+[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0, 24.3.0 & 25.1.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [fix syntax error after previous rebases]
 ---
- meson_options.txt                    | 7 +++++++
+ meson.options                        | 7 +++++++
  src/gallium/drivers/vc4/meson.build  | 4 ++--
  src/gallium/drivers/vc4/vc4_tiling.h | 4 ++--
  3 files changed, 11 insertions(+), 4 deletions(-)
 
-diff --git a/meson_options.txt b/meson_options.txt
+diff --git a/meson.options b/meson.options
 index 8e0bf2a..1cf0e07 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
+--- a/meson.options
++++ b/meson.options
 @@ -117,6 +117,13 @@ option(
    description : 'enable gallium va frontend.',
  )
diff --git a/package/mesa3d/0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch b/package/mesa3d/0002-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
similarity index 100%
rename from package/mesa3d/0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
rename to package/mesa3d/0002-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
diff --git a/package/mesa3d/0004-Fix-uClibc-build.patch b/package/mesa3d/0003-Fix-uClibc-build.patch
similarity index 100%
rename from package/mesa3d/0004-Fix-uClibc-build.patch
rename to package/mesa3d/0003-Fix-uClibc-build.patch
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 99cb0b955c..8b61421d98 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -21,6 +21,12 @@ if BR2_PACKAGE_MESA3D
 config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 	bool
 
+config BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	bool
+	select BR2_PACKAGE_MESA3D_OPENCL
+	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
+	select BR2_PACKAGE_SPIRV_TOOLS
+
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
@@ -50,6 +56,7 @@ config BR2_PACKAGE_MESA3D_OPENCL
 	bool "OpenCL support"
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	select BR2_PACKAGE_LLVM_RTTI
@@ -131,9 +138,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_OPENCL
-	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
-	select BR2_PACKAGE_SPIRV_TOOLS
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	help
 	  Mesa driver for iris-based Intel GPUs.
 
@@ -171,10 +176,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	bool "Gallium panfrost driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
 
+comment "panfrost driver needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
 	bool "Gallium Radeon R300 driver"
 	depends on BR2_i386 || BR2_x86_64
@@ -348,14 +358,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO
 	help
 	  Vulkan VirtIO (venus) driver.
 
-comment "Off-screen Rendering"
-
-config BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
-	bool "OSMesa (Gallium) library"
-	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
-	help
-	  The OSMesa API provides functions for off-screen rendering.
-
 if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "OpenGL API Support"
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index c94611ff05..40a6e88863 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-May/000803.html
-sha256  0d179e019e3441f5d957330d7abb3b0ef38e6782cc85a382608cd1a4a77fa2e1  mesa-25.0.6.tar.xz
-sha512  6a0abc8a5bbbb8ffdad7286fc5642f643b1f4183794425ba689c2c9f5c73a4131c8685074241deb1022631b4c1f1c505dbd848190ec60d5d6931e90dd9316e05  mesa-25.0.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-May/000802.html
+sha256  b1c45888969ee5df997e2542654f735ab1b772924b442f3016d2293414c99c14  mesa-25.1.0.tar.xz
+sha512  40298370727fa1ad6d59be8692dfef01c42e41780816e9b951a05f779c7acca127162d2d3cedfccb7bfe3834b9e917c2b9bc6cb76887488d919cb61741a1da1a  mesa-25.1.0.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 84d1aae6ef..d067fd45ed 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.0.6
+MESA3D_VERSION = 25.1.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -30,10 +30,8 @@ MESA3D_DEPENDENCIES = \
 	zlib
 
 MESA3D_CONF_OPTS = \
-	-Dgallium-opencl=disabled \
 	-Dgallium-rusticl=false \
-	-Dmicrosoft-clc=disabled \
-	-Dpower8=disabled
+	-Dmicrosoft-clc=disabled
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
 MESA3D_DEPENDENCIES += xlib_libxshmfence
@@ -65,7 +63,7 @@ endif
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 # Disable-mangling not yet supported by meson build system.
 # glx:
-#  dri          : dri based GLX requires at least one DRI driver || dri based GLX requires shared-glapi
+#  dri          : dri based GLX requires at least one DRI driver
 #  xlib         : xlib conflicts with any dri driver
 # Always enable glx-direct; without it, many GLX applications don't work.
 MESA3D_CONF_OPTS += \
@@ -96,10 +94,12 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedreno
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
+HOST_MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS) += iris
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE) += llvmpipe
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
+HOST_MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
@@ -122,7 +122,6 @@ MESA3D_CONF_OPTS += \
 	-Dgallium-extra-hud=false
 else
 MESA3D_CONF_OPTS += \
-	-Dshared-glapi=enabled \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
 	-Dgallium-extra-hud=true
 endif
@@ -135,7 +134,7 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
+ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER),y)
 MESA3D_CONF_OPTS += -Dmesa-clc=system -Dprecomp-compiler=system
 MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
 endif
@@ -151,12 +150,6 @@ endif
 
 # APIs
 
-ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_GALLIUM),y)
-MESA3D_CONF_OPTS += -Dosmesa=true
-else
-MESA3D_CONF_OPTS += -Dosmesa=false
-endif
-
 # Always enable OpenGL:
 #   - Building OpenGL ES without OpenGL is not supported, so always keep opengl enabled.
 MESA3D_CONF_OPTS += -Dopengl=true
@@ -273,11 +266,9 @@ else
 MESA3D_CONF_OPTS += -Dglvnd=disabled
 endif
 
-# host-mesa3d is needed by mesa3d only when the Iris Gallium driver is
-# enabled
 HOST_MESA3D_CONF_OPTS = \
 	-Dglvnd=disabled \
-	-Dgallium-drivers=iris \
+	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
 	-Dgallium-vdpau=disabled \
 	-Dinstall-mesa-clc=true \
 	-Dmesa-clc=enabled \
@@ -286,6 +277,10 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dglx=disabled \
 	-Dvulkan-drivers=""
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+HOST_MESA3D_CONF_OPTS += -Dtools=panfrost
+endif
+
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
@@ -293,9 +288,15 @@ HOST_MESA3D_DEPENDENCIES = \
 	host-python-pyyaml \
 	host-spirv-tools
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+HOST_MESA3D_INSTALL_PANFROST_COMPILE = \
+	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/panfrost/clc/panfrost_compile $(HOST_DIR)/bin/panfrost_compile
+endif
+
 define HOST_MESA3D_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/compiler/clc/mesa_clc $(HOST_DIR)/bin/mesa_clc
-	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/compiler/spirv/vtn_bindgen $(HOST_DIR)/bin/vtn_bindgen
+	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/compiler/spirv/vtn_bindgen2 $(HOST_DIR)/bin/vtn_bindgen2
+	$(HOST_MESA3D_INSTALL_PANFROST_COMPILE)
 endef
 
 $(eval $(meson-package))
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index efee63a294..380f729585 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -33,7 +33,8 @@ WINE_CONF_OPTS = \
 	--without-mingw \
 	--without-opencl \
 	--without-oss \
-	--without-vulkan
+	--without-vulkan \
+	--without-osmesa  # BR2_PACKAGE_MESA3D_OSMESA_GALLIUM removed in mesa 25.1
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
 # construct the filename of the gcc to call.  But for external
@@ -143,13 +144,6 @@ else
 WINE_CONF_OPTS += --without-v4l2
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_GALLIUM),y)
-WINE_CONF_OPTS += --with-osmesa
-WINE_DEPENDENCIES += mesa3d
-else
-WINE_CONF_OPTS += --without-osmesa
-endif
-
 ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
 WINE_CONF_OPTS += --with-pcsclite
 WINE_DEPENDENCIES += pcsc-lite
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
