From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 11:30:14 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <20150806063016.4A0BB102D1F@stock.ovh.net>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
Message-ID: <20150806113014.163c6592@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Brendan, Alexey, Vicente, J?r?me, Bernd, Max, Julien, Clayton, Gustavo, Yann, please have a look below.

On Thu,  6 Aug 2015 08:30:16 +0200 (CEST), Thomas Petazzoni wrote:

>         success : 207
>        failures : 41 

That's a 16.4% failure rate. We can classify the build failure as
follows:

unknown/misc:		15
musl: 			9
SPARC atomic/other:	6
toolchain problems:	6
fixed:			4

So we really need to make more progress on fixing the musl issues, and
find a solution for the SPARC atomic problem.

>        sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/cb455f538319a62ae730943190d3a8896473091f/
>        sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/062e08ed5b4306ed64f986f3a9f0938594125c67/

Atomic issue:

   undefined reference to `__sync_add_and_fetch_4'

Brendan?

>          arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/549492270f3f43747a96a8326aef1d7ae1d3b213/

Not sure what's going on:

cannot find Scrt1.o: No such file or directory

Waldemar, it seems to be a uClibc issue. Do you have some idea?


>       x86_64 |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/f1688b70c0e29f9561fd063fe7b386a6e8016648/

Missing link against libintl.

>        sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/c66d29ceee404b84e3fc421c77e5d48032744067/

more undefined references to `__sync_fetch_and_add_4' follow

Brendan ? :-)

>        sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/14591f0ce708f68f925c9223471b3c4f0ddb9eef/

 error: #error "platform not supported"

Pff, why do we care about SPARC ?

>          arm |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/9bbdd2f2c132c15414faf5390d0f4ab96c1f95c7/

musl build problem:

  error: '_IOC_SIZEBITS' undeclared (first use in this function)

>       x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/42e6ea302bb52a4d4e62693fa83760a2f4e06407/

musl build problem:

  error: expected declaration specifiers before '__THROW'

>          arm |                 cifs-utils-6.4 | NOK | http://autobuild.buildroot.net/results/cc38e7581b4bba362a9be388099b0ea237f4e580/

musl build problem:

  error: '_PATH_MOUNTED' undeclared (first use in this function)

>       x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/66fa17376cbb05351988e7ef0dc0c232bbd19f2d/

musl build problem:

   fatal error: fpu_control.h: No such file or directory

>          arm |                     cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/57de9e838fa953e2fb5e358cd535603fb249b7d2/

Fixed by:

    http://git.buildroot.net/buildroot/commit/?id=bfcffb6f81244c57416de5f80cbad4810528ec42

>         bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/2309cfa7c11d89388a18ae2da9cfd280537ec908/
>         bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/1640dc4e38bde6b8af3efb683d8f2cf22f4caa27/

    error: 'strtoll' is not a member of 'std'

Not sure. Maybe compiler is too old?

>       x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/5e346931e8022986e70b0cf06042f1fe17789252/
>       x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/84b3a7b75bda89069476d391ed14bc3b8a098017/

musl build problem:

   error: unknown type name 'sigval_t'

>          arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/8288f90255d546d08cd3a31e84bd31ea83651075/

musl build problem:

   error: unknown type name 'u_long'

>          arc |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/d44aec8c82ed6a315322726dd698e6b48990ba76/

ARC toolchain problem:

   error: '__NR_eventfd' was not declared in this scope

Alexey, I don't remember, do you have a fix for this one?

>          sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/6142f23c3095145039941ef26a5ed1e3d6ebebb1/

Compiler problem:

   internal compiler error: in elimination_costs_in_insn, at reload1.c:3638

>          sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/69cc19557e6de8f3c5b292d498188e7aea8388ad/

Same compiler problem.

>          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/c13a38ab434e4b7d75295d1ac401ae4d06497a4a/

The usual host-erlang-rebar timeout.

>      powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/af970a24d9fdbc9ad6ab05161509fcdf9bdd1b89/
>      powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/3b5611725c13668472482ed4ad3b46886d4c63d9/

Both fixed by:

   http://git.buildroot.net/buildroot/commit/?id=712bb469da4966fa03a251f3fe8bdc18a89569ed

>          arm |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/be0bf8a9579c8a93f3e77c2ac7414b274470631a/

Missing gudev package. I believe I will have to make an exception here
and merge this new package as it is needed to fix some of the build
issues.

>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2fdea2bbcdff4a70ffaac1eecbc8faa81a44e90c/

ARC toolchain problem:

   Error: internal error: fixup not contained within frag

Alexey?

>          arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/c865d16a7f878f2ecc52c30f285c43e5cf45bdcc/
>       x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/4dfd26c01fb8d64b2793402b7ebdc2992ee5a54d/

musl build problem:

   error: '_PATH_LASTLOG' undeclared (first use in this function)

>         mips | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/79b51941ed57b0564c68112489b03cac39a04e9a/

output.c: In function 'output_right':
output.c:784:3: error: size of unnamed array is negative
   (void)sizeof(char[1 - 2*(sizeof(unw_word_t)
   ^

Vicente, J?r?me, can you have a look?

>         i686 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/049ebf21a9d00ef0db54de295cb7fdfcdc5024d8/

Another host-erlang-rebar timeout. I need to adjust the regexp to infer the reason from the build log.

>         i686 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/08305f397ef523ee864827e1e267475a9f6f397f/

checking for LIBUDEV... no
configure: error: gbm requires --enable-dri
make: *** [/home/test/autobuild/instance-1/output/build/mesa3d-10.6.3/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-1/buildroot'

Bernd, is this fixed by one of the pending patches on mesa3d ?

>        sparc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/063b8e47a39eef601fe6d7d9578a64216c8eccb6/

/tmp/ccrWqi6b.s: Assembler messages:
/tmp/ccrWqi6b.s:187: Error: Architecture mismatch on "membar".
/tmp/ccrWqi6b.s:187:  (Requires v9|v9a|v9b; requested architecture is v8.)
/tmp/ccrWqi6b.s:188: Error: Architecture mismatch on "cas".
/tmp/ccrWqi6b.s:188:  (Requires leon|v9|v9a|v9b; requested architecture is v8.)
/tmp/ccrWqi6b.s:189: Error: Architecture mismatch on "membar".
/tmp/ccrWqi6b.s:189:  (Requires v9|v9a|v9b; requested architecture is v8.)
make[1]: *** [src/core/threads.o] Error 1

Pff, why do we care about SPARC, again? If nobody sends a patch for
this, I'll just mark moarvm as not available on SPARC.

>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/15ba0b520043b884fc7dafbb84da171072d7d3ee/

Xtensa toolchain issue:

   Error: operand 2 of 'l32r' has out of range value '4294705124'

Max? This is affecting only OpenCV, maybe we should simply exclude it
from the Xtensa build?

>          arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/4edecf424246204aa68c9670b4950bafcf8fe973/

Glib auto-detection... ()
[...]
cannot find -ldl

Julien?

Note that the build-end.log is very very large, for some reason. I
recommend you to download it with wget, and look at it with less/cat,
instead of your web browser.

>         mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/1f4eee3423650651ac37f55dafed269c6d9baa98/

MIPS problem:

   fatal error: gnu/lib-names-o32_soft.h: No such file or directory

Vicente, can you comment?

>      aarch64 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/0ee0f879e8563954c64b3940cdec39d2e6de937a/

Julien, any idea?

cp -dpf /home/test/autobuild/instance-2/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libqgsttools*.so.* /home/test/autobuild/instance-2/output/target/usr/lib
cp: cannot stat `/home/test/autobuild/instance-2/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libqgsttools*.so.*': No such file or directory

>      powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/10a976146373d3cfd8c218b56a4288478a8e498b/

checking for /home/buildbot/buildroot-test/instance-1/output/host/usr/bin/powerpc-linux-gcc option to accept ISO C99... unsupported
configure: error: SETools requires a C99-compliant C compiler to build.

Weird, this compiler is gcc 4.9...

Clayton?

>         mips |                    squid-3.5.6 | NOK | http://autobuild.buildroot.net/results/cecb968172cb00281e439566e5ae154538435a51/

Fixed by:

   http://git.buildroot.net/buildroot/commit/?id=e911e95df40dd5a93ec5876c08088790ef20244a

>        sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/88ef5155c94621a927b7a4c599b96190d29320ad/

sigbus.c:(.text.sigbus_pop+0x94): undefined reference to `__sync_bool_compare_and_swap_4'
sigbus.c:(.text.sigbus_pop+0xac): undefined reference to `__sync_fetch_and_sub_4'

SPARC atomic issue...

>       x86_64 |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/b92c4f1090a937f1005cdc1c92dd22e19ffe8080/

musl build issue:

error: expected '=', ',', ';', 'asm' or '__attribute__' before '__P'

>          arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/672a09204ddb0b92f4aa2765a993862edaf2104f/

checking for GLES2/gl2.h... yes
checking whether to use OpenGL ES 2 support... configure: error: Cannot enable OpenGL ES 2 support without EGL enabled.
make: *** [/home/test/autobuild/instance-2/output/build/webkitgtk24-2.4.9/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-2/buildroot'

Gustavo, can you have a look?

>       xtensa |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/5d2cdc27418fdf392ec572c388cbb6301b1eb4a5/

  CC       protocol/desktop_shell_la-desktop-shell-protocol.lo
src/compositor-rdp.c: In function 'rdp_peer_init':
src/compositor-rdp.c:1109:10: error: 'rdpSettings' has no member named 'SurfaceFrameMarkerEnabled'
  settings->SurfaceFrameMarkerEnabled = TRUE;
          ^

Yann, can you have a look?

>         sh4a |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/73f9c94178b7f4e2f2f183e51cf39d18046a8c36/

  CC       dri2ext.lo
dri2.c: In function 'dri2_probe_driver_name':
dri2.c:1434:9: error: unknown type name 'drmVersionPtr'
dri2.c:1434:9: warning: implicit declaration of function 'drmGetVersion' [-Wimplicit-function-declaration]
dri2.c:1434:9: warning: nested extern declaration of 'drmGetVersion' [-Wnested-externs]
dri2.c:1444:40: error: invalid type argument of '->' (have 'int')
dri2.c:1444:55: error: invalid type argument of '->' (have 'int')
dri2.c:1445:9: warning: implicit declaration of function 'drmFreeVersion' [-Wimplicit-function-declaration]
dri2.c:1445:9: warning: nested extern declaration of 'drmFreeVersion' [-Wnested-externs]


>      aarch64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/4de40e0b87e39757c6b7a805a931525a0684f351/

  CC       dri2ext.lo
dri2.c: In function 'dri2_probe_driver_name':
dri2.c:1434:9: error: unknown type name 'drmVersionPtr'
         drmVersionPtr version = drmGetVersion(info->fd);

I guess both of these failures are related to the DRI patches posted by
Yann.

>          arc |                   zeromq-4.1.2 | NOK | http://autobuild.buildroot.net/results/be46b621ce5443788b0a1bc9fab614c4ca5d0859/

libsodium.so: undefined reference to `explicit_bzero'

Not sure. Alexey?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
