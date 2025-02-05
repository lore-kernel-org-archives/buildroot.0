Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91528C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 454294097D;
	Wed,  5 Feb 2025 09:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faTdMMDl21N6; Wed,  5 Feb 2025 09:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2A66409F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2A66409F2;
	Wed,  5 Feb 2025 09:35:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0BCC12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 902914097D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDcJmaQ20uFX for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C3440945
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87C3440945
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:35:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F9AB86EB4; Wed,  5 Feb 2025 09:35:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 10:28:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5eb734766b24de5fce6e586897cd4827f8855442
X-Git-Newrev: ebe1efd0a1cb31684ff259fd2cf4823f2bfb8de6
X-Patchwork-Hint: ignore
Message-Id: <20250205093508.7F9AB86EB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add option to build kmsro
 and zink Gallium drivers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebe1efd0a1cb31684ff259fd2cf4823f2bfb8de6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows using simple displays not directly connected to the GPU,
and platforms supported only via Vulkan.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 22 ++++++++++++++++++++++
 package/mesa3d/mesa3d.mk |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 7761b0a650..1a446cac49 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -140,6 +140,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	help
 	  Mesa driver for ARM Mali Utgard GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
+	bool "Gallium kmsro drivers"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	help
+	  Mesa drivers for kernel mode-setting render-only devices
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
@@ -262,6 +274,16 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 	  virgl is the 3D acceleration backend for the virtio-gpu
 	  shipping with qemu.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK
+	bool "Gallium zink driver"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  Zink is a Gallium driver that emits Vulkan API calls,
+	  providing OpenGL support on devices that only support
+	  Vulkan.
+
 config BR2_PACKAGE_MESA3D_VDPAU
 	bool "Gallium VDPAU state tracker"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ce460c4475..2a0b3aefe6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -99,6 +99,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedre
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
@@ -110,6 +111,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
