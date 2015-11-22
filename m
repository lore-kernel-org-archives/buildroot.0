From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 10:57:11 +0100
Subject: [Buildroot] Analysis of build results for 2015-11-21
In-Reply-To: <20151122073011.8CA87102679@stock.ovh.net>
References: <20151122073011.8CA87102679@stock.ovh.net>
Message-ID: <20151122105711.185037f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Gustavo, Waldemar, J?rg, Alexey, see below.

On Sun, 22 Nov 2015 08:30:11 +0100 (CET), Thomas Petazzoni wrote:

>         success : 93 
>        failures : 24 
>        timeouts : 0  
>           TOTAL : 117

For some reason, my autobuilder instance was stuck in a loop generating
random configurations. I'll try to investigate what was going on, maybe
an issue with my latest autobuild-run changes. I've updated my
autobuild-run script to the latest version, and we'll see.

See below for some analysis of the build failures.

>        sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/3a0b601a3dd1a538247d11054e3623e6a242d854/

The usual SPARC issue. I suggest to disable libtirpc on sparc. Waldemar?

>          arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/9dbbb0bea5dcc8a8f38c77c2c95e708bc2797ff2/

musl build problem.

>          arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/04613c47b9669c28cc3ff47c65607c23730ef691/

musl build problem.

>          arm |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/14e291e22b8c8a9c590f0c6ef4316f8ab0aa1fff/

musl build problem, missing <sys/queue.h>

>          arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/bf9040ab972e4405b2af30e4d496059661457130/

musl build problem: error: redefinition of 'struct sigcontext'

>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/52c2da5590113149cc9984ac74acba0c1716f5d4/

Compiler error:

/tmp/ccjK5rZ3.s: Assembler messages:
/tmp/ccjK5rZ3.s:946: Error: bad expression
/tmp/ccjK5rZ3.s:947: Error: bad expression
/tmp/ccjK5rZ3.s:976: Error: bad expression
/tmp/ccjK5rZ3.s:977: Error: bad expression

This is with a Buildroot toolchain, so a fairly modern gcc/binutils
combination. We should: 1/ retry with gcc5/binutils2.25 and report the
bug upstream if applicable.

>          arm |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/124200fd884ba1bba59f137c16214d35e253709a/

prnetdb.c:898:2: error: #error "Unknown name-to-address translation function"

Gustavo ?

>      sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/1515f070c0fd410c681fc8306700244c34eb1635/

Compiler problem:

   error: unable to find a register to spill in class 'FP_REGS'

Waldemar ?

>        nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/ee1af79ffa6646d04a10a042c5791a9b01e1c605/

Probably the same compiler error:

  CC       tightvnc-filetransfer/filetransfermsg.lo
/tmp/ccxoQM9D.s: Assembler messages:
/tmp/ccxoQM9D.s:177: Error: bad expression
/tmp/ccxoQM9D.s:178: Error: bad expression
/tmp/ccxoQM9D.s:247: Error: bad expression

>          arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/0fa54aceec88e6200e4a779108c9433aed3c4f25/

multiple definition of `mi_lttng_element_snapshots'

>          arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/d56b816b72a09d707c163eedac4b63288a0fd24a/

configure: error: Cannot find libpopt. Use LDFLAGS=-Ldir to specify its location.

>      aarch64 |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/c7568ca976ff8d0d76b84ef4d33d5ee215fed4ee/

Fixed by:

   http://git.buildroot.net/buildroot/commit/?id=1ed2e40497365941cb4b4f486e9ec19ec034fedb

>          arm |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/e959e703a8db81032da27bece295c121e53d830d/

Static linking issue against FLAC. J?rg ?

>      sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/4856ca930a8dbb03f31028b60f5c378e81670445/

error: cannot convert 'int*' to 'volatile _Atomic_word* {aka volatile long int*}' for argument '1' to '_Atomic_word __gnu_cxx::__exchange_and_add(volatile _Atomic_word*, int)'

Again some atomic related issues? Waldemar ?

> microblazeel |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/9a0fc1064010a658155e6a18ec72e0e3c58ec7f6/

Again the openssl parallel issue.

>          arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/2a6604622392a3f127fb61505e2751a88a90af7b/

Trying to install a library that hasn't been built:

  /usr/bin/install: cannot stat '/home/autobuild/instance-1/output/build/oprofile-1.0.0/libopagent/.libs/*.so*': No such file or directory

Indeed, it's a fully static configuration, so installing a .so seems
wrong.

>          arc |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/5058b22a53d8ea2e6e0e215a9188ce4628fddc19/

Static linking issue. J?rg ?

>          arc |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/512b80c395124c4c5b3427a0d9882c1cf374235c/

/home/autobuild/instance-0/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(lowlevellock.os): In function `__lll_lock_wait_private':
lowlevellock.c:(.text+0x0): multiple definition of `__lll_lock_wait_private'
/home/autobuild/instance-0/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(libc-lowlevellock.os):libc-lowlevellock.c:(.text+0x0): first defined here
collect2: error: ld returned 1 exit status
Makefile:474: recipe for target 'sip-options' failed

This is a uClibc issue which was affected a number of architectures.
Has it been fixed already for ARC ? Waldemar, Alexey ?

>      aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/6c428f3a5f5d09d629c504856c37042bcf140c7b/

I updated the autobuild-run script on my server to fix this issue.

>          arm |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/cc265cc2dfeef3638040b8bdd15a381d18604107/

ts_close.c:17:19: fatal error: dlfcn.h: No such file or directory
 #include <dlfcn.h>

Cannot be used for static only configurations.

>          arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/b50866d149e0542f86b3088fb96a2738847e3145/

Tries to build a shared library in a static only configuration. Could
someone have a look ?

>          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/e04849c31e2a2528282ce6cdcf69aa10076d721d/
>          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/7b3295e711fc51907c311adb63f0b7d06a90a7b9/
>          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/fde02ae2883a058b98e57ba087466d820ab1a5eb/

gcc 5 issue, fixed by
http://git.buildroot.net/buildroot/commit/?id=c38ea9a59b36be4ce774c901786a1b461751c227.

Best regads,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
