Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C41AD41D74
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 07:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE03560ACA;
	Mon, 15 Dec 2025 07:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aa1oVr0h0lAL; Mon, 15 Dec 2025 07:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAEE260B83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765784594;
	bh=xDL15tmqgzXZz8WZ0z4gj62fACkuclNjW/15PlFmZGw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=euy8FREKaoaTtxgfUCW+zzcbtnNq0UCrdDiII457jSAiDL8B8gnozyMeAU5bQisLq
	 0PZZXNgDmZcC6tE63b9VwZ53Zodv33SzSoj1JUzaZk9/yeYA+FQDy/UWRJLX0aGkKV
	 7xJwSEPrm+tFysn81CnycP/rpPJ8ZTk+Z2j/abMTNu5v0EoSrH/7eZNstZBfQETUrr
	 Bq4hbCTWChxd5/jm9a7xt7lz4DQQScE4BRuzd9SEQe/QVoM5AgE4JGi8/hMjGffGgo
	 9VKz1tH2jrLgqOAtHNrKc+AAdlkYSQNXwux8sOCi/l5QbmlBWo5YYtFj/ZCJRorsVd
	 odYZnU+iL65lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAEE260B83;
	Mon, 15 Dec 2025 07:43:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DE20118
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 07:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F5B8403C2
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 07:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozXRt-rsa2kT for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 07:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 334C7400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 334C7400C4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 334C7400C4
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 07:43:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DC78AC19D11
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 07:42:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 18E6A60664;
 Mon, 15 Dec 2025 07:43:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE694119415E4; Mon, 15 Dec 2025 08:43:02 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
Date: Mon, 15 Dec 2025 08:42:54 +0100
Message-ID: <20251215074254.999761-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765784584; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=3MI5psdIvizfo/wuUljyEh4L3tqNTkvWASmaHDUX+wY=;
 b=SsPlwyyGez24bZ+vr4nMrwRqExZE0PE7ZtkW2oyGvbdeAUnYIwBk0bX3tMfmjytj8TSB1B
 YPQgmBkYgyhiMUjHyOY/1Na2+yfUcCdu5ead1gOou58ZQy0Rmz71DwYeKHR8J1cUtlKnJ5
 T4Q+HfmaTs0kfPsAWh17pUIFs2seZwUSts0RVM/heRBU+Um4l8g2DpoRg2pSqDF6+4iZYM
 j7152ourTXhHnv5vvxJCuIRaU8gt95uDdVK05KKl+0kqi55x6/PC2NZMAvcSLI2mQKSbVh
 tQzLRa+Zsk0VLnSIrc/3hGZwcoLtVIvcklBZJJB/NY0uTthHCgmVwrsY1JVDPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SsPlwyyG
Subject: [Buildroot] [PATCH] package/mesa3d: fix imagination Vulkan driver
 build
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
---
Note: this is not sufficient to get the above configuration to build
completely, I'm working on the other fixes that are needed. But for
sure this fix is needed.

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
index 6fcbf96c80..36e6614124 100644
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
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
