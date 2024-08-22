Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939BAC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07B6881CFE;
	Thu, 22 Aug 2024 18:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DWGA33_VqgN; Thu, 22 Aug 2024 18:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98421819D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98421819D2;
	Thu, 22 Aug 2024 18:16:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 142AB1BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01B3681411
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvOaAuHg9vqR for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8713C819D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8713C819D2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8713C819D2
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:16:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73706A4C26D2;
 Thu, 22 Aug 2024 20:15:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44610)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCLc-000000005D0-2Whr;
 Thu, 22 Aug 2024 18:15:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:15:45 +0200
Message-Id: <20240822181546.64900-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822181546.64900-1-bernd@kuhls.net>
References: <20240822181546.64900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350549;
 bh=R1RtFzfjyhWlW7V+PpiqcHrCiLabUNKb334+WD2y6jU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BaTMqFeYtjiVOibkmpnW3CwkfGHlMVjespDXJogTb3/3ISoOjaiWRHBsiMZNMGrmx
 C3WtAjnOeTZxYXngV6lRQwquCWuYpvVkJ4MH/yDq0XsZhTniOIZc5zGrqIESi6ym2M
 PAhYyc/nd/hNI38oCoJXK6sKjDXlfSIdnzqf5yQKEi8hiOn95j3ob0Q/80PtIuWNG6
 7T56Yw7p5SI4WDqlfWsDSbZXhuoNOdN3fqzIxBee8BSboKkl+bqWXd9sH9t0Oa8Cni
 s3TtubEddQpI6+oYM4QeqplLnb1Jj/mKlS1z8a++vNmCs/enLVANyJSkN3spMtEHY8
 XA3Nst0yu0wVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=BaTMqFeY
Subject: [Buildroot] [PATCH/next 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
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

Added dependency to host-python-pyyaml to host build, needed due to
upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/a3813327575e8875c8c3ed24b5f45a0b7ba64446

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/Config.in                 | 11 ++++-
 package/mesa3d/mesa3d.hash               |  6 +--
 package/mesa3d/mesa3d.mk                 | 51 +++++++++++++++++++-----
 4 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 33c60b285f..98afb77a9c 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.9
+MESA3D_HEADERS_VERSION = 24.2.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
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
index d506d398b8..e98dff4f86 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html
-sha256  51aa686ca4060e38711a9e8f60c8f1efaa516baf411946ed7f2c265cd582ca4c  mesa-24.0.9.tar.xz
-sha512  de2ee6c9df1fc106ee10befe0a76be1e9cfe83d65dbdb83bad6d8d7cfaa085232fb115293a1a790b37b50b1fe14bd58aafbcfe5a15e953b5901a7105d57569a5  mesa-24.0.9.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-August/000774.html
+sha256  c02bb72cea290f78b11895a0c95c7c92394f180d7ff66d4a762ec6950a58addf  mesa-24.2.0.tar.xz
+sha512  a585c788801b5a341d356e44d958b148e6e14f6b3d7224e99a92faa2f004bf0cfc90103c5fdc651afb22f805c6f9dc594f9f3f5ecebcea36f6305b3a6ccb9294  mesa-24.2.0.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ce460c4475..f094fdd030 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.9
+MESA3D_VERSION = 24.2.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -27,6 +27,10 @@ MESA3D_DEPENDENCIES = \
 
 MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
+	-Dgallium-opencl=disabled \
+	-Dgallium-rusticl=false \
+	-Dmicrosoft-clc=disabled \
+	-Dopencl-spirv=false \
 	-Dpower8=disabled
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
@@ -50,14 +54,9 @@ else
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
@@ -126,6 +125,19 @@ MESA3D_CONF_OPTS += \
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
@@ -251,12 +263,33 @@ endif
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
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
