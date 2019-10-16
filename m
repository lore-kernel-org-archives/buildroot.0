From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 17 Oct 2019 00:26:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix static build
 with lts-musl
In-Reply-To: <20191014224947.258f834d@windsurf.home>
References: <20191014165335.4884-1-fontaine.fabrice@gmail.com>
 <20191014224947.258f834d@windsurf.home>
Message-ID: <20191016222624.GA20069@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> +Petr Vorel in Cc.
Thanks!

> On Mon, 14 Oct 2019 18:53:35 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Fixes:
> >  - http://autobuild.buildroot.org/results/9155326e1ff7c2bb2218122c453872c2fc76f65e

> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

> So essentially the problem here is that libcpu_set.a uses some FTS
> functions, but -lfts appears *before* -lcpu_set in the link command
> line.
But in the patch bellow -lfts is behind -lcpu_set:
+-LDLIBS			+= -lcpu_set -lcontrollers -lltp
++LDLIBS			+= -lcpu_set -lcontrollers -lltp $(FTS_LIBS)

I see it when I compile it for musl with ./utils/test-pkg (together with my
patch [1]) it works:

/br-test-pkg/br-x86-64-musl/host/bin/x86_64-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -I/br-test-pkg/br-x86-64-musl/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/include/tirpc  -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FORTIFY_SOURCE=2 -I../../../../../include -I../../../../../include -I../../../../../include/old/   -L/br-test-pkg/br-x86-64-musl/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_syscall_test/../cpuset_lib -L/br-test-pkg/br-x86-64-musl/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_syscall_test/../../libcontrollers -L../../../../../lib  cpuset_syscall_test.c  -L/br-test-pkg/br-x86-64-musl/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib -ltirpc  -lltp -lcpu_set -lcontrollers -lltp -lfts  -o cpuset_syscall_test

But musl is not static. So trying br-arm-full-static (support/config-fragments/autobuild/br-arm-full-static.config,x86_64 from toolchain-configs.csv) and indeed it fails:

/br-test-pkg/br-arm-full-static/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -static -I/br-test-pkg/br-arm-full-static/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/tirpc  -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FORTIFY_SOURCE=2 -I../../../../../include -I../../../../../include -I../../../../../include/old/ -static  -L/br-test-pkg/br-arm-full-static/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_syscall_test/../cpuset_lib -L/br-test-pkg/br-arm-full-static/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_syscall_test/../../libcontrollers -L../../../../../lib  cpuset_syscall_test.c  -L/br-test-pkg/br-arm-full-static/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -ltirpc -lpthread  -lfts -lltp -lcpu_set -lcontrollers -lltp  -o cpuset_syscall_test
...
/br-test-pkg/br-arm-full-static/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -static -I/br-test-pkg/br-arm-full-static/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/tirpc  -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FORTIFY_SOURCE=2 -I../../../../../include -I../../../../../include -I../../../../../include/old/ -static  -L/br-test-pkg/br-arm-full-static/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_memory_test/../cpuset_lib -L/br-test-pkg/br-arm-full-static/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_memory_test/../../libcontrollers -L../../../../../lib  cpuset_memory_test.c  -L/br-test-pkg/br-arm-full-static/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -ltirpc -lpthread  -lfts -lltp -lcpu_set -lcontrollers -lltp -lpthread -o cpuset_memory_test
/br-test-pkg/br-arm-full-static/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /br-test-pkg/br-arm-full-static/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_memory_test/../cpuset_lib/libcpu_set.a(libcpuset.o): in function `cpuset_fts_open':
/br-test-pkg/br-arm-full-static/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3214: undefined reference to `fts_open'

Sure, it works with reversed (i.e. correct) order: -lcpu_set -lfts.

> > +diff --git a/testcases/kernel/controllers/cpuset/Makefile.inc b/testcases/kernel/controllers/cpuset/Makefile.inc
> > +index db6a84305..65967c85b 100644
> > +--- a/testcases/kernel/controllers/cpuset/Makefile.inc
> > ++++ b/testcases/kernel/controllers/cpuset/Makefile.inc
> > +@@ -41,7 +41,7 @@ MAKE_DEPS		:= $(LIBCONTROLLERS) $(LIBCPUSET)
> > + 
> > + LDFLAGS			+= -L$(abs_builddir)/$(LIBCPUSET_DIR) -L$(abs_builddir)/$(LIBCONTROLLERS_DIR)
> > + 
> > +-LDLIBS			+= -lcpu_set -lcontrollers -lltp
> > ++LDLIBS			+= -lcpu_set -lcontrollers -lltp $(FTS_LIBS)
> > + 
> > + INSTALL_TARGETS		?= *.sh
> > + 
> > +diff --git a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
> > +index 322d03cac..2f9f93c69 100644
> > +--- a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
> > ++++ b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
> > +@@ -25,7 +25,7 @@ top_srcdir 		?= ../../../../..
> > + 
> > + include $(top_srcdir)/include/mk/testcases.mk
> > + 
> > +-LDLIBS			+= -lm -lcontrollers -lltp
> > ++LDLIBS			+= -lm -lcontrollers -lltp $(FTS_LIBS)
> > + 
> > + LIB			:= libcpu_set.a

> I'd like to have Petr Vorel's opinion here. According to the INSTALL file:

> LDLIBS   - libraries listed after objects during link, e.g. -lc, -lpthread,
>            -lltp.

> So, the libraries in LDLIBS should appear *after* the objects. Which is
> kind of the case, but not for -lcpu_set.

> Petr: is that expected ? What do you suggest ?
To be honest, I don't know, it looks like a bug. There was some change related
I need to to dig a bit more into library Makefiles.
Cyril, do you have any idea?

> For the record: when static linking, the order of -l options is
> important. If a library libA uses a symbol from libB, then -lA must
> appear *before* -lB in the link command line (yes that's counter
> intuitive).

> Best regards,

> Thomas

Kind regards,
Petr
