From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 14:28:54 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26
In-Reply-To: <20170227072848.7BD45207F5@mail.free-electrons.com>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
Message-ID: <20170227142854.34d3fb86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Waldemar, Dagg, Sam, Vlad, Peter, Frank, Samuel, see below, there are
some build issues for you :-)

Thanks!

On Mon, 27 Feb 2017 08:28:48 +0100 (CET), Thomas Petazzoni wrote:

>        nios2 |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/279dd731bd9ecf5f9d54bda3715caeaa7cbcdbb3
> microblazeel |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/55eb89f89e96b94a821778bc18ed844af08b7460

Perhaps this needs a commit like
https://git.buildroot.org/buildroot/commit/?id=f12a146f817c8ef07a7d41a31a5336b5ef6a96e8
but for nios2 and microblaze ?

Waldemar ?

>         bfin |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/10a06db5edb5243658bd16a41885a20f7b8c7e67
>        nios2 |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/40b6694bafd45a9249e80240b7dc88069fc94014
>         mips |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/01be357e6d56792371cfcc3f1bdc03b6e0d1c4be
>        nios2 |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/7482902ec65e68a5c1e47147d17a084857abdee1
> microblazeel |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/bc95760f71d99c7bdb5608cb213758ad827cfa40

These are all download issues following the revert to CMake 3.6.3.
sources.buildroot.net has now picked up the tarball, so those issues
will no longer occur.

>          arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/869e636a71c9574c0fad41cedf3d311f5f4ee8db

Still this problem with the odroid-mali OpenGL ES provider.

It's been there for ages. Dagg, could you have a look? If it doesn't
get resolved, we'll have to drop the odroid-mali package at some
point.

>       x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/393145bc9bcb93d6df55ec8c63725c3d9a299957
>       x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/60af583e52d9ff8efff1bc455e4f842721c5807c
>       x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/492aaf78f4d47d80bb813810a54121799a5c8d46

   Makefile:807: recipe for target 'gdk-pixbuf-loaders' failed

at installation time. It only happens with that specific x86-64
toolchain: http://autobuild.buildroot.net/?reason=librsvg-2.40.16.

Could you be something like the host is x86-64/glibc and the target is
x86-64/glibc, and it confuses something?

>  powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/caba78cc2706accc187a428364c0e0d10a1dcd60

Missing -fPIC apparently. Sam?

>          arc |           linux-headers-4.9.13 | NOK | http://autobuild.buildroot.net/results/803453df521f258932baf5729d5afe2a084121fb

Download issue.

>          arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/7d70b62ad996830fbeca46dffcc7a1dc030e575d

Lacks a -lpthread apparently:

/home/peko/autobuild/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-snps-linux-uclibc/6.2.1/../../../../arc-snps-linux-uclibc/bin/ld: libthread.a(Thread.o): undefined reference to symbol 'pthread_create'
/home/peko/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/lib/libpthread.so.0: error adding symbols: DSO missing from command line

but the configure script fails to detect thread support:

checking for the pthreads library -lpthread... no

Aah, they test if the compiler defines _REENTRANT:

conftest.c:15:26: error: #error "_REENTRANT must be defined"
 #                        error "_REENTRANT must be defined"

and I know some architectures forget to do so.

I already reported this bug to gcc upstream:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71749

Vlad, could you have a look into this? We have
package/gcc/6.3.0/895-bfin-define-REENTRANT.patch for Blackfin in the
tree, but we don't have the corresponding patch for ARC.

>         or1k |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/47207dfd10ff6e5ec4ccdcf8454aaf5f408ad1e3
>         or1k |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c165c47f45f1e5488e718770c06993d30f32f8e4

Would be fixed by https://patchwork.ozlabs.org/patch/732625/.

>          arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/fb677a917545adee321bdcd2c2519c81326448c4

../video/out/filter_kernels.c: In function 'jinc':
../video/out/filter_kernels.c:318:18: error: implicit declaration of function 'j1' [-Werror=implicit-function-declaration]
     return 2.0 * j1(x) / x;

Vlad, this is only occurring on ARC, could you have a look?

>          arm |         qt5quickcontrols-5.8.0 | NOK | http://autobuild.buildroot.net/results/1ff3e9ad4ba518d0a37f9fc12038bf9020f28094

Was supposed to be fixed by
https://git.buildroot.org/buildroot/commit/?id=e482ebf51d9e8e00c3e58eb65af0dfb70d05d8cc,
but it isn't. Peter (Seiderer), could you have a look ?

>         i686 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/92f9a6b804072a521ad0b25086a0a5ed33eaf53e
>          arc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a04ba24c6cd61bf6f2128a0e869f679cb3f2eac3

Static linking issues, with a CMake based package. Frank, Samuel, could
you have a look?

>       xtensa |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/dfd568ed7eb945cd5e3b53a9c1baa3021049fb82
>          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/c87376d08656e1528fc45cfbef536ac2072d926c
>          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/78053a5b1954433aeb52fd9cc55cd8ecbe84e7f1
> microblazeel |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/b58156dd7fbf0842311e60cfb18163772557e33e
>       mipsel |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/38bb7f09f5b37aac7f536feca45cf6d2a8d50eed
>         i586 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/d26b76534c3ef3cd98459f27ac06048fd6f075eb
>          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/fc853251d8b3aee5289994f996bb6e47d0e5fb76
>       x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/36c28e7e49b31ed2398a67db2e9b08e3aad5a3ee

Some of these are the ncurses problem, fixed by
https://git.buildroot.org/buildroot/commit/?id=0c5946acc24a36f9dff079edd054d948c69434f6.

Some of the others are related to openssl, are not fixed and remain to
be investigated.

>          arc |                      xterm-327 | NOK | http://autobuild.buildroot.net/results/28a92049a6ceef005787c5779f77ecf3fe8ad642

The ARC uClibc doesn't implement getpt(), according to Yann, so we need
to exclude this package with the ARC external toolchain.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
