From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Nov 2013 09:51:10 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131129073003.AF5B01014F0@stock.ovh.net>
References: <20131129073003.AF5B01014F0@stock.ovh.net>
Message-ID: <20131129095110.3c7fc674@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is probably the last day (or last two days) to fix more
autobuilder failures.

On Fri, 29 Nov 2013 08:30:03 +0100 (CET), Thomas Petazzoni wrote:

>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/637e19310ab85c1982319a0f60e9f5643fc3ff1e/

alsa-lib need dynamic library loading, this is being handled by the
Blackfin people, if I remember correctly.

>        arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/260cac5c54e03224fe90f4c5828b97748903eb10/

Not sure what's going on here:

/home/test/test/1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(jmp-unwind.os): In function `_longjmp_unwind':
jmp-unwind.c:(.text+0x24): dangerous relocation: unsupported relocation
collect2: ld returned 1 exit status

>        sh4 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/a1ac6bb5d6f38c37c18df5ede67abd562b004073/

Don't know:

In file included from cairo-xlib-private.h:41:0,
                 from cairo-xlib-display.c:40:
cairo-xlib-xrender-private.h:102:16: error: redefinition of 'struct _XLinearGradient'
In file included from cairo-xlib-xrender.h:45:0,
                 from cairo-xlib-xrender-private.h:53,
                 from cairo-xlib-private.h:41,
                 from cairo-xlib-display.c:40:
/home/test/test/1/output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/include/X11/extensions/Xrender.h:186:16: note: originally defined here
In file included from cairo-xlib-private.h:41:0,
                 from cairo-xlib-display.c:40:
cairo-xlib-xrender-private.h:105:3: error: conflicting types for 'XLinearGradient'

>       bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/8aa814b0eab38809b5614578f18359588db78ffa/

DirectFB using the dynamic library loader. I had a quick look at that
one yesterday, and it seems like DirectFB has some conditionals to not
use dynamic library loading when not available, but it doesn't seem to
work completely:

In file included from ../../../../../lib/direct/os/types.h:43,
                 from ../../../../../lib/direct/os/clock.h:32,
                 from ../../../../../lib/direct/clock.h:32,
                 from clock.c:34:
../../../../../lib/direct/os/linux/glibc/types.h:110:19: error: dlfcn.h: No such file or directory

>       bfin | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/5b6dd72f2599ef073a834359326af36350d9c09b/

libfdt cannot build as a static library, I believe.

>       bfin |                    hostapd-2.0 | NOK | http://autobuild.buildroot.net/results/d4a9f44effeb08eda6c4b32764274ae81d185d5e/

Missing pthread in the link command line?

/home/test/test/1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libnl-3.a(cache_mngt.o): In function `_nl_cache_mngt_unprovide':
cache_mngt.c:(.text+0x6e): undefined reference to `_pthread_rwlock_wrlock'
cache_mngt.c:(.text+0x10a): undefined reference to `_pthread_rwlock_unlock'

>      avr32 |                     libev-4.11 | NOK | http://autobuild.buildroot.net/results/38704a4362ab6c3458c45603975b274937059fa9/

Simon has already sent a fix for that one: missing propagation of libev
architecture dependencies.

>        arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/15cfb974e428b20ba230321cd8b59a82308785af/

This one is already being discussed on the list, and has been reported
upstream I believe:

  CC     evas_cache2.lo
evas_cache2.c: In function '_evas_cache_image_entry_delete':
evas_cache2.c:176:17: error: 'Image_Entry_Flags' has no member named 'delete_me'
evas_cache2.c:181:18: error: 'Image_Entry_Flags' has no member named 'delete_me'
evas_cache2.c: In function '_evas_cache2_image_preloaded_cb':
evas_cache2.c:296:13: error: 'Image_Entry_Flags' has no member named 'preload_done'
evas_cache2.c:303:23: error: 'Image_Entry_Flags' has no member named 'delete_me'
evas_cache2.c:308:17: error: 'Image_Entry_Flags' has no member named 'delete_me'
evas_cache2.c: In function '_evas_cache2_image_entry_preload_add':
evas_cache2.c:317:17: error: 'Image_Entry_Flags' has no member named 'preload_done'
make[5]: *** [evas_cache2.lo] Error 1


>     xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/250339438786d77e757759c7da76df944d8fd560/

Fixed by http://git.buildroot.net/buildroot/commit/?id=354cab0ee8c7c7813d7c7d69d5a699f234443c0b.

>        arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b4b69cb385551b912894b8b81c8d9e8d689c75fe/

That's a Thumb2/sysroot issue I have investigated already, I have some
ideas to fix it, but it's not that simple.

>     xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/165b1c2f96c60f88890e6e7d85f7b5875f0cb788/

Same as before, fixed by
http://git.buildroot.net/buildroot/commit/?id=354cab0ee8c7c7813d7c7d69d5a699f234443c0b.

>      avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/a4a1d1f936d8414acb297c7619e224b9f05d6c36/
>      avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/38fa81315be448c409b9af29f92621fcf5676f71/

Missing syscalls. Probably we want to disable libpfm4 on AVR32,
especially since it's only used to build OProfile on PowerPC.

>      nios2 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/0ae3a53a1a6e870ee1bf2a902a400893339777df/

Fixed by http://git.buildroot.net/buildroot/commit/?id=9402eef6e24b51da750f0852e16cd92ffc65f2a7.

> microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/e0ef522ac074f6f5601d23d380aa94489ca1f4ef/

Will be fixed after the release by bumping the compiler.

>        arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/efe26c54361094fb1e201da6915900cd9b24d596/

The EGL functionality test failed!
 EGL is required for OpenGL ES to manage contexts & surfaces.
 You might need to modify the include and library search paths by editing
 QMAKE_INCDIR_EGL, QMAKE_LIBDIR_EGL and QMAKE_LIBS_EGL in
 /scratch/peko/build/qt-4.8.5/mkspecs/qws/linux-arm-g++.
make: *** [/scratch/peko/build/qt-4.8.5/.stamp_configured] Error 1

OpenGL implementation is the RPi one.

>        arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/c30a078c646af0839039fa71e0bd1d7114970b0b/

The locale issue, with the weird usage of target headers when building
host tools.

>        arc |                ruby-1.9.3-p484 | NOK | http://autobuild.buildroot.net/results/a1fd72919035a6dc38c68831c899cf3464fa2cc7/

Compiler issue, will be fixed after the release by bumping the compiler.

>   mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/1895d54e75cd7864ed4adf17b9ce6f09589738cc/
>        arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/36c4148cc9649c44057b2d0b2b0168692ef530ea/
>    aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d34c7429f60a28f4b2dc7ce1783ce2a6a36fe4cd/

Autobuilder scripts issue, please ignore.

>       bfin |              xlib_libX11-1.5.0 | NOK | http://autobuild.buildroot.net/results/d5f6e444f630a2ba612fb234496872a1e2e714a4/

CrGlCur.c:43:19: error: dlfcn.h: No such file or directory
CrGlCur.c: In function 'open_library':
CrGlCur.c:74: warning: implicit declaration of function 'dlopen'
CrGlCur.c:74: warning: nested extern declaration of 'dlopen'
CrGlCur.c:74: error: 'RTLD_LAZY' undeclared (first use in this function)
CrGlCur.c:74: error: (Each undeclared identifier is reported only once
CrGlCur.c:74: error: for each function it appears in.)

>        arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/7cf107566da47670bc8ef6d16c5e1bb7bcccef3e/

Build machine issue?

  CXX    libzmq_la-encoder.lo
/scratch/peko/host/usr/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/cc1plus: error while loading shared libraries: libc.so.6: failed to map segment from shared object: Cannot allocate memory
make[3]: *** [libzmq_la-decoder.lo] Error 1
make[3]: *** Waiting for unfinished jobs....

Is that reproducible?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
