From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 7 Nov 2016 09:48:01 +1100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-05
In-Reply-To: <20161106150623.2b7fd549@free-electrons.com>
References: <20161106073024.E75F820798@mail.free-electrons.com>
 <20161106150623.2b7fd549@free-electrons.com>
Message-ID: <20161106224801.GA2354@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 06, 2016 at 03:06:23PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> OK, -rc1 is released, so it's time to look at the build failures. Even
> though most developers should now be receiving direct e-mails, I guess
> it's still good to summarize where we are.
> 
> On Sun,  6 Nov 2016 08:30:24 +0100 (CET), Thomas Petazzoni wrote:
> 
> >  powerpc64le |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/70659eead71faa82ccfd0016d04caed134707c24
> 
> Forgets to link with -ldl ?
> 
> Sam, care to have a look?

I'll take a look.

> >       x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/d76ce1a3c863a72a420887e801a6b11757f88f7d
> 
> libgcrypt/libgpg-error issue, but apparently not static linking
> related. I think we've had this one for a while. Anyone to have a look?
> 
> >    powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/eb2722d0d771e828697a4a7eb3e64663e1b19fb6
> 
> PowerPC64 support in Go is not good, I propose to disable it since we
> didn't get any feedback from Geoff.

Just a note here: From that thread I posted earlier, Go is supporting
powerpc64le (which is reasonable given that it's likely what everyone is
using from Power 8 onwards) fairly well, it's just big endian that's not
working. I tested a build of docker-containerd on little endian and it
worked fine.

> >  powerpc64le |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/fee300664d4d76186e4e2378e397ae3054dc6549
> 
> undefined reference to symbol 'XRenderCreatePicture'
> 
> Sam?

Sure.

> >  powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/4417992db8cfc44c8fddec30fc9bb1fb66fdd63d
> 
> main.o: In function `cleanup_main':
> main.c:(.text+0x90): undefined reference to `GC_get_heap_size'
> main.c:(.text+0x9c): undefined reference to `GC_get_total_bytes'
> 
> Sam ? :-)

Yes... maybe I'll see if I can get some of my collegues to pitch in too.

> >         bfin |                       icu-57.1 | NOK | http://autobuild.buildroot.net/results/9e84fb1a9188ee21917617ba328cabdf699138fa
> 
> LINKER BUG: .rofixup section size mismatch
> 
> Waldemar, this is with the mainline Blackfin toolchain. Could you have
> a look?
> 
> >         i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/6ec458f5d2903ef36c4db5217a352352f985d9db
> 
> musl/SSP issue. I remember having a look at it a while ago, but I
> forgot everything :-/
> 
> Anyone interested to investigate? IIRC it wasn't that trivial.
> 
> >         i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/325a50d15e1836b31df4e84ba83b296abfb73041
> 
> init.c:22:18: fatal error: fenv.h: No such file or directory
> 
> Weird. <fenv.h> used to be available on i686. Waldemar, anything
> changed in uClibc in that regard?
> 
> >         i586 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/52c02c68be6c0b3e907f7ed645bd2d18476ec4f3
> >    powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/16836c02f4d1ab5df6b2e21a4fcdbbf4a7542f22
> >         i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/59bf37066fa6433039f957c2dd328215f661328e
> >         i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/96bbc04db65be1d67cc2cc13566f69f5b475305e
> >         i586 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/28334ebccee943b78bab5f7f0c2a71a8e86e43d4
> 
> I've fixed all of these already.
> 
> >          arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/bae83d495b46efeec45c8008949c811b6241adaa
> 
> Binutils 2.27 bug, I've pushed 7027bf022b9c9d488d53e3168af1cf16c6e41a0c
> that contains a patch to fix it.
> 
> >          arc |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/a5c040512a3534b3f988888c2c5da3ae6601c10d
> 
> BFD (GNU Binutils) 2.27.51.20160928 assertion fail arc-got.h:467
> 
> ARC toolchain issue. Alexey?
> 
> >     mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/47e611036be12844ebca093ddd8fe95c326c6056
> 
> Fixed by 7c670327d3f2a21b219509e2102c980d1856d20c.
> 
> >        sparc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/4013d8a6f0222189bb6bb632a797c98fa4c5fd52
> 
> Needs sync 4 bytes dependency.
> 
> > microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/bac8aef2c50871cd0e4310f4c172f7f8c905175b
> 
> Compiler locked into an infinite loop, avoided by
> https://patchwork.ozlabs.org/patch/691569/.
> 
> >       mipsel |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/d25fee7f1ff1b56cc4a627a7e4b3ca005c6671e5
> 
>   GEN      wayland-drm-server-protocol.h
> /bin/bash: /usr/bin/wayland-scanner: No such file or directory
> make[4]: /bin/bash: /usr/bin/wayland-scanner: No such 
> make[4]: *** Waiting for unfinished jobs....
> 
> Bernd, Yann, care to have a look?
> 
> >  powerpc64le |                  mpg123-1.23.8 | NOK | http://autobuild.buildroot.net/results/6f4e373fdf3c08433ab0ac18c7db500974acf11f
> 
> Yet another link failure on PowerPC64. I'm wondering if there's
> anything special about PowerPC64 in terms of linking constraints, as we
> have numerous similar linkissues.

I'll check this one too. Several similar link failures have been caused
by old versions of autotools that don't recognize powerpc64le at all.
It's not obvious from the build failure log because the way configure
fails causes linking to fail during the build, rather than anything
obvious during the configure step.

> >          arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/1f18175bbf8c182256420257ddf8eac91d9d8e6e
> >      powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/771d7686fa1d575011c26bdb48cfe5e4a05054d5
> >         m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b9b39289fef069664a9f202b3f1aeaf28ee43916
> >          arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0085ca6f7ba43d43c81865ef9ac79ab956ea14bd
> 
> Atomic related issues. I need to review/investigate Gustavo's patch.
> 
> >      sparc64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/a1b2ff0385701fba85edfacf663896d8dbc8de09
> >     mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3746f6438bc6df349b709fe0ea6e6bbe72e40c96
> >          arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/ce7bc29a60dadefa9a1e76588b6cd117b9b438d3
> >         i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/b0ae167ed73731a500b3a689369ecee569280f3d
> >          arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/72cc7172fad6f886aef307b353775689784feca3
> >          arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3ee0f8d998507086dc94cc06b66dc7aaea51199a
> >     mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/e7b07b8f84431664ab1c327b42d4ec508f377bd9
> >         bfin | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/df8500280736379c054585cf62980fb4dfeb66d2
> >         i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/6c1efbfb8bdc6b68b4e2ac3cc58d736125ae0dbb
> >         i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/404690a4f8b42f773c50eea834181bae0185c550
> >      sparc64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/d2e66e873fc242f87882f944abdc31a0e5243488
> >          arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/5a8d3f0e540e6123c30b4dac8832a74808e4c1e7
> >     mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/d8803422d86908b24731fff613a05ea0d40f9269
> >          arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/8e9fb71362f81fec605328bc32c4ded1376de5d4
> 
> Regressions caused by a patch from Vicente. Vicente, can you have a
> look?
> 
> >          arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/d0d22727311d6300e0e400728126170407bfd699
> 
> Static linking issue in a CMake based project. Samuel, this one is for
> you! :-)
> 
> >         bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/8326f24511d3b109d22a76660adc017bbcaca197
> 
> Waldemar, this is a compiler segfault, on mainline gcc for Blackfin.
> Anything we can do?
> 
> >          arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/671f4be5343de56185088e84e0878746e8092eca
> >          arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/fbb01a3a9afb8ab40cf54024b81b1fbcc811573e
> >          arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/fae7a41d110ed6c4d62c77873229d069d8b65986
> 
> Fixed by 271756da6749a2d88ca9744cb56f25a8c822123e.
> 
> >          arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/4eeb4702707366ad3d7b37249121bbeb3ba9b7a4
> >       x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/383ea3cbbb295614c2bd9ce1622b0cf787130878
> 
> Musl build issue. Yegor, could you have a look?
> 
> >       x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/3db1ba5a4735b2cd2eb545cb0ba48fbf8eee2342
> >       x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/b277e668d9e22b624416bf46f6ccba802acd257e
> 
> Musl build issues. Anyone to investigate?
> 
> >      powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1ae000dbaa7b6a508be716d2cde85fc8b62b16d0
> >       xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/bd9b007493b54d67e6553a128d371e72dee9c752
> 
> cannot find -lGL
> 
> Not sure what's going on. Bernd, perhaps, you could have a look?
> 
> >         i686 |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/7f152e2255f8d2cf9378812998fe9a239319c116
> 
> selector.o: In function `sel_get_monotonic_time':
> selector.c:(.text+0xd05): undefined reference to `clock_gettime'
> 
> Forgets to link with librt.
> 
> >       x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/386000654c683622af0f719f913798260cb0a905
> >        nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/e890597c7f2f9640bbfac4ff411e00df60bf9137
> >       x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/6a6da51114c7735a3174d01af270effda94f18e2
> >         i686 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/ac5804458093842d7fb1b22ca3b666ef288aff53
> >       xtensa | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/e8c3e52f6bf85cf1d2d7474a1531ca30d1ec6aef
> 
> Under investigation by Yann/Romain.
> 
> >          arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/589616dd9dcf85b5e37bca7fbea6e6f4db82fea0
> >     mips64el |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/21bbc3fe31264b719b69b8cdd7f638a01dbab07b
> >          arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/1a056b227747720233953647c81b6b690342b435
> 
> Those first three are: cannot find -lGL. Bernd, could you have a look?
> 
> >          arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/cb1f817055c2c40b5c528198697515357c8b1261
> 
> {standard input}: Assembler messages:
> {standard input}:439: Error: operand out of range (-260 is not between -256 and 255)
> 
> ARC toolchain issue. Alexey, could you have a look?
> 
> >          arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/6ec75cc176e05bfc6287dc54fa1a53e0ffc0521d
> >          arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/86c15acd9a1bc112e4f6566e2e41ca90ed2eb61c
> 
> cc1plus: error: unrecognized argument in option '-mcpu=native'
> 
> Bernd?
> 
> >       x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/42a7967593cbd00a88700c1f8e800ed2c4ac2192
> 
> Musl build issue. I'm tempted to disable this package on musl
> completely, unless anyone is interested in investigating those problems.
> 
> >         m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/02f9fc5884d3a7d460b96937183362d6c3fc6fde
> 
> Link issue. Waldemar?
> 
> Thomas
