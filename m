From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 09:14:11 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131122073003.1B835101305@stock.ovh.net>
References: <20131122073003.1B835101305@stock.ovh.net>
Message-ID: <20131122091411.59d82eb5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Nov 2013 08:30:02 +0100 (CET), Thomas Petazzoni wrote:

>     mipsel |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/417dac44eb077079f16a039881a45fa1b1782497/
>     mipsel |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/20926ed11e7d86cd6c54700eb609b3fa1740b8a7/
>     mipsel |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/03e5b85c71e5b624e42245f04d305042ec9136fa/
>     mipsel |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/a51b3723f176a98abff809313a5f863e2539e103/

Those four ones are the same:

configure: error: C compiler cannot create executables

probably a toolchain configuration problem, I need to look into this.

>       bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/fc643356587aaed0c3e7c2205dad0c40f02eede1/

I believe the problem here is that Blackfin needs a "_" to be prefixed
on assembly symbols, compared to the corresponding C symbol.

>     xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/04896be35649215d8141cb737185c0c10ad11d12/

iozone_linux-noaio.o:(.literal+0xfec): undefined reference to `pthread_setaffinity_np'

>     xtensa |                        kmod-15 | NOK | http://autobuild.buildroot.net/results/622d25321d76f505de6aef4e33d0e421ba701de5/

/home/test/test/2/output/host/usr/lib/gcc/xtensa-buildroot-linux-uclibc/4.7.3/../../../../xtensa-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.22 internal error, aborting at elf32-xtensa.c line 3374 in elf_xtensa_finish_dynamic_sections

 -> seems like an update to Xtensa binutils is needed.

>      avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/73c7c211a51c312bbe4eb6a540f3ad9c92c79ebe/

TLS not available on AVR32, discussion on-going on how to solve this.

> microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2cd1b11c43655cfd3bcbe8f6e127ea5e4a607e9d/
> microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/bcbc99ec7987fe10d4e752eb96840a7ec1be2744/

Missing compiler intrinsics. There are patches from Spenser to add
internal toolchain support for Microblaze, so that we can remove the
broken external toolchains.

>       bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d5c743294314584473cdd6098ebcfae42971803c/

A patch has been sent by Thomas DS to make libglib and all its reverse
dependencies not available on !MMU. I believe it's the good way to go
for now, until we have a proper patch to make libglib2 usable on !MMU
systems. Peter, can you merge http://patchwork.ozlabs.org/patch/292839/ ?

>      avr32 |                 libroxml-2.2.3 | NOK | http://autobuild.buildroot.net/results/e22d94fca3eabb4e54d82af04319f17ad8e10c20/

Simon Dawson has already sent a patch to fix this:
http://patchwork.ozlabs.org/patch/293203/. Peter, can you merge this.

>        arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/c3082693fe0da0c54d4bbf950dd6d74e1395c1d9/

libvncserver needs thread support.

>        arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/b0b386969459dda9c294f1ccb4927ca225fa6bdd/

Missing dependency?

/home/test/test/1/output/host/usr/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os   -fPIC  -O2 --static -O2 -L../libdm -L../lib -L../libdaemon/client -L../libdm \
	      -o dmsetup dmsetup.o -ldevmapper  
/home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -ldevmapper

>       bfin |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/52cc56df2aa278d92141918de74833d7e4fd3d47/

Needs MMU. Gustavo has sent a patch,
http://patchwork.ozlabs.org/patch/293083/.

>    aarch64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/5967dfd4bd7c2b68e2911a98b9b84c8fe7adf0aa/

I've sent two patches to fix this:
http://patchwork.ozlabs.org/patch/293258/ and
http://patchwork.ozlabs.org/patch/293259/.

>        arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/dfc083bff04eba68456edd359424293842b6f42d/

Thread support needed, patch at
http://patchwork.ozlabs.org/patch/293205/.

> microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/2299063bb4e84833ee3edccec960d551b5fcdfe5/

Needs the internal toolchain backend support for Microblaze.

>   mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/fd7e7e53290f235b540ed5f3c784e2584fdb41e0/

There is no support for mips64 in QtScript, which uses JavaScriptCore.
Options are:

 * Disable the possibility of enabling QtScript on mips64el/mips64

 * Adapt the patch that was done for webkit-gtk to allow
   mips64el/mips64 usage: http://patches.openembedded.org/patch/51625/

>        arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/82bb89d5b29dc6bd40f840bc04845b6c87157985/

Weird thing. It's having problems when building things for the host...
but it uses target headers when building for the host. Someone needs to
look closely into this. Fatih ? :-)

>   mips64el |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/bcff4b81bfbb1191f97317b0945c74d948c9774b/

checking whether to build with BeeCrypt library... no
configure: error: mandatory BeeCrypt library not found
make: *** [/home/test/test/3/output/build/rpm-5.2.0/.stamp_configured] Error 1

rpm has a dependency on beecrypt, so normally it should have been built
before. Seems like rpm isn't "seeing" that beecrypt is around :-)

>        arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/1ec3664f28492bf3da53dcbe8ceeb165bce8df6d/

Patch has been sent to fix this:
http://patchwork.ozlabs.org/patch/293270/. To be applied.

>        arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/f4ad0468f17520a645f029878876a972421a87b4/

OpenGL/libraries problem.

linux-gnueabi/sysroot/usr/lib
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: libXdamage.so.1, needed by /home/test/test/2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so, not found (try using -rpath or -rpath-link)
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: libXfixes.so.3, needed by /home/test/test/2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so, not found (try using -rpath or -rpath-link)
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: libXext.so.6, needed by /home/test/test/2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so, not found (try using -rpath or -rpath-link)
/home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: libX11.so.6, needed by /home/test/test/2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGL.so, not found (try using -rpath or -rpath-link)

>        arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/4f09bbb3cf646e7e45c86d43a50b440245e136e2/

ARC compiler problem. Fixed by the bump of the toolchain components for
ARC (patches already submitted by Mischa).

>   mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/bab68bcf8714f215ac0b0c2546fa06608377fbb0/

Fixed by http://patchwork.ozlabs.org/patch/293207/.

>    powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8fb291915b3ce5dc955f5e7e60eea2a4a6202143/
>        arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/cc4c41b99005c82e546a9e2916df97180be32b2b/

These are autobuilder script issues. Don't take them into account (even
though I indeed need to find a solution for these).

>    powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/7ac90c6087640585a9afb0e31ad9e690eded89f5/

Too old kernel headers, but the toolchain is the latest PowerPC
toolchain from CodeSourcery.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
