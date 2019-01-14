From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 14 Jan 2019 14:43:58 -0600
Subject: [Buildroot] [PATCH 2/2] package/bcc: new package
In-Reply-To: <20190113212118.14512-2-romain.naour@gmail.com>
References: <20190113212118.14512-1-romain.naour@gmail.com>
 <20190113212118.14512-2-romain.naour@gmail.com>
Message-ID: <CANQCQpbETXs2W10sKBkJtqzcs1trhCSLf+1x7C7eOQW+TZMaSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,


On Sun, Jan 13, 2019 at 3:21 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> From: Romain Naour <romain.naour@smile.fr>
>
> Before using bcc, you need to copy the kernel source code to
> "/lib/module/<kernel version>/build" on the target.
> That's because the clang frontend build eBPF code at runtime.
>
> There are some issues with this frontend due to the hardcoded
> architecture support and the use of GNU tuple (x86_64-unknown-linux-gnu).
> That's why the bcc package dependency is limited to Glibc toolchain.
>
> bcc needs tracing support, at least CONFIG_KPROBES, CONFIG_BPFILTER
> and CONFIG_BPF_JIT. See [1] for details.
>
> bcc needs BPF target support in llvm libraries.
> Add a patch disabling man pages.
>
> [1] https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
> The needs of kernel sources on the target is anoying for small devices.
> At least, I'm able to complete the bcc tutorial [1] on my x86_64 target.

Suggest updating LINUX_KCONFIG_FIXUP_CMDS to include enabling of the
BPF features when this package is selected.

>
> [1] https://github.com/iovisor/bcc/blob/master/docs/tutorial.md
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  ...CMake-Allow-to-disable-building-man-pages.patch | 35 +++++++++++++++
>  package/bcc/Config.in                              | 50 ++++++++++++++++++++++
>  package/bcc/bcc.hash                               |  3 ++
>  package/bcc/bcc.mk                                 | 23 ++++++++++
>  6 files changed, 113 insertions(+)
>  create mode 100644 package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
>  create mode 100644 package/bcc/Config.in
>  create mode 100644 package/bcc/bcc.hash
>  create mode 100644 package/bcc/bcc.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0d4c4f1d60..f5dc078c69 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1831,6 +1831,7 @@ F:        package/vnstat/
>
>  N:     Romain Naour <romain.naour@gmail.com>
>  F:     package/aubio/
> +F:     package/bcc/
>  F:     package/bullet/
>  F:     package/darktable/
>  F:     package/efl/
> diff --git a/package/Config.in b/package/Config.in
> index 8d05303472..434427f455 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -79,6 +79,7 @@ menu "Compressors and decompressors"
>  endmenu
>
>  menu "Debugging, profiling and benchmark"
> +       source "package/bcc/Config.in"
>         source "package/blktrace/Config.in"
>         source "package/bonnie/Config.in"
>         source "package/cache-calibrator/Config.in"
> diff --git a/package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch b/package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
> new file mode 100644
> index 0000000000..c5c87d52e9
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
> + CMakeLists.txt | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index bb3f53b9..5e95d555 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -19,6 +19,7 @@ include(cmake/FindCompilerFlag.cmake)
> + option(ENABLE_LLVM_SHARED "Enable linking LLVM as a shared library" OFF)
> + option(ENABLE_CLANG_JIT "Enable Loading BPF through Clang Frontend" ON)
> + option(ENABLE_USDT "Enable User-level Statically Defined Tracing" ON)
> ++option(ENABLE_MAN "Build man pages" ON)
> + CMAKE_DEPENDENT_OPTION(ENABLE_CPP_API "Enable C++ API" ON "ENABLE_USDT" OFF)
> +
> + set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
> +@@ -88,7 +89,9 @@ add_subdirectory(src)
> + add_subdirectory(introspection)
> + if(ENABLE_CLANG_JIT)
> + add_subdirectory(examples)
> ++if(ENABLE_MAN)
> + add_subdirectory(man)
> ++endif(ENABLE_MAN)
> + add_subdirectory(tests)
> + add_subdirectory(tools)
> + endif(ENABLE_CLANG_JIT)
> +--
> +2.14.5
> +
> diff --git a/package/bcc/Config.in b/package/bcc/Config.in
> new file mode 100644
> index 0000000000..7bc681e639
> --- /dev/null
> +++ b/package/bcc/Config.in
> @@ -0,0 +1,50 @@
> +config BR2_PACKAGE_BCC
> +       bool "bcc"
> +       depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +       depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> +       depends on BR2_TOOLCHAIN_USES_GLIBC # hardcode GNU tuple (x86_64-unknown-linux-gnu)
> +       depends on BR2_LINUX_KERNEL # needs kernel sources on the target
> +       depends on BR2_HOST_GCC_AT_LEAST_4_8 # clang
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # clang
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # clang
> +       depends on BR2_INSTALL_LIBSTDCPP # clang
> +       depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # clang
> +       depends on !BR2_STATIC_LIBS # clang, luajit
> +       depends on BR2_USE_WCHAR # clang
> +       select BR2_PACKAGE_CLANG
> +       select BR2_PACKAGE_ELFUTILS
> +       select BR2_PACKAGE_FLEX # needs FlexLexer.h
> +       select BR2_PACKAGE_LLVM_BPF
> +       select BR2_PACKAGE_LUAJIT
> +       help
> +         BPF Compiler Collection (BCC)
> +
> +         BCC is a toolkit for creating efficient kernel tracing and
> +         manipulation programs, and includes several useful tools and
> +         examples. It makes use of extended BPF (Berkeley Packet
> +         Filters), formally known as eBPF, a new feature that was
> +         first added to Linux 3.15. Much of what BCC uses requires
> +         Linux 4.1 and above.
> +
> +         Note: Before using bcc, you need to copy the kernel source
> +         code to the target. By default bcc use:
> +         "/lib/module/<kernel version>/build". That's because the
> +         clang frontend build eBPF code at runtime.

Very interesting patch and package.  Thanks for sending it in.  I know
I've added it to my list to tinker with.

Matt
