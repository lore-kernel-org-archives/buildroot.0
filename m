Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF2EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCF882605;
	Fri, 13 Feb 2026 19:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lo9n71TJqzus; Fri, 13 Feb 2026 19:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8EB682681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011582;
	bh=O4e3KAbI8T8SGCaEni3Hkb2bohrhLbDEtvrKaYrx/6A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F6OmFSiBmotb4NHt0IgM6iAhwo16C6Za646PMAMINSdA9n8ovLiRzYr0gXJE+DGcQ
	 8Eo0BFwnW0IKgDxEbA/AHKAp7K0hwhOlaefTRB5BSv7iWZ9/nJpdbha7jBsYqVNJmr
	 wEslyF6yP4ya4qCS10d0SQXZAmwUchjpvN4csjjA8Y/zuAr1baiZj2uQqY3xCsMCdO
	 RkyM9hd3sXU2IgXAbl8dQDsQBvudDQBztISDc4JLFBKJFTA8WBXsL6FBpWEpUH7am0
	 cTUAAjaHybYPbdHbzMBtZ1HsaBMH3RBL+fHapUBOU+G4QTnlW1AAhB7IuY3cZF+rSy
	 JlnmOXNGusDhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8EB682681;
	Fri, 13 Feb 2026 19:39:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FC93EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14E4E413C5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66KHKJzylg1S for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9656F412DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9656F412DA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BFAD825CC; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:39 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d2ada422c03e5c0859bd1099799ac3333030a21e
X-Git-Newrev: 38021502fb30d171b7863decb3063e819f10099c
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.8BFAD825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mesa3d: fix
 host-mesa3d compilation with latest llvm installed on the host
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/38021502fb30d171b7863decb3063e819f10099c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit eb0e63888bae4b79b20b9cfcfdf44cc256c532ff)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mesa3d/mesa3d.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b3fae9c0cf..d79b8609c5 100644
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
