From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Tue, 9 Sep 2014 14:09:14 +0000
Subject: [Buildroot] Switching to a two stage gcc build
In-Reply-To: <20140909155004.7bc426d7@free-electrons.com>
References: <20140909155004.7bc426d7@free-electrons.com>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356D1E2B5@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I haven't tried this yet, though I recall similar problems, when I've been trying to use our ancient releases of our tools.

In our own build scripts, we do following for the two stage build:

1. Install Linux headers
2. Install uClibc headers
3. Build stage 1
4. Build uClibc and install it
5. Build stage 2

I'm not arguing that this way is definitely better, in fact I'm not even the one who invented it, though I've made some changes there. This works pretty nice for us. Maybe that could work for Buildroot as well?

As of issue with assembler error - that means there is a compiler error, compiler generated wrong insturction. Let me try to reproduce this here and I will send a bugreport to our compiler developer. This might take a day or two for him, depending on his workload and complexity of this particular issues. I suppose I just need to do a default busybox configuration  with master for this error? No need to enable any additional features?

Anton


> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: 09 September 2014 17:50
> To: Alexey Brodkin; Anton.Kolesov at synopsys.com
> Cc: buildroot at uclibc.org
> Subject: Switching to a two stage gcc build
> 
> Alexey, Anton,
> 
> I'm currently working on switching from a three stage gcc build to a
> two stage gcc build in Buildroot. Currently, what we do is:
> 
>  * host-gcc-initial
>  * linux-headers
>  * first build of C library, just to install the headers and start files
>  * host-gcc-intermediate
>  * complete build of C library
>  * host-gcc-final
> 
> I'm switching to the simpler (and faster) solution which allows to
> remove host-gcc-intermediate:
> 
>  * host-gcc-initial
>  * linux-headers
>  * complete build of C library
>  * host-gcc-final
> 
> The attached patch works fine for ARM, but it doesn't work for ARC. The
> problem is that with the two stage gcc build, we build libgcc in
> host-gcc-initial instead of host-gcc-intermediate. This means that
> libgcc is now built *before* the C library has installed its headers.
> Unfortunately, the ARC version of libgcc uses some headers from the C
> library, and therefore fails to build:
> 
> /home/test/outputs/arc-uclibc/build/host-gcc-initial-arc-
> 2014.08/build/./gcc/xgcc -B/home/test/outputs/arc-uclibc/build/host-gcc-
> initial-arc-2014.08/build/./gcc/ -B/home/test/outputs/arc-
> uclibc/host/usr/arc-buildroot-linux-uclibc/bin/ -B/home/test/outputs/arc-
> uclibc/host/usr/arc-buildroot-linux-uclibc/lib/ -isystem
> /home/test/outputs/arc-uclibc/host/usr/arc-buildroot-linux-uclibc/include -
> isystem /home/test/outputs/arc-uclibc/host/usr/arc-buildroot-linux-
> uclibc/sys-include    -g -Os -O2  -g -Os -DIN_GCC -
> DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -Wcast-qual -
> Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem
> ./include   -fPIC -g -DIN_LIBGCC2 -fbuilding-libgcc -fno-stack-protector -
> Dinhibit_libc  -fPIC -I. -I. -I../.././gcc -I../../../libgcc -I../../../libgcc/. -
> I../../../libgcc/../gcc -I../../../libgcc/../include    -o gmon.o -MT gmon.o -MD -
> MP -MF gmon.dep -isystem ../../../libgcc/config/arc/gmon -mno-sdata -c
> ../../../libgcc/config/arc/gmon/
>  gmon.c \
>         -fno-strict-aliasing \
>         -Wno-extra # suppress inane warning about missing initializer.
> In file included from ../../../libgcc/config/arc/gmon/mcount.c:40:0:
> ../../../libgcc/config/arc/gmon/sys/gmon.h:40:23: fatal error: sys/types.h: No
> such file or directory
>  #include <sys/types.h>
>                        ^
> compilation terminated.
> make[3]: *** [mcount.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> grep -v 'include.*fp-bit.h' ../../../libgcc/fp-bit.c >> dp-bit.c
> In file included from ../../../libgcc/config/arc/gmon/gmon.c:34:0:
> ../../../libgcc/config/arc/gmon/sys/gmon.h:40:23: fatal error: sys/types.h: No
> such file or directory
>  #include <sys/types.h>
>                        ^
> compilation terminated.
> make[3]: *** [gmon.o] Error 1
> make[2]: *** [all-target-libgcc] Error 2
> make[1]: *** [/home/test/outputs/arc-uclibc/build/host-gcc-initial-arc-
> 2014.08/.stamp_built] Error 2
> 
> You can reproduce this by applying the attached patch, and using the
> following defconfig:
> 
> BR2_arcle=y
> BR2_ENABLE_SSP=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> 
> It is also worth mentioning that in the latest master (i.e without my
> patch), the ARC toolchain builds fine, but it fails to build Busybox:
> 
> {standard input}: Assembler messages:
> {standard input}:453: Error: operand out of range (128 is not between -128
> and 127)
>   CC      libbb/xregcomp.o
> make[3]: *** [libbb/xfuncs.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> 
> Could you help me solve those issues?
> 
> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
