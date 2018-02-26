From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 11:33:19 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <20180226070010.28C8620727@mail.bootlin.com>
References: <20180226070010.28C8620727@mail.bootlin.com>
Message-ID: <20180226113319.7e3bcf6b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We're almost at the end of the month, and therefore almost at the
final 2018.02, which will be a LTS. I believe it is a good opportunity
to make a final effort to resolve the remaining build failures. See
below for an analysis.

Romain, Johan, Frank, Eric, Mahyar, Bernd, Guillermo, Pierre, Waldemar,
there are questions for you below. Thanks!

On Mon, 26 Feb 2018 08:00:10 +0100 (CET), Thomas Petazzoni wrote:

>      powerpc |                binutils-2.29.1 | NOK | http://autobuild.buildroot.net/results/22839bca79e16fc0d76ebc0f3e5ec4a6d23e99f6 | ORPH

read.c: In function 's_app_line':
read.c:2001:1: internal compiler error: Segmentation fault
 s_app_line (int appline)

Compiler error. It's on PowerPC, with a toolchain from 2017.11. Could
someone retry with a newer gcc, and see if it is fixed ?

Also, is someone interested in adopting this package ? Romain, you have
done a fair bit of toolchain stuff lately, maybe you're interested in
adopting binutils ?

>         mips |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/f84ea17ee70bef3583a8e320fbfd63653d03b661 |     
>     mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/b5b5a7fc4d191bd7bcdc6a753a6ec5969bdd98d1 |     
>      aarch64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/5828c2face461d4f3e1e5a1ce198a13bc1e2b07f |     
>        nios2 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/2f8a661ff15ea797d1c03b7bc82cfd47159c9ef2 |     

Readline is now needed. We have a patch to add readline as a
dependency (https://patchwork.ozlabs.org/patch/860386/), but Baruch
(and me) asked to ask upstream about it, because it looked like a
possibly unintentional change. Since nobody investigated further, I
propose that we apply Bernd's patch adding the readline dependency. If
someone is unhappy with it, we can always revert when the problem is
fixed.

> microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/edd0809b0920fb99384f731b748c29eef3f26bd4 |     
>      powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/51f5ff6fdea5e466b231eb304f2906781417867a |     
> microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d082bf84191974c664805fc28288dc88c3dcf28a |     
>         m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/2514e27740f9f12a7a2766c7f8f08c0d3a2b6885 |     
>         bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/61c963cd3f1a9480b03731424995f9a972c9d090 |     
>         bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6e8ebe92e028236fc0b4e341e045dfead38d7f23 |    

All these are fixed by
https://git.buildroot.org/buildroot/commit/?id=a93a7afb817e09012b28b44d99d0af3d38001fff.
 
>          arc |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/49d3157248f9e73ea5bdee63569ccd7a5e0eb07f |     
>          arc |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/701a22aa4f594be09926ba5f5c599988ad832e16 |     

Fixed by
https://git.buildroot.org/buildroot/commit/?id=7bb17b10af531749192e067efd67a117f2bc8053

>      powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/45edf95c0c44c9d553879e0cbb771098d7c63aa1 |     
>          arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/a36d00407a371d70b4551a9717ebd6ff852c8bca |     

I propose that we make erlang depend on x86/x86_64 as host
architecture. Johan, Frank, are you OK ?

>          arm |           host-rust-bin-1.23.0 | NOK | http://autobuild.buildroot.net/results/03396b02b7932f08c0a89eb482a65e80c3cd021b |     

404 not found while downloding
https://static.rust-lang.org/dist/rust-std-1.23.0-armv7-unknown-linux-gnueabi.tar.xz.
Eric could you have a look ?

>      aarch64 |                  mesa3d-17.3.5 | NOK | http://autobuild.buildroot.net/results/a4d7c2720dbe7f6dd7111c507711dc23cc25b6cc |     

glsl/glsl_parser_extras.cpp: In function 'bool do_common_optimization(exec_list*, bool, bool, const gl_shader_compiler_options*, bool)':
glsl/glsl_parser_extras.cpp:2178:1: internal compiler error: Segmentation fault

Meh, a compiler failure. Bernd, could you test with various gcc
versions, and see if the problem has been fixed ?

>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ec4e7e975c2e8f978a771a1702933d0612e95a9c |     

I guess this is fixed by the old patches submitted by Bernd, which are
still in patchwork. I'm still not super happy about these patches,
though (as I already expressed as a reply to those patches).

>      aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/2ce2d9be9e0699114e3bc3c0434ba05f64741f89 |     

/home/buildroot/autobuild/run/instance-0/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:125:10: fatal error: X11/Xlib.h: No such file or directory
 #include <X11/Xlib.h>

Mahyar, since you added the mpv package, could you have a look ? Or
someone else ?

>       xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4a3cc5780c229a9d5d86543e68cd0819c8cabbd1 | ORPH
>       xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/bcf5e27a1e9f9eea2d1688445146df3c50a8919e | ORPH
>          arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/c363c6fdaecb5d9a9ebb6b8a0930c93df48ce42a | ORPH
>       xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3d933b4e9f7de29776e64229e87b7d57c5381212 | ORPH
>          arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d7a6ced35e42945795ac2adcdf581c4b368bd6a4 | ORPH
>      powerpc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/73108d7ff2ba10ec522c5a551bba54db357f95a8 | ORPH
> microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/e0c434001b5a2a30299af491a6be65f289e157f1 | ORPH

I have looked at all of them, but it seems like the issue is always:

/home/peko/autobuild/instance-2/output/build/php-7.2.2/ext/sockets/sockets.c:800:37: error: 'AI_IDN' undeclared (first use in this function)
  REGISTER_LONG_CONSTANT("AI_IDN",   AI_IDN,    CONST_CS | CONST_PERSISTENT);

AI_IDN is not available on uClibc (and apparently not in musl either).
So the simple fix is to add some dependencies on
BR2_PACKAGE_PHP_EXT_SOCKETS. The better fix is to introduce an autoconf
check, like is already done for AI_ALL. This is probably easy to do.

>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b0ff91d12a569ae9f6a78b1c62c75fb64e207be3 | ORPH

tools/qtextboundaryfinder.cpp:444:1: internal compiler error: in validate_condition_mode, at config/rs6000/rs6000.c:18074

Someone to test this with newer gcc versions ?

>          arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/1fe27c28772ae3ba0ba6d33fa23f597db2707d1c |     
>          arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/46b7c072a64c34ceb6e4be191bddc2bbfd26b3a6 |     


/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-4/output/build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c: In function 'RPI_Create':
/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-4/output/build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:126:39: error: 'RPI_GLES_DefaultProfileConfig' undeclared (first use in this function)
     device->GL_DefaultProfileConfig = RPI_GLES_DefaultProfileConfig;
                                       ^
SDL2 / RPi support broken.

Guillermo, you enabled RPi support in SDL2, could you look at those
build issues ?

>          arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/c2985c0471cfb8e396991bce125222d15474d0d0 |     

The infamous locale issue. Unless someone comes up with a better
solution than https://patchwork.ozlabs.org/patch/876880/, I think I'm
going to go ahead and apply this fix.

>        sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/d3538deb2e993e53d34286403b9ded3138eb4eb9 |     

ctracecmd_wrap.o -o ctracecmd.so
ctracecmd_wrap.o: In function `SWIG_Python_ErrorType':
ctracecmd_wrap.c:(.text+0xa0): relocation truncated to fit: R_SPARC_GOT13 against undefined symbol `PyExc_RuntimeError'
ctracecmd_wrap.c:(.text+0xc0): relocation truncated to fit: R_SPARC_GOT13 against undefined symbol `PyExc_MemoryError'
ctracecmd_wrap.c:(.text+0xd4): relocation truncated to fit: R_SPARC_GOT13 against undefined symbol `PyExc_IOError'
ctracecmd_wrap.c:(.text+0xdc): relocation truncated to fit: R_SPARC_GOT13 against undefined symbol `PyExc_IndexError'
ctracecmd_wrap.c:(.text+0xe4): relocation truncated to fit: R_SPARC_GOT13 against undefined symbol `PyExc_TypeError'

Pierre, you added support for trace-cmd in Buildroot, could you have a look ?

>         i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/e57e3bd425f43471283f10824d54b62b9116e260 |     

tst-syscall6.c: In function 'main':
tst-syscall6.c:32:48: error: 'RWF_DSYNC' undeclared (first use in this function)

This is when building against musl. Waldemar ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
