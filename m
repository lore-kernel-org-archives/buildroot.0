From: Qais Yousef <qais.yousef@arm.com>
Date: Sat, 3 Oct 2020 21:56:24 +0100
Subject: [Buildroot] [RFC PATCH 3/4] Add bpftrace package
In-Reply-To: <b9399296-4cf8-4fc8-81e7-a49472c3cd69@gmail.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
 <20200929102618.28571-4-qais.yousef@arm.com>
 <b9399296-4cf8-4fc8-81e7-a49472c3cd69@gmail.com>
Message-ID: <20201003205623.2okstxwxa6fk5eqb@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain

On 09/29/20 22:55, Romain Naour wrote:

[...]

> > +--- ./src/attached_probe.cpp.old	2020-07-28 13:23:20.599528129 +0100
> > ++++ ./src/attached_probe.cpp	2020-07-28 13:23:49.199715578 +0100
> > +@@ -8,7 +8,7 @@
> > + #include <linux/limits.h>
> > + #include <linux/perf_event.h>
> > + #include <regex>
> > +-#include <sys/auxv.h>
> > ++//#include <sys/auxv.h>
> 
> Why?

Let me reproduce all these issues again and write a better log and patches.

> 
> > + #include <sys/utsname.h>
> > + #include <tuple>
> > + #include <unistd.h>
> > +@@ -612,7 +612,7 @@
> > +       // the build-time constant if unavailable. This always matches the
> > +       // running kernel, but is not supported on arm32.
> > +       unsigned code = 0;
> > +-      unsigned long base = getauxval(AT_SYSINFO_EHDR);
> > ++      unsigned long base = 0; //getauxval(AT_SYSINFO_EHDR);
> 
> Why?
> 
> > +       if (base && !memcmp(reinterpret_cast<void *>(base), ELFMAG, 4))
> > +         code = _find_version_note(base);
> > +       if (! code)
> > diff --git a/package/bpftrace/0002-fix-missing-def-ADDR_NO_RANDOMIZE.patch b/package/bpftrace/0002-fix-missing-def-ADDR_NO_RANDOMIZE.patch
> > new file mode 100644
> > index 0000000000..0481348068
> > --- /dev/null
> > +++ b/package/bpftrace/0002-fix-missing-def-ADDR_NO_RANDOMIZE.patch
> > @@ -0,0 +1,13 @@
> > +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> > +
> > +--- ./src/bpftrace.cpp.old	2020-07-28 13:24:42.322117517 +0100
> > ++++ ./src/bpftrace.cpp	2020-07-28 13:25:08.651880968 +0100
> > +@@ -37,6 +37,8 @@
> > + #include "triggers.h"
> > + #include "utils.h"
> > + 
> > ++#define ADDR_NO_RANDOMIZE	0x0040000
> 
> This define come from the kernel source (include/uapi/linux/personality.h)

It includes <sys/personality.h>. Maybe because I was building with uClibc first
and it didn't have an updated header. I realized much later when I was getting
weird aarch64 errors that I must switch to glibc for aarch64 at least.

Probably this can be dropped if we depend on glibc all the time.

> 
> > ++
> > + namespace libbpf {
> > + #define __BPF_NAME_FN(x) #x
> > + const char *bpf_func_name[] = { __BPF_FUNC_MAPPER(__BPF_NAME_FN) };
> > diff --git a/package/bpftrace/0003-install-libparser.patch b/package/bpftrace/0003-install-libparser.patch
> > new file mode 100644
> > index 0000000000..9cf368cb7a
> > --- /dev/null
> > +++ b/package/bpftrace/0003-install-libparser.patch
> > @@ -0,0 +1,12 @@
> > +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> > +
> > +--- ./CMakeLists.txt.old	2020-07-28 23:08:33.068910392 +0100
> > ++++ ./CMakeLists.txt	2020-07-28 23:08:41.529166766 +0100
> > +@@ -94,6 +94,7 @@
> > + add_library(parser ${BISON_bison_parser_OUTPUTS} ${FLEX_flex_lexer_OUTPUTS})
> > + target_compile_options(parser PRIVATE "-w")
> > + target_include_directories(parser PUBLIC src src/ast ${CMAKE_BINARY_DIR})
> > ++install(TARGETS parser LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
> 
> Maybe libparser should be forced to build as a static library by bpftrace and
> not installed.

Hmm okay. Let me see if I can do this in a way that is upstreamable.

> > diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
> > new file mode 100644
> > index 0000000000..a4bae478dc
> > --- /dev/null
> > +++ b/package/bpftrace/Config.in
> > @@ -0,0 +1,27 @@
> > +config BR2_PACKAGE_BPFTRACE
> > +	bool "bpftrace"
> > +	depends on BR2_aarch64 || BR2_aarch64_be || BR2_x86_64
> > +	depends on BR2_PACKAGE_BCC
> > +	depends on BR2_PACKAGE_LLVM_RTTI
> 
> Why llvm rtti is needed ?

Good question.

I think I was seeing failures similar to the one described in the link below.
Something wasn't found in LLVM library without enabling this option. Will try
to reproduce and document it better. Unless you know of a better way to handle
these type of problems :-)

	https://github.com/iovisor/bpftrace/issues/1156

> 
> > +	help
> > +	  BPFTrace
> > +
> > +	  bpftrace is a high-level tracing language for Linux enhanced
> > +	  Berkeley Packet Filter (eBPF) available in recent Linux
> > +	  kernels (4.x).
> > +
> > +	  bpftrace uses LLVM as a backend to compile scripts to
> > +	  BPF-bytecode and makes use of BCC for interacting with the
> > +	  Linux BPF system, as well as existing Linux tracing
> > +	  capabilities: kernel dynamic tracing (kprobes), user-level
> > +	  dynamic tracing (uprobes), and tracepoints. The bpftrace
> > +	  language is inspired by awk and C, and predecessor tracers
> > +	  such as DTrace and SystemTap.
> > +
> > +	  https://www.github.com/iovisor/bpftrace
> > +
> > +comment "bpftrace supported on aarch64 and x86_64"
> > +	depends on !(BR2_aarch64 || BR2_aarch64_be || BR2_x86_64)
> > +
> > +comment "bpftrace needs bcc, llvm-rtti"
> > +	depends on !BR2_PACKAGE_BCC || !BR2_PACKAGE_LLVM_RTTI
> > diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
> > new file mode 100644
> > index 0000000000..d5975618f1
> > --- /dev/null
> > +++ b/package/bpftrace/bpftrace.mk
> > @@ -0,0 +1,17 @@
> > +################################################################################
> > +#
> > +# BPFTrace
> > +#
> > +################################################################################
> > +
> > +BPFTRACE_VERSION = v0.11.0
> > +BPFTRACE_SITE = https://github.com/iovisor/bpftrace
> > +BPFTRACE_SITE_METHOD = git
> > +BPFTRACE_LICENSE = Apache-2.0
> > +BPFTRACE_LICENSE_FILES = LICENSE
> > +BPFTRACE_INSTALL_STAGING = YES
> 
> If no library is installed by bpftrace, we can remove this line.

+1

> 
> > +BPFTRACE_DEPENDENCIES = bcc
> > +
> > +BPFTRACE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
> 
> Usually the CMAKE_BUILD_TYPE is handled by the Buildroot package infra.
> There are some exceptions like for llvm/clang where the build blowup with  -
> -DCMAKE_BUILD_TYPE=Debug...

+1

> 
> The bpftrace.hash file is missing, see
> http://nightly.buildroot.org/manual.html#adding-packages-hash
> 
> I forgot to mention the DEVELOPERS file entry in my previous review:
> http://nightly.buildroot.org/manual.html#DEVELOPERS
> 
> You need to add you as developer of bpftrace package.
> Feel free to add you to other packages such bcc.

Cool. Thanks for the review! I will work on all of these items and post an
updated series as soon as it's ready.

Please note I am doing this on evenings and weekends only. So please be patient
with me for any delays in responses or following up. It's just me trying to
find the time to work on this. I certainly intend to follow this through :-)

Thanks!

--
Qais Yousef
