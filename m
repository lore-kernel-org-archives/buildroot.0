Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6418C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D8260E95;
	Fri, 15 Mar 2024 19:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBx0qlNMXISU; Fri, 15 Mar 2024 19:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68B9360F01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68B9360F01;
	Fri, 15 Mar 2024 19:31:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 238001BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 100DC8226E
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNndpBHObFw8 for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52A5382116
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52A5382116
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:31:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00C418838C; Fri, 15 Mar 2024 19:31:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 20:30:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 773ef1fdbafc461be787f9ac69f64de62a6f55e0
X-Git-Newrev: e2f87b3c15c100a411d277589ba8de1de564efd4
X-Patchwork-Hint: ignore
Message-Id: <20240315193117.00C418838C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: rework dri3 handling
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2f87b3c15c100a411d277589ba8de1de564efd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mesa3d/Config.in | 15 ++-------------
 package/mesa3d/mesa3d.mk |  4 +---
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 39a4f706e2..459051b2db 100644
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
@@ -295,7 +286,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	bool "Vulkan broadcom driver"
 	depends on BR2_arm || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # dri3/libxshmfence
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan broadcom driver.
@@ -306,7 +296,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
-	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 29c67b77b9..bdb7ea9a6c 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
