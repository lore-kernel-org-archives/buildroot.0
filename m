Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953C4C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 22:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009BF40746;
	Wed, 26 Aug 2026 22:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrWd2qBoPavd; Wed, 26 Aug 2026 22:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787781976;
	bh=/Y95bFvABeM+B2Lery6DR2bGm/CsAWMfYJ2R7Zp1iWc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hlPbe23zab4RmX2G+WoFe2X8YDnj/oqZMk/shEoSD42+u1ItTgJxj+5FbhmubP7hw
	 5H/Sz0t4I3IaghJM9z7xWPldgV1pZH9bovCtYrtXt9Wz7So1eCzWLEewMrsy7IqVs9
	 Koq22pBOu/iyLirIn95lqrV+3luXT+fZwTeW9Gj9BbKCcq/WyyN3WUCE6gDhT9wg9C
	 MmUfBPXls95dXW5nNmviqMYs0m8hhwOn5X7jSTsjxgc0QNwSddTJvhrS7fh2+RRoWv
	 CKPo9aSOKh81su4+o33a7W+nsb9r76fCl5zHBsIOhVqVtUD7jXG/NxNwtxjTWwn8jW
	 BVmvpgDWu9Jbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E9740742;
	Wed, 26 Aug 2026 22:06:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9275F3A4
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 22:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78727400A6
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 22:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKRmnmFsjiXB for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 22:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=k+MtBzZq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E613E4009E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1787781968;
 bh=IZ+ZSqvHeDDc/Lv42xbfKcOBLm833KrIpr6AktyIl4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=k+MtBzZqoDaIfz+fJiQbo6XsiW/E1tGXw0EzJ9VNiQFDvrG5iWzdR9DUCpXQKFQ+/
 5YYkOizAHBAkMWeNQXH8HJPTlWn74RhXG8ANUfD/R5IudhXApkpz4FBiI+UzAigWYD
 BoAEvK818cnMKx0OVlgfcGPGxZI5qv0w0UtDCmW7nf4JRo/dyn0czaFyfGdKO7uyKF
 4jFQ4T3VDZaDJt/ZvSVjFJvGUdPSvx8gde8OeJ4K+PsVTHKDK5ETL8uh8nC5/02HE2
 9zxL1pDThg1/QqWj8M9jq3humrUH3coNTqx0ZsBCSg6XnQkERpfQWyL1kkSTGupMxo
 8Lq0NB/mLiCGA==
Received: from fli4l.lan.fli4l (p54a1b1e0.dip0.t-ipconnect.de [84.161.177.224])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 792D2A4C2375;
 Thu, 27 Aug 2026 00:06:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38690)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wzLl2-000000000T5-1Z5Z;
 Wed, 26 Aug 2026 22:06:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 27 Aug 2026 00:06:07 +0200
Message-ID: <20260826220607.585905-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826220607.585905-1-bernd@kuhls.net>
References: <20260826220607.585905-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: crocus Gallium driver needs
 OpenCL
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

Buildroot commit 59ed1137e9bb8c0157be3dc91a1cc462211dd3c7 bumped the
package to 26.0.0 which added upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b72d347d1c3b9e829971fbdabf993b68776083c1
requiring OpenCL for the crocus driver.

Add the necessary dependencies to fix a configure error:

../output-1/build/mesa3d-26.1.8/meson.build:945:3: ERROR:
 Feature llvm cannot be disabled: CLC requires LLVM

Fixes:
https://autobuild.buildroot.org/results/baa718e140264a9aa64c3a8f4114ca1b05f740e3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b78b6267d0..deca0bbf87 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -62,6 +62,7 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
@@ -129,10 +130,16 @@ comment "Gallium drivers"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 	bool "Gallium crocus driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for gen4-7 Intel GPUs.
 
+comment "crocus driver needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
