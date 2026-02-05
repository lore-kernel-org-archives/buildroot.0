Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE28EC1EA2
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 11:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B9494065B;
	Thu,  5 Feb 2026 11:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLo279ObKgNn; Thu,  5 Feb 2026 11:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A30440509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770290786;
	bh=kGDZggZHsw2gKQ18y9TYrcyEScFrxYe6bIFgHH5JkxM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UbuTBGanTisMcgjdn8FoADjqJCyRewRFp7Tgt+ntO11LzyLEjATDHWzSFafXDZ/5j
	 /Y6PSAO+ZYaHMEYPGT+rl8ck/qGWcHZkH52T8aZAolPkvc7aomCttluQhN3utsXGcA
	 F0+BtxjklLN8EuFHrtAxxM/Ow6SK5Yi06PPF2oinM/MdRUpQRKT74Oj8qgcex+A+8C
	 dWMTrZrcn1jD90mnPjzB+Z4G3mWqCvi4cIEsZs1W8lZ/Ax13iNJN0LEgGKbzr8cKb/
	 X9HH1gBowTEwFJDtxxVMy+6Ui1w+r2UADzigiWxw8JFoCIwMSHxtWRDqE2auDiNszC
	 1SjzhfxomVIUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A30440509;
	Thu,  5 Feb 2026 11:26:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B395DF5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 11:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1231407A7
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 11:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPBL1UTiMEub for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 11:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E184F4006A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E184F4006A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 11:26:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD6B9847AF; Thu,  5 Feb 2026 11:26:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 12:21:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ad58f30677ac2c3c61da41dd702d3a15d62a3af
X-Git-Newrev: eb0e63888bae4b79b20b9cfcfdf44cc256c532ff
X-Patchwork-Hint: ignore
Message-Id: <20260205112623.CD6B9847AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix host-mesa3d
 compilation with latest llvm installed on the host
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb0e63888bae4b79b20b9cfcfdf44cc256c532ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

On Buildroot 2025.05.3, Meson's custom LLVM parser uses llvm-config
with a default search path of /usr/bin, causing it to detect the host
system's llvm-config (version 18.1.3) instead of the buildroot-compiled
one. This forces all LLVM-related packages to match version 18.1.3, but
since the host system lacks llvmspirvlib, the build fails. This patch
forces Meson to use the buildroot-compiled llvm-config.

On the master branch, the meson is somehow able to find the right
llvm-config, so reproduction only seems to be possible if the host
machine ships with a newer version as the one buildroot is using.

  llvm-config found: YES
  ([...]/output/host/bin/llvm-config)
  21.1.8
  Run-time dependency LLVM (modules: bitwriter, core, coverage, engine,
  executionengine, instcombine, irreader, libdriver, linker, lto,
  mcdisassembler, mcjit, native, option, scalaropts, target,
  transformutils, all-targets, coroutines, frontenddriver, frontendhlsl,
  lto, windowsdriver) found: YES 21.1.8

Note that LLVM_CONFIG is a CMake option, not a Meson one. This is because
Meson has custom dependency resolution logic for LLVM (see
https://mesonbuild.com/Dependencies.html#llvm). The EXTRA_BINARIES mechanism
cannot be used here, as it only applies to cross-compilation scenarios, which
does not apply to host-mesa3d builds.

Reproduction (On BR2 tag: 2025.05.3):

BR2_x86_64=y
BR2_x86_atom=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_LLVM=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y

Fixes:

  llvm-config found: YES (/usr/bin/llvm-config-18) 18.1.3
  Run-time dependency LLVM (modules: bitwriter, core, coverage, engine, executionengine, instcombine, irreader, libdriver, linker, lto, mcdisassembler, mcjit, native, option, scalaropts, target, transformutils, all-targets, coroutines, frontenddriver, frontendhlsl, lto, windowsdriver) found: YES 18.1.3
  Dependency LLVMSPIRVLib found: NO. Found 15.0.0.0 but need: '>= 18.1' ; matched: '>= 15.0.0.0', '< 18.2'
  Run-time dependency llvmspirvlib found: NO (tried cmake)

  output/build/host-mesa3d-25.0.6/meson.build:1882:21: ERROR: Dependency lookup for LLVMSPIRVLib with method 'pkgconfig' failed: Invalid version, need 'LLVMSPIRVLib' ['>= 18.1'] found '15.0.0.0'.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Romain:
  - Update the commit title
  - Update commit log about this issue on master branch
  https://lore.kernel.org/buildroot/CACXRmJh1-5Cy92kF9TM5nDs_uB90WAe5iOGmNNL2E-cMhJE7GA@mail.gmail.com/
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/mesa3d.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index db46d7bc7c..b5300df2ba 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -292,6 +292,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
 HOST_MESA3D_TOOLS += imagination
 endif
 
+HOST_MESA3D_CONF_ENV = \
+	LLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"
+
 HOST_MESA3D_CONF_OPTS = \
 	-Dglvnd=disabled \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
