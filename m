From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 09:48:14 +0100
Subject: [Buildroot] Analysis of build results for 2017-03-04
In-Reply-To: <20170305072847.53355206EF@mail.free-electrons.com>
References: <20170305072847.53355206EF@mail.free-electrons.com>
Message-ID: <20170305094814.7fd9ae85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Mar 2017 08:28:47 +0100 (CET), Thomas Petazzoni wrote:

>       x86_64 |                    cmake-3.7.2 | NOK | http://autobuild.buildroot.net/results/f30228e1885e7292957528158d0fb74cb51e2330

Not sure:

[ 77%] Building CXX object Source/CMakeFiles/CPackLib.dir/CPack/IFW/cmCPackIFWInstaller.cxx.o
/home/test/autobuild/run/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so: undefined reference to `libssh2_scp_recv2'
/home/test/autobuild/run/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so: undefined reference to `libssh2_session_handshake'

Samuel, Yann, Vicente?

>          arc |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/7f127655ffeb45b8f49616a1ed16bb184d9d7abf

/home/test/autobuild/run/instance-2/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(loadmsgcat.o): In function `_nl_load_domain':
loadmsgcat.c:(.text+0x36): undefined reference to `pthread_mutex_lock'
loadmsgcat.c:(.text+0xfc): undefined reference to `pthread_mutex_unlock'

That's the usual deal of libintl using pthread functions, which causes
issues in static linking scenarios. There was this story that glibc
provides dummy pthread functions in libc, and the real ones in
libpthread, so that if you don't link with pthread, you don't use the
slow thread-aware versions.

But since static linking is only with musl/uclibc anyway, and they now
all use a single-library approach that doesn't matter. I guess this
error still occurs because the ARC pre-built toolchain uses a uClibc
version that predates the merge-them-all-into-libc change.

Waldemar, do you confirm ?

>       x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/8ebdf97b0aa6c0bce9386147a50b1299d68e57bf

x86/hyperv_clock.c: Assembler messages:
x86/hyperv_clock.c:21: Error: no instruction mnemonic suffix given and no register operands; can't size instruction

Has been there for a while, nobody fixed it.

>       x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/ce545da1d74830d4487c4cf6d757746f3858d22a

undefined reference to `std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> 

Bernd, could you have a look ?

>          arc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/9d34304bd3027a7d9fcbdef03b4d89d394bee3c4

checking for EGL... no
configure: error: Package requirements (egl) were not met:

We have mesa3d as the libgl provider:

BR2_PACKAGE_PROVIDES_LIBGL="mesa3d"

But no EGL implementation indeed. This error is weird, because we
explicitly disabled EGL support by passing --disable-egl --enable-glx
to the configure script.

Gustavo, could you have a look?

>         i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/869069dafda5ef4ab2b9f03ec18d4111ed69eb8f

loader/ldt_keeper.o: In function `Setup_LDT_Keeper':
ldt_keeper.c:(.text+0xab): undefined reference to `modify_ldt'
collect2: error: ld returned 1 exit status

Seems like a weird musl related issue. Bernd, maybe?

> microblazeel |                     putty-0.68 | NOK | http://autobuild.buildroot.net/results/0e3f4306513b79306d43338eced890205632c395

Needs wchar, I've submitted http://patchwork.ozlabs.org/patch/735342/.

>       xtensa |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/b66f8fbce3a5127b69a09bdc91a460a3c107e29d
>  powerpc64le |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/c7d34c0b2f7f802095712391565a738e2636dd01
>      aarch64 |         python-cherrypy-10.1.1 | NOK | http://autobuild.buildroot.net/results/0a4fa02e1ca895a683141439830bd78e6b081187
>          arm |         python-enum-legal-info | NOK | http://autobuild.buildroot.net/results/a4b3e734f2e6e3839a2b3c414e544d5b22b35948
>     mips64el |         python-enum-legal-info | NOK | http://autobuild.buildroot.net/results/9509c7074a365cbd37993829ab24428ee9248a6a
>          arm |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/2018921bc9fe7dc9bc704a508698d314a2a9f0b6
>       x86_64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/0ae046c326c3eb7389f51b5e89a5ff29b5fde307
>     mips64el |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/27e1c6cdf330bd2009bf8895d8c72a7c4f5186af
>      powerpc |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/1daee127ed3ec6bd7d6c75591036bc2e775e629d
>          sh4 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/0a1ff8d28a0b6e25f45c6ca5c469223ec799351f
>         sh4a |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/e689228aafc0e7a5ac61d670342511efd1606526
>      sparc64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/fa29e8f30ef0cc10ffe7c2d0883ffaf810e32977
>          arm |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/26aedb813fe0ebf5f2d5075c4e1f157e7d539d9d
>       x86_64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/530dd7515634f321e183d079ac46947e2a275289
>      aarch64 |           python-pyasn-1.6.0b1 | NOK | http://autobuild.buildroot.net/results/d10d278cf42de0fa5ae73c0c4baebe72eac476c8
>         sh4a |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/e4209a2209bba769c264f8c4c6dfe2995443c243
>      powerpc |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/25cf9c046e5a2c8fec9125c22caeb80371b7db30
>         or1k |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/8120fca07bbd8ca660e33f66bd86f2d079f9a407
>          arm |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/bda5d2adde1249b79ae49acdffdd055cb1351775
>         i686 |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/c7608b2eee963258c8ac9ab2bed28d91a295c00c
>         sh4a |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/64874290293b687c0b4a07eb603184feaf84f54c
>          arm |       python-pytrie-legal-info | NOK | http://autobuild.buildroot.net/results/1cbe77eed024b2018e9249e8eaeeca989324e861

I've reverted the problematic commits for these.

>         i686 |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/a5de9a203b453a34f54c0370c3d493d86d090d52

Waldemar submitted http://patchwork.ozlabs.org/patch/735365/ to fix
this.

> microblazeel |                 wayland-1.13.0 | NOK | http://autobuild.buildroot.net/results/291e0f1ea18004190ae5acd9bec147cacc3e4bda

Reported to Gustavo already: Wayland normally doesn't need C++, except
to build one of its tests.

>         or1k | x264-97eaef2ab82a46d13ea5e0... | NOK | http://autobuild.buildroot.net/results/f366d80bf02df068639b2b967d045cedd365a8e5

I've submitted http://patchwork.ozlabs.org/patch/735286/ to fix this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
