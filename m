Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF13E6F08E
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D48C7405A7;
	Fri,  1 Nov 2024 21:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVCeUu68eiZi; Fri,  1 Nov 2024 21:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9175405C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9175405C1;
	Fri,  1 Nov 2024 21:59:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF95979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2974540469
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLpKdcIkxh1u for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:59:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA3F74012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA3F74012F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA3F74012F
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:59:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 09C77780331;
 Fri,  1 Nov 2024 22:58:51 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59198])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 01 Nov 2024 22:58:51 +0100
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 22:58:51 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Daniel Lang <dalang@gmx.at>, Valentin Korenblit
 <valentinkorenblit@gmail.com>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20241101185758.729921-6-bernd@kuhls.net>
References: <20241101185758.729921-1-bernd@kuhls.net>
 <20241101185758.729921-6-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <e4da2c85462b975463bae10c83809dfd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730498338;
 bh=a152seqlboveI5Sqh5ZNPW6HpjYaZ2oBXzM+EiSiGEc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZyLaM6iMWtFxynv3cYb1dJadfBUIhZnRyxZQnZQwCNL9F56Cv4aj0mYBXufVs03jE
 W3gUlLtxmWqJSU6SCpjEPXTiH9adQqRZfMcLP3CDFQ9FJmgDYVc4fhg0826H0CTQKN
 PpYU2fHvOXFsuLKUfYi52n/bs/KikQFWbZkAslUFLzbbKFnt3FwtOADL0fnWYMnuxS
 zZR0okATw/aaI/v/Gh7FX12yygzRiLgr7ySDhYdiKkjIJJaou/X7iLf4BKY9S+W/pd
 ECTG+yaIxO6Fyv1d65ZK0PNppo0UvRn9qZRjgixJ6RqmRC2nKJ8P339+LghMfF7+1H
 drFS8oqqgVLew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZyLaM6iM
Subject: Re: [Buildroot] [PATCH v2 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the quick update!

On 01/11/2024 19:57, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2024-May/000762.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000763.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000765.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000766.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000767.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-July/000771.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-August/000773.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-August/000776.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-September/000778.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-September/000779.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000780.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000781.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000782.html
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.1.x:
> 
> Added dependency to llvm & Co. for iris driver due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=a512c2a8b572c5da360873320dbbd343c6223cd6
> 
> Added host version of mesa tool intel_clc needed for target build of 
> the
> iris driver.
> 
> Added dependency to host-python-pycparser for etnaviv driver due to
> upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/etnaviv/hwdb/meson.build?h=24.1&id=2192e620bb0c68b75ff45165d0b117c7ecb77268
> 
> Added dependency to host-python-ply for intel vulkan driver due to
> upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/vulkan/grl/meson.build?h=24.1&id=dc1aedef2bd054884685ad971a3ef5be07ecd101
> 
> Although this dependency exists since mesa3d 22.3 it is only needed 
> when
> intel-clc is enabled, this dependency is added with this patch so no 
> need
> to backport this dependency to older buildroot trees.
> 
> Update configure parameter of glvnd option due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=24.1&id=4f25b84b2460524d375424a81b42faa4d99c8e60
> ------------------------------------------------------------------------
> Changes needed for the bump to 24.2.x:
> 
> Added dependency to host-python-pyyaml to host and target build, needed
> due to upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/a3813327575e8875c8c3ed24b5f45a0b7ba64446
> 
> Rebased patch 0002 due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/gallium/drivers/vc4/meson.build?h=24.2&id=da70827656757cd070faac7aff5ca057f1e7fb8a
> 
> Renamed BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST to
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE and added new option
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE due to upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/010b2f9497ab256d9e8041207902948331af5b4b
> "gallium/meson: Deconflate swrast/softpipe/llvmpipe"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: Added handling for deprecated driver option swrast (Julien)
> 
>  Config.in.legacy                              |  7 +++
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...tion-to-disable-optional-neon-suppor.patch | 14 ++---
>  package/mesa3d/Config.in                      | 26 ++++++++-
>  package/mesa3d/mesa3d.hash                    |  6 +-
>  package/mesa3d/mesa3d.mk                      | 55 +++++++++++++++----
>  6 files changed, 86 insertions(+), 24 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 63360b42b8..a10dde7eda 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
> 
>  comment "Legacy options removed in 2024.11"
> 
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> +	bool "mesa Gallium swrast driver was replaced by softpipe"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
> +	help
> +	  The Gallium swrast driver was replaced by softpipe.
> +

There is few remaining instances of
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST.

For example, BR2_PACKAGE_MESA3D_OSMESA_GALLIUM still select it.
There is also several runtime tests using it.

Running the test_kms runtime test, with:

     utils/docker-run support/testing/run-tests \
         -k -d dl -o output_folder
         tests.package.test_kmscube

Fails with the error:
"You have legacy configuration in your .config"

Running:

     git grep -l BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST

shows:

     Config.in.legacy
     package/mesa3d/Config.in
     support/testing/tests/package/test_flutter.py
     support/testing/tests/package/test_glslsandbox_player.py
     support/testing/tests/package/test_glxinfo.py
     support/testing/tests/package/test_kmscube.py
     support/testing/tests/package/test_python_pyqt5.py
     support/testing/tests/package/test_weston.py

I think tests with swrast and LLVM should now use llvmpipe,
whereas those with swrast and NOT LLVM should use softpipe.

After the renaming of this option, we should only have occurrences
in Config.in.legacy.

>  config BR2_PACKAGE_BSDIFF
>  	bool "bsdiff has been removed"
>  	select BR2_LEGACY
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk 
> b/package/mesa3d-headers/mesa3d-headers.mk
> index 33c60b285f..2cb69c9c67 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
> 
>  # Not possible to directly refer to mesa3d variables, because of
>  # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 24.0.9
> +MESA3D_HEADERS_VERSION = 24.2.6
>  MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>  MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>  MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git 
> a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch 
> b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> index f3919478a6..cda792b9db 100644
> --- 
> a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> +++ 
> b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> @@ -9,8 +9,8 @@ to force disabling it at compile time.
> 
>  Upstream: 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
>  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0 & 23.2.0]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +[rebased for 20.2.0, 20.3.0, 21.1.0, 23.1.0, 23.2.0 & 24.2.1]
>  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  [fix syntax error after previous rebases]
>  ---
> @@ -23,7 +23,7 @@ diff --git a/meson_options.txt b/meson_options.txt
>  index 8e0bf2a..1cf0e07 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -124,6 +124,13 @@ option(
> +@@ -148,6 +148,13 @@ option(
>     description : 'enable gallium va frontend.',
>   )
> 
> @@ -41,8 +41,8 @@ diff --git a/src/gallium/drivers/vc4/meson.build 
> b/src/gallium/drivers/vc4/meson
>  index 84da951..7f950de 100644
>  --- a/src/gallium/drivers/vc4/meson.build
>  +++ b/src/gallium/drivers/vc4/meson.build
> -@@ -84,7 +84,7 @@ files_libvc4 = files(
> - vc4_c_args = []
> +@@ -72,7 +72,7 @@ files_libvc4 = files(
> + ]
> 
>   libvc4_neon = []
>  -if host_machine.cpu_family() == 'arm'
> @@ -50,9 +50,9 @@ index 84da951..7f950de 100644
>     libvc4_neon = static_library(
>       'vc4_neon',
>       'vc4_tiling_lt_neon.c',
> -@@ -93,7 +93,7 @@ if host_machine.cpu_family() == 'arm'
> -     ],
> +@@ -82,7 +82,7 @@ if host_machine.cpu_family() == 'arm'
>       c_args : '-mfpu=neon',
> +     dependencies : vc4_deps,
>     )
>  -  vc4_c_args += '-DUSE_ARM_ASM'
>  +  vc4_c_args += '-DVC4_TILING_LT_NEON'
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 7761b0a650..2cd72490bd 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -50,7 +50,8 @@ config BR2_PACKAGE_MESA3D_OPENCL
>  	bool "OpenCL support"
>  	depends on BR2_PACKAGE_MESA3D_LLVM
>  	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
> -		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
> +		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
> +		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>  	select BR2_PACKAGE_LLVM_RTTI
>  	select BR2_PACKAGE_CLANG
>  	select BR2_PACKAGE_LIBCLC
> @@ -129,10 +130,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>  	bool "Gallium iris driver"
>  	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_MESA3D_LLVM
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_MESA3D_OPENCL
> +	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
> +	select BR2_PACKAGE_SPIRV_TOOLS
>  	help
>  	  Mesa driver for iris-based Intel GPUs.
> 
> +comment "iris driver needs llvm"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_PACKAGE_MESA3D_LLVM
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
>  	bool "Gallium lima driver"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # 
> libxshmfence
> @@ -140,6 +149,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
>  	help
>  	  Mesa driver for ARM Mali Utgard GPUs.
> 
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE
> +	bool "Gallium llvmpipe driver"
> +	depends on BR2_PACKAGE_MESA3D_LLVM
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	help
> +	  This is a llvm opengl implementation using the Gallium3D
> +	  infrastructure.
> +
> +comment "llvmpipe driver needs llvm"
> +	depends on !BR2_PACKAGE_MESA3D_LLVM
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  	bool "Gallium nouveau driver"
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> @@ -212,8 +232,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
>  	help
>  	  This is a virtual GPU driver for VMWare virtual machines.
> 
> -config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> -	bool "Gallium swrast driver"
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
> +	bool "Gallium softpipe driver"
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	help
>  	  This is a software opengl implementation using the Gallium3D
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index d506d398b8..0040019345 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,5 +1,5 @@
> -# From 
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html
> -sha256  
> 51aa686ca4060e38711a9e8f60c8f1efaa516baf411946ed7f2c265cd582ca4c  
> mesa-24.0.9.tar.xz
> -sha512  
> de2ee6c9df1fc106ee10befe0a76be1e9cfe83d65dbdb83bad6d8d7cfaa085232fb115293a1a790b37b50b1fe14bd58aafbcfe5a15e953b5901a7105d57569a5 
>  mesa-24.0.9.tar.xz
> +# From 
> https://lists.freedesktop.org/archives/mesa-announce/2024-October/000782.html
> +sha256  
> 2b68c4a6f204c1999815a457299f81c41ba7bf48c4674b0b2d1d8864f41f3709  
> mesa-24.2.6.tar.xz
> +sha512  
> 830a40d38200ff8b2a6bd949e1ac3bf4edc887a10d9aa92285007d138079e1fafb3568f658e777e7894e95b5ce75d2bd6836b0473fa70d32270005e482b1a2da 
>  mesa-24.2.6.tar.xz
>  # License
>  sha256  
> a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  
> docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index ce460c4475..3d19930c8f 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 24.0.9
> +MESA3D_VERSION = 24.2.6
>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://archive.mesa3d.org
>  MESA3D_LICENSE = MIT, SGI, Khronos
> @@ -21,12 +21,17 @@ MESA3D_DEPENDENCIES = \
>  	host-bison \
>  	host-flex \
>  	host-python-mako \
> +	host-python-pyyaml \
>  	expat \
>  	libdrm \
>  	zlib
> 
>  MESA3D_CONF_OPTS = \
>  	-Dgallium-omx=disabled \
> +	-Dgallium-opencl=disabled \
> +	-Dgallium-rusticl=false \
> +	-Dmicrosoft-clc=disabled \
> +	-Dopencl-spirv=false \
>  	-Dpower8=disabled
> 
>  ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
> @@ -50,14 +55,9 @@ else
>  MESA3D_CONF_OPTS += -Dllvm=disabled
>  endif
> 
> -# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
> -# libMesaOpenCL and CL headers are installed
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
>  MESA3D_PROVIDES += libopencl
>  MESA3D_DEPENDENCIES += clang libclc
> -MESA3D_CONF_OPTS += -Dgallium-opencl=standalone
> -else
> -MESA3D_CONF_OPTS += -Dgallium-opencl=disabled
>  endif
> 
>  ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
> @@ -99,13 +99,14 @@ 
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) 
> += freedre
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     
> += i915
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     
> += iris
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     
> += lima
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE) 
> += llvmpipe
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  
> += nouveau
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) 
> += panfrost
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     
> += r300
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     
> += r600
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) 
> += radeonsi
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     
> += svga
> -MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   
> += swrast
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE) 
> += softpipe
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    
> += tegra
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      
> += v3d
>  MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      
> += vc4
> @@ -126,6 +127,19 @@ MESA3D_CONF_OPTS += \
>  	-Dgallium-extra-hud=true
>  endif
> 
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
> +MESA3D_DEPENDENCIES += host-python-pycparser
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
> +MESA3D_DEPENDENCIES += host-python-ply
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
> +MESA3D_CONF_OPTS += -Dintel-clc=system
> +MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
> +endif
> +
>  ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
>  MESA3D_CONF_OPTS += \
>  	-Dvulkan-drivers=
> @@ -251,12 +265,33 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBGLVND),y)
>  ifneq 
> ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),)
>  MESA3D_DEPENDENCIES += libglvnd
> -MESA3D_CONF_OPTS += -Dglvnd=true
> +MESA3D_CONF_OPTS += -Dglvnd=enabled
>  else
> -MESA3D_CONF_OPTS += -Dglvnd=false
> +MESA3D_CONF_OPTS += -Dglvnd=disabled
>  endif
>  else
> -MESA3D_CONF_OPTS += -Dglvnd=false
> +MESA3D_CONF_OPTS += -Dglvnd=disabled
>  endif
> 
> +HOST_MESA3D_CONF_OPTS = \
> +	-Dglvnd=disabled \
> +	-Dgallium-drivers=iris \
> +	-Dgallium-vdpau=disabled \
> +	-Dplatforms= \
> +	-Ddri3=disabled \
> +	-Dglx=disabled \
> +	-Dvulkan-drivers=""
> +
> +HOST_MESA3D_DEPENDENCIES = \
> +	host-libclc \
> +	host-libdrm \
> +	host-python-mako \
> +	host-python-pyyaml \
> +	host-spirv-tools
> +
> +define HOST_MESA3D_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/build/src/intel/compiler/intel_clc 
> $(HOST_DIR)/bin/intel_clc
> +endef
> +
>  $(eval $(meson-package))
> +$(eval $(host-meson-package))
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
