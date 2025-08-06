Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D137C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 18:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 114BC842BE;
	Wed,  6 Aug 2025 18:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G09ltMgLsDVi; Wed,  6 Aug 2025 18:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63E78427E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D63E78427E;
	Wed,  6 Aug 2025 18:40:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 694B731
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 18:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 474C460850
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 18:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmI4GuJBcEBw for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 18:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEC14607D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC14607D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEC14607D8
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 18:40:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD521A4C341C;
 Wed,  6 Aug 2025 20:40:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47818)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1ujj3t-000000003vw-0pEe;
 Wed, 06 Aug 2025 18:40:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Wed,  6 Aug 2025 20:40:29 +0200
Message-Id: <20250806184029.91379-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754505630;
 bh=lmIy/+JR1OgKGooMK5snxmgAF2yOC38WXFCoNeMdRHs=;
 h=From:To:Cc:Subject:Date:From;
 b=Obt1SuljG2PlDq9Uj88Rv38LsWSbsC31zNL45Yu5Dqdgklg836X8qbYDAGM5oS89X
 A2IvYue5PyEkIH7g8XcrH1lKXg9/niC+JidlTeeFokK3M4Ek0Vqv9Nz6nqgi0/nun3
 ZXJfX+KciF5xB8d/9ybsg/NEdUTuWb1QND5MUJLg5g+kX+bme7BMv6dfr+PxJFp+1N
 yPECIjwDpJ6iajbDvycglJMOT3eJyyVoDGd0DQqvk53IMjcO1txCn/7+v2Ivm3Dox1
 sy7iCzvPoHylvhzR307JczId55KJ9FrQQIHlNnApAOMnL8Y3HY3JKQtkc5nvAFPmLj
 G7uraumrxiD8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Obt1Sulj
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.0
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

Rebased patch 0001.

Removed Gallium xa state tracker:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/3be2c47db2318ebe9222c80bf981038df4374b2d

Legacy handling for blind option BR2_PACKAGE_MESA3D_NEEDS_XA is not
necessary.

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2025-August/000815.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk               |  2 +-
 ...-meson-option-to-disable-optional-neon-suppor.patch |  6 +++---
 package/mesa3d/Config.in                               |  9 ---------
 package/mesa3d/mesa3d.hash                             |  6 +++---
 package/mesa3d/mesa3d.mk                               | 10 ++--------
 5 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 8dd0581b41..18527e46fc 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.1.7
+MESA3D_HEADERS_VERSION = 25.2.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index 04b33a7856..52e23e35da 100644
--- a/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -10,7 +10,7 @@ to force disabling it at compile time.
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0, 24.3.0 & 25.1.0]
+[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0, 24.3.0, 25.1.0 & 25.2.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [fix syntax error after previous rebases]
 ---
@@ -23,8 +23,8 @@ diff --git a/meson.options b/meson.options
 index 8e0bf2a..1cf0e07 100644
 --- a/meson.options
 +++ b/meson.options
-@@ -117,6 +117,13 @@ option(
-   description : 'enable gallium va frontend.',
+@@ -131,6 +131,13 @@ option(
+   description : 'enable gallium mediafoundation frontend tests.',
  )
  
 +option(
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 924437f033..d2003fce42 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -102,12 +102,6 @@ config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
 
-# Gallium xa state tracker.
-# Quote from mesa3d meson.build: "XA state tracker requires at least
-# one of the following gallium drivers: nouveau, freedreno, i915, svga.
-config BR2_PACKAGE_MESA3D_NEEDS_XA
-	bool
-
 # OpenGL GLX and Gallium VDPAU both needs X11
 config BR2_PACKAGE_MESA3D_NEEDS_X11
 	bool
@@ -194,7 +188,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
-	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
@@ -266,7 +259,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VMWGFX
-	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  This is a virtual GPU driver for VMWare virtual machines.
 
@@ -282,7 +274,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
-	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Adds support for Nvidia Tegra GPUs, requires nouveau.
 
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9514b5e0e6..7e8c924564 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-July/000814.html
-sha256  4afd26a3cc93c3dd27183d4c4845f1ca7d683f6343900b54995809b3271ebed6  mesa-25.1.7.tar.xz
-sha512  a62fc6970efce3b4861094be2ef3139a3b18a6a51d770ead9f04d39592abc0a13a04702c552637e63bc965236f66ad545d30a9ec446b24f0bfc5bbb7cf0f0757  mesa-25.1.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-August/000815.html
+sha256  7c726b21c074d14d31d253d638b741422f3c0a497ce7f1b4aaaa917d10bd8d4f  mesa-25.2.0.tar.xz
+sha512  f36e4f9f619becfc89f9cf3704d21f5f1532f1e658808fd30c0edce8c28cd65dc6578a21333e896aa5eaccf09da99efd9127a8d3d46681e8360f618cf63bab94  mesa-25.2.0.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 74994fe02a..fe4cdd9eea 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.1.7
+MESA3D_VERSION = 25.2.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -92,15 +92,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 MESA3D_CONF_OPTS += \
 	-Dglx=dri \
 	-Dglx-direct=true
-ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
-MESA3D_CONF_OPTS += -Dgallium-xa=enabled
-else
-MESA3D_CONF_OPTS += -Dgallium-xa=disabled
-endif
 else
 MESA3D_CONF_OPTS += \
-	-Dglx=disabled \
-	-Dgallium-xa=disabled
+	-Dglx=disabled
 endif
 
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
