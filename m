From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 11:25:22 +0100
Subject: [Buildroot] Analysis of build results for 2016-03-07
In-Reply-To: <20160308073022.EFA101019EE@stock.ovh.net>
References: <20160308073022.EFA101019EE@stock.ovh.net>
Message-ID: <20160308112522.47fc4935@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Olivier, Hirochi, J?rg, Julian, Gustavo, Romain, Yann, Gary, Yegor,
Arnout, Vicente, Bernd, Maxime, there are some questions/issues for you
below. Thanks for your help!

On Tue,  8 Mar 2016 08:30:22 +0100 (CET), Thomas Petazzoni wrote:

>         success : 176
>        failures : 87 
>        timeouts : 1  
>           TOTAL : 264

This is not too bad for the beginning of a cycle! Let's have a look at
the issues.

>      powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/89fc19e6ab8a8c46c2d3f5f9817ce7b50908b022/

/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-ctng_e500v2-linux-gnuspe/4.7.3/../../../../powerpc-ctng_e500v2-linux-gnuspe/bin/ld: btreplay: hidden symbol `_rest32gpr_30_x' in /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-ctng_e500v2-linux-gnuspe/4.7.3/libgcc.a(e500crtresx32gpr.o) is referenced by DSO
/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-ctng_e500v2-linux-gnuspe/4.7.3/../../../../powerpc-ctng_e500v2-linux-gnuspe/bin/ld: final link failed: Bad value

Gustavo, this is a PowerPC SPE problem, on a package that you added, so
I guess this issue is for you :-)

>      powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2c7286278f78c4f884e9c18a3c7c9bdac007b810/

./boost/test/impl/execution_monitor.ipp: In function 'unsigned int boost::fpe::enable(unsigned int)':
./boost/test/impl/execution_monitor.ipp:1383:7: error: expected id-expression before '(' token

Not sure. Is anyone willing to look into this?

>          arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/2b2c3895b4340078632f40c23ae77c254b8da4e6/
>          arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/c1de1f9db5de7034c02c76fe91ab1197d591e989/
>          arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/24fdfbb3b6fa5b081af10df3b2b7c2f5bc0c0a39/

Those three issues are caused by problem with the new mali-t76x OpenGL
implementation. Ariel, since you added this package, can you have a
look?

>          arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/8265694adfc4bf9a3a56d1bab10f8db2075312e7/
>          arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/5c05ec13e9b1e7b466870890c680fa0c0e8fcac5/

These are the atomic usage issue on non-threaded toolchain, for which I
have submitted patches already:

  http://patchwork.ozlabs.org/patch/592591/
  http://patchwork.ozlabs.org/patch/592592/

>          arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a13762bdea1ce4c612628ee38d2a371124227303/
>          arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/e0eebd980edfc47c637cff3af12a12e6d4a163dc/

musl build issues. This needs someone cleaning up
http://git.alpinelinux.org/cgit/aports/plain/testing/connman/musl-fixes.patch,
submitting it upstream, and submitting it as a proper set of patches
for Buildroot.

>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/178a210054e94b8ffab38a2ff2acf1697dd17bf5/

ipptool.c: In function 'do_tests':
ipptool.c:865:14: warning: conversion to 'unsigned int' from 'time_t' may change the sign of the result [-Wsign-conversion]
   CUPS_SRAND(time(NULL));
              ^
../config.h:659:33: note: in definition of macro 'CUPS_SRAND'
 #  define CUPS_SRAND(v) srandom(v)

Olivier, since you updated the cups package, could you have a look?

>          arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/0adad402ceac105854f86fa436797180ec22120c/
>          arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/2c44c9e72b9cbf917535ce753af60bde790f3887/

Would be fixed by http://patchwork.ozlabs.org/patch/592310/. Waiting
for Gustavo Reviewed-by/Tested-by.

>        sparc |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/1d942a1f09836dc406d71af7836fb37462bdc006/

Atomic issue on SPARC. Would be fixed by
http://patchwork.ozlabs.org/patch/585873/, I need to review.

>          arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/c88112baffebdf624ab9b1b6f6c55a24907ecc5a/
>          arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/6a6fe920eb54d05ba7aff0da9c4dc5a799ae0e3b/

Missing dependency on erlang-p1-utils, fixed in:

  https://git.busybox.net/buildroot/commit/?id=09f020105ff507845509374025c1fdfa7fda805f

>          sh4 |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/cde454cc7b8c0881044331e4d3cd043fd46bdaf3/
>         sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/e2c62e7f4cb35c6de15af88ca3e8b12719bfa88b/
>          sh4 |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/1504e4c4ac456398e5537bbfca682c627521a9ca/

/home/peko/autobuild/instance-1/output/build/fio-fio-2.6/gettime.c:163: undefined reference to `arch_flags'

This problem was discussed in Debian 5 years ago
(https://lists.debian.org/debian-superh/2011/08/msg00000.html), and is
still not resolved apparently. I would suggest to simply mark the
package as not available on SuperH, unless someone complains.

> microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/a2a74f515b87778148f66b27a68bde99e92a4a42/

internal compiler error: in gen_reg_rtx, at emit-rtl.c:838

Romain, is this part of our "known" toolchain issues on Microblaze?

>      powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/6dd60ac2d3c3182948a0b58da91371a4d7e5f977/

Gustavo, another PowerPC issue:

/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-gnu/4.5.2/../../../../powerpc-linux-gnu/bin/ld: gadgetfs-test: hidden symbol `_restgpr_29_x' in /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-gnu/4.5.2/libgcc.a(crtresxgpr.o) is referenced by DSO

>       x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/ce32ab937a0990f9b2ccc8992972d5e6800ce3c3/

Would be fixed by http://patchwork.ozlabs.org/patch/590524/.

>          sh4 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/76dcaa4d385a7ce904a67f71fb6cd52f5a1076f4/
>          sh4 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1efec98c12d2543350d8714a61faa44811d7292f/

/home/peko/autobuild/instance-1/output/host/opt/ext-toolchain/sh4-linux-musl/include/asm/ptrace_32.h:44:8: error: redefinition of 'struct pt_regs'
 struct pt_regs {
        ^

Someone to have a look at this? It's SH4/musl.

However, I don't have any SH4/musl configuration in the autobuilder set
of toolchains. This is due to the rename of toolchain symbols, and
therefore
https://git.busybox.net/buildroot-test/tree/web/toolchains/configs/sourcery-sh.config
is no longer up-to-date. I'll have to fix this.

>          arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/435cf41a256bc4f6368ad48736da720660699ade/

webserver.c:34:19: fatal error: error.h: No such file or directory
 #include <error.h>

Hiroshi, you added this package, can you have a look at this build
issue? Thanks!

> microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/c9e4890e3981d1a9e9bc658afb550e669d690bf8/

/home/buildroot/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-gnu/4.9.3/../../../../microblazeel-buildroot-linux-gnu/bin/ld: fde encoding in CMakeFiles/grantlee_core.dir/filterexpression.cpp.o(.eh_frame) prevents .eh_frame_hdr table being created.

Romain, any idea?

>     mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/3d01d60306d9857e2ae127502905de8a78762e70/

libavformat/a64.c:1:0: error: '-mips64r2' conflicts with the other architecture options, which specify a mips64 processor

Would be fixed by:

  http://patchwork.ozlabs.org/patch/589657/

>          arm |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/dfc25b78e17bd53d052261357220a240b4adacf4/

Ignore.

> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4fcad074e1c9d66e19283bac9e15039990eb9430/

Infamous documentation issue.

>       xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/83f3b205a8eee99c151e409b66ca9fddd711d0e3/
>      aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/36c230cbe75610ab33adb38f2a42d67d9a05c2ee/
>       xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fda22b44fcb3f33708c6302196bb13af877cbc43/
>         mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dc7b4d318e4f51e8d2295b7e0d033e6961bfac9b/
>          arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a37f483d2a9e05aaf27e5a229d3f9797efb5d218/
>       x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/82508736d42428fc489950fcc4c03926c84f1247/
>     mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2ed1809935035a8848ef4917ac5ae686fef28b5e/
>     mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/edf91c8f6ff5b6921d462b71a515f66c8e273c6c/
> microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/97f6f7e6a87a108cfb205975e4e1068f23d652f8/
>     mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ab9f95c9c308a9d4d200f125d50b8c752a71ecad/
>     mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1260d8815b663a30a7c4a316f96119813024bca1/
>       x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/eb88223d569cffb4e431599e5d0c5103aac9863b/
>       x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/efa682f409c98f9beddd1a4d7e2e2e8a66924e4d/
>          arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f710ba9160b7bbb11779d83e508ffe1566a8e10a/

This is being handled by Yann/Gustavo. Yann, Gustavo, any news?

>          arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/c265cfada20621a631e9d118b9633df80b0e4864/
>          arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/658c5e2fe6e3a4ad74ca47c926426e95eac0b9ec/

Musl issue. Anybody to look into
http://git.alpinelinux.org/cgit/aports/tree/main/hostapd, clean up the
patches, submit upstream and to Buildroot?

>       x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/1c19b90267ce0bf30f768cd8200533bf6c249f0a/

Musl build issue. Anyone?

>          sh4 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/16a8b36f9cb10a2c3f8237f2f2f249e9fbffa5d8/

Musl build issue.

>        nios2 |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/d806c2db907bdc1d9fc322962a198892abdfd214/

Too old toolchain. I have rebuilt the toolchain, will put it in
production soon.

>          arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/66bbe8ec2d77f5e4a4e28df63400345851f0db4d/

In file included from gpgme-tool.c:22:0:
../config.h:258:17: error: two or more data types in declaration specifiers
 #define error_t int

Musl build issue.

>          arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/91e0bfb5235eef46f98f6c34155aa255382efefd/
>          arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/37f4e1495631b94893874fe2cf3003519ef6bc3c/
>          arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/0245e23db3d86eee88a02b1f4c13c0fba3a72a6c/

Gary, this is for you. I believe you're already on it.

>         i686 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/ac8bc108f88cfc3cb75e05316967f5fa74dd1a85/
>      aarch64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/6914ddbbd0699f45c061e0208cec2a8cf8daeeb8/
>      sparc64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/dab542e4ca2dacf25b2e7822e4ddb137ea7c1c17/
>       mipsel |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/51bcbd1f9657dee56356444023021ef120a905e7/
>       x86_64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/5069fdd4c4a09a6bae2dcbf1f631ece561fe2df0/
>     mips64el |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/0e5bf7509a72bbef68b1f422de8ff93597d5af52/

Would be fixed by:

  http://patchwork.ozlabs.org/patch/593225/
  http://patchwork.ozlabs.org/patch/593224/

>          arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/f07a91d2a31660e2a9345f4299f3ff2ecaa80c55/
>          arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/6ca6a212f9da1359b0f7b3dd94e399dd222bfedb/

Toolchain issue. Alexey, Lada, is this fixed by recent ARC tools?

>          arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/c37457296a319e0aeee1608e34e0e436f7cc3dd1/

musl build issue.

>          sh4 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/d3e6b80d836c6b220239822885d733c404c35d52/

In file included from coord-config-lex.l:23:0:
coord-config-parse.y:107:2: error: unknown type name 'time_t'
  time_t timestamp;

Most likely musl build issue again.

>       x86_64 |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/05d38049e4791f082f99b870e6bfe67393255ce9/

musl build issue. Gustavo, Yegor, since this package is new and you
actively use it, can you have a look?

>      powerpc |                    lzlib-0.4.3 | NOK | http://autobuild.buildroot.net/results/ef80136ec17ad9b0a5e3121c4b6091b15c3da0d4/
>          arm |                    lzlib-0.4.3 | NOK | http://autobuild.buildroot.net/results/5e9d77e415e8cafb842b84d3d6d91280ae5491e3/

CMake Error at /home/buildroot/autobuild/run/instance-1/output/host/usr/share/cmake-3.4/Modules/FindPackageHandleStandardArgs.cmake:148 (message):
  Could NOT find Lua (missing: LUA_LIBRARIES) (found version "5.1.4")

J?rg, this is an issue that follows your lzlib bump. Can you have a look? Thanks!

>        sparc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/bb7bc6c534ff7514e437e25674d9878c2129e418/

Needs an atomic dependency. Waldemar?

>         i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3b1290b3d95ba58ea2861ffbcf8b50a087f378ea/


CC	libpostproc/postprocess.o
libpostproc/postprocess.c:94:53: error: expected ',' or ';' before 'FFMPEG_VERSION'

No idea. Gustavo?

>          arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/92a81f510cd9870f9df868984d8e896bcac72e86/
>          arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/72abac3d927197afba30832176c2c2bfd7926485/

aggregartp.o: In function `main':
/home/peko/autobuild/instance-2/output/build/multicat-2.1/aggregartp.c:381: undefined reference to `pthread_self'
/home/peko/autobuild/instance-2/output/build/multicat-2.1/aggregartp.c:381: undefined reference to `pthread_setschedparam'

I believe it needs NPTL support, not only thread support. Julian, since
you added multicat, can you have a look?

>         bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/a5aacc722ab0a3ffb3f1130e08eb9055909a3bb1/

/home/buildroot/autobuild/run/instance-0/output/build/multicat-2.1/util.c:243: undefined reference to `_clock_nanosleep'
/home/buildroot/autobuild/run/instance-0/output/build/multicat-2.1/util.c:238: undefined reference to `_clock_nanosleep'

Missing link with -lrt ?

Julian, this is also for you :-)

>          sh4 |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/cfd265288dcb8d26fed741e116cf3f8c30e2901d/

Musl build issue. And also for you :-)

>          sh4 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/b1da3e37e4e169a11e81f2b08f0fce1d8822a3f4/

Musl build issue. Anybody to look into this?

>      sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/35603130a37125be6c9f85e5740b2c85bbcc4820/

Weird atomic related issue. Waldemar?

>          arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/2bd5bd5cfa399f8b6c5370d8834a6b9182266222/
>          arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/4c349a9bb24de7850dc783d5c77324b7b81fa01b/

Musl build issue. Anybody to clean up
https://patchwork.ozlabs.org/patch/573517/, submit upstream, and
resubmit to Buildroot properly?

>          arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/b9f1a0a7ac54d0cf00f4880a36bd43ad988fcd30/
>      powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/2c741fef7ba203b156b674dddcbe1b8b8a32c048/

../../../owlib/src/include/compat_netdb.h:69:24: fatal error: rpc/netdb.h: No such file or directory
 # include <rpc/netdb.h>

Arnout ?

>          arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/31ffcdb2b855deb9fdee54dd09c5cb57ad01593a/

Static linking issue.  We have
http://patchwork.ozlabs.org/patch/574582/, but I am not satisfied by
the proposed solution (see my comments).

>     mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/5a8abdd4918a721c1bddbf68a16d99bea90a59a9/
>     mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/c125010c16887f197e1ea342fbe7bc3a890f41e5/

host2ip.c:13:38: fatal error: rpcsvc/ypclnt.h: No such file or directory
 #include <rpcsvc/ypclnt.h>   /* YP */

Vicente, this happens with the Codescape toolchains.


>          arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/3cad309afbcedb05e747a9a7afd21342f6f58e1b/

/tmp/ccFr7cvF.s: Assembler messages:
/tmp/ccFr7cvF.s:2253: Error: invalid register number `63'

Another ARC toolchain issue. Alexey, Lada, is this already fixed in the latest arc-tools ?

>         bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d3f09f503ee3757865c35ba04a787e4b083670db/

process.c: In function 'rb_spawn_process':
process.c:3921: warning: passing argument 2 of 'rb_ary_new_from_values' from incompatible pointer type
process.c:3923: error: 'status' undeclared (first use in this function)
process.c:3923: error: (Each undeclared identifier is reported only once
process.c:3923: error: for each function it appears in.)

Perhaps we should just mark Ruby as not available on Blackfin and get done with it.

>      sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/5309ff058f0a995f93c4981d4f864a64ef8bfcb5/

Needs PIC build IIRC. I have a patch for this somewhere, I'll dig it up
and send.

>         bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/6829ec8edeb0a98080bd5aaf2fff8d86b3fdf1c5/

Static linking problem.

>     mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/44f59a9535cb10b215f9aa9c6c078dcd154f8c6a/

prototypes.h:628:5: error: conflicting types for 'getnameinfo'
 int getnameinfo(const struct sockaddr *, socklen_t,

Weird, not sure.

>     mips64el |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/a695088bb8ba1ea1923da6eea988ef9ed1723297/

configure:19926: checking for libpcap
configure:19999: error: "Unable to find matching library for header file in /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr"

Weird.

>          arm |                wireshark-2.0.2 | NOK | http://autobuild.buildroot.net/results/714daf80b6dcb14499a99e4bfb5ec12784780be2/

checking for pcap_open_live in -lpcap with -lpfring... no
configure: error: Can't link with library libpcap.
make: *** [/home/peko/autobuild/instance-0/output/build/wireshark-2.0.2/.stamp_configured] Error 1

Seems like we have an issue around libpcap.

>      powerpc | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/2e58f95dcdfe7f139d39712ac3026be76a9f3296/

  CC       r128_dri.lo
r128_dri.c:61:26: fatal error: GL/glxtokens.h: No such file or directory

Bernd, maybe ? I know we have
http://patchwork.ozlabs.org/patch/572317/, but there is a pending
question which was not answered. Can you have a look?

>          arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/258268c204c405332244ea2e07379f1d801732df/

[ 30%] Linking C executable gen-extra-close
/home/peko/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lyajl
collect2: error: ld returned 1 exit status

Maxime, you recently bumped this package. Can you have a look?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
