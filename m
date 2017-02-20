From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 13:41:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <20170217211242.GC3470@free.fr>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
Message-ID: <20170220134111.1bc02a9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for doing this analysis. A few comments below.

On Fri, 17 Feb 2017 22:12:42 +0100, Yann E. MORIN wrote:

> On 2017-02-17 08:28 +0100, Thomas Petazzoni spake thusly:
> >         or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/cd963404761070623489ee74df3e69f5052f40a1
> >         or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/99e6e01f0d85fe8eb5d9b09fcc3971b577c9ba6b
> >         or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/e5b471dbb91ef2a15844a9ee6d1a83a38f7cc07d  
> 
>     error: 'printf' was not declared in this scope
> 
> Fabrice?

For this one and the jsoncpp-1.7.7 you reported below, what I find
weird is that they happen *only* on or1k. or1k is using gcc 5.x, and
lots of other architectures are using gcc 5.x.

So I would *really* like to understand why we get those alljoyn and
jsoncpp failures specifically on or1k and not on other architectures.

> >         i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/bd4cca6e7706a68dd6c16a7bb409185c9f006a57
> >         m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/4118477ac02732b99b8bb3db8bef43290edbc5de  
> 
> Neither mbedtls nor poarslsl detected. Patches by J?rg on the list (in
> this order):
>     https://patchwork.ozlabs.org/patch/728005/
>     https://patchwork.ozlabs.org/patch/728007/
>     https://patchwork.ozlabs.org/patch/728004/
>     https://patchwork.ozlabs.org/patch/728006/

I'll apply.

> >         or1k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/81047e13f4d7896abae1036e098303e6bf68a0e7  
> 
>     error: 'strtoll' is not a member of 'std'
> 
> C+11 stuff... Jonathan?

Same or1k question as above: why does it happen only on or1k, and not
on other architectures?

> >          arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/fb14e37aaf453874d1c33e5ed73b9c751ace5ae3
> >          arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/774a8dd489760bc213ac7cf3e8040cee6a4e2437
> >          arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/80aba6b26a21914197388baf73ada4b79952db13
> >          arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a2bda0553eff5e415e622aa7a38763d838ae43c2  
> 
>     multiple definition of `_Unwind_Resume'
>     undefined reference to `pthread_cancel_init'
>     undefined reference to `__libgcc_s_resume'
> 
> Probably needs NPTL. James?

Nope, nope, all those issues were issues in uClibc-ng. Waldemar has
sent a patch, I applied it, and I'm currently rebuilding all the
pre-built toolchains.

> >         or1k |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/c24dd55e773167be182f40ae723e82d3f71c6eba  
> 
>     error: field 'uc_mcontext' has incomplete type
> 
> Some ucontext issue on or1k (see below, there are more)... Waldemar, Gustavo?

Waldemar has sent a uClibc-ng patch to fix this, I applied it, rebuild
of the toolchain in progress.

> >       x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/e7505f36d7c2cfaf7527515b2e3014c2e8e2c5ca  
> 
>     undefined reference to `std::__cxx11::basic_string<char,
>     std::char_traits<char>, std::allocator<char> >::basic_string
>     (std::__cxx11::basic_string<char, std::char_traits<char>,
>     std::allocator<char> >&&)@GLIBCXX_3.4.21'
> 
> Some ugly C++11 issue? Bernd?

This one has been there for a long time, since we bumped libcec to
4.0.2. I will revert the version bump in the next days if no fix is
proposed.

> >      aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/0a266f54e2938f7479232b7acec1834250f6c064  
> 
>     error: conflicting types for 'khronos_uint64_t'
> 
> Gustavo?

This one is more an odroid-mali bug:

BR2_PACKAGE_PROVIDES_LIBEGL="odroid-mali"
BR2_PACKAGE_PROVIDES_LIBGLES="odroid-mali"

I've already asked Dagg to have a look, but never had an answer.

> > microblazeel | make[4]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/92c165a970b9d8912c5ca50ed3567478cd2a2b3d  
> 
> Timeout, but weird: the ffmpeg build started at 3850 seconds (a bit more
> than one hour) and the timeout is supposed to be 8h, so the ffmpeg build
> did not finish after about 7h...

Perhaps an infinite loop in the compiler. Happens sometimes on complex
code such as ffmpeg, and not very widely used architectures such as
microblaze.

> >  powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/4ba59ebb2cd16ed7e70c67e89f5f80c5b803d3c3
> >    powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/b97341c59b9c6f7dbdfe59cd770e0c285be8fa06
> >  powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/741535d8d9c75acebeff96679d4f1ac6ecbc5f61  
> 
> Patch on the list:
>     https://patchwork.ozlabs.org/patch/706869/

The original fix from Sam has been applied by Peter.

> >         sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/2944568f9623f1377e987a1dadde5ea8cc428c5f  
> 
>     error: 'SIZE_MAX' was not declared in this scope
> 
> Missing header? Samuel?

This is the same issue as the one fixed for libraw in
d246cf5fd01bb0d20a0e64194ffed514ea8dd0aa. It's annoying that the issue
is in the jasper package, but we have to fix it in all packages using
jasper. Not sure what can be done about it though.

> >       x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/e9ff38bea523df79331de3004939ee39b446d723  
> 
>     error: narrowing conversion [...] from 'char' to 'uchar...'
> 
> Damn gcc6... ;-) Should be easy; any taker?

I had a quick look, it's not that trivial if you want the correct fix.
And of course, mysql 5.1.73 is very very old, upstream is now at 5.7.17
(https://dev.mysql.com/downloads/mysql/). So I would like to suggest
that we mark oracle-mysql as BR2_BROKEN, and wait to see if anyone is
interested to fix this during the next release cycle.

> >        nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/a02c4da118c2d0f90016c5e3c8877782d6882f96  
> 
>     ld: BFD (Sourcery CodeBench Lite 2016.11-32) 2.26.51 assertion fail
> 
> >        nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/116931f17c4eb4977638ca0392bd6024e05d4ff9  
> 
>     #error Target architecture was not detected as supported by
>     Double-Conversion.
> 
> No qt5 on nios2? 

For those two issues, we have an exception in the autobuilders:
https://git.buildroot.org/buildroot-test/tree/scripts/autobuild-run#n500.
It's just that the autobuild-run script is not up-to-date on all
machines.

> >          arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/41a0559f0d3c760ba9aad77dea4ed43e25b63ac4  
> 
>     Project ERROR: Library 'libpng' is not defined.
> 
> But it is enabled in the build. Dependency issue?

That's the freetype issue, patches from Peter Seiderer are on the list,
needs review.

> >          arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/8f55bdbdce189c14baed772bb74eb41a0f8ce83c  
> 
>     #error "ARM architecture too old"
> 
> arm920t is an armv4. Surely we would not expect something big as Qt5 to
> stil work on such an old beast...

Fix by Peter Korsgaard already.

> >      powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/1fd4195d3e941f4963a1957e4194b4e05e7bb909  
> 
>     ld: BFD (crosstool-NG hg+-c65fcf8a34b7) 2.24 assertion fail
> 
> Cyril, Gustavo, Sam: you're the PPC experts?

At some point, I will have to get rid of the Crosstool-NG toolchains I
believe.

> >       mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/48a78b16a63448e1ac91efa7ae0ca77b2b9dba49  
> 
>     Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v0,$t8,$t7'
> 
> Julien C., Peter S., Vicente?

This one is definitely for Vicente to look at.

> >       x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/28c76e4125134b729f99099c3a53c1dcc55d0f12
> >          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/558fd8acb31afd0a57c0c01020f73d9ee17a7bd9
> >          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/fd599fd32ceab165a4926044e42f543c03179dec
> >       xtensa |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/3bba96405442dd97bdecfdc7865e4e13927fd327
> >          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/7e96654503efcc79d386e13e23c21031738d493c
> >     mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/bd4c8eb1687713062e5b1ebbcde7f464c13779f1
> >       x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/59f8410ba54e6ebbd7b65fd36f6b192a11f1262a
> >      powerpc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/6ec46927ce16cf2b159805872ebef363c75e7551
> >          arc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8005ec840ac748970f6c4d49a3b5f1e2f1b69adc  
> 
>     configure: error:  You need to have ncurses forms library installed to
>     compile sngrep.
> 
> ncurses is disabled in this config. Adam?

ncurses is definitely enabled, so is ncurses-wchar.

> >          arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/2d31a3295e51c5866fedae4adb0aa464e5079987
> >          arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/e240455fc0bc6141988b5e1209f1a9b85b016361  
> 
> The wchar issue raised by Thomas upstream, which has a patch:
>     https://github.com/dbry/WavPack/commit/876fc3f3907e871d0938ac6c8c5252f5f31abd1f

I think J?rg has submitted a patch, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
