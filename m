From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 May 2021 22:35:37 +0200
Subject: [Buildroot] [PATCHv6 2/5] package/bcc: new package
In-Reply-To: <20201220151203.2206747-2-romain.naour@gmail.com>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
 <20201220151203.2206747-2-romain.naour@gmail.com>
Message-ID: <f8632936-986c-6c2e-3b40-b40c71cecd6c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I still have comments and it's a bit too much to fix up while applying :-(

On 20/12/2020 16:12, Romain Naour wrote:
> From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
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
> https://ebpf.io/
> 
> BCC can be tested on the target :
> $ mount -t debugfs none /sys/kernel/debug
> $ cd /usr/share/bcc/tools
> $ ./execsnoop

 It would be nice to create a runtime test that does exactly this!

> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Tested-by: Qais Yousef <qais.yousef@arm.com>
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---
> v6
> - Add missing python patch from Qais
> - remove luajit patch since the luajit support is explicitely disabled
> - keep tested-by from Qais since he tested bcc (but not the luajit support)
> - drop the reviewed-by due to luajit and python changes
> - Add Romain in DEVELOPERS file
> 
> v5
> - Add a patch to disable luajit support
> - remove iperf3, netperf, audit optional runtime dependencies (Qais)
> 
> v4
> - Bump to version 0.17.0.
> - Remove kernel dependency (Qais)
> - Remove optional kernel option handling (Quais)
> - Update ebpf url (Quais)
> - Fix tools path in the commit log (Quais)
> - Add full tar dependency (used to extract the kernel sources from IKHEADERS module) (Quais)
> - Make luajit optional dependeny (Quais)
> - Remove python module install hook (Quais)
> - Keep BCC_LINUX_CONFIG_FIXUPS but only for kernel built by Buildroot.
> 
> V3
> - Bump to version 0.16.0.
> - Add required python dependency.
> - Remove unnecessary and duplicated
>   kernel flags (#Testing section) in bcc.mk.
> 
> V2
> - Add eBPF's required Kernel flags.
> - Fix submodule source fetch problem.
> - Add toolchain dependency.
> ---
>  DEVELOPERS                                    |  2 +
>  package/Config.in                             |  1 +
>  ...-an-option-to-disable-luajit-support.patch | 45 +++++++++++++++++++
>  ...sts.txt-Fix-python-installation-path.patch | 34 ++++++++++++++
>  package/bcc/Config.in                         | 39 ++++++++++++++++
>  package/bcc/bcc.hash                          |  3 ++
>  package/bcc/bcc.mk                            | 43 ++++++++++++++++++
>  7 files changed, 167 insertions(+)
>  create mode 100644 package/bcc/0001-CMake-add-an-option-to-disable-luajit-support.patch
>  create mode 100644 package/bcc/0002-python-CMakeLists.txt-Fix-python-installation-path.patch
>  create mode 100644 package/bcc/Config.in
>  create mode 100644 package/bcc/bcc.hash
>  create mode 100644 package/bcc/bcc.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9406f30cd5..681c4e18db 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1392,6 +1392,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
>  F:	package/qt5/qt5wayland/
>  
>  N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> +F:	package/bcc/
>  F:	package/python-aiofiles/
>  F:	package/python-crayons/
>  F:	package/python-cycler/
> @@ -2233,6 +2234,7 @@ F:	board/qemu/
>  F:	configs/qemu_*
>  F:	package/alure/
>  F:	package/aubio/
> +F:	package/bcc/
>  F:	package/binutils/
>  F:	package/bullet/
>  F:	package/clang/
> diff --git a/package/Config.in b/package/Config.in
> index dc7139a49a..c04392126c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -83,6 +83,7 @@ endmenu
>  
>  menu "Debugging, profiling and benchmark"
>  	source "package/babeltrace2/Config.in"
> +	source "package/bcc/Config.in"
>  	source "package/blktrace/Config.in"
>  	source "package/bonnie/Config.in"
>  	source "package/cache-calibrator/Config.in"
> diff --git a/package/bcc/0001-CMake-add-an-option-to-disable-luajit-support.patch b/package/bcc/0001-CMake-add-an-option-to-disable-luajit-support.patch
> new file mode 100644
> index 0000000000..93d3e16a7f
> --- /dev/null
> +++ b/package/bcc/0001-CMake-add-an-option-to-disable-luajit-support.patch
> @@ -0,0 +1,45 @@
> +From b61c5eb0b2c385a6d3bbabf2396cb363588b32ab Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sun, 6 Dec 2020 17:15:25 +0100
> +Subject: [PATCH] CMake: add an option to disable luajit support
> +
> +bcc luajit support is optional and should be disabled
> +when luajit is not available.
> +
> +This option allow to explicitely disable luajit when
> +cross-compiling.
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>

 Was this patch sent upstream?

> +---
> + CMakeLists.txt     | 2 ++
> + src/CMakeLists.txt | 2 ++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 74fe4f19..c87b28c4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -40,6 +40,8 @@ option(ENABLE_LLVM_SHARED "Enable linking LLVM as a shared library" OFF)
> + option(ENABLE_CLANG_JIT "Enable Loading BPF through Clang Frontend" ON)
> + option(ENABLE_USDT "Enable User-level Statically Defined Tracing" ON)
> + option(ENABLE_MAN "Build man pages" ON)
> ++cmake_dependent_option(ENABLE_LUAJIT "Use Luajit" ON "ENABLE_CLANG_JIT" OFF)
> ++
> + CMAKE_DEPENDENT_OPTION(ENABLE_CPP_API "Enable C++ API" ON "ENABLE_USDT" OFF)
> + 
> + set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 37b7e289..78c5fe58 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -17,5 +17,7 @@ add_subdirectory(cc)
> + endif()
> + if(ENABLE_CLANG_JIT)
> + add_subdirectory(python)
> ++if(ENABLE_LUAJIT)
> + add_subdirectory(lua)
> + endif()
> ++endif()> +--
> +2.25.4
> +
> diff --git a/package/bcc/0002-python-CMakeLists.txt-Fix-python-installation-path.patch b/package/bcc/0002-python-CMakeLists.txt-Fix-python-installation-path.patch
> new file mode 100644
> index 0000000000..507a5aced7
> --- /dev/null
> +++ b/package/bcc/0002-python-CMakeLists.txt-Fix-python-installation-path.patch
> @@ -0,0 +1,34 @@
> +From 15d8445905b6023eb369083392dd1018d31e9664 Mon Sep 17 00:00:00 2001
> +From: Qais Yousef <qais.yousef@arm.com>
> +Date: Fri, 18 Dec 2020 16:36:15 +0000
> +Subject: [PATCH] python/CMakeLists.txt: Fix python installation path
> +
> +The check for /etc/debian_version is unfriendly to cross build
> +environment like buildroot. It tries to identify the distro of the host,
> +but since we're in cross build environment this obviously breaks.
> +
> +Remove this check for now.
> +
> +Signed-off-by: Qais Yousef <qais.yousef@arm.com>

 Was this patch sent upstream? Or was an issue created?

> +---
> + src/python/CMakeLists.txt | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
> +index fa602397..797e0d14 100644
> +--- a/src/python/CMakeLists.txt
> ++++ b/src/python/CMakeLists.txt
> +@@ -5,10 +5,6 @@ if(NOT PYTHON_CMD)
> +   set(PYTHON_CMD "python")
> + endif()
> + 
> +-if(EXISTS "/etc/debian_version")
> +-  set(PYTHON_FLAGS "${PYTHON_FLAGS} --install-layout deb")
> +-endif()
> +-
> + file(GLOB_RECURSE PYTHON_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
> +   ${CMAKE_CURRENT_SOURCE_DIR}/*.py)
> + file(GLOB_RECURSE PYTHON_INCLUDES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
> +-- 
> +2.25.1
> +
> diff --git a/package/bcc/Config.in b/package/bcc/Config.in
> new file mode 100644
> index 0000000000..087d0cb932
> --- /dev/null
> +++ b/package/bcc/Config.in
> @@ -0,0 +1,39 @@
> +config BR2_PACKAGE_BCC
> +	bool "bcc"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # hardcode GNU tuple (x86_64-unknown-linux-gnu)
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # clang
> +	depends on BR2_INSTALL_LIBSTDCPP # clang
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # to select tar package

 Busybox tar is not sufficient? Why not? Is it for xz support?

> +	select BR2_PACKAGE_CLANG

 You didn't propagate

         depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future

> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_FLEX # needs FlexLexer.h
> +	select BR2_PACKAGE_LLVM_BPF

 This looks weird because it depends on LLVM. It's implicit through clang, of
course, but still I think we should have select BR2_PACKAGE_LLVM as well.


> +	select BR2_PACKAGE_PYTHON3

 Isn't python optional on ENABLE_CLANG_JIT?

 You didn't propagate python3's dependencies. Most are implied by glibc, but the
glibc constraint may go away in the future, and it does not include the MMU
dependency.

> +	select BR2_PACKAGE_TAR # Decompress kernel headers required by BCC

 Isn't this a runtime dependency? tar doesn't install to staging so it's
unlikely to be a build-time dependency.

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
                                            builds

> +
> +	  https://github.com/iovisor/bcc
> +	  http://www.ebpf.io
> +
> +comment "bcc needs a glibc toolchain, C++, gcc >= 4.8, host gcc >= 4.8"

 There's no host gcc dependency...

> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
> new file mode 100644
> index 0000000000..a9ca0a36cd
> --- /dev/null
> +++ b/package/bcc/bcc.hash
> @@ -0,0 +1,3 @@
> +# locally calculated
> +sha256  7a3ef28a493dcd7ee0797ebca8f13b30ffca08efc93ff73ff8fa9ba0234d7947  bcc-v0.17.0.tar.gz
> +sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
> diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
> new file mode 100644
> index 0000000000..bafa9e2096
> --- /dev/null
> +++ b/package/bcc/bcc.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# bcc
> +#
> +################################################################################
> +
> +BCC_VERSION = v0.17.0
> +BCC_SITE = https://github.com/iovisor/bcc.git
> +BCC_SITE_METHOD = git
> +BCC_GIT_SUBMODULES = YES

 Can't the tarball be used?

https://github.com/iovisor/bcc/releases/download/v0.17.0/bcc-src-with-submodule.tar.gz


> +BCC_LICENSE = Apache-2.0
> +BCC_LICENSE_FILES = LICENSE.txt
> +# libbcc.so and libbcc_bpf.so

 This comment is not very useful - you'd normally put that in the commit message.

 However, if it's just .so files, then that's normally not a reason to install
it in staging. Staging is for when another package can have a build-time
dependency on it. Typically, that implies headers as well as a library.

> +BCC_INSTALL_STAGING = YES
> +BCC_DEPENDENCIES = host-bison host-flex clang elfutils flex llvm python3 tar

 So I'm surprised to see tar here.


> +
> +# ENABLE_LLVM_SHARED=ON to use llvm.so.
> +# Force REVISION otherwise bcc will use git describe to generate a version number.
> +BCC_CONF_OPTS = -DENABLE_LLVM_SHARED=ON \

 If the line is split, prefer to do it like this:

BCC_CONF_OPTS = \
	-DENABLE_LLVM_SHARED=ON \



 Regards,
 Arnout

> +	-DREVISION=$(BCC_VERSION) \
> +	-DENABLE_CLANG_JIT=ON \
> +	-DENABLE_MAN=OFF \
> +	-DENABLE_LUAJIT=OFF
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
> +	# bcc needs debugfs at runtime
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS)
> +endef
> +
> +$(eval $(cmake-package))
> 
