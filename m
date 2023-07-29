Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C6EC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 18:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B1B140121;
	Sat, 29 Jul 2023 18:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B1B140121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3pQqCFl1dok; Sat, 29 Jul 2023 18:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6996440469;
	Sat, 29 Jul 2023 18:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6996440469
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B77FA1BF3C2
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 18:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E1A481DEA
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 18:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E1A481DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQ6302O_ruxg for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 18:02:55 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54B8081DE2
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 18:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B8081DE2
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 908A4A4C0824;
 Sat, 29 Jul 2023 20:02:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35118)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qPoHD-000654-0j;
 Sat, 29 Jul 2023 20:02:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 20:02:50 +0200
Message-Id: <20230729180250.1494674-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690653771;
 bh=Iu3ByJMjaR0OUjxYGTiIwhqY0h0rRaK33uJ4JBtbfYE=;
 h=From:To:Cc:Subject:Date:From;
 b=XxEo6Pxi6CJ98QpARDxXZRrwsWo4+6waxjWYE71K5CR4ODdFZUjynFrWuTtK0HNb/
 bWVn/lqb4/oiFfYfwhGBUP8mj5sIkfOEB0BhrDjLCneVWvY+Lnk97QI1QHN5pnHO8Z
 P1nWW6PLkx4SokUeVxsrM9Y9Bs5SEhZUIVRfMOKi0bL4oD4YpGjcOmPlUZW/O01c80
 PkBYmVneG7sh+2TvAVjtzM0ofPx0fy+4vmq7+PJmwUQuJNc+DtbExW9K9oANCxS+e4
 LKzh0LXs6/Oup6nWQegM8ZKBu1gzyu2Nd5kHgMma2Orc+vw4is6Foed6s3rGs40bUT
 LAik6hegPQucQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=XxEo6Pxi
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: rework dri3 handling
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Peter Seiderer <ps.report@gmx.net>
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
 package/mesa3d/Config.in | 14 ++------------
 package/mesa3d/mesa3d.mk |  4 +---
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c7ee2a8db0..542d57e72c 100644
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
@@ -247,7 +240,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	bool "Gallium v3d driver"
 	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4 # runtime
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
@@ -263,7 +255,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
@@ -305,7 +296,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6fa5c1c686..73f3b06518 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -35,11 +35,9 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
 MESA3D_CONF_OPTS += -Db_asneeded=false
 endif
 
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
