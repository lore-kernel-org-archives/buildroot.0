Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA76D5B868
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 20:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE14540AB8;
	Mon, 15 Dec 2025 20:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAD7i7sPSWeW; Mon, 15 Dec 2025 20:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E4940AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765831513;
	bh=JFWGG3Dnj940JKkTWgMrFuzpL+4SQP5sghL55W2xdms=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OENSY2UCjXD2KECDwzsn7LhD6IJtJ8FTx0HFFcTWo7hbz9Vumoz2IsIo0sq5Mzb1t
	 digCdGj5b0IA0y8U9nPI1i/rxL9JtC8n07qFSMkuTEQvJ/sdjIkL/3Q6u9AkmqMZ/i
	 Hoq7uZaJ/Wh8EYhxW78b6ynv7Ot2cZhGFzIuTcXz45mqdi+pkuUX1y1bUS3t+4kls/
	 Ns13Gy1Iuwtypjww0yEkYFVcIqq3jJXxZ2mi9+9yWS7T6oV+60X3i9hSRW8NTbiD/d
	 09OKDOqY5W5ll8zS2SWp35aAMRQLcxVhDnk9gdhrRJk6eJysuxEGQefLoCxLNFnpWg
	 fPDK1Ey/niaKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E4940AB0;
	Mon, 15 Dec 2025 20:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE79255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 20:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1114B60EC2
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 20:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBy2xOj5bfKQ for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 20:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE33060EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE33060EAD
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE33060EAD
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 20:45:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C5DDC1A21D2;
 Mon, 15 Dec 2025 20:45:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9509660664;
 Mon, 15 Dec 2025 20:45:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CEB661194073E; Mon, 15 Dec 2025 21:45:03 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
Date: Mon, 15 Dec 2025 21:44:52 +0100
Message-ID: <20251215204453.1119040-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765831505; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=G9QtNmeZEx61qV2UYEr77tnvYIuCyALlkmXtrC8I84o=;
 b=s9ViQt+R27+psbzIbox3odz+z857isXF76dgr4wGwCGLI+T3IqlgXE9PO2RIm5hPrHbqdH
 0JgZCzB/u8h8WnxE9ed34Xp91rXY7YGOzOFbGiwGH7255v0vBmvw09wNn+v0BiuMLZ6KFB
 uwy7t6lCDwADday6HZbZIQUvy9cvAIpkvnBoZXX/IkcoI79LsHZ1lX9z+/ttDdNP/A6Wet
 TYS+JUvwjySjywgmiJzVqlVARpLlFb2AA3ugSnG7rbPvlYvUrCdNUivJRr6n66yD5cLlBj
 4VkBTSn7KaIDBek2u61mAaLoBTXbGBxgLYA66n3Dp1jg2eDxJVwUJTgTGxv7sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=s9ViQt+R
Subject: [Buildroot] [PATCH] package/mesa3d: add missing dependencies for
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
  pco_clc (HOST_MESA3D_INSTALL_PCO_CLC)

With all this, the defconfig above builds successfully.

This has been broken since Buildroot commit
5e818c16a31a902ec29a250f920f43c76e2d9868, which introduced the vulkan
driver support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in |  6 ++++++
 package/mesa3d/mesa3d.mk | 10 ++++++++++
 2 files changed, 16 insertions(+)

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
index 36e6614124..e431c25f78 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -298,6 +298,10 @@ ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
 HOST_MESA3D_CONF_OPTS += -Dtools=panfrost
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
+HOST_MESA3D_CONF_OPTS += -Dtools=imagination
+endif
+
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
@@ -310,10 +314,16 @@ HOST_MESA3D_INSTALL_PANFROST_COMPILE = \
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
