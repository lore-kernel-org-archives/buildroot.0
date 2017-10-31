From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Oct 2017 23:05:19 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171031070013.AD75D207B2@mail.free-electrons.com>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
Message-ID: <20171031230519.3feb2619@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Since Peter is about to release -rc1, it's time to restart with
analyzing the build failures we have. And we have *lots* of them!

Alexey, Yann, Adam, Peter (both Korsgaard and Seiderer?, Olivier,
Matthew, Johan, Angelo, J?rg, Samuel, Waldemar, Bernd and Baruch: there
are some questions/issues/topics for you below. Please read on! Thanks
for your support!

On Tue, 31 Oct 2017 08:00:13 +0100 (CET), Thomas Petazzoni wrote:

>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/25e4ff4b8cecd88d56bd75fcdef64ad9affed959 | ORPH
>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/204d17c639e8a38648dbc15c4abbc0c6fe23370a | ORPH
>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/2ac87b1ea118366df4c816a13fa7cd02f8b10dc0 | ORPH
>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/a818230518d1197a9916019a955437fc3611ad33 | ORPH
>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/3663fc12c6d5908ba496efdfaa1ba24ed39f0104 | ORPH
>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/af51008cdc92645adb20664aa7b3c64d9ed4691e | ORPH
>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/e033f008b4731d41ec426884b45a591dda7adaf3 | ORPH
>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/1be95e26fd18e9772e42b5e6cb1e93fbac9c1c8a | ORPH
>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/c94d79b9eaecdb36e0894ae0f965ae39cdb35386 | ORPH
>          arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/53359e0fe1408f3816d3091b49462320239f39c1 | ORPH

This is happening only on ARC. Why? Matt Weber proposed a patch,
https://patchwork.ozlabs.org/patch/832397/, but I am not terribly
convinced because it doesn't explain why this problem happens only on
ARC, and why it appeared suddenly.

Alexey, could you have a look ?

>         bfin |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/5874155f0d722c004971bb9ae9df995f052744c6 |     
>          arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/06bfcc0ba0ea9a125e89a54235348564d1a074a3 |     
>         m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/f2a0bd030cce31a7346f05442a2d16c462713768 |     
>         m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/38d80d117f346ed630b10b6cdc951ec9a9dd1576 |     
>         bfin |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/19ddca30994e3acf223e54b91cfda9725838d71c |  

All five issues are the same:

libs/fiber/src/numa/linux/pin_thread.cpp:31:39: error: '::pthread_setaffinity_np' has not been declared
     if ( BOOST_UNLIKELY( 0 != ( err = ::pthread_setaffinity_np( ::pthread_self(), sizeof( set), & set) ) ) ) {

This is weird, because:

config BR2_PACKAGE_BOOST_FIBER
        bool "boost-fiber"
        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL

So the fiber library shouldn't be built on toolchains that don't have
NPTL support.

Adam, since you bumped Boost, could you investigate this?

>          arc |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/2cb531b9f9c75bb5dae10c02f2afeca225c65947 | ORPH


  CC      console-tools/setlogcons.o
libbb/appletlib.c:206:8: error: 'NUM_APPLETS' undeclared (first use in this function); did you mean 'PF_APPLETALK'?
  max = NUM_APPLETS;

What is going on here?!?

>          arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/30d398c5764350609ef37d158c665347caf9f134 |     
>          arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/5f5b5edb058efe976c003678e21bcc28a87cc828 |     

Your Buildroot configuration needs a compiler capable of building 32 bits binaries.
If you're running a Debian/Ubuntu distribution, install the gcc-multilib package.
For other distributions, refer to their documentation.

Peter, gcc112 is your autobuilder, and it's a ppc64 machine, which
probably explains the issue.

>          arm |                     cups-2.2.5 | NOK | http://autobuild.buildroot.net/results/0f1cb8d72d0a78eb8b5c46548bc7c7bade93c674 | ORPH


ippserver.o: In function `ipp_print_job':
/accts/mlweber1/rclinux/target_build/instance-3/output/build/cups-2.2.5/test/ippserver.c:3881: undefined reference to `_cupsThreadDetach'
ippserver.o: In function `run_printer':
/accts/mlweber1/rclinux/target_build/instance-3/output/build/cups-2.2.5/test/ippserver.c:6812: undefined reference to `_cupsThreadDetach'
/accts/mlweber1/rclinux/target_build/instance-3/output/build/cups-2.2.5/test/ippserver.c:6830: undefined reference to `_cupsThreadDetach'

This happens with a toolchain that doesn't have thread support. So
either we make cups depend on the availability of thread support, or we
fix the problem in cups. Perhaps making cups depend on thread support
is the easiest option.

Olivier, could you have a look into this? Also, I realized you are not
listed in the DEVELOPERS file for the cups package, would you be OK to
add yourself there?

>    powerpc64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/1588d1a2fec77522857fd22e344b1a89ad04bb44 | ORPH
>          arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/a1b68de766d13628380dfaa4e4db893a6c8e8af6 | ORPH
>         or1k |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/bf1124aed79210f16acc08e056e744a0dc17b418 | ORPH
>       x86_64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/8a7203b7473b5500b456344379dfa6d6bde4d52d | ORPH

configure: PYTHON_INCLUDES overridden to: -I/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.6m -I/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/python3.6m
checking whether those headers are sufficient... no
configure: error: could not find Python headers

Feels like the "building in /usr" issue, it would be fixed by
https://patchwork.ozlabs.org/patch/827751/.

>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/b8fd41b127ab7702a2b69998076d737ea2e092b5 |     
>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/43c90fbad3662101ef4eb5958f73700d1ff57b38 |     
>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/a152a190108986392346efbba001b9dd0bdc89bc |     
>          arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/60d44246fe6a54b02b53564761807204b9a190d0 |     

libavcodec/vp9dsp_template.c:1685:1: internal compiler error: Segmentation fault

Alexey, could you have a look ?

>       xtensa |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/81aa66ddd88919295ccb5f34b527b737627263a7 |


CMake Error at channels/tsmf/client/gstreamer/CMakeLists.txt:21 (message):
  GStreamer library not found, but required for TSMF module.

Adam, you recently bumped freerdp, could you please have a look?
     
>          arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/5a1404cf52c9547533a5b04c40d6118b43a07707 |     

gpm-root.c:(.text.startup+0x1aa): undefined reference to `__sigemptyset'
gpm-root.c:(.text.startup+0x1aa): undefined reference to `__sigemptyset'

This is with the new glibc ARC toolchain. Alexey ? :-)

>       xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/bb0a52f08ce07b3aa7301e69e9be12f3e45f45b2 | ORPH
>          arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/0b6feb96ba877cb4f3b8c6a05c977a1c12805fac | ORPH
>          arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/daa93d58840c77c980d040e2b740555dc3b36951 | ORPH


/home/buildroot/autobuild/run/instance-3/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgobject-2.0.a(libgobject_2_0_la-gmarshal.o): In function `g_cclosure_marshal_VOID__VOID':
gmarshal.c:(.text+0x0): multiple definition of `g_cclosure_marshal_VOID__VOID'
../gst/.libs/libgstreamer-0.10.a(libgstreamer_0.10_la-gstmarshal.o):/home/buildroot/autobuild/run/instance-3/output/build/gstreamer-0.10.36/gst/gstmarshal.c:60: first defined here

Static linking issue. Who volunteers to have a look? We don't even have
a person listed in the DEVELOPERS file for gstreamer.

>          arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/6c4c7b3094bd48a72786f5be3d760f0356557403 |     
>          arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/a17d5eb1aac01dab19412aa28d523625577730db |     

The infamous ./bootstrap issue that consumes 100% of the CPU before
timing out the build job. Johan, we really need to find a solution to
this problem. How can we proceed to debug this?

>          arc |   host-gdb-arc-2017.09-rc1-gdb | NOK | http://autobuild.buildroot.net/results/43eae264991aa369490236c7bd59c0b6a67fcf25 | ORPH

checking whether /usr/bin/g++ supports C++11 features with -h std=c++11... no
configure: error: *** A compiler with support for C++11 language features is required.
make[2]: *** [configure-gdb] Error 1

The ARC special version needs:

        depends on BR2_HOST_GCC_AT_LEAST_4_8
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

Just like the gdb 8.0 version.

Yann, perhaps you could have a look at this ?

>       xtensa |     host-libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/dfb5009ff4289086ff6ecf008d623cad92e7d1fe | ORPH

/usr/include/openssl/kssl.h:150:5: error: unknown type name 'krb5_octet'
     krb5_octet FAR *key;

I think we need to pass --disable-openssl when building host-libevent.
Who volunteers to have a look?

>          arm |            host-mono-5.2.0.224 | NOK | http://autobuild.buildroot.net/results/51dcf8908157393a09ce772e6099e73fd0cd0ba2 |     

Unhandled Exception:
System.ExecutionEngineException: System.NullReferenceException: Object reference not set to an instance of an object ---> System.NullReferenceException: Object reference not set to an instance of an object

Angelo, could you have a look ?

>          arc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/9567703c95823be10400c0a330c3997a4cd6a62c | ORPH
>          arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e3ee47e30a01e68a80fcbef3178f8eb051fe509f | ORPH
>          sh4 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/7d60ebf31fd9df7a5fef7e7723859c32d7972f5b | ORPH

The libfdt/python issue. Matt Weber has proposed a patch to fix it:
https://patchwork.ozlabs.org/patch/827287/, however I have some
questions/concerns about it.

>       xtensa |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/fb939428388a53dce3a141147e6bdca15cd9c9ea |     
> microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/d5328314675e47534658884a9b249cefcf237c40 |     

Error: /home/peko/autobuild/instance-2/output/build/jimtcl-0.75/autosetup/config.guess: unable to guess system type

Peter: another ppc64 as host system issue I believe. Could you have a look ?

>      powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/e5badaca8f078b84d3a2135634a96729a20f2a9b |     

hsh.c: In function 'hsh':
hsh.c:28:21: error: declaration of 'hsh' shadows a global declaration [-Werror=shadow]
hsh.c:26:1: error: shadowed declaration is here [-Werror=shadow]

Should be fairly easy to fix. Peter, jose is a package you have added.
Could you have a look?

>          arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/d3c3abf9966dd023923235c3879f521ba3a2daa5 | ORPH


strerror.c: In function 'rpl_strerror':
strerror.c:44:21: warning: implicit declaration of function 'strerror_override'; did you mean 'strerror_r'? [-Wimplicit-function-declaration]
   const char *msg = strerror_override (n);
                     ^~~~~~~~~~~~~~~~~

This so far only happened on ARC, with uClibc. Alexey ?

>          arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/16791e9548715d06efe37cf99fb07e4e27d98383 |     

Yet again:

prog.c:24:7: warning: implicit declaration of function 'dlmopen' [-Wimplicit-function-declaration]
  h1 = dlmopen(LM_ID_BASE, "libfoo.so", RTLD_LAZY);

I'll try to have a look tomorrow.

> microblazeel |            lua-sdl2-v2.0.5-6.0 | NOK | http://autobuild.buildroot.net/results/46f93012342549c44e100522eea0852586311ef4 |     

I have a fix for this one, it's easy. I'll send it shortly.

>          arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/8be30492abe3345dc9411fe3e5636c4f8e4311ce |     

src/rtphint.cpp:342:35: error: ISO C++ forbids comparison between pointer and integer [-fpermissive]
                     if (pSlash != '\0') {

Would be fixed by
http://pkgs.fedoraproject.org/cgit/rpms/libmp4v2.git/tree/0004-Fix-GCC7-build.patch.
J?rg, mp4v2 is your package, could you have a look? :-)

>       xtensa |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/9e636919c98cd31b5067c8306d0e481a672434cf | ORPH
>     mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/912561f505ad10d1eaa96dbe247d5838e9968e14 | ORPH

xtensa-linux-g++.br_real: error: libssh2/lib/libssh2.a: No such file or directory

Who volunteers to have a look?

>     mips64el |                opencv-2.4.13.3 | NOK | http://autobuild.buildroot.net/results/b27d324331f6e351e95dd4742f4d0a50af60c590 |     
>     mips64el |                opencv-2.4.13.3 | NOK | http://autobuild.buildroot.net/results/44ed0be0bd94028b7b37e7bf21233adc1753d94b |  

CMake Error at cmake/OpenCVCompilerOptions.cmake:21 (else):
  A duplicate ELSE command was found inside an IF block.
Call Stack (most recent call first):
  CMakeLists.txt:437 (include)

Should be easy to fix. Samuel, do you think you will find some time to
have a look at this?
   
>         bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/78e033fe9f43845581a5d87b21a8451f67520e44 |     

/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/openobex-1.7.2/lib/obex_transport_sock.c:(.text+0x5f6): undefined reference to `accept4'

Not sure what's going on. accept4() not wired in Linux or uClibc for
Blackfin? Something else? Waldemar, could you have a look?

>          arm |                  openssh-7.6p1 | NOK | http://autobuild.buildroot.net/results/3dcd2ab22b75bf27afd963d57e31df5e0bdedcaa | ORPH
>          arm |                  openssh-7.6p1 | NOK | http://autobuild.buildroot.net/results/8cc30818a400c7a392a3de787cabc9cd8425495f | ORPH

getpagesize.c:(.text+0x0): multiple definition of `getpagesize'
openbsd-compat//libopenbsd-compat.a(bsd-getpagesize.o):bsd-getpagesize.c:(.text+0x0): first defined here

Would be fixed by http://patchwork.ozlabs.org/patch/832199/.

>         m68k |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/c35599e6bf09aebe456ea959d7c238f82090fc62 |     

/usr/lfs/v0/rc-buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: cannot find -lopenjp2

Bernd, you recently bumped openjpeg. Could you have a look ?

>       x86_64 |           qt5declarative-5.9.2 | NOK | http://autobuild.buildroot.net/results/d9707cc2f47c6906b7e4872e185b7866301c3322 |     

logo.h:52:11: error: 'GLfloat' does not name a type
     const GLfloat *constData() const { return m_data.constData(); }

Not sure what's going on. I don't see which package is the OpenGL
provider. Peter (Seiderer), do you have an idea ?

>          arc |              stress-ng-0.06.15 | NOK | http://autobuild.buildroot.net/results/296b14584c200593f88af75cdda65c4ca03cd863 |     

stress-fp-error.c: In function 'stress_fp_error':
stress-fp-error.c:100:10: error: 'FE_INVALID' undeclared (first use in this function); did you mean 'EINVAL'?
    EDOM, FE_INVALID);
          ^~~~~~~~~~

We already exclude nios2, we should probably exclude ARC as well.
Alexey, do you confirm?

See:

        # fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
        depends on !BR2_nios2

>         m68k |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/5bff9fbd24264b3515a669d585e10ef23127d569 |     
>       mipsel |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/d1c8e74477797b597c38186343e4d6c69b05560d |     

SVN repo is dead, and it locks up the build until we time out? Doesn't
look great. Yann? :-)

> microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/20a9a75f701ce70c2ae434085a85ad8d34adc67b | ORPH
>          arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/46844b028989808aa7340c14af22f2855ec803d8 | ORPH
> 

Not sure. Is it just:


make[2]: *** [jim/libjim.a] Error 1
make[2]: *** Waiting for unfinished jobs....
usb_modeswitch.c: In function 'checkSuccess':
usb_modeswitch.c:1579:7: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
    if (i == CheckSuccess-1) {

That makes the build fail?

Baruch, you are the last person who bumped this package, could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
