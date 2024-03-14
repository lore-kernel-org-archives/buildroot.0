Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26103C54E5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 21:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A685060E4E;
	Thu, 14 Mar 2024 21:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jn13SRRoTQvn; Thu, 14 Mar 2024 21:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12A0460878
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A0460878;
	Thu, 14 Mar 2024 21:16:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37021BF3E9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0D8082147
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdkD5Q7NaU1X for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 21:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3AEC81FE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3AEC81FE2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3AEC81FE2
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 21:16:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0585.dip0.t-ipconnect.de [91.58.5.133])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F3FEA4C068C;
 Thu, 14 Mar 2024 22:16:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36662)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rksQh-000000000UV-0Hpf;
 Thu, 14 Mar 2024 21:15:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 22:15:57 +0100
Message-Id: <20240314211557.20391-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710450960;
 bh=zFdXvKoA2iNSq4ckJ6cDRZOxJGsp2Q0mfo0q7535Frs=;
 h=From:To:Cc:Subject:Date:From;
 b=p0dlrk+SZqb26sjS9cxrSQoe00Ownq7IpuHvc/N0o9EPsASuQpiXItBJtBblvo68h
 s16z8tfA0kfeN8zW4/+YwOPHxKNBBcbStmwnOzIj3dG1bqv2KU2/XQUHdvHvnXuTk1
 yKO89tWbwZoqnIdyPFAWKE+IRZHN3SaGWUv87m8G0GWhsGN+/ofPOjBLgfhIdV4yZc
 TMIpaogm/gCrk/P8ihJGPzhH1Rsw3r+68O84PgCBDKb0Q/FgpgQiJyKS59gZyRTZqR
 pjZfZ5yt5mgPZl7t3pB9Py40kLwyyzNIwQw0rZOet6c5uV07FafUi4WNN5mEiDVSPr
 saHNs1AjxAnpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=p0dlrk+S
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: rework dri3 handling
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Bernd Kuhls <bernd@kuhls.net>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

While fixing a build error

../src/egl/drivers/dri2/platform_x11.c: In function 'dri2_x11_get_msc_rate':
../src/egl/drivers/dri2/platform_x11.c:1229:44:
 error: 'struct dri2_egl_display' has no member named 'screen_resources'

with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y

(crocus and i915 drivers are also affected) it turns out that we can
assume the need for dri3 support when X.org is enabled as a hard depen-
dency even if mesa3d's configure does not throw errors when missing,
like for the Intel drivers.

Before this patch these Config.in options were used:

config BR2_PACKAGE_MESA3D_DRI3
  select BR2_PACKAGE_XLIB_LIBXSHMFENCE
select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7

which can be translated into:

select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7

and used at option BR2_PACKAGE_MESA3D_DRIVER.

Configure option -Ddri3=enabled is passed to mesa3d when at least one
driver is enabled along with X.org:
ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: rebased

 package/mesa3d/Config.in | 14 ++------------
 package/mesa3d/mesa3d.mk |  4 +---
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 39a4f706e2..ca7b9c8178 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -56,11 +56,7 @@ config BR2_PACKAGE_MESA3D_OPENCL
 	select BR2_PACKAGE_LIBCLC
 	select BR2_PACKAGE_HAS_LIBOPENCL
 
-# inform the .mk file of gallium, dri, dri3 or vulkan driver selection
-config BR2_PACKAGE_MESA3D_DRI3
-	bool
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
-
+# inform the .mk file of gallium or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
@@ -71,6 +67,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
 
 # Gallium xa state tracker.
 # Quote from mesa3d meson.build: "XA state tracker requires at least
@@ -103,7 +100,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
 	help
@@ -117,7 +113,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	# can't see is just spurious. However, that dependency is about
 	# the toolchain having sync4 primitives, which is always a given
 	# for arm/aarch64.
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	help
@@ -141,7 +136,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
 	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for ARM Mali Utgard GPUs.
@@ -158,7 +152,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	bool "Gallium panfrost driver"
 	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
@@ -239,7 +232,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	bool "Gallium v3d driver"
 	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4 # runtime
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
@@ -255,7 +247,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
@@ -306,7 +297,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index df0079bf80..71929014c8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -29,11 +29,9 @@ MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
 	-Dpower8=disabled
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
+ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
 MESA3D_CONF_OPTS += -Ddri3=enabled
-ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence
-endif
 else
 MESA3D_CONF_OPTS += -Ddri3=disabled
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
