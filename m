Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7453C54E71
	for <buildroot@archiver.kernel.org>; Sat, 24 May 2025 08:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99F2D820D9;
	Sat, 24 May 2025 08:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fSKl0b-S_tB; Sat, 24 May 2025 08:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B859B820EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B859B820EA;
	Sat, 24 May 2025 08:04:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D5ACA
 for <buildroot@buildroot.org>; Sat, 24 May 2025 08:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 832AC6065C
 for <buildroot@buildroot.org>; Sat, 24 May 2025 08:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1J5jAgzXleA for <buildroot@buildroot.org>;
 Sat, 24 May 2025 08:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D67496089F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D67496089F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D67496089F
 for <buildroot@buildroot.org>; Sat, 24 May 2025 08:04:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25AA9A4C2BDD;
 Sat, 24 May 2025 10:03:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60876)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uIjrK-000000006mk-0jkH;
 Sat, 24 May 2025 08:03:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Romain Naour <romain.naour@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Sat, 24 May 2025 10:03:55 +0200
Message-Id: <20250524080355.19316-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1748073839;
 bh=QZ5WRDQSGPgKxoKbDpakeVkg2B+1EhwG0S4dI5FFCU0=;
 h=From:To:Cc:Subject:Date:From;
 b=Lpu4CVZNYxOrsfeHEz/gMVRHC73E9vmCL+9MgEWg+KSpueWhXeCio/evqrYJbtWb4
 rC3ScK4dI2PUV4Aw1b5IP0uiS4spAWFSsgSNc16zI10jbWezI8/fIGDqUUU71dFsCX
 0m4Kdn2FXlYPS3xpH01IkfAT/8fywAS//CfkGTOm6mafF7nlwHLN+b5jn8vnFCD9wv
 GP4KCJ9KSPujTx/37fjqNLZWXQsh8S3pl+XYIHDZ7C9gF89bFnvm068xvhDtTzLD5x
 95xO2+pC7mwGCwjXTpY2I9sXa7w2dGMrWtg/zWRUKlynvj82YWrqgi1w6jW9BQD7Lf
 31gisRptiDzBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=Lpu4CVZN
Subject: [Buildroot] [PATCH/next v3 1/1] package/mesa3d: bump version to
 25.1.1
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

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2025-May/000804.html
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
Also remove optional osmesa support from mesa3d-demos and wine.
Regarding wine please see this discussion:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33836#note_2805850

Configure option shared-glapi was removed upstream:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/e5c76088e9e8834aa277777b41604b2463029a09
https://gitlab.freedesktop.org/mesa/mesa/-/commit/fefb1a6fb3cff1b227e835c2f67accd33fb96b2a

Removed deprecated and unused configure options gallium-opencl & power8:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/a0b457aca6cbe94d555ae75864a47bb6a16318a0
https://gitlab.freedesktop.org/mesa/mesa/-/commit/c4b305079d70790ee9d34a25a2f70759ece96f0d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd v3: - bump to 25.1.1, rebase on -next branch, added note about
             impact of osmesa removal on wine]
Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Mehdi v2: - removed 0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
           from .checkpackageignore.
           - removed OSMesa from mesa-demos and wine packages.]
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
index b9e3b42915..8f6c912d23 100644
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
index 9681617a3c..563d532604 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
+	bool "mesa3d OSMesa (Gallium) library support removed"
+	select BR2_LEGACY
+	help
+	  Mesa3d removed the OSMesa (Off-Screen) interface library.
+
 config BR2_PACKAGE_ALSA_LIB_ALISP
 	bool "alsa-lib alisp support removed"
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
index cabdbe6595..45b7e9084a 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.0.6
+MESA3D_HEADERS_VERSION = 25.1.1
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
index c94611ff05..ee99e8b635 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-May/000803.html
-sha256  0d179e019e3441f5d957330d7abb3b0ef38e6782cc85a382608cd1a4a77fa2e1  mesa-25.0.6.tar.xz
-sha512  6a0abc8a5bbbb8ffdad7286fc5642f643b1f4183794425ba689c2c9f5c73a4131c8685074241deb1022631b4c1f1c505dbd848190ec60d5d6931e90dd9316e05  mesa-25.0.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-May/000804.html
+sha256  cf942a18b7b9e9b88524dcbf0b31fed3cde18e6d52b3375b0ab6587a14415bce  mesa-25.1.1.tar.xz
+sha512  8000fec61da3b7c0355b74458c52f8faeb562398a1882d68cd31a253848edd3333072521ec52f8c5c1a62d909afd6667803d43cb54027d0af3d944f1add27aae  mesa-25.1.1.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 84d1aae6ef..203c5a18c3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.0.6
+MESA3D_VERSION = 25.1.1
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
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
