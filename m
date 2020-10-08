From: Qais Yousef <qais.yousef@arm.com>
Date: Thu, 8 Oct 2020 23:31:35 +0100
Subject: [Buildroot] [RFC PATCH 3/4] Add bpftrace package
In-Reply-To: <b9399296-4cf8-4fc8-81e7-a49472c3cd69@gmail.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
 <20200929102618.28571-4-qais.yousef@arm.com>
 <b9399296-4cf8-4fc8-81e7-a49472c3cd69@gmail.com>
Message-ID: <20201008223134.fnrywkmlevsk5be2@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain

On 09/29/20 22:55, Romain Naour wrote:

[...]

> > diff --git a/package/bpftrace/0001-fix-no-sys-auxv-header.patch b/package/bpftrace/0001-fix-no-sys-auxv-header.patch
> > new file mode 100644
> > index 0000000000..c89fbe51ee
> > --- /dev/null
> > +++ b/package/bpftrace/0001-fix-no-sys-auxv-header.patch
> > @@ -0,0 +1,22 @@
> > +Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> > +
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

This ..

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

.. this ..

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

.. and this were caused by using uClibc. With Glibc I can't reproduce them. So
it's just uClibc lacks the new headers and definitions.

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

The below define in bpftrace.mk makes this and the other libs static:

	+BPFTRACE_CONF_OPTS += -DBUILD_SHARED_LIBS:BOOL=OFF

There's a weird requirement for bpftrace to work correctly. It must not be
stripped otherwise it'll lose an important functionality. I found the below
bugzilla which describes the problem:

	https://bugzilla.redhat.com/show_bug.cgi?id=1865787

Is there a way to tell buidlroot not to strip a binary without setting it in
the config? I couldn't find an example in .mk file - but maybe I didn't look
hard enough.

Thanks

--
Qais Yousef
