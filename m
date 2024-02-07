Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E627C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C9EB61480;
	Wed,  7 Feb 2024 19:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNE89SXpl8Ht; Wed,  7 Feb 2024 19:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC9DD61485
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC9DD61485;
	Wed,  7 Feb 2024 19:08:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51BE31BF577
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A01A416CA
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uxyn5RzbBWUH for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0714A4013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0714A4013F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0714A4013F
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:07:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [84.198.244.196])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 134975FFB1;
 Wed,  7 Feb 2024 20:07:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 20:07:46 +0100
Date: Wed, 7 Feb 2024 20:07:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZcPVAhfEMmyyRyyI@landeda>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-7-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202093625.1409559-7-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707332873;
 bh=I8Fr8bHnwbTnTI6qE1hRrfOZt+dLAc9QZse6or3vRP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k54B3hnM4xxHE4cu6aUGJuZzIrV9Ix5WhT4qg3yjOIQRwC+hZ+pNY0Z56OGPULeUv
 R3xMW/V64aHbyIUtMJ8z//1gE8hJ9NxDoAtFkaiZhb1kOqIE+GNNKkkrZiznr7E8XG
 tz+JQ8ZCChj0H/A5/CDtNVYCHTN3tgRIqSXhD9qexVN/e3231sVZ/b/OhpoM0PWyUd
 YBwm8/V5EYFnbLSKdJ20lqI/gz2bVxwKCvmmw2dVgcX8z0WB3jNWn9wkydFs0ghvnz
 Noe8pOsVJkxUz7BhMJ9RBClLOW0S5uaOZQUAFLABsidu+Tz2aZGfrplv7GwfKSe5+x
 etAnnGdFbYmgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k54B3hnM
Subject: Re: [Buildroot] [PATCH v4 6/7] package/llvm-project: add
 opencl-c-base.h on target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: sebastian.weyer@smile.fr, bernd@kuhls.net, romain.naour@smile.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, All,

On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
> rusticl depends on the mesa clc_compile_to_llvm_module function.
> This function requires opencl-c-base.h when LLVM version >= 15.
> 
> The header is deleted automatically by CLANG_FILES_TO_REMOVE
> post install target hook in llvm-project/clang package.
> When rusticl is enabled, after the whole clang directory has
> been removed, the header is copied back to
> /usr/lib/clang/$(LLVM_PROJECT_VERSION)/include/
> 
> By default, the mesa3d variable used to retrieve the header
> is set to the staging directory on the host machine. A merge
> request on mesa's gitlab solved this problem. See:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568
> 
> The patches have been backported to mesa 23.3.4.
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
> Changes v3 -> v4:
> 	- Add patches merged by mesa upstream.

Adding those patches has nothing to do in this commit, but should in the
next one, that adds rusticl support in mesa3d, right?

Regards,
Yann E. MORIN.

> ---
> Running an app that uses rusticl leads to an error.
> Example:
> 
> RUSTICL_ENABLE=panfrost clpeak
> 
> Platform: rusticl
>   Device: Mali-G52 (Panfrost)
>     Driver version  : 23.3.4 (Linux ARM64)
>     Compute units   : 2
>     Clock frequency : 800 MHz
>     Build Log: <built-in>:1:10: fatal error: 'opencl-c-base.h' file not found
> Error executing LLVM compilation action.
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
>  package/llvm-project/clang/clang.mk           |  9 ++
>  ...ncl-external-clang-headers-option-an.patch | 72 ++++++++++++++++
>  ...or-every-user-when-using-shared-LLVM.patch | 40 +++++++++
>  ...lc-retrieve-libclang-path-at-runtime.patch | 86 +++++++++++++++++++
>  4 files changed, 207 insertions(+)
>  create mode 100644 package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch
>  create mode 100644 package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch
>  create mode 100644 package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch
> 
> diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
> index 0bafd6461b..09aac7f0ec 100644
> --- a/package/llvm-project/clang/clang.mk
> +++ b/package/llvm-project/clang/clang.mk
> @@ -90,6 +90,15 @@ define HOST_CLANG_INSTALL_CLANG_TBLGEN
>  endef
>  HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_INSTALL_CLANG_TBLGEN
>  
> +# Rusticl needs opencl-c-base.h to be present on the target.
> +define CLANG_OPENCL_C_BASE_HEADER_TO_TARGET
> +	mkdir -p $(TARGET_DIR)/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include
> +	$(INSTALL) -D -m 0644 $(@D)/lib/Headers/opencl-c-base.h $(TARGET_DIR)/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include/opencl-c-base.h
> +endef
> +ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
> +CLANG_POST_INSTALL_TARGET_HOOKS += CLANG_OPENCL_C_BASE_HEADER_TO_TARGET
> +endif
> +
>  # This option must be enabled to link libclang dynamically against libLLVM.so
>  HOST_CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
>  CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
> diff --git a/package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch b/package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch
> new file mode 100644
> index 0000000000..ebe3542627
> --- /dev/null
> +++ b/package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch
> @@ -0,0 +1,72 @@
> +From b7f2ada31d85dfd2e9906a7343d14a3b0b85cf14 Mon Sep 17 00:00:00 2001
> +From: Karol Herbst <kherbst@redhat.com>
> +Date: Tue, 2 Jan 2024 22:58:39 +0100
> +Subject: [PATCH 1/3] meson: remove opencl-external-clang-headers option and
> + rely on shared-llvm
> +
> +Setting opencl-external-clang-headers to enabled while using shared LLVM
> +was broken and this option was mostly used for windows to force static
> +inclusion of opencl base headers.
> +
> +Simply relying on the shared-llvm option here is enough to get what we
> +want.
> +
> +Signed-off-by: Karol Herbst <kherbst@redhat.com>
> +Reviewed-by: Jesse Natalie <jenatali@microsoft.com>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568>
> +[antoine.coutant@smile.fr: backported to mesa-23.3.4]
> +Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> +---
> + .gitlab-ci/windows/mesa_build.ps1 | 1 -
> + meson_options.txt                 | 7 -------
> + src/compiler/clc/meson.build      | 4 +---
> + 3 files changed, 1 insertion(+), 11 deletions(-)
> +
> +diff --git a/.gitlab-ci/windows/mesa_build.ps1 b/.gitlab-ci/windows/mesa_build.ps1
> +index a4f87c4eadb..e79eb6b6587 100644
> +--- a/.gitlab-ci/windows/mesa_build.ps1
> ++++ b/.gitlab-ci/windows/mesa_build.ps1
> +@@ -59,7 +59,6 @@ meson setup `
> + -Dopencl-spirv=true `
> + -Dmicrosoft-clc=enabled `
> + -Dstatic-libclc=all `
> +--Dopencl-external-clang-headers=disabled `
> + -Dspirv-to-dxil=true `
> + -Dbuild-tests=true `
> + -Dwerror=true `
> +diff --git a/meson_options.txt b/meson_options.txt
> +index e885ba61a8a..537ba797407 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -191,13 +191,6 @@ option(
> +   description : 'Link libclc SPIR-V statically.',
> + )
> + 
> +-option(
> +-  'opencl-external-clang-headers',
> +-  type : 'feature',
> +-  description : 'Use system Clang headers at runtime for OpenCL kernel ' +
> +-                'compilation.',
> +-)
> +-
> + option(
> +   'd3d-drivers-path',
> +   type : 'string',
> +diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
> +index 3e4f1a7f441..81345225768 100644
> +--- a/src/compiler/clc/meson.build
> ++++ b/src/compiler/clc/meson.build
> +@@ -30,9 +30,7 @@ _libmesaclc_c_args = []
> + _libmesaclc_cpp_args = ['-DLLVM_LIB_DIR="@0@"'.format(llvm_libdir)]
> + _libmesaclc_sources = []
> + 
> +-if get_option('opencl-external-clang-headers') \
> +-   .disable_auto_if(host_machine.system() == 'windows') \
> +-   .disabled()
> ++if not _shared_llvm
> +   # LLVM 16 moved clang header path from using full version to only major version
> +   if dep_llvm.version().version_compare('< 16')
> +     # Prior to LLVM 16, this path used a full version
> +-- 
> +2.25.1
> +
> diff --git a/package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch b/package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch
> new file mode 100644
> index 0000000000..3560f6805f
> --- /dev/null
> +++ b/package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch
> @@ -0,0 +1,40 @@
> +From 56c85c4c7a757a9ba3d8ac08e6c4c4c7f19e6cab Mon Sep 17 00:00:00 2001
> +From: Karol Herbst <kherbst@redhat.com>
> +Date: Thu, 11 Jan 2024 14:55:46 +0100
> +Subject: [PATCH 2/3] clc: force fPIC for every user when using shared LLVM
> +
> +As we want to start using `dladdr`, this is needed to prevent `dladdr`
> +returning information of the wrong file.
> +
> +Fixes tag as it's required by the actual fix.
> +
> +Signed-off-by: Karol Herbst <kherbst@redhat.com>
> +Fixes: e22491c8326 ("clc: fetch clang resource dir at runtime")
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568>
> +[antoine.coutant@smile.fr: backported to mesa-23.3.4]
> +Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> +---
> + src/compiler/clc/meson.build | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
> +index 81345225768..442a583065b 100644
> +--- a/src/compiler/clc/meson.build
> ++++ b/src/compiler/clc/meson.build
> +@@ -123,7 +123,13 @@ _libmesaclc = static_library(
> +                  idep_mesautil, dep_spirv_tools]
> + )
> + 
> ++_idep_mesaclc_link_args = []
> ++if _shared_llvm
> ++  _idep_mesaclc_link_args += cc.get_supported_link_arguments('-fPIC')
> ++endif
> ++
> + idep_mesaclc = declare_dependency(
> +   link_with : _libmesaclc,
> +   include_directories : include_directories('.'),
> ++  link_args : _idep_mesaclc_link_args,
> + )
> +-- 
> +2.25.1
> +
> diff --git a/package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch b/package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch
> new file mode 100644
> index 0000000000..c19ba7d2b7
> --- /dev/null
> +++ b/package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch
> @@ -0,0 +1,86 @@
> +From fa2c045e04370beb454951c32bccc087638e04c7 Mon Sep 17 00:00:00 2001
> +From: Antoine Coutant <antoine.coutant@smile.fr>
> +Date: Thu, 30 Nov 2023 11:10:20 +0100
> +Subject: [PATCH 3/3] clc: retrieve libclang path at runtime.
> +
> +LLVM_LIB_DIR is a variable used for runtime compilations.
> +When cross compiling, LLVM_LIB_DIR must be set to the
> +libclang path on the target. So, this path should not
> +be retrieved during compilation but at runtime.
> +
> +dladdr uses an address to search for a loaded library.
> +If a library is found, it returns information about it.
> +The path to the libclang library can therefore be
> +retrieved using one of its functions. This is useful
> +because we don't know the name of the libclang library
> +(libclang.so.X or libclang-cpp.so.X)
> +
> +v2 (Karol): use clang::CompilerInvocation::CreateFromArgs for dladdr
> +v3 (Karol): follow symlinks to fix errors on debian
> +
> +Fixes: e22491c8326 ("clc: fetch clang resource dir at runtime")
> +Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> +Reviewed-by: Karol Herbst <kherbst@redhat.com>
> +Reviewed-by (v1): Jesse Natalie <jenatali@microsoft.com>
> +[antoine.coutant@smile.fr: backported to mesa-23.3.4]
> +
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568>
> +---
> + src/compiler/clc/clc_helpers.cpp | 24 +++++++++++++++++++++---
> + 1 file changed, 21 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/compiler/clc/clc_helpers.cpp b/src/compiler/clc/clc_helpers.cpp
> +index 55287f22683..22eb3495be9 100644
> +--- a/src/compiler/clc/clc_helpers.cpp
> ++++ b/src/compiler/clc/clc_helpers.cpp
> +@@ -23,6 +23,7 @@
> + // ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + // OTHER DEALINGS IN THE SOFTWARE.
> + 
> ++#include <cstdlib>
> + #include <filesystem>
> + #include <sstream>
> + #include <mutex>
> +@@ -57,6 +58,10 @@
> + 
> + #include "spirv.h"
> + 
> ++#if DETECT_OS_UNIX
> ++#include <dlfcn.h>
> ++#endif
> ++
> + #ifdef USE_STATIC_OPENCL_C_H
> + #if LLVM_VERSION_MAJOR < 15
> + #include "opencl-c.h.h"
> +@@ -876,12 +881,25 @@ clc_compile_to_llvm_module(LLVMContext &llvm_ctx,
> + #endif
> +    }
> + #else
> ++
> ++   Dl_info info;
> ++   if (dladdr((void *)clang::CompilerInvocation::CreateFromArgs, &info) == 0) {
> ++      clc_error(logger, "Couldn't find libclang path.\n");
> ++      return {};
> ++   }
> ++
> ++   char *clang_path = realpath(info.dli_fname, NULL);
> ++   if (clang_path == nullptr) {
> ++      clc_error(logger, "Couldn't find libclang path.\n");
> ++      return {};
> ++   }
> ++
> +    // GetResourcePath is a way to retrive the actual libclang resource dir based on a given binary
> +-   // or library. The path doesn't even need to exist, we just have to put something in there,
> +-   // because we might have linked clang statically.
> ++   // or library.
> +    auto libclang_path = fs::path(LLVM_LIB_DIR) / "libclang.so";
> +    auto clang_res_path =
> +-      fs::path(Driver::GetResourcesPath(libclang_path.string(), CLANG_RESOURCE_DIR)) / "include";
> ++      fs::path(Driver::GetResourcesPath(std::string(clang_path), CLANG_RESOURCE_DIR)) / "include";
> ++   free(clang_path);
> + 
> +    c->getHeaderSearchOpts().UseBuiltinIncludes = true;
> +    c->getHeaderSearchOpts().UseStandardSystemIncludes = true;
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
