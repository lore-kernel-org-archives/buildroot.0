Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBF6C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 21:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1642380CD4;
	Sun, 20 Sep 2026 21:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pFWvvz5_ogn; Sun, 20 Sep 2026 21:39:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1014B80CF2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789940369;
	b=Rc7ZP7Rr9JdP+KhQ61vz0cWqq4j6q/PMigIJl8lmJVH32WURq7i3ZegsmeKSKZLkvqTu
	 xEt6y0Qvi6u5Y7olHjVm0EEYCcowhRtqlRBsQGJNlynFakaxIotOySdeJNFi2mDyLxSsl
	 s3RUChCu0RFAqhrNZWz08/xJrJprTvMGfqSk18AjInDmvreEoiYYQsNh8A+3gDLDyB37N
	 BzjQDQQ7yVHFeU9QfVF9FnuI7XG4y4Xhlc/rGv1fz58tommBSYEJngznKXtN6AbX8/hpw
	 AXx5o3YEem06bcP7F5dfnlz7b2YdtRe0h6azMG2s8Wu5BkBRyer+YNi4lpl9L33VGaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789940369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=895lZfyHUAUU1Pt/ETINxOiIYZ5tZzAn60jFc04j5MQ=;
	b=exMm8nsD2SGPNa93KtLXijpkeOLkMZ5kg8rD3qkpTrfl0Eata9j8d6UPKGxo9r0llyLD
	 ay1GqYG0sMcnA30EP7h3S7Jg9B/dGuPSvZdhClOHRDscfI65w3E+i1Q25kkdVPc4IoG4/
	 Pb7g48h/YFeFFlrJRAKrC5CihXkMmYFE2pfdiygVtWH8HMiLxGe4w0mJsdTUawzhuX4kV
	 C5DCkYA1SVhhLBnZ/Gr0pBKa+j93QUzXQAlB2WoH14v0RtzG/w0TeKdNCMgVywFZ3ohiX
	 EEuCNKGZGTOlcshZQB2AiGsR7Je0uIiYa4nQ7+IxxRNwWcl+g+pX2vwc7JrwaF1qb5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=EXPTRtdz;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789940369;
	bh=895lZfyHUAUU1Pt/ETINxOiIYZ5tZzAn60jFc04j5MQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGdv1jbrLPE0WuIghO+Imtv17t0Ej1T6WhvniHCpU+hLPbEROnEy9qA9zHP6AVtFm
	 qMVspcGbUqPqtMWeJLkikEUUV34DxoHAHqCrmmvicyQulDx3M5clWwbclvqPVNT50J
	 IQCqdfOCg+nVGvL0BUAwBYJI9vVrJxeWW6yy4N0XJCdYvfwuLMYma4nxf8nluB2N9N
	 EOVJQpxbNOwGnSej87wS9bARswGAxe25LvtNe8GR6VlGl2kqxsbLiXIGMCVvb3d7jE
	 BXCmqiV9UQdWPFN+TsGAra2sGm89QKGwYPt7MbPjETBbIMm8nfvRbqjNd8OMRbfzBK
	 Tm7Ty3yspIn+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1014B80CF2;
	Sun, 20 Sep 2026 21:39:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90939380
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8211280E0B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6CdnPGYaLtg for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 21:39:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B261F80E07
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789940366;
 b=Y4zmavh/5SncOZH7XeLPsup/eiwu5ubN6ZS+RYuu6N2HiZqU80l6Yc2Mv/7tsz8r5kth
 YY+u6yuMTW9o9848xvCnaceyA5GipwbTd8XUzVLPx6a00JtVkal6rHsAQ1y88/R9pdZPb
 CLa4iEyIdy7PlUg0c47L72QBKk7WKe4b+/PhNQit00/2WhwoOZpWj7d+e4PoOIJJ7KK9Y
 6305msBFH/dlva4m6NCvn6ZvKWBwALRaDavvawMS2NEMPyoRVHxaok/sYWAcTJg0+vR8m
 nfP9JPe1y/s3rWvMKTvgObT9SiHGOsHgwJ5dq/Vnt0F5OMzA/FNs536VnxYew8W/SEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789940366;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=61+tL3qh0l+/t+EgJ9AtBo7qXplnbBbdBme07F/kOvU=;
 b=E3KZkyD3Zxji+GzxvBgY+9YliH2Cqh5JuE0doECtV1KVjGFkureyyJYH+cKhfUOHChtB
 bG9FfnnvHkxXAc5FPiehB/n5TF3htW1k9EEEe2Asl7mMgxQbh2+mPOy5ALVH2zIgMD7W4
 20PH7dUpIC6Day+l5jxF2UcC+zbuC1E96cCYZXapyoEfP55UiTxu2O4QM6oZoTKBK+og6
 oGM3RNcfIQnJo5AwFovt7uCb8aK/Fn1WDfGb8PcmJcXg2WkWD6Yg20h4F5eCppEBCajf/
 aEACJmJCqEgLNuaLyauJfa7hKKeOBsxJZqTV1R/KZJoYlMTpbE0oGYiPhtGevWN7lJA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EXPTRtdz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EXPTRtdz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B261F80E07
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789940347;
 bh=61+tL3qh0l+/t+EgJ9AtBo7qXplnbBbdBme07F/kOvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EXPTRtdzeeddDgB2NHLk8xy2gKQmobsbXy68FxLX+FZzVUxCWkbbcAVIO+wzuSfHr
 1SHkjz0TepyKZ7q0ssqCZu2zhbV3gWNJ+BfYKszQIc5G5nGwPhZg25w8fdn2/vu+ss
 3dQVS/W6CxC+S2Me1Oc5U3fk8N+xZONxGvgK/09vmiZjBk7yCiE0ZENxBpb+BZGwtX
 oCaE+Zae+qkhyfl49NuBBg287lcKjVYJMUyqiAFz1q23GZMYvzEOO8RFpPuY6faiTu
 JEkkgmYRSneXNDorMuEZQK+2xBpgPyu4OhKbN94hfvNEYvt6qEsoXb7TyelPhRohAO
 fzPfihrTaztDA==
X-KAS-Sym: v3:f51bdf72230551df:lCKheS9ndnLLT4/f2BHXUkrfR+y86dFsCTmS5bBz4x+JxkFu26PKvBlGIxwbEoZV3EMtFST4Z+Yjco2VyPNCjf0K8YyV44TotU/s/6m7e1dzv1CrNQChbFzHpDFdaeqGlBULAx9L2hDMv6zhejJatdiQkneMrRZCElAm+doYIZfcFv82xVKiwh2EFYcJruuwMTZ//04bitbQcwuVLYhcHaglvfFOiNIzWpATDgyKjpjljYZba0Uo0N3Q0vvY7XTPULpWdgcdx470NDL3BFM9B4gIJYdB8o3O84alnrDZCCb7SZ1DLtA/fQ2cMvAFIRaKFu0NhBkZgIKqCW65wor1bg==:dyUD3bwRwtttG3lmMSQz9sjsXylZrUAIWZkLhjlkpsXnI1TTlVt3W8Km5sXld8HR3prtH1NZsO2rzqU0TYs/eFzNZYBPv7ugU4tcOHZfTKWiv1bdlt7araJ2bG+ZB1pkdALHM22VYo2bawL7YB6mXwTxKkRJ5E1mZq3ht7D+4gphhX2V0cPPnAGyqYGAAH7XGyBewA1buLRNQyGAeBFEbieAQtGRoxx00uxciNjIkAVnumJ3ukNjmTz7QXcsspwK/Tc0TJ4kxs5xBa1F2HXOA6Rrrpx6zz4TemYVqxwcXkcO07kGBnbUz0kgDD2M0EcifXMTbb0jn8BTGhKyT3o2MAg9QP6etMZ+3uqayFLz6U60+0wATWQtlye4cSxShVngQiE5rSGpuV4pd91gbKKuF+QFsY+qIOYMIUkNXW7iWJfCigcEItNm/+rWLp+ecxuNK88qSCWMGfT5qIdmnWHftsSd7w7BOgt5lva8fP9zct3Ow8Tw0Ru+U9dRukXihs6aTHI6cOqEjHGwVaNRB3xq4z+Ykm4+fDpa2n2m6ZRVynLMVrIPirDX0ysOMrAR7y87CHIufDxpJF4Pp9Ul3Ifzb9qpGtBpvYn36zDZ4FC/NIGj8J
 CiCJsbHZXCLVA5IzgHLNvbTzlohYL53NqtaisSQ35O4n29sCw7yKYvPw1Ui7mKRXlhoQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F0DA7A4C4886;
 Sun, 20 Sep 2026 23:39:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44740)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8PFb-000000006Yg-2QYu;
 Sun, 20 Sep 2026 21:39:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun, 20 Sep 2026 23:39:02 +0200
Message-ID: <20260920213906.905956-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920213906.905956-1-bernd@kuhls.net>
References: <20260920213906.905956-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 2/6] package/mesa3d: rework OpenCL handling
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
v2: removed code left-over (Romain)

 Config.in.legacy                             |  9 ++++++
 package/mesa3d/Config.in                     | 32 +++++---------------
 package/mesa3d/mesa3d.mk                     |  8 ++---
 support/testing/tests/package/test_mesa3d.py |  1 -
 4 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bb6257f532..e3824ca927 100644
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
 config BR2_PACKAGE_LIBCPPRESTSDK
 	bool "libcpprestsdk has been removed"
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
index 87c7f427e4..c103345e86 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -50,13 +50,11 @@ else
 MESA3D_CONF_OPTS += -Dllvm=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
-MESA3D_PROVIDES += libopencl
-MESA3D_DEPENDENCIES += clang libclc
-endif
-
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
