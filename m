Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B32C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB8C6143E;
	Thu, 12 Jun 2025 08:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0F9wbbDmiFo; Thu, 12 Jun 2025 08:39:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22E6B61421
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22E6B61421;
	Thu, 12 Jun 2025 08:39:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D04443
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE3D281A27
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MA20jSc2sf7c for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B77F80D5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B77F80D5A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68852817E6; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Jun 2025 22:47:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2a82364ac923df26cfcd30edd3d755d90923323
X-Git-Newrev: fc7c7d74aa619fa22608436f26b706e83af8d9fc
X-Patchwork-Hint: ignore
Message-Id: <20250612083833.68852817E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add RustiCL support
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1458243622778940958=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1458243622778940958==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fc7c7d74aa619fa22608436f26b706e83af8d9fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RustiCL is an OpenCL implementation written entirely in
RUST and integrated into Mesa3D. It enables the use of OpenCL
programs on top of existing Gallium drivers. RustiCL is a
modern and maintainable replacement for the old C-implemention
Clover.

To build Rusticl in Mesa3D, the following components are required:

  - host-rustc (Rust compiler)
  - host-rust-bindgen (for generating bindings)
  - spirv-tools
  - spirv-llvm-translator (providing libLLVMSPIRVLib.so matching the LLVM version)
  - LLVM built with libclc and -DLLVM_ENABLE_DUMP=ON
  - Mesa headers via mesa-clc-bundle-headers=enabled
  - There is a known meson bug and in order to fix it we set -Drust_std=2021, see:
    https://docs.mesa3d.org/rusticl.html#known-issues
    https://github.com/mesonbuild/meson/issues/10664

More details in the Mesa documentation:
https://docs.mesa3d.org/rusticl.html

Rusticl is the provider of OpenCL in Buildroot.
However, Mesa does not provide the `libOpenCL.so` library itself.
We therefore depend on the `opencl-icd-loader` package to
install this loader in the toolchain sysroot, so that other
OpenCL-dependent packages can build and link against it.

Without the ICD loader, only `libRustiOpenCL.so` is available and
tools like `clinfo` or `clpeak` fail.

- 'Dmesa-clc-bundle-headers=enabled' ensures that the OpenCL header
   files are bundled and available in the target. Without this,
   runtime compilation of OpenCL kernels via clpeak or clinfo fails
   with:
	fatal error: 'opencl-c-base.h' file not found

see https://gitlab.freedesktop.org/mesa/mesa/-/commit/3619611b31bade726b3dd3d0583ff41a5794cad3

We add a Rust compiler override to Meson to use Buildroot’s
host Rust toolchain using MESA3D_MESON_EXTRA_BINARIES.
Rusticl requires Meson to invoke rustc with the correct target and linker:
    * 'rust=['$(HOST_DIR)/bin/rustc','--target=$(RUSTC_TARGET_NAME)']'
    * 'rust_ld='$(TARGET_CROSS)gcc''
Another solution was proposed to set rust and rust_ld globally in
cross-compilation.conf, we prefer to define them locally within mesa
for now to ensure precise control over the rust toolchain behavior
during the Mesa build.

see https://lore.kernel.org/buildroot/ZcOeEMfwX4XlRXO7@landeda/

Currently, we should always use RUSTICL_ENABLE= driver to use rusticl.
More information:
https://docs.mesa3d.org/envvars.html#envvar-RUSTICL_ENABLE

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Julien: add references to meson bug]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 37 +++++++++++++++++++++++++++++++++----
 package/mesa3d/mesa3d.mk | 25 ++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8b61421d98..f932c8daa2 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -50,19 +50,43 @@ comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
-# clang and libclc dependencies are satisfied by
-# BR2_PACKAGE_MESA3D_LLVM
-config BR2_PACKAGE_MESA3D_OPENCL
+menuconfig BR2_PACKAGE_MESA3D_OPENCL
 	bool "OpenCL support"
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
+		BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
 	select BR2_PACKAGE_HAS_LIBOPENCL
+if BR2_PACKAGE_MESA3D_OPENCL
+# libclc dependency is satisfied by
+# BR2_PACKAGE_MESA3D_LLVM
+config BR2_PACKAGE_MESA3D_RUSTICL
+	bool "RustiCL"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_LLVM_DUMP
+	select BR2_PACKAGE_SPIRV_TOOLS
+	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
+	select BR2_PACKAGE_OPENCL_ICD_LOADER
+	help
+	  RustiCL is an OpenCL implementation written in Rust.
+	  By default, devices are disabled in RustiCL. If you want
+	  to enable a device, you need to set the environment variable
+	  RUSTICL_ENABLE to the driver you are using.
+
+	  https://docs.mesa3d.org/envvars.html#envvar-RUSTICL_ENABLE
+
+endif # BR2_PACKAGE_MESA3D_OPENCL
+
+config BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
+	bool
 
 # inform the .mk file of gallium or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
@@ -139,6 +163,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for iris-based Intel GPUs.
 
@@ -157,6 +182,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE
 	bool "Gallium llvmpipe driver"
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  This is a llvm opengl implementation using the Gallium3D
 	  infrastructure.
@@ -170,6 +196,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Supports all Nvidia GPUs.
 
@@ -179,6 +206,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
 
@@ -229,6 +257,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	select BR2_PACKAGE_LLVM_AMDGPU
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 203c5a18c3..000b9150f1 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -30,7 +30,6 @@ MESA3D_DEPENDENCIES = \
 	zlib
 
 MESA3D_CONF_OPTS = \
-	-Dgallium-rusticl=false \
 	-Dmicrosoft-clc=disabled
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
@@ -56,6 +55,30 @@ MESA3D_PROVIDES += libopencl
 MESA3D_DEPENDENCIES += clang libclc
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
+MESA3D_DEPENDENCIES += \
+	host-rustc \
+	host-rust-bindgen \
+	spirv-tools \
+	spirv-llvm-translator \
+	opencl-icd-loader
+
+# rust_std is defined here to workaround a known meson bug. See:
+# https://docs.mesa3d.org/rusticl.html#known-issues
+# https://github.com/mesonbuild/meson/issues/10664
+MESA3D_CONF_OPTS += \
+	-Dgallium-rusticl=true \
+	-Drust_std=2021 \
+	-Dmesa-clc-bundle-headers=enabled
+
+MESA3D_MESON_EXTRA_BINARIES += \
+	rust=['$(HOST_DIR)/bin/rustc','--target=$(RUSTC_TARGET_NAME)'] \
+	rust_ld='$(TARGET_CROSS)gcc'
+
+else
+MESA3D_CONF_OPTS += -Dgallium-rusticl=false
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
 MESA3D_DEPENDENCIES += elfutils
 endif

--===============1458243622778940958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1458243622778940958==--
