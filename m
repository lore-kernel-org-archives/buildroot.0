Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60B0CD98E6
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 06:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9865640523;
	Fri, 19 Jun 2026 06:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsV4q9kQgEcD; Fri, 19 Jun 2026 06:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87BA84037D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781850663;
	bh=RN65RXdEWD7xZI5IQtIn//E3CjmWA6bGM8rrhnrL+sU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rsxABeWBAhuf1CVDntPRmjyvzKdKIhx+kQ+D8wpG/ElpFF+3/QrmsytOHRQyjf9KM
	 dxosgJS96LkOwzoVgbLtkODodw7yOR4hjHbe5aLFBxWNCfO6+72rQULUyV2dJ/fOtx
	 ZAShXqk4hsPB95+22jCicIX1PBuX+SaBRomicAKiYyFlc4ZdN2mDnOZILRoO01DO6n
	 XmouEnvkAW5QKrF3uZd1zrXe15YDE0pVT+mHak8lRcn0IBB+Og9JrmUS4Bh5lRK24v
	 S89KFIAcH/QR1DaTF0S+O/mzeso3ukDX/PAd0B9LfD82xZ5plB3fEnVnjXgGbQS2sc
	 abdYkfDR/lmWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87BA84037D;
	Fri, 19 Jun 2026 06:31:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A29042D7
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 883516F4E2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfN7tNHHfMWy for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 06:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 659E56F493
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 659E56F493
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 659E56F493
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:30:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b4bc.dip0.t-ipconnect.de [84.161.180.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72BF0A4C10B1;
 Fri, 19 Jun 2026 08:30:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44582)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waSkh-000000004uS-0KYy;
 Fri, 19 Jun 2026 06:30:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 Jun 2026 08:30:53 +0200
Message-ID: <20260619063054.2870792-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781850655;
 bh=DUmATng3R7ftD2NkNmnhMpP5/qzHJH75fw0XKu1mOdE=;
 h=From:To:Cc:Subject:Date:From;
 b=Mly4xCo/GfpnHCBbiJ3A8QL9xmLOY//zDIAHf9OJBFZ5ABDZ9GCRxZBMMyQEHELce
 qNpIF463cg2NQ4NuhOfmEgyciesUl9e2OfSkCy40fmG6rmFRH5yXCbYmCyaFGDzSu/
 oy2gdrHVP1e+dojC69rd6SJI/55i/DKu8up+sq6AxQSMdU1Z3C9wdnoIOj44B7Vu1M
 w50jZ1Qp/WBhkmtrk6EOtzRXDpxe0ETEWISi4k0oY8OF0q8MYehgYirmOZ7TLSprQT
 41BJ7VuwzAfJBiDa4EgVi2fewfUBYpVBm6g8IyVMg4lBOwM6TwI0WxNGe3Or5cphxS
 YDVkF4gdgt2wQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Mly4xCo/
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: restrict Gallium VA-API
 support to supported drivers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes a build error introduced by buildroot commit
460700d38e1bb9ddb83bf8de81d69a2448099165 which took not into account
that only certain drivers support Gallium VA-API:

../output-1/build/mesa3d-26.1.2/meson.build:742:3: ERROR: Feature
 gallium-va cannot be enabled: VA state tracker requires at least one
 of the following gallium drivers: r600, radeonsi, nouveau, d3d12
 (with option gallium-d3d12-video), virgl.

Fixes:
https://autobuild.buildroot.net/results/16b/16b2a63b444d7f84ceab5134ce9ff63e910537a7/

which includes configure option -Dgallium-drivers=etnaviv,r300.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/commits/36ff3d2605eb3ce64917b89a54e965204484a10b

 package/mesa3d/Config.in | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e4a444efbb..e184039150 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -197,6 +197,7 @@ comment "llvmpipe driver needs llvm"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
 	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
@@ -236,6 +237,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 		(BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
 			BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
@@ -254,6 +256,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
@@ -325,6 +328,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 	bool "Gallium virgl driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  virgl is the 3D acceleration backend for the virtio-gpu
@@ -507,17 +511,20 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
+config BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
+	bool
+
 config BR2_PACKAGE_MESA3D_GALLIUM_VA
 	bool "Gallium VA-API"
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	# circular dependency: mesa3d -> libva -> libgl -> mesa3d
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_GLX || BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_LIBVA
 	help
 	  Enable VA-API video acceleration support in Gallium drivers.
 
-comment "Gallium VA-API needs a gallium driver, incompatible with GLX w/o libglvnd"
-	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || \
+comment "Gallium VA-API needs a supported gallium driver, incompatible with GLX w/o libglvnd"
+	depends on !BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER || \
 		(BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND)
 
 config BR2_PACKAGE_MESA3D_PATENTED_VIDEO_CODECS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
