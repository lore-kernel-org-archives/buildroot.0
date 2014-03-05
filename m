From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 11:27:29 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140305073008.3DAFE101B04@stock.ovh.net>
References: <20140305073008.3DAFE101B04@stock.ovh.net>
Message-ID: <20140305112729.47a9a631@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Mar 2014 08:30:08 +0100 (CET), Thomas Petazzoni wrote:

>     x86_64 | <command-line>:0:0: note: t... | TIM | http://autobuild.buildroot.net/results/82e7f26e2e307aeb66a8ff98be3369e04886d226/

Timeout, weird.

>     x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/ee48919bb9d0651642b3a1b547cfbd2c5ef2a8dd/

/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.7.3/../../../../x86_64-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.7.3/../../../../x86_64-buildroot-linux-uclibc/lib/../lib64/libstdc++.so'

I think a contributor had a look into this some time ago, and came to
conclusions, but I don't remember, I'd have to dig in the archives :/

>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f1735664c37a72b1b8b137f8bbc6be14624c84e9/

Don't know.

>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/77f4cb65535033db9d5184b142d96f2a508a7a5c/
>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/da19c46398ba8a0977058d76fe21bd9968f92ac1/

This problem has been around for weeks. Would it be possible for an
OpenGL person to look into this?

cairo-gl-private.h:255:8: error: unknown type name 'GLchar'

>     x86_64 |                   connman-1.21 | NOK | http://autobuild.buildroot.net/results/5c500167a7277fd3f3cdf02e13749f6e98a0e81e/

Might be a symbol redefinition problem in uClibc, when linking
statically. I remember reading some posts about this on the uClibc
mailing list.

/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-gstdio.o): In function `g_utime':
gstdio.c:(.text+0x7b): warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes'
/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(lowlevellock.os): In function `__lll_lock_wait_private':
(.text+0x0): multiple definition of `__lll_lock_wait_private'
/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(libc-lowlevellock.os):(.text+0x0): first defined here
/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(lowlevellock.os): In function `__lll_unlock_wake_private':
(.text+0xa0): multiple definition of `__lll_unlock_wake_private'
/home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(libc-lowlevellock.os):(.text+0x30): first defined here
collect2: ld returned 1 exit status

>       bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/99363a20dc25600460bd4cf169d92c922f55a5f6/
>       bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/48ca7dbd47d4231b6b98f490f952533caf888861/
>       bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/cc9eafd42f1d7887763b912b2ad785635201be3c/

Yesterday evening, I've started looking into this. Here is a summary of
my findings.

So, we're building for Blackfin FLAT, so static only build. ZeroMQ is a
library written in C++, and czmq is a library around it written in C.
The configure script tests whether a simple application that calls
zmq_init() can be linked properly against the ZeroMQ library. This test
is done by compiling the test application using 'gcc', not 'g++'. While
this test works fine in dynamic link mode (because libzmq as a NEEDED
on libstdc++), it fails in static link mode because it links with
-lzmq, but not -lstdc++. A quick test shows that linking against
-lstdc++ would solve the problem.

So there are apparently two issues:

 1/ The libzmq.pc file does not have a Libs.private: -lsdtc++

 2/ The configure.ac script of czmq does not call pkg-config with the
    --static option. Apparently, the logic in pkg.m4 is not even aware
    that it should use --static.

I must say I'm not sure how to fix the problem properly.

> microblaze |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/d8b4f69e5b19a3d9c1b8e4114e686cff7cfeae2f/

To be looked at by Microblaze people:

{standard input}: Assembler messages:
{standard input}:9306: Error: operation combines symbols in different segments
{standard input}:9307: Error: operation combines symbols in different segments

>        arm |                      eudev-1.3 | NOK | http://autobuild.buildroot.net/results/5190f23b84ca9eec49f1071ccfdb3314f6c4ae5b/
>    powerpc |                      eudev-1.3 | NOK | http://autobuild.buildroot.net/results/624ad8ef30318bfb2de0952c5101cfa2b8d94f76/
>     mipsel |                      eudev-1.3 | NOK | http://autobuild.buildroot.net/results/c4e920b16c57e79df979f00cceaea7c0483f043c/

Fixed by:

  http://git.buildroot.net/buildroot/commit/?id=d5604d9c3de6cd0b24db1351227b017fd8a8be75

>        arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/ac98e35736532c697e1c08e23e1d6800c951ea23/
>        arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/d02e1843ef90f4b40c99e3b23eddf376f827d46e/
>        arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/51ea53c39e6c067760c2d1e9c0c7b7bfbbe28be8/

OpenCV problem, to be looked at by Samuel I believe:

/home/test/test/3/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/opencv/cv.h:72:37: fatal error: opencv2/legacy/compat.hpp: No such file or directory

>       i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/4dab2c72b9583df03db5b065a7f8a7ca0e6d9181/
>       i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/ced5ed9ce2f1742560828999eeb6dc8777729d78/

Parallel installation problem.

>       i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/a423aa18e25686474633d6420bf701e1fa637bd0/
>    powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/2eb4783dcc3fd990d37f34f2a146a7c025647bec/


The host python3 problem (SCons only works with Python 2).

>        sh4 |                     libsoc-0.6 | NOK | http://autobuild.buildroot.net/results/1f451a338487a2a3c8a8f9b18540d41b90ee5aac/
>       i686 |                     libsoc-0.6 | NOK | http://autobuild.buildroot.net/results/6735751b31dfe8e3ced80c5d18d816772286d4f7/
>        arm |                     libsoc-0.6 | NOK | http://autobuild.buildroot.net/results/578032aac810d04cced1e8fdf0f6f39d20132de8/
>       i686 |                     libsoc-0.6 | NOK | http://autobuild.buildroot.net/results/1888956c040f56b4d6603f2d2f44ccb7614a87de/

Fixed by:

  http://git.buildroot.net/buildroot/commit/?id=41711cfdeda6f5fd9b2531f538f3643854d7d3ea

>       sh4a |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/996fc95b302fb6dfc7cd9a468fd395226a36c6c4/

Not sure:

/home/test/test/1/output/host/usr/bin/sh-linux-gnu-gcc  -shared -Wl,-soname,libxmlrpc_xmltok.so.3  xmltok.osh xmlrole.osh  -o libxmlrpc_xmltok.so.3.25  
xmltok.osh: file not recognized: File truncated
collect2: error: ld returned 1 exit status

>        arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/31a4ba00f9628365f080877079ba8d8120f4f23a/

Needs pkg-config.

>        arc |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/9a259663b28ae47ed2bfd15f53b0fc44b5853227/

The architecture of your CPU (arc) is not supported by this configure script
It seems nobody has ported MPlayer to your OS or CPU type yet.

>        arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/c505587a795cd936ce8d5dda4805c0974a96981e/
>        arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/59ade0d9290cf623b45cd6fe0d0d56f295588ee0/

checking for fork... no
configure: error: pcntl: fork() not supported by this platform
make: *** [/home/test/test/1/output/build/php-5.5.9/.stamp_configured] Error 1

>        arm |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/8505e0dd5ecda76071f0ea4f7705a105308a1c20/

Fixed by:

  http://git.buildroot.net/buildroot/commit/?id=878c04b8ccc399c0d9c09767eda9b129e3b59a53

>       i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/3abe178c26dc34a4f6a887ed3abbfcaa8990ce6d/
>        sh4 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/a685caa6d3e4850a45360dfe733013ba2d53404c/

*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.17 but the autoconf macros are from gettext version 0.18

>       bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/047f2f8ac15592d5f78093249eeed14148de4e5e/

Compiler does not provide the necessary intrinsics.

>      avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/7a0be4da26415b05f3d1c9522da703be408bb5f6/

Not sure :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
