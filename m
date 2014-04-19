From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 09:08:50 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-18
In-Reply-To: <20140419063009.6CB4810148A@stock.ovh.net>
References: <20140419063009.6CB4810148A@stock.ovh.net>
Message-ID: <20140419090850.339ca98f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Apr 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

>         success : 60 
>        failures : 22 

Much better than yesterday. Analysis below.

>       i686 |               compiling old_th | TIM | http://autobuild.buildroot.net/results/41a94e8fae8667d19842338bb8f909cae70642ab/

We're getting more and more of these. We need to analyze the build time
graph, and see if those 4+ hours long build times are expected or not.
If they are, I will have to increase the timeout on the server.

>     x86_64 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/9d252b26819e57f7c90a1b65c93da9fbf0afb9d5/

-fPIC problem

/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/bin/ld: ../../gst-libs/ext/libav/libavcodec/libavcodec.a(lpc_mmx.o): relocation R_X86_64_PC32 against symbol `ff_pd_1' can not be used when making a shared object; recompile with -fPIC

>        arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/d650fd7afe3e433bdccf7f5020dff22b23115e18/

OpenCV problem. Samuel, can you have a look? It appears almost every
day.

  CXX      libgstopencv_la-motioncells_wrapper.lo
gstdisparity.cpp:124:39: fatal error: opencv2/contrib/contrib.hpp: No such file or directory
compilation terminated.
make[4]: *** [libgstopencv_la-gstdisparity.lo] Error 1

>       i686 |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/e513f44e2e673d6a87cdadaba1f85c6181c269f2/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/a219031dcf19b9eedc05938f827f26f2f476b74d/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/bdc34ef8a3e4bb749fe9b77dad1c513c29dde2d8/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/0dbb093c89b3bdc778d4a909db851647d61e6b5b/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/bc8adbd69369c6cccdc0de918a79eed0f7a381c8/

Some more host-nodejs build problem, but Samuel was not able to
reproduce them. I guess I need to run a build on the autobuilder server
to investigate more what's going on.

> microblazeel | if /home/test/test/2/output... | TIM | http://autobuild.buildroot.net/results/30df2bdfc563c3c4c7207f35da0f107b529f671d/

Timeout to be investigated. Someone willing to look at the build time
data?

>        arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/bfb7595f9468ebc6820acc13f9e99619185fa400/

Python syntax issue?

>        arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/56630d23dc508131883491119cc2adce2e221324/

-Werror is probably not a good idea.

task.c: In function 'read_groups':
task.c:110:5: error: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'ssize_t' [-Werror=format=]
     evt, new_sz, ret);
     ^
cc1: all warnings being treated as errors

>        arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/a6f5550cc63260126cb66a954af60f1633b97faf/

checking host system alignment requirements... checking for a Python interpreter with version >= 2.7... none
configure: error: no suitable Python interpreter found
make: *** [/home/test/test/1/output/build/lttng-libust-2.4.0/.stamp_configured] Error 1

I think Romain Naour said the new version of lttng-libust was fixing
this. Romain, could you send a patch to bump lttng-libust?

>        arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/64069f179545ec48e649ca2aae58941798070520/
>        arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/4a200729f490a38d1170d5b9f5b125500638cba7/

Gaah, some custom external toolchain affected by the gcc bug... how to
handle this? Add an exclusion to the autobuilder scripts?

>     xtensa |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/66a9d2c664e0a9b2b0c51b998c72c2ceda90ff9b/

We need to add a NPTL dependency to mesa3d.

In file included from pipebuffer/pb_buffer_fenced.c:47:0:
./os/os_thread.h: In function 'pipe_barrier_init':
./os/os_thread.h:325:4: error: implicit declaration of function 'pthread_barrier_init' [-Werror=implicit-function-declaration]
./os/os_thread.h: In function 'pipe_barrier_destroy':
./os/os_thread.h:330:4: error: implicit declaration of function 'pthread_barrier_destroy' [-Werror=implicit-function-declaration]
./os/os_thread.h: In function 'pipe_barrier_wait':
./os/os_thread.h:335:4: error: implicit declaration of function 'pthread_barrier_wait' [-Werror=implicit-function-declaration]


>       i686 |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/61c1c566dc0e829cb663ca30b1fd6cf9cc6cd931/

checking for PTHREAD_PRIO_INHERIT... no
configure: error: Building OpenGL ES1 without OpenGL is not supported
make: *** [/home/test/test/1/output/build/mesa3d-10.0.4/.stamp_configured] Error 1

This is something for Yann to look at.

>      nios2 |                 minidlna-1.1.2 | NOK | http://autobuild.buildroot.net/results/1948b8998a8795436990178b6691a690327c67aa/

Not sure who can take care of this.

checking for avformat_open_input in -lavformat... no
configure: error: Could not find libavformat - part of ffmpeg
make: *** [/home/test/test/3/output/build/minidlna-1.1.2/.stamp_configured] Error 1

>        sh4 |                      nmap-6.40 | NOK | http://autobuild.buildroot.net/results/34d3e029f8cdefb0d1200fd45149fba256eea907/
>        arm |                      nmap-6.40 | NOK | http://autobuild.buildroot.net/results/50f9580b6aa5bbf7dea9c8a597b12cdf67cf897d/

Fixed by http://git.buildroot.net/buildroot/commit/package/nmap?id=126d5b5bb847c4c303267e128c80c30ce679498a

>        arm |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/81096c8736da5e0417f96a384a4967a1375f688a/

Another uClibc static linking problem, with symbols defined in both
libc.a and libpthread.a.

>      avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/e307f53b1ca8b385701e745138bad728e62d1017/

I have a patch to fix this, needs a final test and then I can submit it.

>     x86_64 |                   samba4-4.1.6 | NOK | http://autobuild.buildroot.net/results/a268755b6e5b1c7cdb40c6b96a561347125f7ff8/

default/source4/heimdal/lib/krb5/krb5_err.c:279:23: error: 'link' redeclared as different kind of symbol
/home/test/test/3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/unistd.h:770:12: note: previous declaration of 'link' was here
[ 906/3777] Compiling default/source4/heimdal/lib/krb5/heim_err.c
default/source4/heimdal/lib/krb5/heim_err.c:168:23: error: 'link' redeclared as different kind of symbol
/home/test/test/3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/unistd.h:770:12: note: previous declaration of 'link' was here
Waf: Leaving directory `/home/test/test/3/output/build/samba4-4.1.6/bin'

Samba 4 is Gustavo's stuff :-)

>       bfin |                   squashfs-4.2 | NOK | http://autobuild.buildroot.net/results/2738934fc23219a33fe1e07b3213b4e10266fc79/

Fixed by http://git.buildroot.net/buildroot/commit/package/squashfs?id=40988f824269fd181d933e2241c604b6b57af9e1

>      avr32 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/debb2a80fe82376d3de059c487d45adc26d41d1e/

Seems like the old uClibc version used on avr32 does not have
qsort_r()...

sun.c:(.text+0x1816): undefined reference to `qsort_r'

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
