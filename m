Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAFBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159FB421E9;
	Fri, 17 Dec 2021 21:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iy4u8TgV195; Fri, 17 Dec 2021 21:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C7C421E6;
	Fri, 17 Dec 2021 21:01:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37E071BF2F0
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27018421E6
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYw2Rn0PE_O6 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58ACF421E8
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:01:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5C73B8257F; Fri, 17 Dec 2021 20:55:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:00:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d1da42fcc6976de77bcdf6ad75d17186abc320b
X-Git-Newrev: 8892b25edabe7ce168869a3ad25bd9693059cebe
X-Patchwork-Hint: ignore
Message-Id: <20211217205544.5C73B8257F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add config option for DRI3
 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8892b25edabe7ce168869a3ad25bd9693059cebe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add config option for DRI3 support and use it instead
of DRI3 enable/disable logic in *.mk file.

Move the libxshmfence dependency to the DRI3 option, cfr. the following
in meson.build:

    if with_dri3
      ...
      dep_xshmfence = dependency('xshmfence', version : '>= 1.1')
    endif

Also select DRI3 in the Vulkan Intel driver.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Arnout: make it a blind option, move xshmfence select to dri3]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 14 +++++++++-----
 package/mesa3d/mesa3d.mk | 18 ++++++++++--------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c84f48413f..a27c29d37d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -54,20 +54,24 @@ config BR2_PACKAGE_MESA3D_OPENCL
 	select BR2_PACKAGE_LIBCLC
 	select BR2_PACKAGE_HAS_LIBOPENCL
 
-# inform the .mk file of gallium, dri or vulkan driver selection
+# inform the .mk file of gallium, dri, dri3 or vulkan driver selection
+config BR2_PACKAGE_MESA3D_DRI3
+	bool
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	bool
+	select BR2_PACKAGE_MESA3D_DRI3 if \
+		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4 && \
+			!BR2_RISCV_32)
 	select BR2_PACKAGE_MESA3D_DRIVER
 	select BR2_PACKAGE_MESA3D_GBM if \
 		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
 		!BR2_PACKAGE_MESA3D_OPENGL_EGL
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
-		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4 && \
-			!BR2_RISCV_32)
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
@@ -367,9 +371,9 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
 	depends on BR2_PACKAGE_XORG7 # xorgproto
+	select BR2_PACKAGE_MESA3D_DRI3
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	select BR2_PACKAGE_XORGPROTO
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 61b095ccca..152f5e1b62 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -35,6 +35,15 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
 MESA3D_CONF_OPTS += -Db_asneeded=false
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
+MESA3D_CONF_OPTS += -Ddri3=enabled
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
+MESA3D_DEPENDENCIES += xlib_libxshmfence
+endif
+else
+MESA3D_CONF_OPTS += -Ddri3=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
 MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
@@ -123,14 +132,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
-	-Ddri-drivers= -Ddri3=disabled
+	-Ddri-drivers=
 else
-ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
-MESA3D_DEPENDENCIES += xlib_libxshmfence
-MESA3D_CONF_OPTS += -Ddri3=enabled
-else
-MESA3D_CONF_OPTS += -Ddri3=disabled
-endif
 MESA3D_CONF_OPTS += \
 	-Dshared-glapi=enabled \
 	-Dglx-direct=true \
@@ -143,7 +146,6 @@ MESA3D_CONF_OPTS += \
 else
 MESA3D_DEPENDENCIES += xlib_libxshmfence
 MESA3D_CONF_OPTS += \
-	-Ddri3=enabled \
 	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
