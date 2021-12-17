Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA49C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6306281871;
	Fri, 17 Dec 2021 21:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rswqj3i8Om4x; Fri, 17 Dec 2021 21:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD8380B01;
	Fri, 17 Dec 2021 21:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 459E81C1162
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 426BF61172
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0R5txr7DUFX for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6658F60EAE
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:01:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6D1E782580; Fri, 17 Dec 2021 20:55:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:00:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8892b25edabe7ce168869a3ad25bd9693059cebe
X-Git-Newrev: 26642e4cc09666110d5105e7867579a0e48cfa09
X-Patchwork-Hint: ignore
Message-Id: <20211217205544.6D1E782580@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: gallium/kmsro drivers
 require dri3 for X11
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

commit: https://git.buildroot.net/buildroot/commit/?id=26642e4cc09666110d5105e7867579a0e48cfa09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

select BR2_PACKAGE_MESA3D_DRI3 for all gallium/kmsro drivers in case
X11 is selected, see meson.build:

  240 with_gallium_kmsro = with_gallium_v3d or with_gallium_vc4 or with_gallium_etnaviv or with_gallium_panfrost or with_gallium_lima or with_gallium_freedreno
  [...]
  524 if with_gallium_kmsro and (with_platform_x11 and not with_dri3)
  525   error('kmsro requires dri3 for X11 support')
  526 endif

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=13831

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a27c29d37d..7c3a1beff3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -110,6 +110,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
+	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
 	help
@@ -123,6 +125,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	# can't see is just spurious. However, that dependency is about
 	# the toolchain having sync4 primitives, which is always a given
 	# for arm/aarch64.
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	help
@@ -150,6 +153,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
+	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for ARM Mali Utgard GPUs.
@@ -165,6 +170,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	bool "Gallium panfrost driver"
+	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
@@ -252,6 +259,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	bool "Gallium v3d driver"
 	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
@@ -266,6 +275,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on BR2_arm || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
