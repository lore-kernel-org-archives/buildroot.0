From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 17 Oct 2019 09:43:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix static build
 with lts-musl
In-Reply-To: <20191017090518.27cbbe11@windsurf>
References: <20191014165335.4884-1-fontaine.fabrice@gmail.com>
 <20191014224947.258f834d@windsurf.home>
 <20191016222624.GA20069@dell5510>
 <20191017090518.27cbbe11@windsurf>
Message-ID: <20191017074324.GA21117@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  

> > > So essentially the problem here is that libcpu_set.a uses some FTS
> > > functions, but -lfts appears *before* -lcpu_set in the link command
> > > line.  
> > But in the patch bellow -lfts is behind -lcpu_set:
> > +-LDLIBS			+= -lcpu_set -lcontrollers -lltp
> > ++LDLIBS			+= -lcpu_set -lcontrollers -lltp $(FTS_LIBS)

> That's what my point is: without the patch from Fabrice, passing some
> LDLIBS to ltp-testsuite puts those libraries listed in LDLIBS *before*
> the internal ltp-testsuite libraries, which contradicts the
> ltp-testsuite documentation for this LDLIBS variable.

> What Fabrice's patch does is provide a way to give a list of libraries
> that are *really* used after the list of objects/internal libraries.
Thanks for an explanation.

> > /br-test-pkg/br-arm-full-static/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -static -I/br-test-pkg/br-arm-full-static/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/tirpc  -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FORTIFY_SOURCE=2 -I../../../../../include -I../../../../../include -I../../../../../include/old/ -static  -L/br-test-pkg/br-arm-full-static/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_memory_test/../cpuset_lib -L/br-test-pkg/br-arm-full-static/build/ltp-testsuite-20190930/testcases/kernel/controllers/cpuset/cpuset_memory_test/../../libcontrollers -L../../../../../lib  cpuset_memory_test.c  -L/br-test-pkg/br-arm-full-static/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -ltirpc -lpthread  -lfts -lltp -lcpu_set -lcontrollers -lltp -lpthread -o cpuset_memory_test

> See that -lfts is passed, but *before* -lcpu_set ? That's what causes the issue.
Sure.

> > > Petr: is that expected ? What do you suggest ?  
> > To be honest, I don't know, it looks like a bug. There was some change related
> > I need to to dig a bit more into library Makefiles.
> > Cyril, do you have any idea?

> An option would be in the various Makefiles to do:

> LDLIBS := -lrt $(LDLIBS)

> instead of:

> LDLIBS += -lrt

> And similarly for the specific case causing the trouble:

> LDLIBS := -lcpu_set -lcontrollers -lltp $(LDLIBS)
We already use LDLIBS := -lfoo -lbar $(LDLIBS) approach in some Makefiles,
IMHO we could fix it for static build.

> instead of the current:

> LDLIBS += -lcpu_set -lcontrollers -lltp

> Another option is to decide that ltp-testsuite is not available for
> static-only builds.

> Best regards,

> Thomas

Kind regards,
Petr
