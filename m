Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A43D10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9462440C0F;
	Sat, 26 Oct 2024 11:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlCrJY1QVEbu; Sat, 26 Oct 2024 11:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F359D40B83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F359D40B83;
	Sat, 26 Oct 2024 11:19:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 768755C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7038F40B83
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Y7cB4Xwllwz for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:19:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 689544098C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 689544098C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 689544098C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:19:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69A4CA4C0F4E;
 Sat, 26 Oct 2024 13:18:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57302)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4eoV-000000000YB-27MY;
 Sat, 26 Oct 2024 11:18:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 26 Oct 2024 13:18:33 +0200
Message-Id: <20241026111834.1688070-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241026111834.1688070-1-bernd@kuhls.net>
References: <20241026111834.1688070-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729941516;
 bh=xdliRsLU5UN8lj8D2mkGo5+3BZweZtqYZg7S40KrjUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ox6piiyYfTSKxyOkokocb8tMdayCf0R5lv6pDpu+ypMGLP7dDg11shdbpK1GaKzsy
 3DbA6opg+WNwmaKf/568uVhSPw/UenhjlxNZ+YKwjuI2ABZD8Nvd4KlUHc12IA07nN
 inFosfYHzwz1mnobUVm4HG+5XwIsUaF6g9axJHU3terbOpinEj5EnodcbsA45aSLCT
 wmdxL5vX0n4ito6cPvVGTY5nVQ+dq3N+/zNAGkPi8VIjUN77K5gTs+8DfPaHsOsIOz
 qSwQROlP/VXyPTxvDbWxofmajp4odooC3EmuvyKuD7+43L1W8ccY+uFyfUNfKkyTnz
 FuGxc/W5Vnz6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=ox6piiyY
Subject: [Buildroot] [PATCH 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.5
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
https://lists.freedesktop.org/archives/mesa-announce/2024-May/000762.html
https://lists.freedesktop.org/archives/mesa-announce/2024-June/000763.html
https://lists.freedesktop.org/archives/mesa-announce/2024-June/000765.html
https://lists.freedesktop.org/archives/mesa-announce/2024-July/000766.html
https://lists.freedesktop.org/archives/mesa-announce/2024-July/000767.html
https://lists.freedesktop.org/archives/mesa-announce/2024-July/000771.html
https://lists.freedesktop.org/archives/mesa-announce/2024-August/000773.html
https://lists.freedesktop.org/archives/mesa-announce/2024-August/000776.html
https://lists.freedesktop.org/archives/mesa-announce/2024-September/000778.html
https://lists.freedesktop.org/archives/mesa-announce/2024-September/000779.html
https://lists.freedesktop.org/archives/mesa-announce/2024-October/000780.html
https://lists.freedesktop.org/archives/mesa-announce/2024-October/000781.html
------------------------------------------------------------------------
Changes needed for the bump to 24.1.x:

Added dependency to llvm & Co. for iris driver due to upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=a512c2a8b572c5da360873320dbbd343c6223cd6

Added host version of mesa tool intel_clc needed for target build of the
iris driver.

Added dependency to host-python-pycparser for etnaviv driver due to
upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/src/etnaviv/hwdb/meson.build?h=24.1&id=2192e620bb0c68b75ff45165d0b117c7ecb77268

Added dependency to host-python-ply for intel vulkan driver due to
upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/vulkan/grl/meson.build?h=24.1&id=dc1aedef2bd054884685ad971a3ef5be07ecd101

Although this dependency exists since mesa3d 22.3 it is only needed when
intel-clc is enabled, this dependency is added with this patch so no need
to backport this dependency to older buildroot trees.

Update configure parameter of glvnd option due to upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=4f25b84b2460524d375424a81b42faa4d99c8e60
------------------------------------------------------------------------
Changes needed for the bump to 24.2.x:

Added dependency to host-python-pyyaml to host and target build, needed
due to upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/a3813327575e8875c8c3ed24b5f45a0b7ba64446

Rebased patch 0002 due to upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/drivers/vc4/meson.build?h=24.2&id=da70827656757cd070faac7aff5ca057f1e7fb8a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...tion-to-disable-optional-neon-suppor.patch | 14 ++---
 package/mesa3d/Config.in                      | 11 +++-
 package/mesa3d/mesa3d.hash                    |  6 +--
 package/mesa3d/mesa3d.mk                      | 52 +++++++++++++++----
 5 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 33c60b285f..c55759067e 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.9
+MESA3D_HEADERS_VERSION = 24.2.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index f3919478a6..cda792b9db 100644
--- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -9,8 +9,8 @@ to force disabling it at compile time.
 
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0 & 23.2.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0 & 24.2.1]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [fix syntax error after previous rebases]
 ---
@@ -23,7 +23,7 @@ diff --git a/meson_options.txt b/meson_options.txt
 index 8e0bf2a..1cf0e07 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -124,6 +124,13 @@ option(
+@@ -148,6 +148,13 @@ option(
    description : 'enable gallium va frontend.',
  )
  
@@ -41,8 +41,8 @@ diff --git a/src/gallium/drivers/vc4/meson.build b/src/gallium/drivers/vc4/meson
 index 84da951..7f950de 100644
 --- a/src/gallium/drivers/vc4/meson.build
 +++ b/src/gallium/drivers/vc4/meson.build
-@@ -84,7 +84,7 @@ files_libvc4 = files(
- vc4_c_args = []
+@@ -72,7 +72,7 @@ files_libvc4 = files(
+ ]
  
  libvc4_neon = []
 -if host_machine.cpu_family() == 'arm'
@@ -50,9 +50,9 @@ index 84da951..7f950de 100644
    libvc4_neon = static_library(
      'vc4_neon',
      'vc4_tiling_lt_neon.c',
-@@ -93,7 +93,7 @@ if host_machine.cpu_family() == 'arm'
-     ],
+@@ -82,7 +82,7 @@ if host_machine.cpu_family() == 'arm'
      c_args : '-mfpu=neon',
+     dependencies : vc4_deps,
    )
 -  vc4_c_args += '-DUSE_ARM_ASM'
 +  vc4_c_args += '-DVC4_TILING_LT_NEON'
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 7761b0a650..3586451bc6 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -50,7 +50,8 @@ config BR2_PACKAGE_MESA3D_OPENCL
 	bool "OpenCL support"
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
@@ -129,10 +130,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_OPENCL
+	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
+	select BR2_PACKAGE_SPIRV_TOOLS
 	help
 	  Mesa driver for iris-based Intel GPUs.
 
+comment "iris driver needs llvm"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index d506d398b8..893f83cc79 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html
-sha256  51aa686ca4060e38711a9e8f60c8f1efaa516baf411946ed7f2c265cd582ca4c  mesa-24.0.9.tar.xz
-sha512  de2ee6c9df1fc106ee10befe0a76be1e9cfe83d65dbdb83bad6d8d7cfaa085232fb115293a1a790b37b50b1fe14bd58aafbcfe5a15e953b5901a7105d57569a5  mesa-24.0.9.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-October/000781.html
+sha256  733d0bea242ed6a5bb5c806fe836792ce7f092d45a2f115b7b7e15897c9dd96f  mesa-24.2.5.tar.xz
+sha512  9f202907dc4e7f1063c32882b2c9a3ab34c4d83de1c9ef4dd171043b87b110bfd7e7a3d6e3632ed768e024ef18b97181c4f6bc377cc7d3eb609dd96ebf6a783e  mesa-24.2.5.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ce460c4475..f3a5a80cdc 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.9
+MESA3D_VERSION = 24.2.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -21,12 +21,17 @@ MESA3D_DEPENDENCIES = \
 	host-bison \
 	host-flex \
 	host-python-mako \
+	host-python-pyyaml \
 	expat \
 	libdrm \
 	zlib
 
 MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
+	-Dgallium-opencl=disabled \
+	-Dgallium-rusticl=false \
+	-Dmicrosoft-clc=disabled \
+	-Dopencl-spirv=false \
 	-Dpower8=disabled
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
@@ -50,14 +55,9 @@ else
 MESA3D_CONF_OPTS += -Dllvm=disabled
 endif
 
-# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
-# libMesaOpenCL and CL headers are installed
 ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
 MESA3D_PROVIDES += libopencl
 MESA3D_DEPENDENCIES += clang libclc
-MESA3D_CONF_OPTS += -Dgallium-opencl=standalone
-else
-MESA3D_CONF_OPTS += -Dgallium-opencl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
@@ -126,6 +126,19 @@ MESA3D_CONF_OPTS += \
 	-Dgallium-extra-hud=true
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
+MESA3D_DEPENDENCIES += host-python-pycparser
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
+MESA3D_DEPENDENCIES += host-python-ply
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
+MESA3D_CONF_OPTS += -Dintel-clc=system
+MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=
@@ -251,12 +264,33 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGLVND),y)
 ifneq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),)
 MESA3D_DEPENDENCIES += libglvnd
-MESA3D_CONF_OPTS += -Dglvnd=true
+MESA3D_CONF_OPTS += -Dglvnd=enabled
 else
-MESA3D_CONF_OPTS += -Dglvnd=false
+MESA3D_CONF_OPTS += -Dglvnd=disabled
 endif
 else
-MESA3D_CONF_OPTS += -Dglvnd=false
+MESA3D_CONF_OPTS += -Dglvnd=disabled
 endif
 
+HOST_MESA3D_CONF_OPTS = \
+	-Dglvnd=disabled \
+	-Dgallium-drivers=iris \
+	-Dgallium-vdpau=disabled \
+	-Dplatforms= \
+	-Ddri3=disabled \
+	-Dglx=disabled \
+	-Dvulkan-drivers=""
+
+HOST_MESA3D_DEPENDENCIES = \
+	host-libclc \
+	host-libdrm \
+	host-python-mako \
+	host-python-pyyaml \
+	host-spirv-tools
+
+define HOST_MESA3D_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/build/src/intel/compiler/intel_clc $(HOST_DIR)/bin/intel_clc
+endef
+
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
