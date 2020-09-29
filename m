From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 29 Sep 2020 22:55:36 +0200
Subject: [Buildroot] [RFC PATCH 3/4] Add bpftrace package
In-Reply-To: <20200929102618.28571-4-qais.yousef@arm.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
 <20200929102618.28571-4-qais.yousef@arm.com>
Message-ID: <b9399296-4cf8-4fc8-81e7-a49472c3cd69@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Qais,

Le 29/09/2020 ? 12:26, Qais Yousef a ?crit?:
> bpftrace is a high-level tracing language for Linux enhanced Berkeley
> Packet Filter (eBPF) available in recent Linux kernels (4.x).
> 
> Only tested on x86_64 and aarch64. The package doesn't support i386 and
> aarch32.

This is new, we didn't worked on bpftrace yet.

> 
> Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> ---
>  package/Config.in                             |  1 +
>  .../0001-fix-no-sys-auxv-header.patch         | 22 +++++++++++++++
>  ...02-fix-missing-def-ADDR_NO_RANDOMIZE.patch | 13 +++++++++
>  package/bpftrace/0003-install-libparser.patch | 12 +++++++++
>  .../bpftrace/0004-install-libresources.patch  | 12 +++++++++
>  package/bpftrace/0005-install-libarch.patch   | 10 +++++++
>  package/bpftrace/0006-install-libast.patch    | 11 ++++++++
>  package/bpftrace/Config.in                    | 27 +++++++++++++++++++
>  package/bpftrace/bpftrace.mk                  | 17 ++++++++++++
>  9 files changed, 125 insertions(+)
>  create mode 100644 package/bpftrace/0001-fix-no-sys-auxv-header.patch
>  create mode 100644 package/bpftrace/0002-fix-missing-def-ADDR_NO_RANDOMIZE.patch
>  create mode 100644 package/bpftrace/0003-install-libparser.patch
>  create mode 100644 package/bpftrace/0004-install-libresources.patch
>  create mode 100644 package/bpftrace/0005-install-libarch.patch
>  create mode 100644 package/bpftrace/0006-install-libast.patch
>  create mode 100644 package/bpftrace/Config.in
>  create mode 100644 package/bpftrace/bpftrace.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 03ed3e5874..c7e352be82 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -86,6 +86,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/blktrace/Config.in"
>  	source "package/bcc/Config.in"
>  	source "package/bonnie/Config.in"
> +	source "package/bpftrace/Config.in"
>  	source "package/cache-calibrator/Config.in"
>  	source "package/clinfo/Config.in"
>  	source "package/dacapo/Config.in"
> diff --git a/package/bpftrace/0001-fix-no-sys-auxv-header.patch b/package/bpftrace/0001-fix-no-sys-auxv-header.patch
> new file mode 100644
> index 0000000000..c89fbe51ee
> --- /dev/null
> +++ b/package/bpftrace/0001-fix-no-sys-auxv-header.patch
> @@ -0,0 +1,22 @@
> +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> +
> +--- ./src/attached_probe.cpp.old	2020-07-28 13:23:20.599528129 +0100
> ++++ ./src/attached_probe.cpp	2020-07-28 13:23:49.199715578 +0100
> +@@ -8,7 +8,7 @@
> + #include <linux/limits.h>
> + #include <linux/perf_event.h>
> + #include <regex>
> +-#include <sys/auxv.h>
> ++//#include <sys/auxv.h>

Why?

> + #include <sys/utsname.h>
> + #include <tuple>
> + #include <unistd.h>
> +@@ -612,7 +612,7 @@
> +       // the build-time constant if unavailable. This always matches the
> +       // running kernel, but is not supported on arm32.
> +       unsigned code = 0;
> +-      unsigned long base = getauxval(AT_SYSINFO_EHDR);
> ++      unsigned long base = 0; //getauxval(AT_SYSINFO_EHDR);

Why?

> +       if (base && !memcmp(reinterpret_cast<void *>(base), ELFMAG, 4))
> +         code = _find_version_note(base);
> +       if (! code)
> diff --git a/package/bpftrace/0002-fix-missing-def-ADDR_NO_RANDOMIZE.patch b/package/bpftrace/0002-fix-missing-def-ADDR_NO_RANDOMIZE.patch
> new file mode 100644
> index 0000000000..0481348068
> --- /dev/null
> +++ b/package/bpftrace/0002-fix-missing-def-ADDR_NO_RANDOMIZE.patch
> @@ -0,0 +1,13 @@
> +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> +
> +--- ./src/bpftrace.cpp.old	2020-07-28 13:24:42.322117517 +0100
> ++++ ./src/bpftrace.cpp	2020-07-28 13:25:08.651880968 +0100
> +@@ -37,6 +37,8 @@
> + #include "triggers.h"
> + #include "utils.h"
> + 
> ++#define ADDR_NO_RANDOMIZE	0x0040000

This define come from the kernel source (include/uapi/linux/personality.h)

> ++
> + namespace libbpf {
> + #define __BPF_NAME_FN(x) #x
> + const char *bpf_func_name[] = { __BPF_FUNC_MAPPER(__BPF_NAME_FN) };
> diff --git a/package/bpftrace/0003-install-libparser.patch b/package/bpftrace/0003-install-libparser.patch
> new file mode 100644
> index 0000000000..9cf368cb7a
> --- /dev/null
> +++ b/package/bpftrace/0003-install-libparser.patch
> @@ -0,0 +1,12 @@
> +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> +
> +--- ./CMakeLists.txt.old	2020-07-28 23:08:33.068910392 +0100
> ++++ ./CMakeLists.txt	2020-07-28 23:08:41.529166766 +0100
> +@@ -94,6 +94,7 @@
> + add_library(parser ${BISON_bison_parser_OUTPUTS} ${FLEX_flex_lexer_OUTPUTS})
> + target_compile_options(parser PRIVATE "-w")
> + target_include_directories(parser PUBLIC src src/ast ${CMAKE_BINARY_DIR})
> ++install(TARGETS parser LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

Maybe libparser should be forced to build as a static library by bpftrace and
not installed.

> + 
> + include(CheckSymbolExists)
> + set(CMAKE_REQUIRED_DEFINITIONS -D_GNU_SOURCE)
> diff --git a/package/bpftrace/0004-install-libresources.patch b/package/bpftrace/0004-install-libresources.patch
> new file mode 100644
> index 0000000000..4c1902e2b3
> --- /dev/null
> +++ b/package/bpftrace/0004-install-libresources.patch
> @@ -0,0 +1,12 @@
> +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> +
> +--- ./resources/CMakeLists.txt.old	2020-07-28 23:08:53.037515482 +0100
> ++++ ./resources/CMakeLists.txt	2020-07-28 23:09:24.934482032 +0100
> +@@ -1,6 +1,7 @@
> + add_library(resources headers.cpp)
> + 
> + target_include_directories(resources PUBLIC ../src)
> ++install(TARGETS resources LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

same for libresources.

> + 
> + function(embed_headers output)
> +   file(WRITE ${output} "#include \"headers.h\"\n\nnamespace bpftrace {\n")
> diff --git a/package/bpftrace/0005-install-libarch.patch b/package/bpftrace/0005-install-libarch.patch
> new file mode 100644
> index 0000000000..04812ff313
> --- /dev/null
> +++ b/package/bpftrace/0005-install-libarch.patch
> @@ -0,0 +1,10 @@
> +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> +
> +--- ./src/arch/CMakeLists.txt.old	2020-07-28 23:01:18.283735497 +0100
> ++++ ./src/arch/CMakeLists.txt	2020-07-28 23:02:13.865419746 +0100
> +@@ -11,3 +11,5 @@
> + else()
> +   message(FATAL_ERROR "Unsupported architecture: ${CMAKE_SYSTEM_PROCESSOR}")
> + endif()
> ++
> ++install(TARGETS arch LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

same for libarch.

> diff --git a/package/bpftrace/0006-install-libast.patch b/package/bpftrace/0006-install-libast.patch
> new file mode 100644
> index 0000000000..c84991d360
> --- /dev/null
> +++ b/package/bpftrace/0006-install-libast.patch
> @@ -0,0 +1,11 @@
> +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> +
> +--- ./src/ast/CMakeLists.txt.old	2020-07-28 23:00:16.837873565 +0100
> ++++ ./src/ast/CMakeLists.txt	2020-07-28 23:04:08.320887977 +0100
> +@@ -67,4 +67,6 @@
> +     target_link_libraries(ast ${llvm_libs})
> +   endif()
> +   target_link_libraries(ast libclang)
> ++
> ++  install(TARGETS ast LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

same for libast.

> + endif()
> diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
> new file mode 100644
> index 0000000000..a4bae478dc
> --- /dev/null
> +++ b/package/bpftrace/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_BPFTRACE
> +	bool "bpftrace"
> +	depends on BR2_aarch64 || BR2_aarch64_be || BR2_x86_64
> +	depends on BR2_PACKAGE_BCC
> +	depends on BR2_PACKAGE_LLVM_RTTI

Why llvm rtti is needed ?

> +	help
> +	  BPFTrace
> +
> +	  bpftrace is a high-level tracing language for Linux enhanced
> +	  Berkeley Packet Filter (eBPF) available in recent Linux
> +	  kernels (4.x).
> +
> +	  bpftrace uses LLVM as a backend to compile scripts to
> +	  BPF-bytecode and makes use of BCC for interacting with the
> +	  Linux BPF system, as well as existing Linux tracing
> +	  capabilities: kernel dynamic tracing (kprobes), user-level
> +	  dynamic tracing (uprobes), and tracepoints. The bpftrace
> +	  language is inspired by awk and C, and predecessor tracers
> +	  such as DTrace and SystemTap.
> +
> +	  https://www.github.com/iovisor/bpftrace
> +
> +comment "bpftrace supported on aarch64 and x86_64"
> +	depends on !(BR2_aarch64 || BR2_aarch64_be || BR2_x86_64)
> +
> +comment "bpftrace needs bcc, llvm-rtti"
> +	depends on !BR2_PACKAGE_BCC || !BR2_PACKAGE_LLVM_RTTI
> diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
> new file mode 100644
> index 0000000000..d5975618f1
> --- /dev/null
> +++ b/package/bpftrace/bpftrace.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# BPFTrace
> +#
> +################################################################################
> +
> +BPFTRACE_VERSION = v0.11.0
> +BPFTRACE_SITE = https://github.com/iovisor/bpftrace
> +BPFTRACE_SITE_METHOD = git
> +BPFTRACE_LICENSE = Apache-2.0
> +BPFTRACE_LICENSE_FILES = LICENSE
> +BPFTRACE_INSTALL_STAGING = YES

If no library is installed by bpftrace, we can remove this line.

> +BPFTRACE_DEPENDENCIES = bcc
> +
> +BPFTRACE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

Usually the CMAKE_BUILD_TYPE is handled by the Buildroot package infra.
There are some exceptions like for llvm/clang where the build blowup with  -
-DCMAKE_BUILD_TYPE=Debug...

The bpftrace.hash file is missing, see
http://nightly.buildroot.org/manual.html#adding-packages-hash

I forgot to mention the DEVELOPERS file entry in my previous review:
http://nightly.buildroot.org/manual.html#DEVELOPERS

You need to add you as developer of bpftrace package.
Feel free to add you to other packages such bcc.

Best regards,
Romain


> +
> +$(eval $(cmake-package))
> 
