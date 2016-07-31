From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 10:48:50 +0200
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <20160730232322.4eca1a53@free-electrons.com>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
Message-ID: <20160731084850.GO22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> We've got lots of failures, so your need is definitely needed to fix
> some of them. Waldemar, Maxime (Hadjinlian and Ripard), Olivier
> (Schonken and Singla), Gustavo, Romain, Alexey, Vlad, Yann, Frank,
> Angelo, Fabrice, Bernd, Julien, Dagg, Vicente, Baruch, Peter, please
> look below, there are lots of things for you! :-)
> 
> Thanks for your participation!
> 
> On Sat, 30 Jul 2016 08:30:32 +0200 (CEST), Thomas Petazzoni wrote:
> 
> >         bfin |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/1852c55f115fd16a986b678521da332c8b1b42cd/
> >         bfin |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/d5999ae91a1f4dee3d01a0bbc3d8a4c5939ad175/
> 
> Waldemar, this is an issue with the Blackfin internal toolchain. Could
> you have a look?
> 
> bfin-buildroot-linux-uclibc/bin/ld: LINKER BUG: .rofixup section size mismatch

Patch sent.
 
> >         bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/8949521b9997ae9db107657d271ddafacb9f3a56/
> 
> hidden symbol `___udivsi3'
> 
> Another issue in the Blackfin internal toolchain. Waldemar, I believe
> you're already working on it, right?

I am working on it. I have a patch to solve this one, but for full
C++ support I need this here resolved:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68468
I pestered the original Author via e-Mail, but he unfortunately only
commented on the original bug report, which was a result of a
misconfiguration. I tried to git bisect gcc, but it seems nearly
impossible to create a toolchain with a gcc from 2004 :(
 
> >         bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/8544ce58d75820666579db93a25ca5656a8efa8e/
> 
> undefined reference to `__emutls_get_address'
> 
> Again with the Blackfin internal toolchain.

Need to look into it.
 
> >         bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/17232204249aeb04150ac43a2424aa26a6b6c807/
> 
> LINKER BUG: .rofixup section size mismatch
> 
> Same bug as acpica.

Same patch.
 
> >         m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/bb7a107d1ca6e8713e6ccffe6c61c43b777fb962/
> >         m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/63898c00929b4546279bda52148b218f847714ed/
> 
> Toolchain problem. Waldemar?

Patch sent.
 
> >         bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/ca7f844bb1664c4d408b9187785c37de2d0e5ffa/
> >         bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/879ac63cc337c14e4a70b194de3b112341e5e918/
> 
> Still the same Blackfin toolchain issue.

I think this can be fixed by my first patch to the Bfin-C++ problem.
I will try.
 
> >          arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/aa83fae5c248ea192ea12101640b3420e68653b3/
> 
> checking for pthread_self in -lpthread... yes
> configure: error: "Pthreads not supported by the GC on this platform."
> make: *** [/home/peko/autobuild/instance-0/output/build/bdwgc-7.4.2/.stamp_configured] Error 1
> 
> Waldemar, I though you had fixed this issue. Is this just that I need
> to rebuild the toolchain?

If this commit isn't active, yes.
6ab32f38562e8976d75bbfd53a9ab46e9701c492
 
> >         bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/b420fdfddbf86822a6d9d3975b6befe7f91b938f/
> 
> I guess this is the usual C++ problem.

Without any deeper look, yes I agree.
 
> >         m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c0a8b73901956b393bebe7df3b7af26ade26fcbf/
> 
> /tmp/ccYJjr0Y.s: Fatal error: Tried to convert PC relative branch to absolute jump
> 
> Waldemar?

Need to take a look later.
 
> >          arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3b82c44ee853fab0e0c63881f0705bb659412917/
> >          arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/dafbb93ab38a4285ce42436219d552cceb14828b/
> 
> Waldemar, these are GDB Simulator build issues it seems.

Need to take a look later.
 
> >         m68k |                   iozone-3_446 | NOK | http://autobuild.buildroot.net/results/e5bbb80c81f4f170cf48d375e016e87a296ff754/
> 
> iozone_linux-noaio.o: In function `count_burst':
> iozone.c:(.text+0x8ec6): undefined reference to `pthread_barrier_wait'
> iozone_linux-noaio.o: In function `throughput_test':
> iozone.c:(.text+0x1cbe4): undefined reference to `pthread_barrierattr_setpshared'
> iozone.c:(.text+0x1cbea): undefined reference to `pthread_barrier_init'
> iozone.c:(.text+0x24952): undefined reference to `pthread_barrier_destroy'
> collect2: error: ld returned 1 exit status
> 
> Needs NPTL maybe. Waldemar?

I'll check this later.
 
> >        nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/d5b30d6b5463928ded1a1c1f1f5345a726f6ffaf/
> >        nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/917041c7165093f44a5d3b4a5ba56a3d1b59e456/
> >        nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/dcfc53b6fc25210cf70a1abf0e24b85f0d971101/
> >        nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/79109d06183efa17f6f68c1ea78cbd9927c5c46e/
> 
> Hum, I believe we might have an issue with the recent changes in the
> thread options in uClibc. Seems like the toolchain was built without
> thread support?

But nios2 here uses Glibc. I started a build to take a look.
 
> >      powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/7fab869ea5bdbd5ca7a701e8fdfa31b0c154101a/
> 
> ../include/libunwind-ppc32.h:182:9: error: unknown type name 'ucontext_t'
>  typedef ucontext_t unw_tdep_context_t;

uClibc-ng for PPC32 has no UCONTEXT support, yet.

> >         m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/0f5ed287f1756fbec710454e9c694202c3206dbe/
> 
> aggregartp.c: In function 'main':
> aggregartp.c:344:40: error: 'POLLRDHUP' undeclared (first use in this function)
>      pfd[0].events = POLLIN | POLLERR | POLLRDHUP | POLLHUP;

That is a bug in uClibc-ng, I am working on it right now.
 
> >          arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/5bb34ff490c70eea5e4fb497e5228ca1319fffdc/
> >          arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/8ba1410ed3ffb4954ccc4b7c3996d1839d677bef/
> >         m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/26ee52ad549b7ef75c9ce4b2eae94f9312cea775/
> 
> noMMU issue, on both ARM and m68k. Waldemar ?

Patch sent.
 
> >        sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/e9402204edb86b3315ce55b47f6262df1d27a45a/
> 
> checking if have Sparc v8+/v9 support... no
> configure: WARNING: Sparc v8 target is not supported in this release of Open MPI.
> configure: WARNING: You must specify the target architecture v8plus to compile
> configure: WARNING: Open MPI in 32 bit mode on Sparc processors (see the README).
> configure: error: Can not continue.

If only Sparcv8+ and v9 is supported, we should just disable it for
sparcv8. Maybe leon3/4 works.
 
> >         m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/455fd0f274bfa4bbd786bcd6740ecf960e47c1bd/
> 
> m68k toolchain issue. Waldemar ?

Looks like the sep-data issue fixed in assimp-v3.2 patch.
 
> >         m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/d1471227151e87d2e690a1bd9209c491b2feec8b/
> 
> Toolchain issue:
> 
> /tmp/cc3GcxVi.s: Assembler messages:
> /tmp/cc3GcxVi.s: Fatal error: Tried to convert PC relative branch to absolute jump
> 
> Waldemar ?

If you disable it for static builds as mentioned, I will not do
anything as it is m68k/coldfire static build.
 
> >         bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/12d3a46aa770f8444a274e8b98688e3577817121/
> >         bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/c4cf65e1a4732bef1c8198f986a9daceca175da3/
> 
> Usual C++ Bfin problem. For Waldemar :)

Argh..
 
> >         bfin |                 wavemon-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d81b199c74cb4251f0b0eb975f66cb5016eb464c/
> 
> iw_scan.c: In function 'scan_result_init':
> iw_scan.c:378: warning: implicit declaration of function 'pthread_mutexattr_setrobust'
> iw_scan.c:378: error: 'PTHREAD_MUTEX_ROBUST' undeclared (first use in this function)
> iw_scan.c:378: error: (Each undeclared identifier is reported only once
> iw_scan.c:378: error: for each function it appears in.)
> 
> NPTL needed, maybe? Waldemar?

I will check later.
 
> Thanks a lot!

best regards
 Waldemar
