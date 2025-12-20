Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A919E668BB
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 15:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBA7740985;
	Sat, 20 Dec 2025 15:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3r-hFSboAGX; Sat, 20 Dec 2025 15:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71E6F40977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766245513;
	bh=V4zgply0ec7pb+onxpcguGWsHyWtRFqt+rnGRpviIxI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZnCbt0pj4mt1A7LDEY1ABgjwPlYqbf4oumKQfq65Lj+IZ1O/0ueSH5h9PUuYIn6Ae
	 boZ90Q4EY81SaCD0EpdZFy+DTwOSjb6UQmnFRDnMhaKNsQt+KFGXAm5RdWhsV/k+xx
	 s7uQjUsZRv5Ph2Qr9oeZATza5FY0uyeEiLdCQFs+JTXJSBRTOZmKB8wjTAiHQr32P5
	 BwaCXWjLsYfBlzlfCFbQSyLHZ5EIxau0Ey48JhAsqMxoRfn7TY2KM9cNOmJNyOixZw
	 8AQIe5TtRLrzNVXV/DRwiv8MirNc3+wq3m2d0+14edogKE8cSLo+H1FfSBKK+YANr4
	 N1oqYcY3M4CwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71E6F40977;
	Sat, 20 Dec 2025 15:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 974B4293
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A6B8822AD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkiQk_4i-t3P for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 15:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA8C822AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EA8C822AE
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:45:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 995D68751C; Sat, 20 Dec 2025 15:45:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 12:54:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a4beae7a59ed2261ecc249d83c04882ccb33f5b
X-Git-Newrev: b9f030668cbfd11e54164886aa4e6cbb317360f0
X-Patchwork-Hint: ignore
Message-Id: <20251220154508.995D68751C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix imagination Vulkan
 driver build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b9f030668cbfd11e54164886aa4e6cbb317360f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit 6e189ba6c17a2ab9b60e6fd65fc6a44a17dc9e8f, merged
in mesa-25.3.0, the imagination Vulkan driver is no longer
experimental.

Therefore, since Buildroot commit
3e296a151195f9d32dbfd62d6c75d08b822be6dd, which bumped mesa3d to
version 25.3.0, the build of a configuration such as:

 BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION=y

fails with:

build/mesa3d-25.3.1/meson.build:4:0: ERROR: Value "imagination-experimental" for option "vulkan-drivers" is not in allowed choices: "auto, amd, broadcom, freedreno, intel, intel_hasvk, panfrost, swrast, virtio, imagination, microsoft-experimental, nouveau, asahi, gfxstream, all"

Fix this by using the proper Vulkan driver name.

There are no autobuilder failures for this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 2 +-
 package/mesa3d/mesa3d.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 94d88dd8db..89e40d47b1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -333,7 +333,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	  Vulkan broadcom driver.
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
-	bool "Vulkan imagination driver (experimental)"
+	bool "Vulkan imagination driver"
 	depends on BR2_arm || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 41b72dd08e..c054f7617e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -129,7 +129,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
-MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination-experimental
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO) += virtio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
