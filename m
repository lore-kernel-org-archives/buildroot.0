Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230FCC5B552
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 20:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C81E780FA7;
	Sun,  1 Jun 2025 20:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKxfFV-EqUQP; Sun,  1 Jun 2025 20:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F359280FD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F359280FD8;
	Sun,  1 Jun 2025 20:45:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD790127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF61341D7A
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78OD136-asXg for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 20:45:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4BC641D85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4BC641D85
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4BC641D85
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:45:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08d8.dip0.t-ipconnect.de [91.58.8.216])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85AB9A4C3802;
 Sun,  1 Jun 2025 22:45:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42090)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uLpYk-000000007IZ-3fYd;
 Sun, 01 Jun 2025 20:45:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  1 Jun 2025 22:45:29 +0200
Message-Id: <20250601204529.787544-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601204529.787544-1-bernd@kuhls.net>
References: <20250601204529.787544-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1748810735;
 bh=gxL7O5tH268zcGhSJy8jXSZ4mG4JOa92QguO4HY9a3I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UwF6fLWmIiInR903eFHWW1J2Pr07pMUzehiuEwxvZn4BN1KH15n1tegdjHT316JKn
 cmU9jLNDz9asJKRlGKHQmSUsPVAHtKaMOOFOH7C+ZvaSReADVF2quOIVC6IbofsdPj
 /8f6vymX9AsmUDti4BxdalFFAUJxHi1j1qDFzjzfiOscst36fanP4W2KODLtFYDh2j
 9FLla8n58TX1Y5MVnyU8YjKV7Iu80diKkayqDGeObGrNBEDpvn0dWuOlcHfCVk9QFk
 Ke2RPvGExTZe9WsC+uw2gm6Rmtot0IrfBvU/hjNoR2vNWfsGlidoetXhtKCe1cWtk9
 laECZO8tIBBXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=UwF6fLWm
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: vulkan intel needs llvm
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

Since mesa3d was bumped to 25.0.6 with buildroot commit 317260f336 the
Intel Vulkan driver also needs llvm.

Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
https://lists.buildroot.org/pipermail/buildroot/2025-May/780130.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d/Config.in | 10 +++++++++-
 package/mesa3d/mesa3d.mk |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 9454beedf4..98c77125e1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -51,7 +51,8 @@ config BR2_PACKAGE_MESA3D_OPENCL
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
@@ -324,10 +325,17 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_OPENCL
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
+	select BR2_PACKAGE_SPIRV_TOOLS
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
+comment "intel vulkan needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 84d1aae6ef..bc456a43a3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -133,6 +133,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
+MESA3D_CONF_OPTS += -Dmesa-clc=system -Dprecomp-compiler=system
+MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
