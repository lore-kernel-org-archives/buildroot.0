From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 8 Aug 2019 18:14:11 +0200
Subject: [Buildroot] [PATCH v3 7/7] package/bcc: new package
In-Reply-To: <1557130548-6267-8-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557130548-6267-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557130548-6267-8-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <5ff0d1a4-89c5-db8c-6706-bbfd8115a4d3@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/05/2019 ? 10:15, Jugurtha BELKALEM a ?crit?:
> From: Romain Naour <romain.naour@smile.fr>
> 
> bcc is a front-end tool for eBPF :
> https://github.com/iovisor/bcc/blob/master/README.md.
> eBPF is the most powerful Linux tracer, and bcc
> allows to write eBPF scripts in C and PYTHON3.
> 
> bcc can help to troubleshoot issues quickly on
> embedded systems (as long as Linux kernel
> version >= 4.1).
> 
> bcc can also make it easy to create observabilty tools,
> SDN configuration, ddos mitigation, intrusion detection
> and secure containers. More information is available at:
> http://www.brendangregg.com/ebpf.html.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
> ---
>  package/Config.in                                  |  1 +
>  ...CMake-Allow-to-disable-building-man-pages.patch | 35 +++++++++++++++
>  package/bcc/0002-fix-aarch64-cross-compile.patch   | 38 ++++++++++++++++
>  package/bcc/Config.in                              | 51 ++++++++++++++++++++++
>  package/bcc/bcc.hash                               |  3 ++
>  package/bcc/bcc.mk                                 | 23 ++++++++++
>  6 files changed, 151 insertions(+)
>  create mode 100644 package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
>  create mode 100644 package/bcc/0002-fix-aarch64-cross-compile.patch
>  create mode 100644 package/bcc/Config.in
>  create mode 100644 package/bcc/bcc.hash
>  create mode 100644 package/bcc/bcc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 38d5321..b2fa28d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -79,6 +79,7 @@ menu "Compressors and decompressors"
>  endmenu
>  
>  menu "Debugging, profiling and benchmark"
> +	source "package/bcc/Config.in"
>  	source "package/blktrace/Config.in"
>  	source "package/bonnie/Config.in"
>  	source "package/cache-calibrator/Config.in"
> diff --git a/package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch b/package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
> new file mode 100644
> index 0000000..c5c87d5
> --- /dev/null
> +++ b/package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
> @@ -0,0 +1,35 @@
> +From a99f097aedbf964356e62c0c4bba1257f108c3eb Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Fri, 7 Dec 2018 22:36:21 +0100
> +Subject: [PATCH] CMake: Allow to disable building man pages
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---

This patch is upstream:
https://github.com/iovisor/bcc/pull/2481

[...]

> +
> diff --git a/package/bcc/0002-fix-aarch64-cross-compile.patch b/package/bcc/0002-fix-aarch64-cross-compile.patch
> new file mode 100644
> index 0000000..896ad6a
> --- /dev/null
> +++ b/package/bcc/0002-fix-aarch64-cross-compile.patch
> @@ -0,0 +1,38 @@
> +From 4198c9589f9285c2f4e656159e28a3f19e280a7b Mon Sep 17 00:00:00 2001
> +From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> +Date: Thu, 2 May 2019 11:06:23 +0200
> +Subject: [PATCH] luajit: fix aarch64 cross-compile
> +
> +Unlike CMAKE_SYSTEM_PROCESSOR which identifies aarch64
> +as a valid architecture, luajit does not recognize it.
> +luajit defines aarch64 as arm64.
> +
> +Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> +---
> + src/lua/CMakeLists.txt | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/lua/CMakeLists.txt b/src/lua/CMakeLists.txt
> +index 7541d48..59415b0 100644
> +--- a/src/lua/CMakeLists.txt
> ++++ b/src/lua/CMakeLists.txt
> +@@ -13,9 +13,15 @@ if (LUAJIT_LIBRARIES AND LUAJIT)
> + 		DEPENDS ${SRC_LUA} ${CMAKE_CURRENT_SOURCE_DIR}/squishy
> + 	)
> + 
> ++	if (CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
> ++		SET (LUAJIT_TARGET_ARCH arm64)
> ++	else()
> ++		SET (LUAJIT_TARGET_ARCH ${CMAKE_SYSTEM_PROCESSOR})
> ++	endif()
> ++

As noticed by upstream, this patch is not complete.
We need to do the same for all architectures supported by luajit:

https://github.com/iovisor/bcc/pull/2480


> + 	ADD_CUSTOM_COMMAND(
> + 		OUTPUT bcc.o
> +-		COMMAND ${LUAJIT} -bg bcc.lua bcc.o
> ++		COMMAND ${LUAJIT} -bg bcc.lua -a ${LUAJIT_TARGET_ARCH} bcc.o
> + 		DEPENDS bcc.lua
> + 	)
> + 
> +-- 
> +2.7.4

[...]

> index 0000000..e8f53eb
> --- /dev/null
> +++ b/package/bcc/bcc.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# bcc
> +#
> +################################################################################
> +
> +BCC_VERSION = v0.8.0

BCC tool evolve really fast!
There is a v0.10 version now.

I'll mark this patch as changes requested.

Best regards,
Romain

> +BCC_SITE = $(call github,iovisor,bcc,$(BCC_VERSION))
> +BCC_LICENSE = Apache-2.0
> +BCC_LICENSE_FILES = LICENSE.txt
> +# libbcc.so and libbpf.so
> +BCC_INSTALL_STAGING = YES
