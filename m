From: Qais Yousef <qais.yousef@arm.com>
Date: Sun, 4 Oct 2020 19:12:18 +0100
Subject: [Buildroot] [PATCH 2/2] package/bcc: new package
In-Reply-To: <20200824181740.12878-2-jugurtha.belkalem@smile.fr>
References: <20200824181740.12878-1-jugurtha.belkalem@smile.fr>
 <20200824181740.12878-2-jugurtha.belkalem@smile.fr>
Message-ID: <20201004181215.2w225cjecin4pm6r@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jugurtha

I am very late to the party and missed earlier reviews. So apologies in advance
if any of my comments was already brought up/addressed.

Can you keep me on CC on future posting and any other related discussion
please?

On 08/24/20 20:17, Jugurtha BELKALEM wrote:
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

There's the brand new ebpf website too

	http://www.ebpf.io

> 
> BCC can be tested on the target :
> $ mount -t debugfs none /sys/kernel/debug

I wonder if this something we can automatically append to /etc/fstab when this
package is enabled..

> $ mkdir -p /lib/modules/KERNEL_VERSION/build
> $ cd /lib/modules/KERNEL_VERSION//build
> $ cp /sys/kernel/kheaders.tar.xz .
> $ unxz kheaders.tar.xz
> $ tar xf kheaders.tar

All the above is unnecessary. BCC automatically does this if it detects
/sys/kernel/kheaders.tar.xz is present. I had to enable BR2_PACKAGE_TAR for BCC
to handle this correctly. I guess busybox::tar is too limited to work with BCC
commands.

> $ cd /usr/share/bcc/examples/tracing
> $ ./disksnoop.py

/usr/share/bcc/tools contains actual tools. I recommend picking up an example
from there.

> 
> V3
> - Bump to version 0.16.0.
> - Add required python dependency.
> - Remove unnecessary and duplicated
>   kernel flags (#Testing section) in bcc.mk.
> -------------
> V2
> - Add eBPF's required Kernel flags.
> - Fix submodule source fetch problem.
> - Add toolchain dependency.

Did you intend to include these in the commit message?

> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  DEVELOPERS                                       |  1 +
>  package/Config.in                                |  1 +
>  package/bcc/0001-fix-aarch64-cross-compile.patch | 65 ++++++++++++++++++++++++
>  package/bcc/Config.in                            | 49 ++++++++++++++++++
>  package/bcc/bcc.hash                             |  3 ++
>  package/bcc/bcc.mk                               | 57 +++++++++++++++++++++
>  6 files changed, 176 insertions(+)
>  create mode 100644 package/bcc/0001-fix-aarch64-cross-compile.patch
>  create mode 100644 package/bcc/Config.in
>  create mode 100644 package/bcc/bcc.hash
>  create mode 100644 package/bcc/bcc.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 42fa5a4..bd836a6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1396,6 +1396,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
>  F:	package/qt5/qt5wayland/
>  
>  N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> +F:	package/bcc/
>  F:	package/python-cycler/
>  F:	package/python-matplotlib/
>  
> diff --git a/package/Config.in b/package/Config.in
> index d7e79f4..8ec3932 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -83,6 +83,7 @@ menu "Compressors and decompressors"
>  endmenu
>  
>  menu "Debugging, profiling and benchmark"
> +	source "package/bcc/Config.in"
>  	source "package/blktrace/Config.in"
>  	source "package/bonnie/Config.in"
>  	source "package/cache-calibrator/Config.in"
> diff --git a/package/bcc/0001-fix-aarch64-cross-compile.patch b/package/bcc/0001-fix-aarch64-cross-compile.patch
> new file mode 100644
> index 0000000..6b42797
> --- /dev/null
> +++ b/package/bcc/0001-fix-aarch64-cross-compile.patch
> @@ -0,0 +1,65 @@
> +From 5a5b0f04484e00c88e7be902101367d6d591fb96 Mon Sep 17 00:00:00 2001
> +From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> +Date: Thu, 2 May 2019 11:06:23 +0200
> +Subject: [PATCH] cmake/luajit: Provide the target architecture to luaJIT while
> + cross-compiling

Is this luajit required to enable Lua front-end to BCC? Given python is the
most common front-end, I'd argue to make this an extra option that is only
enabled if the user selects it in the menu. Same way BPF backend in LLVM is
only compiled in if selected. IMHO that's a better default behavior.

> +
> +Unlike CMAKE_SYSTEM_PROCESSOR which identifies aarch64
> +as a valid architecture, luajit does not recognize it.
> +luajit defines aarch64 as arm64.
> +
> +LuaJIT doesn't use usual arch naming, so we have to convert
> +between CMake and Luajit for each architectures while
> +cross-compiling.
> +
> +Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> +v2: Do the same for other architecture supported by LuaJIT.
> +https://github.com/iovisor/bcc/pull/2480
> +---
> + src/lua/CMakeLists.txt | 29 ++++++++++++++++++++++++++++-
> + 1 file changed, 28 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/lua/CMakeLists.txt b/src/lua/CMakeLists.txt
> +index 7541d48df..226e1b1d2 100644
> +--- a/src/lua/CMakeLists.txt
> ++++ b/src/lua/CMakeLists.txt
> +@@ -13,9 +13,36 @@ if (LUAJIT_LIBRARIES AND LUAJIT)
> + 		DEPENDS ${SRC_LUA} ${CMAKE_CURRENT_SOURCE_DIR}/squishy
> + 	)
> + 
> ++	# LuaJIT doesn't use usual arch naming, so we have to convert
> ++	# between CMake and Luajit while cross-compiling.
> ++	if (CMAKE_CROSSCOMPILING)
> ++		SET (LUAJIT_TARGET_ARCH "-a")
> ++		# https://github.com/LuaJIT/LuaJIT/blob/f0e865dd4861520258299d0f2a56491bd9d602e1/src/jit/bcsave.lua#L30
> ++		# https://github.com/LuaJIT/LuaJIT/blob/f0e865dd4861520258299d0f2a56491bd9d602e1/src/jit/bcsave.lua#L65
> ++		if (CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm64")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64_be")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm64be")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86)$")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "x86")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "mips")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "mips")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "mipsel")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "mipsel")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "powerpc")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "ppc")
> ++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
> ++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "x64")
> ++		else()
> ++			MESSAGE(FATAL_ERROR "${CMAKE_SYSTEM_PROCESSOR} is not supported by LuaJIT")
> ++		endif()
> ++	endif()
> ++
> + 	ADD_CUSTOM_COMMAND(
> + 		OUTPUT bcc.o
> +-		COMMAND ${LUAJIT} -bg bcc.lua bcc.o
> ++		COMMAND ${LUAJIT} -bg bcc.lua ${LUAJIT_TARGET_ARCH} bcc.o
> + 		DEPENDS bcc.lua
> + 	)
> + 
> diff --git a/package/bcc/Config.in b/package/bcc/Config.in
> new file mode 100644
> index 0000000..cf03927
> --- /dev/null
> +++ b/package/bcc/Config.in
> @@ -0,0 +1,49 @@
> +config BR2_PACKAGE_BCC
> +	bool "bcc"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # hardcode GNU tuple (x86_64-unknown-linux-gnu)
> +	depends on BR2_LINUX_KERNEL # needs kernel sources on the target

This dependency on building the kernel in buildroot is not user friendly. For
example I never build the kernel in buildroot, and certainly would like to be
able to enable this package without having to build the kernel in buildroot.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # clang
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # clang
> +	depends on BR2_INSTALL_LIBSTDCPP # clang

> +	select BR2_PACKAGE_AUDIT # runtime

This..

> +	select BR2_PACKAGE_CLANG
> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_FLEX # needs FlexLexer.h

> +	select BR2_PACKAGE_IPERF3 # runtime

.. this..

> +	select BR2_PACKAGE_LLVM_BPF
> +	select BR2_PACKAGE_LUAJIT

> +	select BR2_PACKAGE_NETPERF # runtime

.. and this look odd to me. Can you expand which runtime requires them?

> +	select BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_XZ # Decompress kernel headers required by BCC

If you replace XZ with TAR, you should find that BCC automatically handles the
ikheader.tar.xz for you. There's now BPF Type Format (BTF) option in the kernel
that could replace the dependency on the headers. Haven't played much with that
yet though. BTF requires a tool called pahole. We can handle this support later
I guess.

> +	help
> +	  BPF Compiler Collection (BCC)
> +
> +	  BCC is a toolkit for creating efficient kernel tracing and
> +	  manipulation programs, and includes several useful tools and
> +	  examples. It makes use of extended BPF (Berkeley Packet
> +	  Filters), formally known as eBPF, a new feature that was
> +	  first added to Linux 3.15. Much of what BCC uses requires
> +	  Linux 4.1 and above.
> +
> +	  Note: Before using bcc, you need either need to :
> +	  - For kernel_ver = [4.1, 5.2) : Copy kernel source code
> +	  to target folder /lib/module/<kernel_ver>/build.
> +	  - Or kernel_ver >= 5.2 : Compile kernel with CONFIG_IKHEADERS
> +	  and use generated headers under /sys/kernel/kheaders.tar.xz
> +	  to populate /lib/module/<kernel_ver>/build.
> +
> +	  That's because the clang frontend build eBPF code at runtime.
> +
> +	  https://github.com/iovisor/bcc
> +
> +comment "bcc needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL

I must remove this to compile this patch. This hard dependency is not required
IMHO. You can still auto fix up the kernel if you like if the user is building
the kernel and has enabled BCC. Just keep in mind it's a fast moving target, so
the set of configs might require a bit of maintenance. Given it's all
documented in BCC website, I personally think it's better to leave correct
kernel configuration to the user to follow the right instructions from BCC
website rather than automatically handle it for them.

> +
> +comment "bcc needs a glibc toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> +	depends on BR2_LINUX_KERNEL
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
> new file mode 100644
> index 0000000..e3fa662
> --- /dev/null
> +++ b/package/bcc/bcc.hash
> @@ -0,0 +1,3 @@
> +# locally calculated
> +sha256 38105c6c7e53d6a8d4c2be5c2e6dd46ebeaa1489600501711d85cfe9bc065e9d  bcc-v0.16.0.tar.gz
> +sha256 b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
> diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
> new file mode 100644
> index 0000000..4fe69cb
> --- /dev/null
> +++ b/package/bcc/bcc.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# bcc
> +#
> +################################################################################
> +
> +BCC_VERSION = v0.16.0
> +BCC_SITE = https://github.com/iovisor/bcc.git
> +BCC_SITE_METHOD = git
> +BCC_GIT_SUBMODULES = YES
> +BCC_LICENSE = Apache-2.0
> +BCC_LICENSE_FILES = LICENSE.txt
> +# libbcc.so and libbpf.so
> +BCC_INSTALL_STAGING = YES
> +BCC_DEPENDENCIES = host-bison host-flex host-luajit clang elfutils flex llvm \
> +		   luajit python3
> +
> +# ENABLE_LLVM_SHARED=ON to use llvm.so.
> +# Force REVISION otherwise bcc will use git describe to generate a version number.
> +BCC_CONF_OPTS = -DENABLE_LLVM_SHARED=ON \
> +	-DREVISION=$(BCC_VERSION) \
> +	-DENABLE_CLANG_JIT=ON \
> +	-DENABLE_MAN=OFF
> +
> +# BCC requires python-bcc (shiped under bcc/src/python) to work.
> +# However, BCC compiles bcc/src/python/setup.py.in into bcc/src/python.
> +# The generated compiled folder (bcc/src/python/bcc-python/bcc) should
> +# be copied to target python's site-packages directory.
> +define BCC_INSTALL_PYTHON_BCC
> +	cp -r $(BUILD_DIR)/bcc-$(BCC_VERSION)/src/python/bcc-python/bcc \
> +	$(TARGET_DIR)/usr/lib/python3.*/site-packages/
> +endef
> +BCC_POST_INSTALL_TARGET_HOOKS += BCC_INSTALL_PYTHON_BCC

I think you're hitting a bug in BCC build system which causes the package to be
installed in the wrong location on the target.

Does the attached patch help?

> +
> +define BCC_LINUX_CONFIG_FIXUPS
> +	# Enable kernel support for eBPF
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CLS_BPF)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_BPF)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_JIT)
> +	# [for Linux kernel versions 4.1 through 4.6]
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_BPF_JIT)
> +	# [for Linux kernel versions 4.7 and later]
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_EBPF_JIT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_EVENTS)
> +	# [for Linux kernel versions 5.2 and later]
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_IKHEADERS)
> +	# For running bcc networking examples on vanilla kernel
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCH_SFQ)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_POLICE)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_GACT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_DUMMY)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_VXLAN)
> +endef

This will be a big maintenance headache. New dependency can come up and configs
like CONFIG_NET_* are not essential and seem to be specific to your usage.

I'm not in favour of them personally, but if you want them the list need to
shrink to the bare minimum and depend on user building the kernel in buildroot
IMO.

Thanks!

--
Qais Yousef

> +
> +$(eval $(cmake-package))
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0005-fix-python-installation-path.patch
Type: text/x-diff
Size: 531 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201004/d99fa0bb/attachment.patch>
