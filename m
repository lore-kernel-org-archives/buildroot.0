Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1112CA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 09:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6221F60E2E;
	Sat,  2 Sep 2023 09:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6221F60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KxFp_CnvKzpp; Sat,  2 Sep 2023 09:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACD6C60BB0;
	Sat,  2 Sep 2023 09:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACD6C60BB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14BD51BF21A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 09:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F01784010C
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 09:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F01784010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99i2lSvgi2Sp for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 09:59:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E2934025D
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 09:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E2934025D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFF3286884; Sat,  2 Sep 2023 09:59:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 11:49:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d5a7f213ab94d986133760122105adda76676823
X-Git-Newrev: 0bc44d52c643711e39bc2ee44ca10a16ed300460
X-Patchwork-Hint: ignore
Message-Id: <20230902095900.EFF3286884@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: add vulkan
 broadcom driver support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0bc44d52c643711e39bc2ee44ca10a16ed300460
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 9 +++++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c7ee2a8db0..c3abd662f3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -299,6 +299,15 @@ comment "Gallium VDPAU state tracker needs X.org and gallium drivers r600, radeo
 
 comment "Vulkan drivers"
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
+	bool "Vulkan broadcom driver"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # dri3/libxshmfence
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan broadcom driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8f3d224417..67573909a3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -119,6 +119,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 # Vulkan Drivers
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
