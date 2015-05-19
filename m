From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 May 2015 10:00:45 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150519063012.E7D2A100C5F@stock.ovh.net>
References: <20150519063012.E7D2A100C5F@stock.ovh.net>
Message-ID: <20150519100045.44f1b3a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This is *really* looking better and better. There are still around 10
days left before the final release, I'm sure we can reach even lower
build failure numbers.

Let's have a look at the build issues from yesterday. Yann, Alexey,
Bartosz, there are some questions/things for you, see below.

On Tue, 19 May 2015 08:30:12 +0200 (CEST), Thomas Petazzoni wrote:

>       xtensa |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/ab1ae40f1862300cd7667b7bd03cc59d7455a769/

Tries to include <dlfcn.h> in a static linking configuration, and
conntrack-tools is using dlopen(), so we should mark this package as
not available for static builds.

>          arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/f5261a0933f9b5449d1f4e5cab1bb02e7154e683/

Does not build in static linking configs, fixed by
http://git.buildroot.net/buildroot/commit/?id=db989f89c9fb1ebc3997d8a3c517948392611d77.

>          arm |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/057499012d6443a736f384fd1d7e283396ab1c2e/

Would be fixed by http://patchwork.ozlabs.org/patch/473622/.

>       xtensa |                        kmod-20 | NOK | http://autobuild.buildroot.net/results/a12744849118fd49b9c811f31919ddb12c1eff29/
>       xtensa |                        kmod-20 | NOK | http://autobuild.buildroot.net/results/5af2245025568af230d682863307236700d0d206/

Those are regressions caused by the revert of the kmod Xtensa
workaround, and the fact that the external toolchain has not been
rebuilt with the latest Xtensa binutils fixes. For now, I've added an
exception in the autobuilder script, I'll rebuild the toolchain later.

>      powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/90d8a0cad1ec56f251970b591e9cdf35e57b35ef/

-- checking for module 'libsigrokcxx>=0.3.0'
--   package 'libsigrokcxx>=0.3.0' not found
CMake Error at /ssd1/thomas/autobuild/instance-0/output/host/usr/share/cmake-3.1/Modules/FindPkgConfig.cmake:340 (message):

Bartosz, since you are the author of the pulseview package, can you
have a look? Thanks!

>          arc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/e781d4ce27ce17067b2e5e298e1e8ba9add41371/

Compiler problem:

/tmp/ccQkdXjH.s: Assembler messages:
/tmp/ccQkdXjH.s: Error: unaligned opcodes detected in executable segment
make[2]: *** [.obj/release-shared-emb-generic/qxquerytokenizer.o] Error 1

Alexey, can you have a look? Thanks!

>        nios2 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/7a478f03e0b38ffdcffa4153c17eef9cc4457b8c/

Compiler error when linking QtGui. I already disabled QtWebkit for this
toolchain recently. Maybe we should simply disable Qt completely with
this toolchain, which seems quite broken. And Qt is quite unlikely to
be used on NIOS II systems. Thoughts?

>      powerpc |                 sqlite-3081000 | NOK | http://autobuild.buildroot.net/results/aed3690689b60844e3278626da3c3eb75f2a2586/

Parallel build issue, Yann already reproduced the issue and was
investigating it yesterday evening, but I'm not sure if he managed to
find a solution.

>          arm |                 sysstat-11.0.4 | NOK | http://autobuild.buildroot.net/results/bea726de24801385f335e02271671e030f857e3e/

Forgets to link against libintl when static linking. Can someone have a
look at this one?

>          arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/0cd5e0263b42e6845504d97688632e16206bd000/

Already fixed by
http://git.buildroot.net/buildroot/commit/?id=be1287e7e5ca2a11cd6dea84ac481d10eaa48edb.

So let's do the overall math, on 11 build failures, we have:

 * 2 build failures already handled by a new exception in the
   autobuilder script.

 * 2 build failures already fixed by committed patches

 * 1 build failure fixed by a proposed patch

 * 2 build failures that look quite easy to solve (conntrack-tools,
   sysstat)

 * 4 that look a bit more complicated (qt, sqlite, pulseview)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
