Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841A4CEB2E4
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 17:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C1140544;
	Sat, 15 Nov 2025 17:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHLAVR-4aOav; Sat, 15 Nov 2025 17:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4889E405F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4889E405F9;
	Sat, 15 Nov 2025 17:01:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FBDC1A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51A5683D01
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LC-MRyITZU1U for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 17:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0DAB83CEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0DAB83CEE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0DAB83CEE
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:01:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5B07EA4C6C59;
 Sat, 15 Nov 2025 18:01:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51336)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKJeX-000000004pQ-3m4u;
 Sat, 15 Nov 2025 17:01:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sat, 15 Nov 2025 18:01:33 +0100
Message-ID: <20251115170133.1522658-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763226094;
 bh=8GpIiYBesyOaZMSMBU7fZeAEpEmr85V3jUXs9R3sJa4=;
 h=From:To:Cc:Subject:Date:From;
 b=kxItWTPwWHMf/cbZK3PSHA1foHSGd87GdHvcF9QEplsnR3ISsEU23C21StlZYpnGR
 RLOLF6J9vzX5J9UVFPm8v/nEQ5FDn7fcWLsXdbCrGlJ7E9RU9RAe73ePOJ9EXGQPHj
 /59NB1JC3safukQW0isQ4zISQSrQjDFz7QtJdLXO45iFrELbVqlFFG4p9uOUBgQ/iW
 n0bLjupA4/QnozG6SCVMlJ1+4KHiFzVn274LNUakDfoQrGUKbcXUmUqGPkTq01qWHf
 kR5Nds1YEY5ref9DDC6pdPUPBDxhSrEQgId/RSjzt7HZehWDjmMxtVFmhNRGW5sDDI
 W98nllF9Gad8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=kxItWTPw
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.0
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
https://gitlab.freedesktop.org/mesa/mesa/-/blob/25.3/docs/relnotes/25.3.0.rst?ref_type=heads

Rebased patch 0001 due to upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/82bafaa1fa2d711f2cfa57fddddc3833c530f98f

Rebased patch 0003 due to upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/3bd0badd3a92ca0064e8d96f9e1b19651604262b

Removed VDPAU support following upstream commit:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/4b54277d2e9420e37cdce98b3a09e6cecf87300d
Added Config.in.legacy option.

Added optional dependency to libdisplay-info for Vulkan drivers:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/2c870bbe20ccaed9d8c85bb3144075025d3c9a01
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35461/diffs#0cc1139e3347f573ae1feee5b73dbc8a8a21fcfa

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                              |  6 ++++++
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...tion-to-disable-optional-neon-suppor.patch | 15 +++++++-------
 package/mesa3d/0003-Fix-uClibc-build.patch    |  7 +++----
 package/mesa3d/Config.in                      | 20 +------------------
 package/mesa3d/mesa3d.hash                    |  6 +++---
 package/mesa3d/mesa3d.mk                      | 17 ++++++++--------
 7 files changed, 29 insertions(+), 44 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 24e627a28b..f2223a327a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_MESA3D_VDPAU
+	bool "mesa3d Gallium VDPAU state tracker support removed"
+	select BR2_LEGACY
+	help
+	  Mesa3d removed the Gallium VDPAU state tracker.
+
 config BR2_PACKAGE_DVBSNOOP
 	bool "dvbsnoop has been removed"
 	select BR2_LEGACY
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 75d7405504..662683f944 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.2.7
+MESA3D_HEADERS_VERSION = 25.3.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index 52e23e35da..f2596a9e87 100644
--- a/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -10,7 +10,7 @@ to force disabling it at compile time.
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0, 24.3.0, 25.1.0 & 25.2.0]
+[rebased for 25.3.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [fix syntax error after previous rebases]
 ---
@@ -23,7 +23,7 @@ diff --git a/meson.options b/meson.options
 index 8e0bf2a..1cf0e07 100644
 --- a/meson.options
 +++ b/meson.options
-@@ -131,6 +131,13 @@ option(
+@@ -123,6 +123,13 @@ option(
    description : 'enable gallium mediafoundation frontend tests.',
  )
  
@@ -50,11 +50,10 @@ index 84da951..7f950de 100644
    libvc4_neon = static_library(
      'vc4_neon',
      'vc4_tiling_lt.c',
-@@ -82,7 +82,7 @@ if host_machine.cpu_family() == 'arm'
+@@ -82,6 +82,7 @@
      c_args : ['-mfpu=neon', '-DV3D_BUILD_NEON'],
      dependencies : vc4_deps,
    )
--  vc4_c_args += '-DUSE_ARM_ASM'
 +  vc4_c_args += '-DVC4_TILING_LT_NEON'
  endif
  
@@ -63,20 +62,20 @@ diff --git a/src/gallium/drivers/vc4/vc4_tiling.h b/src/gallium/drivers/vc4/vc4_
 index 5afe329..919b299 100644
 --- a/src/gallium/drivers/vc4/vc4_tiling.h
 +++ b/src/gallium/drivers/vc4/vc4_tiling.h
-@@ -89,7 +89,7 @@ vc4_load_lt_image(void *dst, uint32_t dst_stride,
+@@ -90,7 +90,7 @@ vc4_load_lt_image(void *dst, uint32_t dst_stride,
                    void *src, uint32_t src_stride,
                    int cpp, const struct pipe_box *box)
  {
--#ifdef USE_ARM_ASM
+-#if DETECT_ARCH_ARM
 +#ifdef VC4_TILING_LT_NEON
          if (util_get_cpu_caps()->has_neon) {
                  vc4_load_lt_image_neon(dst, dst_stride, src, src_stride,
                                         cpp, box);
-@@ -105,7 +105,7 @@ vc4_store_lt_image(void *dst, uint32_t dst_stride,
+@@ -106,7 +106,7 @@ vc4_store_lt_image(void *dst, uint32_t dst_stride,
                     void *src, uint32_t src_stride,
                     int cpp, const struct pipe_box *box)
  {
--#ifdef USE_ARM_ASM
+-#if DETECT_ARCH_ARM
 +#ifdef VC4_TILING_LT_NEON
          if (util_get_cpu_caps()->has_neon) {
                  vc4_store_lt_image_neon(dst, dst_stride, src, src_stride,
diff --git a/package/mesa3d/0003-Fix-uClibc-build.patch b/package/mesa3d/0003-Fix-uClibc-build.patch
index faa86b0d1b..d8cd50024c 100644
--- a/package/mesa3d/0003-Fix-uClibc-build.patch
+++ b/package/mesa3d/0003-Fix-uClibc-build.patch
@@ -25,9 +25,8 @@ Fixes build errors with uClibc and gcc-9.3.0:
 
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13898
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[rebased for 23.2.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[rebased for 25.3.0]
 ---
  src/util/compiler.h | 10 ++++++++++
  src/util/macros.h   |  1 +
@@ -59,10 +58,10 @@ diff --git a/src/util/macros.h b/src/util/macros.h
 index 22b18303826..8f73ee72693 100644
 --- a/src/util/macros.h
 +++ b/src/util/macros.h
-@@ -31,6 +31,7 @@
- #include <stddef.h>
+@@ -32,6 +32,7 @@
  #include <stdint.h>
  #include <stdio.h>
+ #include <string.h>
 +#include "util/compiler.h"
  
  #ifdef _GAMING_XBOX
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d2003fce42..94d88dd8db 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -102,7 +102,7 @@ config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
 
-# OpenGL GLX and Gallium VDPAU both needs X11
+# OpenGL GLX needs X11
 config BR2_PACKAGE_MESA3D_NEEDS_X11
 	bool
 	depends on BR2_PACKAGE_XORG7
@@ -322,24 +322,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK
 	  providing OpenGL support on devices that only support
 	  Vulkan.
 
-config BR2_PACKAGE_MESA3D_VDPAU
-	bool "Gallium VDPAU state tracker"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
-		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
-		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
-	select BR2_PACKAGE_MESA3D_NEEDS_X11
-	select BR2_PACKAGE_LIBVDPAU
-	help
-	  VDPAU state tracker (needs r300, r600, radeonsi or nouveau
-	  gallium drivers).
-
-comment "Gallium VDPAU state tracker needs X.org and gallium drivers r600, radeonsi or nouveau"
-	depends on !BR2_PACKAGE_XORG7 || \
-		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
-		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
-		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI)
-
 comment "Vulkan drivers"
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e2b3d9ca79..e642273d67 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-November/000828.html
-sha256  b40232a642011820211aab5a9cdf754e106b0bce15044bc4496b0ac9615892ad  mesa-25.2.7.tar.xz
-sha512  87dd815e0d11d6ec0eb969ee93d3f376103bb899d90599e0b7902394e41c58139384df79f89633e132ca969348d3320f55308a74651d409b454d51f1bcda27bc  mesa-25.2.7.tar.xz
+# From https://gitlab.freedesktop.org/mesa/mesa/-/blob/25.3/docs/relnotes/25.3.0.rst?ref_type=heads
+sha256  0fd54fea7dbbddb154df05ac752b18621f26d97e27863db3be951417c6abe8ae  mesa-25.3.0.tar.xz
+sha512  46df9e5e27f9a36cf893a68ad4a465fcc6efe1bcb46ad8d4b015699ad1a11e582b8d41f4157326556af603fe454b2ff34ecc17a0c742b5fd9ce5f0097106fec5  mesa-25.3.0.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5305ea2de1..3d2f85240b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.2.7
+MESA3D_VERSION = 25.3.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -159,11 +159,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
+	-Ddisplay-info=disabled \
 	-Dvulkan-drivers=
 else
 MESA3D_DEPENDENCIES += host-python-glslang
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
+ifeq ($(BR2_PACKAGE_LIBDISPLAY_INFO),y)
+MESA3D_DEPENDENCIES += libdisplay-info
+MESA3D_CONF_OPTS += -Ddisplay-info=enabled
+else
+MESA3D_CONF_OPTS += -Ddisplay-info=disabled
+endif
 endif
 
 # APIs
@@ -245,13 +252,6 @@ else
 MESA3D_CONF_OPTS += -Dlibunwind=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_VDPAU),y)
-MESA3D_DEPENDENCIES += libvdpau
-MESA3D_CONF_OPTS += -Dgallium-vdpau=enabled
-else
-MESA3D_CONF_OPTS += -Dgallium-vdpau=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 MESA3D_CONF_OPTS += -Dlmsensors=enabled
 MESA3D_DEPENDENCIES += lm-sensors
@@ -287,7 +287,6 @@ endif
 HOST_MESA3D_CONF_OPTS = \
 	-Dglvnd=disabled \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
-	-Dgallium-vdpau=disabled \
 	-Dinstall-mesa-clc=true \
 	-Dmesa-clc=enabled \
 	-Dplatforms= \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
