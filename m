Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDDEC43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 09:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C6960C19;
	Sat, 11 Jul 2026 09:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0wyhm7gmYhA; Sat, 11 Jul 2026 09:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7DB260C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783760811;
	bh=9Tb8dcWKtma8SyeU26Toa2IFCI3IhH15ZBixF/oH7LA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jB28YyBxP4Y6AkmH7eb+YFLPIP2snsIIhiI1ifuqFC07xLyb4xL8rNzPPfxVPJtSL
	 Ha06wgceoa5yCxfa46+l7ly46zL2K8juiLViWik2gpV6usEcOSXF8W55tOD8BiPrQQ
	 TXLADajjvnS4Xnw2QdsAAkchv5pWd29RogbEG31OwliiTJ97ezOg/1nDd9Mpi0yERA
	 KM9FYJ82UGLyo/XKEL6jPL4wmxLPx3C2mH2el2fxvUFKmy6YTsLX4BQIR0ekqUGgWZ
	 yhqVe2o/yRGQU4JCdEjsbHL+EedRD7jPsbiPhMud7RnFXMLE9yTFMMTrel9ZpzoRnF
	 wb32/gwJpKtYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7DB260C09;
	Sat, 11 Jul 2026 09:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A81F4372
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 09:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82BFF60C09
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 09:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shNGpVkb4AOt for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 09:06:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6ECF060B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ECF060B35
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ECF060B35
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 09:06:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9129631E0C07; Sat, 11 Jul 2026 11:06:46 +0200 (CEST)
Date: Sat, 11 Jul 2026 11:06:46 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-ID: <alIHpvT_JG8YujB3@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1783760806; bh=biBoJJmC5RSItcdH2+GEhHxCkEPU3Di+/1Ng8XqFglc=;
 h=Date:From:To:Cc:Subject:From;
 b=NhuLMjUkuEuAUxfC0rsGQZGMuCepmetGA9f/ulqT/jQNq0dtyPaHdg/J2IWqcaruq
 3cdP/vakzHHfXdKbbEK4qGpg2NmU4alQ/Yk18iyFe0Mk6tBk2NNs9fwSIkIg2fgWR9
 zjMV1vo4s6BaZBeavailqV3Cbl3KT3VmOnUq360QtW6jWiLN2WRqo+F/RRIYHXzkio
 T2/PzeUmcFwu6ytRbE8fXAkoxPPfNWpa5DQlukCISRpATgas9rK0wX9xJU8DnD9nEV
 amU0hMYAjrgD8VQtqYggM4qbZd8It3OuTYfi5kSO9TEBeahcHcTu0h6wplllIb8ieY
 9PV1S5XztqQow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] configs/ci20: bump Linux to 6.18.38 and U-Boot
 to 2026.07
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

The patch bumps the Linux kernel to version 6.18.38 and U-Boot to
version 2026.07.

Tested on ci20.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 configs/ci20_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index bb4863cb1d..4fd7d48c38 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -1,14 +1,14 @@
 BR2_mipsel=y
 BR2_mips_xburst=y
 # BR2_MIPS_SOFT_FLOAT is not set
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci20/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.38"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ci20_mmc"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
