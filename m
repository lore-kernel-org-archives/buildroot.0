From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 09:32:45 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212073007.B3242100CEB@stock.ovh.net>
References: <20140212073007.B3242100CEB@stock.ovh.net>
Message-ID: <20140212093245.49e2b6ac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As usual, analysis of yesterday build failures.

On Wed, 12 Feb 2014 08:30:07 +0100 (CET), Thomas Petazzoni wrote:

>      avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/aeeaaf1f22d655eb918a492d430f5cce37b8a201/

../common/resolver.o: In function `getrrs':
resolver.c:(.text+0x46): undefined reference to `__dn_skipname'
collect2: ld returned 1 exit status

Might be something missing in uClibc 0.9.31 used by AVR32, so we would
have to disable this package on avr32 if that's the case.

>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7069e1f43cbed745d65f7dd9904a3fff034530ac/

Fixed by http://patchwork.ozlabs.org/patch/293833/. I'll try to give a
test to this patch today, and send my tested by.

>      avr32 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/595a83e6f1df0f0c0294d31ccb3857206c0da47a/

/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/avr32-buildroot-linux-uclibc/4.2.2/../../../../avr32-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/avr32-buildroot-linux-uclibc/4.2.2/../../../../avr32-buildroot-linux-uclibc/lib/libstdc++.so'
collect2: ld returned 1 exit status

Probably the C++ static linking issue. Since -rc1 has been released, I
will rebuild all the Buildroot external toolchains.

>       bfin |                   boost-1.55.0 | NOK | http://autobuild.buildroot.net/results/17dd7946631354d59336259d5f31aa899e3599b8/

Some part of boost needs fork(). But we probably shouldn't disable
boost as a whole, only the specific modules that cannot work on !MMU
systems.

./boost/test/impl/debug.ipp: In function 'bool
boost::debug::attach_debugger(bool)': ./boost/test/impl/debug.ipp:868:
error: 'fork' was not declared in this scope

>    aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/c57f89ffa732e2bfbb6ebf9af9de5bac3cbc197f/

Compiler problem:

  CC     src/groups.o
{standard input}: Assembler messages:
{standard input}:378: Error: operand 3 should be an integer register -- `adc x11,x10,0'
{standard input}:382: Error: operand 3 should be an integer register -- `adc x2,x11,0'
{standard input}:400: Error: operand 3 should be an integer register -- `adc x4,x2,0'

>       bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/1ae0fee94f2161ce20ba6efdccf7fb90ddbfcb1b/

checking for zmq_init in -lzmq... no
configure: error: cannot link with -lzmq, install libzmq.

> microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0365f1e36a91f64e5c67eb1d4872ec57269ddd8f/

/home/test/test/3/output/host/usr/bin/microblaze-buildroot-linux-gnu-gcc -g -o dropwatch main.o lookup.o lookup_bfd.o lookup_kas.o -lbfd -liberty -lreadline -lnl-3 -lnl-genl-3 -lpthread -lncurses -lm
/home/test/test/3/output/host/usr/lib/gcc/microblaze-buildroot-linux-gnu/4.9.0/../../../../microblaze-buildroot-linux-gnu/bin/ld: cannot find -liberty
collect2: error: ld returned 1 exit status

>       bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/4c38d5c29d3c338e84c7c3720f89b0b81ab629ac/

{standard input}: Assembler messages:
{standard input}:4: Error: syntax error. Input text was _compat.elfutils_0.122.dwarf_bitsize.
{standard input}:4: Error: 
make[4]: *** [dwarf_bitsize.os] Error 1

>    powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/314694709b3a2d812c18acc70e374b3bc2fbedbd/

  CC     enlightenment_start-e_start_main.o
e_start_main.c: In function 'main':
e_start_main.c:478:42: error: 'PT_GETSIGINFO' undeclared (first use in this function)
e_start_main.c:478:42: note: each undeclared identifier is reported only once for each function it appears in
make[5]: *** [enlightenment_start-e_start_main.o] Error 1

>       bfin |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/567beac5f5d0c19620a6e770d2b9302bed481332/

checking whether to enable tiff support... yes
checking for TIFFReadScanline in -ltiff... no
checking for TIFFReadScanline in -ltiff... (cached) no
checking for TIFFReadScanline in -ltiff34... no
configure: error: TIFF support was requested but system does not support it
make: *** [/home/test/test/2/output/build/imlib2-1.4.5/.stamp_configured] Error 1

>        arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/2a33d2c7535a9d867d76dd5cf05e1bcc3f5cdc38/

iozone needs threads, fixed.

>       bfin |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/ad90baa5e07569308a7e2b2510b67c5b2a563b44/

uClibc configuration problem?

/home/test/test/2/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libeina.a(eina_file.o): In function `_eina_file_map_all':
eina_file.c:(.text+0x6aa): undefined reference to `_madvise'
/home/test/test/2/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libeina.a(eina_file.o): In function `_eina_file_map_new':
eina_file.c:(.text+0x7fc): undefined reference to `_madvise'
collect2: ld returned 1 exit status

>    powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/8be92ceb7e93332b218d3090b1b4fbf64e7af887/
>    powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/9a5c30cccf7b7e1c68a384fa5c49e4009d50400e/

In file included from common.c:10:0:
/home/test/test/3/output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/include/linux/netlink.h:31:2: error: expected specifier-qualifier-list before 'sa_family_t'

>    aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/6635f7149cd0f5192d49276b2cc3edc5be3b5868/

Ah, yes. I have the beginning of a patch that bumps libv4l, which
solves this problem. But it is not a straightforward bump since libv4l
has changed quite a bit (more tools available, for example).

What should we do in the mean time?

>     xtensa |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/2c6b9fdfffe81042d7606893d1ff006f9e6c4296/

/home/test/test/3/output/host/usr/lib/gcc/xtensa-buildroot-linux-uclibc/4.7.3/../../../../xtensa-buildroot-linux-uclibc/bin/ld: cannot find -ldevmapper

>     xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/68bb764e5b34a2862537c3bd4b57ef5af529f0a3/

Compiler problem:

CC	libavcodec/vp56.o
{standard input}: Assembler messages:
{standard input}:70614: Error: operand 1 of 'j' has out of range value '155096'
{standard input}:71047: Error: operand 1 of 'j' has out of range value '154068'
{standard input}:129895: Error: operand 1 of 'j' has out of range value '4294812257'
{standard input}:129905: Error: operand 1 of 'j' has out of range value '4294813285'

>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/ed28908a93362d76fc720cf67f6c530eed8d855b/

ARM/floating point issue:

CC	libavformat/avc.o
{standard input}: Assembler messages:
{standard input}:3921: Error: selected processor does not support ARM mode `vmov d0,r7,r8'
{standard input}:3923: Error: selected processor does not support ARM mode `vld1.32 {d2[],d3[]},[r2,:32]'
{standard input}:3924: Error: selected processor does not support ARM mode `vmov d1,r0,r1'
{standard input}:3925: Error: selected processor does not support ARM mode `vmul.f32 q0,q0,q1'
{standard input}:3926: Error: selected processor does not support ARM mode `vst1.32 {q0},[r3,:128]!'

>        arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/4d12fc71a775b0f81afeae1fa5317c0cb319185f/

ARM/neon issue

>       bfin |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/dd64c2aed5291b6c083f061709d6179150440a7e/

configure: error: no code allocation backend
make: *** [/home/test/test/3/output/build/orc-0.4.18/.stamp_configured] Error 1

>        arm | qtuio-abe4973ff60654aad9df7... | NOK | http://autobuild.buildroot.net/results/9b57f76672c8d0a74980cb1de32661761b666ce7/

/home/test/test/1/output/host/usr/bin/arm-unknown-linux-gnueabi-g++ -L/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -lGAL -lEGL -Wl,-O1 -o pinchzoom graphicsview.o main.o mouse.o moc_graphicsview.o moc_mouse.o qrc_mice.o    -L/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -L../../lib -lqTUIO -lQtGui -L/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot//usr/lib -ldirectfb -lfusion -L/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -ldirect -lEGL -lQtNetwork -lQtCore -lpthread 
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.6.4/../../../../arm-unknown-linux-gnueabi/bin/ld: warning: libXdamage.so.1, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.6.4/../../../../arm-unknown-linux-gnueabi/bin/ld: warning: libXfixes.so.3, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.6.4/../../../../arm-unknown-linux-gnueabi/bin/ld: warning: libXext.so.6, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.6.4/../../../../arm-unknown-linux-gnueabi/bin/ld: warning: libX11.so.6, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)

>     x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/451521367a12cc4eda823526ec1e25580d4a2cc6/

Already fixed, by Maxime Hadjinlian.

>     x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/23caf6deef3cbd8fd6b150e133d493d26d16d80b/

Same as yesterday:

/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/boost/cstdint.hpp:314:42: error:                 typedef boost::ulong_long_type boost::uint64_t
src/thrift/transport/TSSLSocket.cpp:351:1: error: 'uint64_t' does not name a type

>        arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/656cddb6f22360808fbe39a9d112a06b87ad313a/

I will have a look into this.

>      nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/fe79fe617e7bb8c7fabcbaefac883604bbb49d80/

Might be an issue in my autobuilder infra.

>       i686 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/39c77ffb5a5599d0b09422433c747b2bac185c4f/

  CXX      libopencv_example_plugin_la-opencv_example.lo
opencv_example.cpp:42:33: fatal error: opencv2/core/core_c.h: No such file or directory

>       mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/05bc24c48da6ccd9cccb90689b7457b973278f9d/

/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.7.3/../../../../mips-linux-gnu/bin/ld: ./.libs/libvlc_srtp.a(libvlc_srtp_la-srtp.o): relocation R_MIPS_26 against `div' can not be used when making a shared object; recompile with -fPIC
./.libs/libvlc_srtp.a(libvlc_srtp_la-srtp.o): could not read symbols: Bad value

> microblaze |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/67d14aaaf6b4c04225a457676c8ff7b125f6b692/

misc/objects.c: In function 'vlc_object_release':
misc/objects.c:531:1: internal compiler error: in merge_overlapping_regs, at regrename.c:295
 }

We probably want to disable vlc on Microblaze for now, and add a
bugzilla entry to track this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
