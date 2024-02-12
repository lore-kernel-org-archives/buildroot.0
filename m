Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3604EC4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 14:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F15C81EC3;
	Mon, 12 Feb 2024 14:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OmqrZeTzEVxi; Mon, 12 Feb 2024 14:54:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0137381E25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0137381E25;
	Mon, 12 Feb 2024 14:54:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 267491BF390
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20AEF4180D
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxhUKJvKr0rT for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 14:54:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 168AF4189A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 168AF4189A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 168AF4189A
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 14:54:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so26869585e9.1
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 06:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707749694; x=1708354494;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8N7xgAzz5CilNuZLEmw5GW7+jgSSpCWZJ5XU28f+L3c=;
 b=qEOmIace/qGILJ1Nt/VXsC+0BwRZswZcM9Kl0kLIf2F/5UoUVAg4+YmIJguIxWrT46
 GEVCpd+Sf3z3o8xQ0t/raWAgc1vbyUFUOn2mwilwgftJHt1zCjB0b/+/Ar/R81yX9FEO
 yAK3PrAb8x9qf0F6la4YK9sfhzL2E5k3DXpMMFmrf+mWBdqabTte5bHUoUwF1K+4LVSd
 sWE8D4t0RyGylReIXw0W9oTXNjS22AN1cBthWSU4q+e3cYPBMHXpLdA3Msq5sz/B7MWx
 u3jT1WsBHdUxljSF43P0HYjA1l9+MsulEQhekrosCHrVWFC6gAx4Iuwu1bHs17mEatq6
 qyVQ==
X-Gm-Message-State: AOJu0Yx/YZmCQ4ux4wD+Pv6QcM5VcuCe+kPHlURK7wqLEhYMWLHNJDc5
 Gqqs5gyUuNXmD2+UVZ8frn1v0nG+VCUo9zEOaoU/QJiXMjazRxOV/AtCp2mzVQ4=
X-Google-Smtp-Source: AGHT+IGQK3GlVnUpdjtI7R7WSTWOEjY+uU187CJg5krNgGW+cTgkBwsdyZmFvbjdOhnfwiyH3SrtQg==
X-Received: by 2002:a05:6000:1250:b0:33b:60ca:269f with SMTP id
 j16-20020a056000125000b0033b60ca269fmr4425672wrx.43.1707749693865; 
 Mon, 12 Feb 2024 06:54:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXhfMD7woVei3m41rtGadHJkkbccq6Zk8+9RKEK0RXyxuAMArHd0cnfIYw3fJO4B57/M/nkynWKzHtyq7nJc9HwdEhJPV3KC5YmJIUNAdJMFGE5/KqUbdbNMik8wadw9u6RXtH55yKmcTbFdI4lTGXv
Received: from ?IPV6:2a01:cb08:8680:f100:ee18:d70:d8d8:5591?
 (2a01cb088680f100ee180d70d8d85591.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8680:f100:ee18:d70:d8d8:5591])
 by smtp.gmail.com with ESMTPSA id
 en8-20020a056000420800b0033b7d9c14desm4177192wrb.5.2024.02.12.06.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 06:54:53 -0800 (PST)
Message-ID: <7e506d41-f4ff-4c9f-b407-2d39eccc559c@smile.fr>
Date: Mon, 12 Feb 2024 15:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-7-antoine.coutant@smile.fr>
 <ZcPVAhfEMmyyRyyI@landeda>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <ZcPVAhfEMmyyRyyI@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707749694; x=1708354494;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8N7xgAzz5CilNuZLEmw5GW7+jgSSpCWZJ5XU28f+L3c=;
 b=FfkUw+b1fxDRX0YH6BKj0hS1FMYxyhuke8KRboC0cqFKjOGgtkygNoyf1L7mE/Ar6s
 9rhFXzaDCwYW41WOlMscKRChtu+gg1XNYPO6M6Dwrmvk8+7eQTR+0tFzrGU4ldo0Kpgf
 8vhU7+HcgEimMUcg+du+OVchBm80mMUEc/8wOG3tWTp0F1302OiNLSQ6ooYfKkIW8lMS
 Fnw61nQPEstSGVa7vcR6BBnfrQqa0Y1PR5ltntwXIJbCJvo2obVyIol8ughcpksf+wre
 3EqkUc+QhF7oYMnE3S0bkedipXMoXyLUKcn0HlR1xPZyKtwWqSDFfduOccuc0tBEFWT3
 cvNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=FfkUw+b1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 07/02/2024 20:07, Yann E. MORIN wrote:
> Antoine, All,
>
> On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
>> rusticl depends on the mesa clc_compile_to_llvm_module function.
>> This function requires opencl-c-base.h when LLVM version >= 15.
>>
>> The header is deleted automatically by CLANG_FILES_TO_REMOVE
>> post install target hook in llvm-project/clang package.
>> When rusticl is enabled, after the whole clang directory has
>> been removed, the header is copied back to
>> /usr/lib/clang/$(LLVM_PROJECT_VERSION)/include/
>>
>> By default, the mesa3d variable used to retrieve the header
>> is set to the staging directory on the host machine. A merge
>> request on mesa's gitlab solved this problem. See:
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568
>>
>> The patches have been backported to mesa 23.3.4.
>>
>> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
>> ---
>> Changes v3 -> v4:
>> 	- Add patches merged by mesa upstream.
> Adding those patches has nothing to do in this commit, but should in the
> next one, that adds rusticl support in mesa3d, right?

I added them here because they are necessary when using

the missing header. However, you are right, their place is not

in this patch as they are not useful to add the missing header

on the target.


I will move them into the patch that adds rusticl support.


Thanks, for this feedback !


Regards,

Antoine Coutant


>
> Regards,
> Yann E. MORIN.
>
>> ---
>> Running an app that uses rusticl leads to an error.
>> Example:
>>
>> RUSTICL_ENABLE=panfrost clpeak
>>
>> Platform: rusticl
>>    Device: Mali-G52 (Panfrost)
>>      Driver version  : 23.3.4 (Linux ARM64)
>>      Compute units   : 2
>>      Clock frequency : 800 MHz
>>      Build Log: <built-in>:1:10: fatal error: 'opencl-c-base.h' file not found
>> Error executing LLVM compilation action.
>>
>> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
>> ---
>>   package/llvm-project/clang/clang.mk           |  9 ++
>>   ...ncl-external-clang-headers-option-an.patch | 72 ++++++++++++++++
>>   ...or-every-user-when-using-shared-LLVM.patch | 40 +++++++++
>>   ...lc-retrieve-libclang-path-at-runtime.patch | 86 +++++++++++++++++++
>>   4 files changed, 207 insertions(+)
>>   create mode 100644 package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch
>>   create mode 100644 package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch
>>   create mode 100644 package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch
>>
>> diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
>> index 0bafd6461b..09aac7f0ec 100644
>> --- a/package/llvm-project/clang/clang.mk
>> +++ b/package/llvm-project/clang/clang.mk
>> @@ -90,6 +90,15 @@ define HOST_CLANG_INSTALL_CLANG_TBLGEN
>>   endef
>>   HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_INSTALL_CLANG_TBLGEN
>>   
>> +# Rusticl needs opencl-c-base.h to be present on the target.
>> +define CLANG_OPENCL_C_BASE_HEADER_TO_TARGET
>> +	mkdir -p $(TARGET_DIR)/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include
>> +	$(INSTALL) -D -m 0644 $(@D)/lib/Headers/opencl-c-base.h $(TARGET_DIR)/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include/opencl-c-base.h
>> +endef
>> +ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
>> +CLANG_POST_INSTALL_TARGET_HOOKS += CLANG_OPENCL_C_BASE_HEADER_TO_TARGET
>> +endif
>> +
>>   # This option must be enabled to link libclang dynamically against libLLVM.so
>>   HOST_CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
>>   CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
>> diff --git a/package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch b/package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch
>> new file mode 100644
>> index 0000000000..ebe3542627
>> --- /dev/null
>> +++ b/package/mesa3d/0006-meson-remove-opencl-external-clang-headers-option-an.patch
>> @@ -0,0 +1,72 @@
>> +From b7f2ada31d85dfd2e9906a7343d14a3b0b85cf14 Mon Sep 17 00:00:00 2001
>> +From: Karol Herbst <kherbst@redhat.com>
>> +Date: Tue, 2 Jan 2024 22:58:39 +0100
>> +Subject: [PATCH 1/3] meson: remove opencl-external-clang-headers option and
>> + rely on shared-llvm
>> +
>> +Setting opencl-external-clang-headers to enabled while using shared LLVM
>> +was broken and this option was mostly used for windows to force static
>> +inclusion of opencl base headers.
>> +
>> +Simply relying on the shared-llvm option here is enough to get what we
>> +want.
>> +
>> +Signed-off-by: Karol Herbst <kherbst@redhat.com>
>> +Reviewed-by: Jesse Natalie <jenatali@microsoft.com>
>> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568>
>> +[antoine.coutant@smile.fr: backported to mesa-23.3.4]
>> +Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
>> +---
>> + .gitlab-ci/windows/mesa_build.ps1 | 1 -
>> + meson_options.txt                 | 7 -------
>> + src/compiler/clc/meson.build      | 4 +---
>> + 3 files changed, 1 insertion(+), 11 deletions(-)
>> +
>> +diff --git a/.gitlab-ci/windows/mesa_build.ps1 b/.gitlab-ci/windows/mesa_build.ps1
>> +index a4f87c4eadb..e79eb6b6587 100644
>> +--- a/.gitlab-ci/windows/mesa_build.ps1
>> ++++ b/.gitlab-ci/windows/mesa_build.ps1
>> +@@ -59,7 +59,6 @@ meson setup `
>> + -Dopencl-spirv=true `
>> + -Dmicrosoft-clc=enabled `
>> + -Dstatic-libclc=all `
>> +--Dopencl-external-clang-headers=disabled `
>> + -Dspirv-to-dxil=true `
>> + -Dbuild-tests=true `
>> + -Dwerror=true `
>> +diff --git a/meson_options.txt b/meson_options.txt
>> +index e885ba61a8a..537ba797407 100644
>> +--- a/meson_options.txt
>> ++++ b/meson_options.txt
>> +@@ -191,13 +191,6 @@ option(
>> +   description : 'Link libclc SPIR-V statically.',
>> + )
>> +
>> +-option(
>> +-  'opencl-external-clang-headers',
>> +-  type : 'feature',
>> +-  description : 'Use system Clang headers at runtime for OpenCL kernel ' +
>> +-                'compilation.',
>> +-)
>> +-
>> + option(
>> +   'd3d-drivers-path',
>> +   type : 'string',
>> +diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
>> +index 3e4f1a7f441..81345225768 100644
>> +--- a/src/compiler/clc/meson.build
>> ++++ b/src/compiler/clc/meson.build
>> +@@ -30,9 +30,7 @@ _libmesaclc_c_args = []
>> + _libmesaclc_cpp_args = ['-DLLVM_LIB_DIR="@0@"'.format(llvm_libdir)]
>> + _libmesaclc_sources = []
>> +
>> +-if get_option('opencl-external-clang-headers') \
>> +-   .disable_auto_if(host_machine.system() == 'windows') \
>> +-   .disabled()
>> ++if not _shared_llvm
>> +   # LLVM 16 moved clang header path from using full version to only major version
>> +   if dep_llvm.version().version_compare('< 16')
>> +     # Prior to LLVM 16, this path used a full version
>> +--
>> +2.25.1
>> +
>> diff --git a/package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch b/package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch
>> new file mode 100644
>> index 0000000000..3560f6805f
>> --- /dev/null
>> +++ b/package/mesa3d/0007-clc-force-fPIC-for-every-user-when-using-shared-LLVM.patch
>> @@ -0,0 +1,40 @@
>> +From 56c85c4c7a757a9ba3d8ac08e6c4c4c7f19e6cab Mon Sep 17 00:00:00 2001
>> +From: Karol Herbst <kherbst@redhat.com>
>> +Date: Thu, 11 Jan 2024 14:55:46 +0100
>> +Subject: [PATCH 2/3] clc: force fPIC for every user when using shared LLVM
>> +
>> +As we want to start using `dladdr`, this is needed to prevent `dladdr`
>> +returning information of the wrong file.
>> +
>> +Fixes tag as it's required by the actual fix.
>> +
>> +Signed-off-by: Karol Herbst <kherbst@redhat.com>
>> +Fixes: e22491c8326 ("clc: fetch clang resource dir at runtime")
>> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568>
>> +[antoine.coutant@smile.fr: backported to mesa-23.3.4]
>> +Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
>> +---
>> + src/compiler/clc/meson.build | 6 ++++++
>> + 1 file changed, 6 insertions(+)
>> +
>> +diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
>> +index 81345225768..442a583065b 100644
>> +--- a/src/compiler/clc/meson.build
>> ++++ b/src/compiler/clc/meson.build
>> +@@ -123,7 +123,13 @@ _libmesaclc = static_library(
>> +                  idep_mesautil, dep_spirv_tools]
>> + )
>> +
>> ++_idep_mesaclc_link_args = []
>> ++if _shared_llvm
>> ++  _idep_mesaclc_link_args += cc.get_supported_link_arguments('-fPIC')
>> ++endif
>> ++
>> + idep_mesaclc = declare_dependency(
>> +   link_with : _libmesaclc,
>> +   include_directories : include_directories('.'),
>> ++  link_args : _idep_mesaclc_link_args,
>> + )
>> +--
>> +2.25.1
>> +
>> diff --git a/package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch b/package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch
>> new file mode 100644
>> index 0000000000..c19ba7d2b7
>> --- /dev/null
>> +++ b/package/mesa3d/0008-clc-retrieve-libclang-path-at-runtime.patch
>> @@ -0,0 +1,86 @@
>> +From fa2c045e04370beb454951c32bccc087638e04c7 Mon Sep 17 00:00:00 2001
>> +From: Antoine Coutant <antoine.coutant@smile.fr>
>> +Date: Thu, 30 Nov 2023 11:10:20 +0100
>> +Subject: [PATCH 3/3] clc: retrieve libclang path at runtime.
>> +
>> +LLVM_LIB_DIR is a variable used for runtime compilations.
>> +When cross compiling, LLVM_LIB_DIR must be set to the
>> +libclang path on the target. So, this path should not
>> +be retrieved during compilation but at runtime.
>> +
>> +dladdr uses an address to search for a loaded library.
>> +If a library is found, it returns information about it.
>> +The path to the libclang library can therefore be
>> +retrieved using one of its functions. This is useful
>> +because we don't know the name of the libclang library
>> +(libclang.so.X or libclang-cpp.so.X)
>> +
>> +v2 (Karol): use clang::CompilerInvocation::CreateFromArgs for dladdr
>> +v3 (Karol): follow symlinks to fix errors on debian
>> +
>> +Fixes: e22491c8326 ("clc: fetch clang resource dir at runtime")
>> +Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
>> +Reviewed-by: Karol Herbst <kherbst@redhat.com>
>> +Reviewed-by (v1): Jesse Natalie <jenatali@microsoft.com>
>> +[antoine.coutant@smile.fr: backported to mesa-23.3.4]
>> +
>> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568>
>> +---
>> + src/compiler/clc/clc_helpers.cpp | 24 +++++++++++++++++++++---
>> + 1 file changed, 21 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/compiler/clc/clc_helpers.cpp b/src/compiler/clc/clc_helpers.cpp
>> +index 55287f22683..22eb3495be9 100644
>> +--- a/src/compiler/clc/clc_helpers.cpp
>> ++++ b/src/compiler/clc/clc_helpers.cpp
>> +@@ -23,6 +23,7 @@
>> + // ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + // OTHER DEALINGS IN THE SOFTWARE.
>> +
>> ++#include <cstdlib>
>> + #include <filesystem>
>> + #include <sstream>
>> + #include <mutex>
>> +@@ -57,6 +58,10 @@
>> +
>> + #include "spirv.h"
>> +
>> ++#if DETECT_OS_UNIX
>> ++#include <dlfcn.h>
>> ++#endif
>> ++
>> + #ifdef USE_STATIC_OPENCL_C_H
>> + #if LLVM_VERSION_MAJOR < 15
>> + #include "opencl-c.h.h"
>> +@@ -876,12 +881,25 @@ clc_compile_to_llvm_module(LLVMContext &llvm_ctx,
>> + #endif
>> +    }
>> + #else
>> ++
>> ++   Dl_info info;
>> ++   if (dladdr((void *)clang::CompilerInvocation::CreateFromArgs, &info) == 0) {
>> ++      clc_error(logger, "Couldn't find libclang path.\n");
>> ++      return {};
>> ++   }
>> ++
>> ++   char *clang_path = realpath(info.dli_fname, NULL);
>> ++   if (clang_path == nullptr) {
>> ++      clc_error(logger, "Couldn't find libclang path.\n");
>> ++      return {};
>> ++   }
>> ++
>> +    // GetResourcePath is a way to retrive the actual libclang resource dir based on a given binary
>> +-   // or library. The path doesn't even need to exist, we just have to put something in there,
>> +-   // because we might have linked clang statically.
>> ++   // or library.
>> +    auto libclang_path = fs::path(LLVM_LIB_DIR) / "libclang.so";
>> +    auto clang_res_path =
>> +-      fs::path(Driver::GetResourcesPath(libclang_path.string(), CLANG_RESOURCE_DIR)) / "include";
>> ++      fs::path(Driver::GetResourcesPath(std::string(clang_path), CLANG_RESOURCE_DIR)) / "include";
>> ++   free(clang_path);
>> +
>> +    c->getHeaderSearchOpts().UseBuiltinIncludes = true;
>> +    c->getHeaderSearchOpts().UseStandardSystemIncludes = true;
>> +--
>> +2.25.1
>> +
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
