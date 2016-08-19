From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 00:07:09 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-18
In-Reply-To: <20160819063024.55AF4101904@stock.ovh.net>
References: <20160819063024.55AF4101904@stock.ovh.net>
Message-ID: <20160820000709.0ceef3cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Usual analysis of build failures. Waldemar, Samuel, Yann, Angelo,
Andr?, Rahul, Vicente, Gustavo, Baruch, No?, please have a look below.

A quick summary is:

* issues fixed: 		12
* issues with patches: 		3
* blackfin toolchain issues: 	3
    2 being solved
* ARM Cortex-M issues: 		3
* noMMU issues: 		1
* uClibc issues: 		1
* ARC toolchain issues: 	4
* static linking issues: 	3
* gcc 6.x issues: 		2
* misc/weird issues: 		11
* m68k issues: 			3
* musl issues: 			1

On Fri, 19 Aug 2016 08:30:24 +0200 (CEST), Thomas Petazzoni wrote:

>         bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/e53f4e9676904ae78bd26bcd3fd5ce66401e9176/
>         bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/6794a876a14a4d36c120254649944b1c813a5e7c/

Still the usual Blackfin issues. I've sent a PATCHv4 of Waldemar's
patch that addresses this. Hopefully, we will be able to apply it in
the next days.

>          arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/e8acfe63de74ef4fddef20128001e8111d0004ff/
>          arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/c1475707f24f1fc4398a3a43f9750606385fc365/

ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context

Some unsupported relocations, on Cortex-M. I'm not sure why we're
hitting these only when building binutils, and not other packages.

Waldemar, have you ever seen those? What do you think?

>         bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/40c7cdd5ff8ea8020332b37628262e9636414b35/

eelf32bfin.c:1790:1: error: unable to find a register to spill in class 'CCREGS'

Waldemar, this is a gcc bug.

>          arc |    binutils-arc-2016.09-eng008 | NOK | http://autobuild.buildroot.net/results/00455b6a8324920ad843d90ce0413451522691a8/

Fixed by
https://git.buildroot.org/buildroot/commit/?id=fc61da15f46ca3eba529b71025ef9e5715b49716.

>         i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/e88b4dbd4b79fc983b8f7d33da3287966854f8ca/
>         i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/bad3202ef2138ebe9c698e24e41dc6d418a99212/
>       x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/a678836114dd3bf247e01bc293949b2866582d2e/
>          arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/9f91c4c8d3dfdcf8ff763cc3956c307670efbb97/

We've now disabled connman on musl, by
https://git.buildroot.org/buildroot/commit/?id=9ebcc74da68f89aab31c6d3a942e9dda8a0303ee.

>      powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/3ea8018a063c697323579c272fd9e9174f3e369c/

/home/buildroot/autobuild/run/instance-1/output/build/domoticz-3.4834/main/domoticz.cpp:48:22: fatal error: execinfo.h: No such file or directory
 #include <execinfo.h>

This needs an execinfo check. Samuel, could you have a look? I would
have done it if it was an autoconf package, but since it's a CMake
package :-)

>          arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/77b36f25c7296393da5e7b82d81d39397d26de0b/
>          arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/5dc71d61e615d980a610cb64a785fb800fa576e4/
>          arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/4f52271f4b4b5380c80efcbed08d9ea1f5da0df5/

ARC toolchain issue, under investigation.

>      powerpc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/620a2bda1ae981716a69f4f41749d25d2460b98a/

fwup static linking issue. One part of it is
https://patchwork.ozlabs.org/patch/657961/, but there is also the
discussion around pthread availability in libc or in libpthread.
Discussion with Waldemar is on-going.

>          arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/66aff89ea92f5a940dfa7ed3b0bdffb938dd998c/

Fixed by
https://git.buildroot.org/buildroot/commit/?id=4c70361ac14745eb8f287973da60802b8f8a253c.

>          arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8a8d533a0f785591fee10f1c09c9294f892ef7f7/

gcc 6.x issue:

../tests/iodelay.cpp:170:49: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
../tests/iodelay.cpp:171:50: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]

I guess
https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645
should fix it.

>          arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/6e91cfb1a0a55d1e816de66353bf6a4053af05a5/

[ 41%] Linking CXX static library ../lib/libkms++.a
Error running link command: No such file or directory

Yann ?

>          arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/630b61c1d48fbd7bab3de2d1a4e2632dd8b886ca/

ld (ld-elf2flt): -shared used without passing a shared library ID
collect2: error: ld returned 1 exit status

Smells like it's trying to build a shared library while we're on a
static-only configuration.

>      aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/3efe300199759fb84ad8122abc36bbcdfa10e0cd/

error: conflicting types for 'khronos_uint64_t'

Gustavo?

>         m68k |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1014a22cfdd3b18f349dde33f14acca4131dbd5b/

Waldemar, no support of libffi for 5208. What's the plan for that?

>          arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/f519a1b18f05acfd1eae4e6c9770a49b4b9e34b7/

test_urcu_fork.o: In function `main':
/home/buildroot/autobuild/run/instance-2/output/build/liburcu-0.8.7/tests/regression/test_urcu_fork.c:108: undefined reference to `fork'
collect2: error: ld returned 1 exit status

One liburcu test does not build on noMMU platforms. Needs a patch.

>          arc |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/47787173c90a3fb43336d245ff3f9a97afa60a04/

gcc 6.x issue:

base64.cpp:26:1: error: narrowing conversion of '-1' from 'int' to 'char' inside { } [-Wnarrowing]

>         sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/2770360880c9b265c8e019141925e56c35ba22dc/
>         i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/a3127f6b391f42c951b568c4bc476b10990e8b8e/
>         sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/fc2359b139c092be080359fc37555197ab9e2b5a/

Would be fixed by:

https://patchwork.ozlabs.org/patch/660882/

>      aarch64 |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/279591190dd7676ff4bcbb6017a109af7b7d67e9/
>       x86_64 |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/6b92fa15853bfeca8dd1dff15fcc57bef81194cc/

The libbsd issue. I'm not sure how to solve without fixing pkg-config.
What do we do for the release? Take the not-so-nice patch proposed by
Yann to work around the problem?

Secondary question: other packages are using libbsd, why aren't we
seeing other occurrences of this problem?

>          arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/99f006c734e59f0b47b1f34827012068d082a5e5/

ARC compiler issue.

>       x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/cfe678940c0a27e592dc40577c5a7c9a17772fa2/

Still the Mono failures. Angelo, any news?

>       x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/7c8b7b32feecb5f4ee0ecfed4d037b1ff7ce71e2/

The musl issue, Khem suggested a fix, I'll try it.

>          arm |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/7773282fdd31cc58ec6e63d561d2acbef64e926f/

arm_neon.h:6169:1: error: inlining failed in call to always_inline 'vcombine_f32': target specific option mismatch

Andr?, you originally added openal, can you have a look?

>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/43e50b480b4aea0fdec745d7875c85377c114cac/
>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/62786f33f28c5c4eabca2e33ce4f4289c4d9c7db/

Can still this OpenBLAS issue on ARM. Need to take a look :/

>         m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/20b1586757450d6aad8583ad7a787a7ca11acef1/

Waldemar, this is still occuring :)

>       x86_64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/6be08c666f783d31f3bb1a6b591186e07cb28547/
>     mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/1d5c2b717ddb9d6c333fdb4d91dc19a0c388154c/

The funky C++ issue. I give one beer at the next conference to the
person who tackles this problem that we have since at least one year
(see
http://autobuild.buildroot.net/results/1b6/1b6215df5e8aee157aa60530e5a90c0e9f2429c2/build-end.log,
from August 19 2015).

>       mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/98992860d20eacfa54f03137c8cd16178129a9ab/

This requires some mips knowledge:

{standard input}:1347: Error: opcode not supported on this processor: mips32 (mips32) `mtc1 $v1,$f2'
{standard input}:1348: Error: opcode not supported on this processor: mips32 (mips32) `cvt.d.w $f2,$f2'
{standard input}:1351: Error: opcode not supported on this processor: mips32 (mips32) `mtc1 $v1,$f2'

Vicente, Rahul, could you have a look?

>     mips64el |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/01317aeaff7d127a05e0488a51e81f2d43750687/

/home/buildroot/build/instance-1/output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libz.a(zutil.o): In function `zcalloc':
zutil.c:(.text+0x48): multiple definition of `zcalloc'
/home/buildroot/build/instance-1/output/build/quagga-1.0.20160315/lib/.libs/libzebra.a(memory.o):memory.c:(.text+0x1a0): first defined here
collect2: error: ld returned 1 exit status

Should not be too difficult to fix. Gustavo? Or Baruch maybe?

>       x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/b4232c0d3f390c1ad2bcd14655dbdd1bc3c35027/

Fixed by
https://git.buildroot.org/buildroot/commit/?id=4cae57b4588e5ad6917559602d529c86be95db42.

>          sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/ccd175ad26367e429ecc7cfc408fea13d097e329/
>          sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/a6051e2d1ecae9901d353f6bb4c9aac28ea3f93e/

Fixed by
https://git.buildroot.org/buildroot/commit/?id=a754ca85a1baffcfdff2239fe85099d9c6ec82ba.

>          arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/460f9a530c7a68e512495e0f3827ff315740b85e/

Fixed by https://git.buildroot.org/buildroot/commit/?id=b73fe4a68b41fb7804101ed516aa6c806ff18260.

> microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/007ded7d01e3746fc28013d76d04536758a2e2e2/

Fixed by https://git.buildroot.org/buildroot/commit/?id=c1276aacd2b0c1dc52b02bacd4b4c7c50a4b26fe.

>         bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f1ed03a5e410c01910404876475b155f1672d47c/

Fixed by https://git.buildroot.org/buildroot/commit/?id=19765d838f5308976bcbe6b892a33a2cd9dc1882

>       x86_64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/c9b13ae8d4af9ae6a65921de142c0e8da30664e0/

tsp_tcsi_param.c:14:28: fatal error: bits/local_lim.h: No such file or directory
 #include <bits/local_lim.h>

No?, since you added this package, could you have a look?

>         m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3122287ddea1e316a64ccf0d0dc9415bfefebb49/

posix/thread.c:82:5: warning: #warning Monotonic clock not available. Expect timing issues. [-Wcpp]
 #   warning Monotonic clock not available. Expect timing issues.
     ^
posix/thread.c: In function 'vlc_clock_setup_once':
posix/thread.c:91:18: error: lvalue required as left operand of assignment
     vlc_clock_id = (val < 0) ? CLOCK_REALTIME : CLOCK_MONOTONIC;

Waldemar ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
