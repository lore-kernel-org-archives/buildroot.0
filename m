Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E4EC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D85E240844;
	Sun, 20 Sep 2026 21:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aC3OUFErQTbJ; Sun, 20 Sep 2026 21:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6F25340E1E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789940382;
	b=sL397H3poSo082kXhT3wsjG01xE0wiXhiBMyme/G1vtBGBcLMvtzChbblJ3A/8gJnQJY
	 5AMWE5Z4WU8aM1HP7XH0oCeL8Mf4my2hnjBXgEn3SdZO7BZ2BHBZFkVkb6EUTdG56Z2D6
	 2Yncv3y0wK5d6o6y5j5nbNRDvu8AfoLL6qG2LVXEtqHsAP/Gj+7FCg5lrQ953p4uYAlYs
	 9h8BV3GMHcqS1n4Uwda7M8swYBMRFe4uEPYgAqMBJb51SqoPibrvU4iwcfGpNmwTbEUkF
	 kIHztrAWQWwmYBBbYfu0DgAdRhJuYVL8OefQZq6/ALtoXPzaw/VizB4JUQ7UwSu1A8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789940382;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2tc+NxzVjqc5x1oXm785IgASDXRh9k09fNSpgReOONU=;
	b=Z5vQBf0pqfjBsUG1bWwYBP0gGmAiHofYNxfNuHAZW7oJg+IJjRo5N0OEBGYu6hTHTkbA
	 VRjOUaTXEukPn5DM9aBPysbpVRsJA5SVMRfD4KNM+4mQarpdjj8Zdn72/e246kEWqFtHH
	 arkhRsfizNcn+zC5QTB2NjCh6llvT6Uew6KRJKEsjfAJKIzMthIjmFl3O2Xn5rDWkPsyh
	 y42jkjxMfWMeeTb+aQ3dyLjRbiwx8ANxQ3nWflEjEjyw8bt5Pj1xufxT7fpjmd6Zc3HUc
	 zU7GwoTYvlL4j/prtshJG4WmuXT4aBz8tjVgMk1p2HoHp7uzBxxsPmjD3UDGXMfTr0w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=gnnlztip;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789940382;
	bh=2tc+NxzVjqc5x1oXm785IgASDXRh9k09fNSpgReOONU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N7OZNAd9i1Fd9X9jYYnwpNt/JihHpSRR63xv/FrfsNORcuNU5zBPtzMdTQLfkO2wm
	 GUTkbgyd+7j4tjlMG4NbJE8UiEGPOwFlaIYGgKayYKn4y8UTXao6QegmRTn61RcltZ
	 fKmDlQSX/GWRde5vsYihyvNz5EIjweUJkJ/BVPpYBRfnKY26h9qfN/UPFXqI/dCdFr
	 jxHbTAJjIsZ9Rrx4Z61mNuLvzxmQp/tO4ycDeXEQKcfkgQELEjH39hmTl2SK+xJ6SK
	 jIHPtDQ/Mww9SNb+WVkj9Jb5bJnoDUEzGYPY2GappjZVmQYJmUtLUNwnBS0ZUin+dO
	 +jqRGc8g0Jpcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F25340E1E;
	Sun, 20 Sep 2026 21:39:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A9C4386
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E523D40E3C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oex3JP7G-sG9 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 21:39:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 692F340E1E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789940379;
 b=YUw/O1Lb7sX9dZAX4I8DHvnFwGSuw3mmwQUTNHxnVE+ZJSlcxQ/n4K3Q1+TyJv1JokEm
 A4cIWel8q293zOvQKffvYXQ38eud8gsSIQ228hKedIOi4+bmZdxzOL1nlXjT3UFz2FfzJ
 GmLWB/padYYZL5/wUtLFyMdi1iJ5eFlzcVMFBktyJ5QmS6udqM9LWQ8BC4Q4teYpxE+39
 LCKZ1DK/sIRLcPbRtA+H960rJlmDgNfyck/HXVE5/Izu9ZAXRSTilHc3qOt2zQs8yfVIE
 lcoYnYBFixTwHtoPUjq+mRJWQbtCqYQGCp0b7EKaI+qUuOrE89XSTva41qs98QGe3Hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789940379;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=7ndv8rDr4nk+GouOrrT7obaWjWqFQarhKAS90at7hTM=;
 b=qeyyuJ4U4V/0GPnsufTr7ezN71Zti+WkicWTV5FSN7KChvkjpJPEnKODPOTM4bRjkcJi
 Qd66X+fhsdgflYHHc9xdA3EXaIFv4laoI4XNmK3zx528Bkha0hoqFBi96jIMJ9PXKPcho
 ECioeXNjK2TXHPTCaM9YkdAGW0QRwpU3dYWlq9djxVOSrJUYpgYhewA/eX7XOJhywv4+q
 Qxi2QZ3Vyl6P7gS3J/Tze97VwJ0/wn/nN4/c1vRa/lBDP1JTNx8Jk6/OBERd+bhcwhsgF
 mRBzaYVRfzTRgnMUOLKlLmqyG4LHXQ5h46DokbLykmV3viymZ9G7AUmmqzTZkKmJlkg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gnnlztip; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gnnlztip
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 692F340E1E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789940348;
 bh=7ndv8rDr4nk+GouOrrT7obaWjWqFQarhKAS90at7hTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gnnlztiphubRbwXzaQHuCEmd6WH7TTvmYUesOSJaQUmxhBMB6iw6D2TZpVJKXxCT3
 b0/x32pkzeafwI/I7tV0RZEtBfdiuSNv2BWngvX4Vcs19VthQ459a07F5MgSczjCfa
 e3RJzpBV/osuV/JSZncUjqbP7Ocps9etOSwfOw28sedEbvYCwNcIS7H8gvSq1L2OCi
 5P/X4jdsMxgyxifpmVqnmmOF+i1WSB9PyMN/8+EziuZKJpyisW1oliyvCwLk/M/KUC
 OXPUwxvBSPF8lrmvwdZOxOiYASvtars26m0wwDlyK0jo8pQcb5Q8pMQGIfyA/aQiuA
 HoPFR3U4bAHgQ==
X-KAS-Sym: v3:f51bdf72230551df:lCKheS9ndnLLT4/f2BHXUkrfR+y86dFsCTmS5bBz4x+JxkFu26PKvBlGIxwbEoZV3EMtFST4Z+Yjco2VyPNCjf0K8YyV44TotU/s/6m7e1dzv1CrNQChbFzHpDFdaeqGlBULAx9L2hDMv6zhejJatdiQkneMrRZCElAm+doYIZfcFv82xVKiwh2EFYcJruuwMTZ//04bitbQcwuVLYhcHaglvfFOiNIzWpATDgyKjpjljYZba0Uo0N3Q0vvY7XTPULpWdgcdx470NDL3BFM9B4gIJYdB8o3O84alnrDZCCb7SZ1DLtA/fQ2cMvAFIRaKFu0NhBkZgIKqCW65wor1bg==:N+uMtYyGPv1hIibfaQTTDqLVHJ0QTz/hFfOJf5B4sNEHKfJLl1NxfJvjE6xjL+sWH9bsfFhnFK4/kgsrE2PQUSRWdS28svc9C1WIpsSyKSM6zuApzFKnMXNGWQz9fc/XMdj8RLS9aikVMM7i8+1nASPFoxWnuDLtndHPERkfNgldMbuPDZ4dQ4qIHKIJtuUAwsci6F0UXnDaQUoAuugrzPSM63OwbnBSgUCRAHXhFcm3uha/btzKiPBV075U70N2syofJTdW75rx7klYenmKaicrPgNomDtknB3hskA9/Td3aZVwpFjCJhwI+tzZ6L2wxm2Ve7eAM2JWcnlmekVV1ojYdEBFom6zbI3z//oZBkwf2Tsn3vjQyNIdnu0RGhCwx9xSSFzKkhJXcs+uT4UuQClcE5CDDTu4c6NOYb2b6+whJWiXj2JCkCCXv0m6ob6K7TuWqgX0rrw90ql7fU580yxPtWMcsxFTVrTu+b5w5VPZ66zRRtUPwMbd0X3Hz144e6AoStLfx3ylqiLMOKiRx0fDG8EDbzeT9KTtgF7DDutmgvi3cmZHa+3FTxJoF2dmkO+aESomRPvRST+5vlBmZf+m9JPp1//ROfRBzuuqcRwLh8
 BmhlI6eGwwelj5eg6QwNy1kxLFqGXQxxPv1oPOEo/9wnIGs/JbFviPFl3Q4MTSKOo4UQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1A355A4C4887;
 Sun, 20 Sep 2026 23:39:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44740)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8PFb-000000006Yg-2ypY;
 Sun, 20 Sep 2026 21:39:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun, 20 Sep 2026 23:39:03 +0200
Message-ID: <20260920213906.905956-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920213906.905956-1-bernd@kuhls.net>
References: <20260920213906.905956-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 3/6] package/mesa3d: precomp-compiler does
 not need target llvm
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

Inspired by and fixes
https://gitlab.com/buildroot.org/buildroot/-/work_items/180

To build binaries provided by the host-mesa3d package we do not need to
build llvm packages for the target arch.

Added configure options for rtti support to fix build error when
BR2_PACKAGE_LLVM_RTTI is not enabled:

output/build/host-mesa3d-26.2.3/meson.build:2042:8: ERROR: Problem
 encountered: LLVM was built without RTTI, so Mesa must also disable
 RTTI. Use an LLVM built with LLVM_ENABLE_RTTI or add cpp_rtti=false.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added note about new rtti configure options (Romain)

 package/mesa3d/Config.in | 46 +++++++++++++++++++++++-----------------
 package/mesa3d/mesa3d.mk |  8 ++++++-
 2 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index cb86e6a2a4..feed6b68fe 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -23,8 +23,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 
 config BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	bool
-	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
-	select BR2_PACKAGE_SPIRV_TOOLS
+	select BR2_HOST_CMAKE_AT_LEAST_3_20 # host-llvm
 
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
@@ -147,15 +146,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for iris-based Intel GPUs.
 
-comment "iris driver needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "iris driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
@@ -189,15 +190,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	bool "Gallium panfrost driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
 
-comment "panfrost driver needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "panfrost driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
 	bool "Gallium Radeon R300 driver"
@@ -360,46 +363,49 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver"
 	depends on BR2_arm || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan imagination driver.
 
-comment "imagination vulkan needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "imagination vulkan driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
-comment "intel vulkan needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
-
-comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
+comment "intel vulkan driver needs a glibc toolchain w/ headers >= 3.17, host gcc >= 7"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
 	bool "Vulkan panfrost driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan panfrost driver.
 
-comment "panfrost vulkan needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "panfrost vulkan driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
 	bool "Vulkan swrast driver"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c103345e86..04112eea8e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -178,7 +178,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER),y)
 MESA3D_CONF_OPTS += -Dmesa-clc=system -Dprecomp-compiler=system
-MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
+MESA3D_DEPENDENCIES += host-mesa3d
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
@@ -347,6 +347,12 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dglx=disabled \
 	-Dvulkan-drivers=""
 
+ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
+HOST_MESA3D_CONF_OPTS += -Dcpp_rtti=true
+else
+HOST_MESA3D_CONF_OPTS += -Dcpp_rtti=false
+endif
+
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
