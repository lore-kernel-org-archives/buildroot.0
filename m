Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901D8D5B86E
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B5EB60EB3;
	Mon, 15 Dec 2025 21:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xInA99qblP2Z; Mon, 15 Dec 2025 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41D8F60EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765832563;
	bh=pdSsDqHQssxoLv5uLSF53TbeLI6Cnb5UJdKwYYvi01A=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NjOOZtZIAyu0HSIAHFCBaEs2Nhb0g0OEnVNo5p9gq+MjryKM3VRD4S8DEmBCmzXbV
	 AGGzJugkkJBIAu8AE9yeH3ybjJLteY2/bRHUAjvNzdTG+VcDbF6zaoJA9cBP3QlfAt
	 JcHjwVt0eqsY8R8+TvfbNbhmupCaexra5BAgYf+0birRFhJ8wfE19R7otQaro8pLgX
	 rAiqMh3p2dS7v+luI1PBHL0wot85b9TUF0caBC+CCuq9dP6EkP9YPUNw5Xqb3kNQW2
	 1LKWs8SUiZsLbUEEHPVk+MY+hpJTR41bAt+ADUcmHLsemHvcg1ecg8EjVbnhHYDXHY
	 2WRjUVyBqI6nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D8F60EF1;
	Mon, 15 Dec 2025 21:02:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FF04151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4488B408B0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPkDcJkBaeV3 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73CFA4020C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73CFA4020C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73CFA4020C
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:02:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F1D6E1A21E7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:02:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B48BB60664;
 Mon, 15 Dec 2025 21:02:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F532119405FD; Mon, 15 Dec 2025 22:02:36 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
Date: Mon, 15 Dec 2025 22:02:34 +0100
Message-ID: <20251215210234.1123314-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765832556; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=MuqAoLHZUddWDPkyomjJXbkZm6MMKHvrxB3VVdT/N9U=;
 b=higbspA/PDGYKcsA37MQ/tAr7Qz/T9HFYzunkLwkqHNtqTautxUK32/AS1kOwtnJseJvtI
 DkdkteKkhi34ycYv1UXDqIHuFCfrbEbDhky1B4ddqXP4MTwlAzOMuJKfFbdVcbQOE+5ebg
 ilTHYwb8Smn/Rv7RpbVzYcZ+bpfCvTZWxy+pSIdcd5jaViXV1bE4fu1FxUREUBj2GMHALn
 Qhu1JnykrGwpBiBAv39XXNUSmJ8544BU4FWVoaQto/eeU0O7PChTrTYD44JWYyr/r7k5XF
 YeOXzSaFYZjFn7H6x9V5tuA0oEry764eBjMTWdkSAkgt73zUGMbp9t60zPhGlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=higbspA/
Subject: [Buildroot] [PATCH v2] package/mesa3d: add missing dependencies for
 imagination driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The build of the following basic configuration enabling the
imagination Vulkan driver

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION=y

fails with:

meson.build:847:3: ERROR: Feature llvm cannot be disabled: CLC requires LLVM

Adding just LLVM as a dependency is not enough, as then libclc is
needed, then LLVMSPIRVLib, then clangBasic, then the pco_clc tool.

In fact, like the Panfrost driver, building the Imagination driver
requires building host tools using host-mesa3d. To fix this we:

- Make the BR2_PACKAGE_MESA3D_OPENCL option selectable

- Make sure that BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION depends
  on BR2_PACKAGE_MESA3D_LLVM and select
  BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER (the latter being needed to
  build host-mesa3d)

- Make sure the host-mesa3d builds imagination
  tools (-Dtools=imagination) and install
  pco_clc (HOST_MESA3D_INSTALL_PCO_CLC). This requires introducing
  HOST_MESA3D_TOOLS as a list of tools to build, which then gets used
  to construct the -Dtools argument, as we can now have both
  "panfrost" and "imagination" in this list.

With all this, the defconfig above builds successfully.

This has been broken since Buildroot commit
5e818c16a31a902ec29a250f920f43c76e2d9868, which introduced the vulkan
driver support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v1 -> v2:

Ensure that both panfrost *and imagination tools can be built. The v1
would only allow one or the other.
---
 package/mesa3d/Config.in |  6 ++++++
 package/mesa3d/mesa3d.mk | 19 +++++++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 89e40d47b1..e1faea95d5 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -58,6 +58,7 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
 		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
 		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
 	select BR2_PACKAGE_LLVM_RTTI
@@ -336,10 +337,15 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver"
 	depends on BR2_arm || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan imagination driver.
 
+comment "imagination vulkan needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 36e6614124..3ba51c8b8f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -284,9 +284,18 @@ else
 MESA3D_CONF_OPTS += -Dglvnd=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+HOST_MESA3D_TOOLS += panfrost
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
+HOST_MESA3D_TOOLS += imagination
+endif
+
 HOST_MESA3D_CONF_OPTS = \
 	-Dglvnd=disabled \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
+	-Dtools=$(subst $(space),$(comma),$(HOST_MESA3D_TOOLS)) \
 	-Dinstall-mesa-clc=true \
 	-Dmesa-clc=enabled \
 	-Dplatforms= \
@@ -294,10 +303,6 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dglx=disabled \
 	-Dvulkan-drivers=""
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
-HOST_MESA3D_CONF_OPTS += -Dtools=panfrost
-endif
-
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
@@ -310,10 +315,16 @@ HOST_MESA3D_INSTALL_PANFROST_COMPILE = \
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/panfrost/clc/panfrost_compile $(HOST_DIR)/bin/panfrost_compile
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
+HOST_MESA3D_INSTALL_PCO_CLC = \
+	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/imagination/pco/uscgen/pco_clc $(HOST_DIR)/bin/pco_clc
+endif
+
 define HOST_MESA3D_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/compiler/clc/mesa_clc $(HOST_DIR)/bin/mesa_clc
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/compiler/spirv/vtn_bindgen2 $(HOST_DIR)/bin/vtn_bindgen2
 	$(HOST_MESA3D_INSTALL_PANFROST_COMPILE)
+	$(HOST_MESA3D_INSTALL_PCO_CLC)
 endef
 
 $(eval $(meson-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
