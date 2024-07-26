Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5CDC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 19:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B95A82140;
	Fri, 26 Jul 2024 19:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BY2hFmBSFCwO; Fri, 26 Jul 2024 19:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0F8820BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0F8820BD;
	Fri, 26 Jul 2024 19:08:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 139F11BF995
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 19:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F0D940DBB
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 19:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WETyw4BntVSk for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 19:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 632E540DAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 632E540DAF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 632E540DAF
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 19:08:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba5c.dip0.t-ipconnect.de [84.161.186.92])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D95FA4C3321;
 Fri, 26 Jul 2024 21:07:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55514)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXQHb-000000001VJ-1tHK;
 Fri, 26 Jul 2024 19:07:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 21:07:12 +0200
Message-Id: <20240726190712.1634310-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726190712.1634310-1-bernd@kuhls.net>
References: <20240726190712.1634310-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722020835;
 bh=aJN38G3NdTW3gkMPILNq+UKt7CVQqTQmo87EM+clmDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R0GTTdus5el/4YgoofAIBcgOSe7Tnf16MskQBbhE2l0Uxij29Ca5/t8A9HDLA1q2x
 3dxXTwz36385NoHHcWue2DRNkqrjpakOURoyvpC2kFoQfiuJmeTqlagFCCaZQ8GNXd
 elGfotG/q0KqtFeOAWSldGauXGULZkldwxn5JppZA3qZhCIlPd/1OjX2d0OFZI+Xd4
 GYgHk2N1b8xqAdq1GENAKtfF7gfl/YUbtm153Rq9e4sfooXZzgmQaTJVUu5AP5NysD
 fDKPP1YOMSfLr3TTE/5zURb2BDTL791wtcVJbIj1fO+Zk6/Taia1GbPiyCFOmWdg0E
 /Z5IWRvJKWMDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=R0GTTdus
Subject: [Buildroot] [PATCH 5/5] package/{mesa3d,
 mesa3d-headers}: bump version to 24.1.4
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/Config.in                 | 11 +++++-
 package/mesa3d/mesa3d.hash               |  6 ++--
 package/mesa3d/mesa3d.mk                 | 44 +++++++++++++++++++++---
 4 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 33c60b285f..f330bd7bac 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.9
+MESA3D_HEADERS_VERSION = 24.1.4
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
index d506d398b8..d734e966d8 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html
-sha256  51aa686ca4060e38711a9e8f60c8f1efaa516baf411946ed7f2c265cd582ca4c  mesa-24.0.9.tar.xz
-sha512  de2ee6c9df1fc106ee10befe0a76be1e9cfe83d65dbdb83bad6d8d7cfaa085232fb115293a1a790b37b50b1fe14bd58aafbcfe5a15e953b5901a7105d57569a5  mesa-24.0.9.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-July/000767.html
+sha256  7cf7c6f665263ad0122889c1d4b076654c1eedea7a2f38c69c8c51579937ade1  mesa-24.1.4.tar.xz
+sha512  0293f1493685888e5d2f0e616645c937e5a9c348fcb654b050b7c42bfdade1518c508920e456cf8be0033dceab4570a916db87dbb454174e425d91e9c05d0748  mesa-24.1.4.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ce460c4475..6af7b54ed6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.9
+MESA3D_VERSION = 24.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -27,6 +27,9 @@ MESA3D_DEPENDENCIES = \
 
 MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
+	-Dgallium-rusticl=false \
+	-Dmicrosoft-clc=disabled \
+	-Dopencl-spirv=false \
 	-Dpower8=disabled
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
@@ -126,6 +129,19 @@ MESA3D_CONF_OPTS += \
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
@@ -251,12 +267,32 @@ endif
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
