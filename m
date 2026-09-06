Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E512C79F9E
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 23:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20E714057C;
	Sun,  6 Sep 2026 23:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1F7z-jFWuu9; Sun,  6 Sep 2026 23:31:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4EF7C4051D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788737470;
	b=V6vNc6n3huAtfdJN/x+9bdemxEfkadfFPkt970d1k9k1JVi4Cfueqkx5A02v7SyNHSlE
	 Y7Q2+x+ivRsS+brp37PMMAYQpzywsKhrzXBNoOq4PY6day1BjMYL6PjDMxjasaKM06Va9
	 sf6sMJE1BspVDcF0jWHt8cSaGCdfuz8vTzb10O7WezpW4ivqQhBlC/9at6RteZRzg4bIb
	 X7woU+yjfSDGeKHi5Fvam9Fq2jAD96bX6cERlNQAkwFff3dIWecZIHn4jHiSRHMfzxKS1
	 /Nhttf0H96ia+/ONJnwUlcwBDUg6ErmvkoGtBMXWkaHbr/woazeyFcTriNEj66KZxtg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788737470;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=rO0VxKhr9z9Y4HSrQj/16A3XBBiX4JPghOpI1PjnLqA=;
	b=JsxTzjw/XZx5KymOJ359O8vZnSaw1ce5JvMmzohmMo7C49qrzZZsoivTENDOieZvcwhC
	 34McNEa9yS+285jIDdndQWjxEXT67aoTRr9wHvaBcNodulkR0xgvl57ZYqccAZKfs44Ic
	 +I2CSirj2M0oTH8vYjgszgFbgd9O2+3zkcUf/t3I+K1kNYhhTGVEMp2PHvTAncCPbtg/v
	 MpWgVLvAzBFRGjL73xM3G55nibhB0RfdN+oQBnYU8oHFeTUdaQBAcTEyysDELu9Vgh9sH
	 47da7PqWISIgFc1xnRLmGH5QM+R90mduZwgh2zsRJpNLVrqGCno+XWQ8izHXElTiWiw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788737470;
	bh=rO0VxKhr9z9Y4HSrQj/16A3XBBiX4JPghOpI1PjnLqA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ALHswv5AelQxchCKxGFZZN1kt7DA7uytgnknxElYakTimFs86yf3ZNd8JUjaKmsrl
	 JmVUVp7YG7/sq82LPnhThCgR24Gpc0XzsCnu4TzqsBc7i6M3NH/AKe2Ff7VwVqyqGJ
	 d236nzMSCWXopuSM0OD7m9ehPrhe5Mqf54VMUFPNR19fooafyD4uZs02kpdNOAkrEb
	 GEWVqSfADgYg6XZaGYtJu5soD2U/qaN9DuXJnPPy8880uPLReZ4R2Ug2T64AnmdgNo
	 dxxxaz43I3avvakQ2JlqS11Eagi2NPgRgbcvn1YQy906IMn7FyHu4gLGyS6PX6FxYx
	 jXl4R4eE09CZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF7C4051D;
	Sun,  6 Sep 2026 23:31:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDEBD118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBBC880AEF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nbQD0H05n0Q for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 23:31:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CA3CB80A96
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788737467;
 b=gJLNXaavnOlNSG0XOYpBR3iSQErWTISyAu1NCFg89AOCcpRbwhw68mqTL39vUSFTkXW6
 oQ/fpy5Y3Zt5TPfTpNTIVnkU8N11LiOxUYg0Ka0a13iZpZt9iXAMcaUPoGtoTuR+Bx0R0
 +Ltqehjr5CAUG8EXW4NuXv7k9wkfx0+GHfgTqyz2HgPx9ZaAUNfXigYs7cnThXvG1Q7s7
 Alls5XotzArCZ6SFI2QEG1pIRfMX+LNE2Mc04OiqWJMS4TSPCyZpqmw6NAZYwr++HxLiZ
 1gZZcN66iqBqCDdoAQS6aZiLvIjgClKhey2e0qnIpRvjiYPJU42WDhw/s1b4ysdlNag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788737467;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=330DwqFghZZp94ExmXt3gKbpEy5JrdwWwupU2kenSbM=;
 b=NI5fGETfKxH0slZO+zPyshrgIL2khggmITgZtIogf7zenE2XQWyDsBcEjs/CGPyv9MDw
 vvzAHBYY3Yb1Uxb2YhKj622JTu4j28/dc/zNaG+CfkUlsc6MKPQvxJeqgdDzSR38q8oxi
 do+vXiIgmK8jvpMaBDTDaYEAPYC5XqOiRcOBq3/qgSVk40Jy66wIWLb/PNHHTm2bPmb6Q
 Egmsg+bdYpirBJ0yH5+AJwn/buURDjJXZID1K2GvaYYodWJO0yXfE1WpGNKUtqjYzJrFv
 WHOoS3b3HbmBoxv1yLKs09WBaYsIJtDU1IY2sBAReHYTqEOCIKkHyg/UsX5HXRNBR9A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PieDpC2s; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PieDpC2s
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA3CB80A96
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788737449;
 bh=330DwqFghZZp94ExmXt3gKbpEy5JrdwWwupU2kenSbM=;
 h=From:To:Cc:Subject:Date:From;
 b=PieDpC2sU9RMhpdv6X1VagXoioo9OgaiQLcrtG5ZJTerH+M2p8tFkQATdkP2tWI1T
 V6pB+Z15qO9CTZ8wkJGbpPPCRlNsA50k34x6Pm8N4X25c3vXV0SeOKGZff3rqqb5tF
 EtphiQazcehupsswlzkqUS8HiRbHS/svf7IY1CEaGwJNu79bfGUndlINVc5mk/k2xq
 mMuljG8tYFB42YSAIXeE+DdWqM04CR0DIzrtfbsDFoDywUBgEalRWOMpVE4KqieMc1
 LKZsgorBgNzQCEJNdrHSqW6GA7B8N6MHI0CPANA8srlWHjLVxvfVW/2WJzO15ubevd
 zIBFUbjRzFwUA==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 00EF8A4C270D;
 Mon,  7 Sep 2026 01:30:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44132)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3MK0-000000007cf-38uo;
 Sun, 06 Sep 2026 23:30:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Sep 2026 01:30:43 +0200
Message-ID: <20260906233048.692559-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/6] package/mesa3d: rework OpenCL handling
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

Mesa3D removed the old Clover OpenCL implementation in version 25.2.0
and kept only RustiCL:

https://lists.freedesktop.org/archives/mesa-announce/2025-August/000815.html
"[...] the Clover OpenCL implementation has been deleted. RustiCL is now
 the only OpenCL implementation available [...]"

Since then the option BR2_PACKAGE_MESA3D_OPENCL served no other purpose
than allowing access to the RustiCL sub-option. This commit merges both
options and their dependencies.

Fixes https://gitlab.com/buildroot.org/buildroot/-/work_items/180#note_3501740032

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                             |  9 ++++++
 package/mesa3d/Config.in                     | 32 +++++---------------
 package/mesa3d/mesa3d.mk                     |  7 +++--
 support/testing/tests/package/test_mesa3d.py |  1 -
 4 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6c222c0e57..6daaf56f22 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "Mesa3D OpenCL support is now provided by RustiCL"
+	select BR2_LEGACY
+	help
+	  Mesa3D removed the old Clover OpenCL implementation and
+	  replaced it by RustiCL. This option served no other purpose
+	  than allowing access to the RustiCL sub-option which was moved
+	  to the main options section.
+
 config BR2_BINUTILS_VERSION_2_44_X
 	bool "binutils 2.44 has been removed"
 	select BR2_LEGACY
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e184039150..cb86e6a2a4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -23,7 +23,6 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 
 config BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	bool
-	select BR2_PACKAGE_MESA3D_OPENCL
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_SPIRV_TOOLS
 
@@ -56,35 +55,20 @@ config BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY
 	help
 	  Legacy Wayland EGL_WL_bind_wayland_display support.
 
-menuconfig BR2_PACKAGE_MESA3D_OPENCL
-	bool "OpenCL support"
-	depends on BR2_PACKAGE_MESA3D_LLVM
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST || \
-		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
-		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
-	select BR2_PACKAGE_LLVM_RTTI
-	select BR2_PACKAGE_CLANG
-	select BR2_PACKAGE_LIBCLC
-	select BR2_PACKAGE_HAS_LIBOPENCL
-if BR2_PACKAGE_MESA3D_OPENCL
-# libclc dependency is satisfied by
-# BR2_PACKAGE_MESA3D_LLVM
 config BR2_PACKAGE_MESA3D_RUSTICL
-	bool "RustiCL"
+	bool "RustiCL OpenCL support"
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	select BR2_PACKAGE_HOST_RUSTC
 	select BR2_PACKAGE_LLVM_DUMP
+	select BR2_PACKAGE_LLVM_RTTI
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_LIBCLC
 	select BR2_PACKAGE_SPIRV_TOOLS
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_OPENCL_ICD_LOADER
+	select BR2_PACKAGE_HAS_LIBOPENCL
 	help
 	  RustiCL is an OpenCL implementation written in Rust.
 	  By default, devices are disabled in RustiCL. If you want
@@ -93,8 +77,6 @@ config BR2_PACKAGE_MESA3D_RUSTICL
 
 	  https://docs.mesa3d.org/envvars.html#envvar-RUSTICL_ENABLE
 
-endif # BR2_PACKAGE_MESA3D_OPENCL
-
 config BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	bool
 
@@ -554,7 +536,7 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES && !BR2_PACKAGE_LIBGLVND
 
 config BR2_PACKAGE_PROVIDES_LIBOPENCL
-	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_RUSTICL
 
 endif # BR2_PACKAGE_MESA3D
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 87c7f427e4..8c78167685 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -50,13 +50,14 @@ else
 MESA3D_CONF_OPTS += -Dllvm=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
-MESA3D_PROVIDES += libopencl
-MESA3D_DEPENDENCIES += clang libclc
+ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
+MESA3D_PROVIDES += libopencl
 MESA3D_DEPENDENCIES += \
+	clang \
+	libclc \
 	host-rustc \
 	host-rust-bindgen \
 	spirv-tools \
diff --git a/support/testing/tests/package/test_mesa3d.py b/support/testing/tests/package/test_mesa3d.py
index 24fc6df59e..193aa7a373 100644
--- a/support/testing/tests/package/test_mesa3d.py
+++ b/support/testing/tests/package/test_mesa3d.py
@@ -17,7 +17,6 @@ class TestMesa3DRusticl(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_PACKAGE_MESA3D=y
         BR2_PACKAGE_MESA3D_LLVM=y
-        BR2_PACKAGE_MESA3D_OPENCL=y
         BR2_PACKAGE_MESA3D_RUSTICL=y
         BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE=y
         BR2_PACKAGE_CLINFO=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
