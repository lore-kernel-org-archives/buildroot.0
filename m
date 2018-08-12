From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 22:36:29 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-11
In-Reply-To: <20180812060015.A385B207E5@mail.bootlin.com>
References: <20180812060015.A385B207E5@mail.bootlin.com>
Message-ID: <20180812223629.2bac8ebe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Matt, Hollis, Romain, J?rg, Bernd, there are some questions for you
below.

On Sun, 12 Aug 2018 08:00:15 +0200 (CEST), Thomas Petazzoni wrote:

>      powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/87e82a5e8d0b1c1ff10ec3e59d25bcd56b329075 |     

Seems like some PowerPC Altivec code gets used even when Altivec is not
available, or something like that:

  CC       libaircrack_crypto_ppc_altivec_la-sha1-git.lo
memory.c:1:0: warning: -mvsx requires hardware floating point [enabled by default]
  CC       libaircrack_crypto_ppc_altivec_la-simd-intrinsics.lo
sha1-git.c:1:0: warning: -mvsx requires hardware floating point [enabled by default]
  CC       libaircrack_crypto_ppc_altivec_la-wpapsk.lo
simd-intrinsics.c:1:0: warning: -mvsx requires hardware floating point [enabled by default]
simd-intrinsics.c:147:18: error: unknown type name 'vtype'
simd-intrinsics.c: In function 'dispatch':
simd-intrinsics.c:671:3: warning: implicit declaration of function 'SIMDmd5body' [-Wimplicit-function-declaration]
simd-intrinsics.c:671:16: error: 'vtype' undeclared (first use in this function)
simd-intrinsics.c:671:16: note: each undeclared identifier is reported only once for each function it appears in
simd-intrinsics.c:671:23: error: expected expression before ')' token
simd-intrinsics.c: At top level:
simd-intrinsics.c:905:18: error: unknown type name 'vtype'
simd-intrinsics.c:1386:19: error: unknown type name 'vtype'
simd-intrinsics.c:1928:21: error: unknown type name 'vtype'
simd-intrinsics.c:2547:21: error: unknown type name 'vtype'

Anybody with some PowerPC understanding to look into this ? Matt perhaps ?

>       x86_64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/43b9bccacd88397d732fda16d998fa7dc001f900 |     

Hollis: your autobuilder times out when downloading this package, could
you have a look ? See
http://autobuild.buildroot.net/?reason=azure-iot-sdk-c%.

>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9dfffc1dcedefc3c4baee412ae36ae297f15cdba |     
>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ea533448148a2728a3faecb9c67fae849f17e62b |     
>       xtensa |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/704d54409644e7e5ad0064029edc1b8020df1b80 |     
>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/81ae35780e16c5c458e06228da180cf2d83eadf7 |     
>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7049a7ef91a7984848a2bcf67df792ed4dbe785f |     
>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4f3ff822f0f057bef22c1a59deae429d544be29c |     
>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/71006378450b5687240c455a72b5cc314704b776 |     

Again this libboost_atomic issue.

>          arm |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/f46ef6123b5fa92753ff534b4ef7bea3f53ac388 |     

lib/luks2/luks2.h:86: error: redefinition of typedef 'json_object'
/scratch1/hblancha/build/buildroot-autobuild/instance-0/output/host/include/json-c/json_object.h:160: note: previous declaration of 'json_object' was here

Hollis, this is happening only on your autobuilder, could you have a
look: http://autobuild.buildroot.net/?reason=host-cryptsetup%.

>       x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/e48c974980b8228302a76ac5b6afad14e7ce81c1 |     

Same.

>       xtensa |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/34b8bb8824d369e5b53e2a4effd1a8d18df07aee |     

Hollis, once again your autobuilder timing out when downloading stuff:
http://autobuild.buildroot.net/?reason=linux-firmware%.

>        nios2 |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/276e07067ad630ce39b5e43d7e90cb8bd22a1925 |     


cc1: warnings being treated as errors
../py/objdict.c: In function 'dict_view_print':
../py/objdict.c:458: error: dereferencing pointer 'o' does break strict-aliasing rules
../py/objdict.c:457: error: dereferencing pointer 'o' does break strict-aliasing rules
../py/objdict.c:456: error: dereferencing pointer 'o' does break strict-aliasing rules
../py/objdict.c:455: error: dereferencing pointer 'o' does break strict-aliasing rules
../py/objdict.c:454: note: initialized from here
make[1]: *** [build/py/objdict.o] Error 1

Hollis, this also only happens on your autobuilder:
http://autobuild.buildroot.net/?reason=micropython%.

Do you have a Docker container with the RHEL6.5 so that other people
can reproduce those issues ?

>      powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/d63727755d671ef6ac484fe26a79793123976651 |     

iquant_intra.c: In function 'iquant_intra_m1_altivec':
iquant_intra.c:122:10: internal compiler error: Segmentation fault
     vsrc = vec_ld(offset, (signed short*)src);
     ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Someone needs to dig into gcc bug reports, test with a more recent gcc,
etc. Romain, this is usually your stuff :-)

>     mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/d8a7339d8bdd5cdc6bd1716585d4bcf15a2e8015 |     
>         mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/5af01895e0a58751ef342001bad5e17caf742b92 |     
>     mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/b9857a5b8b4bb6f8a47e78cc14ee1f81852f6867 |     

Fixed by
https://git.buildroot.org/buildroot/commit/?id=21f0507cc193469b8ba7fccc3fc07a2bbd12784b.

>          arm |                     owfs-3.2p1 | NOK | http://autobuild.buildroot.net/results/c30201b79b6e36df4bb14281036dcb23eda1edf6 |     

make[4]: Entering directory `/scratch1/hblancha/build/buildroot-autobuild/instance-0/output/build/owfs-3.2p1/src/man/man1'
/usr/bin/soelim -r -I ./.. owcapi.man > owcapi.1
/usr/bin/soelim: invalid option -- 'r'
usage: /usr/bin/soelim [ -vC ] [ -I file ] [ files ]
make[4]: *** [owcapi.1] Error 1

Hollis, this is again something that happens only on your build
machine: http://autobuild.buildroot.net/?reason=owfs%.

>          arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/ca3fe2e816ceeacb8218c0085bcb37413ef381c6 |     
>          arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/48b7ab85de68e1972853a10f5999f4240c5efd88 |     

Seems like
https://src.fedoraproject.org/rpms/python-qt5/c/47fb7fdc5d16582772f9c3fc8a6a674a41a7f605?branch=master
would fix it.

>          arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/60576363adfca404c3a7883d5d46e8a4a9ee8171 |     

checking for soxr_create in -lsoxr... no
configure: error: soxr support requested but libsoxr not found!
make[1]: *** [/home/peko/autobuild/instance-0/output/build/shairport-sync-3.2.1/.stamp_configured] Error 1

J?rg, this is your package, could you have a look ?

From a quick look at http://autobuild.buildroot.net/?reason=shairport%,
it seems to be happening since July 2.

>          arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/da246c496854a3cec1cb4be3589264abd6f2c6de |     

Scanning dependencies of target x265-shared
[ 97%] Linking CXX shared library libx265.so
ipfilter8.S.o: file not recognized: File truncated
collect2: error: ld returned 1 exit status
make[4]: *** [libx265.so.160] Error 1
make[3]: *** [CMakeFiles/x265-shared.dir/all] Error 2
make[3]: *** Waiting for unfinished jobs....

Bernd, this happened twice in recent times:
http://autobuild.buildroot.net/?reason=x265%. A parallel build issue
perhaps ?

>         m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/295710ddc7ac11a88a2e8986ad35ac1803c7fe12 |     

src/dish.cpp: In constructor 'zmq::dish_t::dish_t(zmq::ctx_t*, uint32_t, int)':
src/dish.cpp:49:1: internal compiler error: in connect_traces, at
dwarf2cfi.c:2752.

Another nice compiler failure. Romain ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
