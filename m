From: Spider <spiderwebmail@gmail.com>
Date: Wed, 27 Oct 2010 18:23:15 -0200
Subject: [Buildroot] Errors building toolchain for powerpc
In-Reply-To: <AANLkTimeLeD9kcEL5R=oCGipG6x8XwpT5JCbdsq5Xs26@mail.gmail.com>
References: <AANLkTimBuCJakiyC31=Xigwd4e2FhisCV1g5vMwnHh0u@mail.gmail.com>
	<AANLkTimeLeD9kcEL5R=oCGipG6x8XwpT5JCbdsq5Xs26@mail.gmail.com>
Message-ID: <AANLkTi=j38Q5EMb5BBS5gVZ95ULANhVk=nCrcY8dNR0V@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry guys it seems it was an Xen problem.
When installing the OS, Xen was configured to work on 32 bits but the
arch was 64, so The guessing of the architecture became  unreliable in
some way.  Reinstalling the OS in a pure 64 environment solved the
problem.

2010/10/27 Spider <spiderwebmail@gmail.com>:
> Hi guys,
>
> Im trying to generate a powerpc toolchain, I did try buildroot before
> (buildroot 2009.08) and it worked fine, but this time I cant
> crosscompile the toolchain correctly and got stuck.
>
> Here is the machine
> $uname -a
> Linux builder 2.6.26-2-xen-amd64 #1 SMP Thu Sep 16 16:32:15 UTC 2010
> x86_64 GNU/Linux
>
> It uses Xen as supervisor with a debian is installed and AMD64 arch.
>
> I just wanted to build the toolchain so I removed all the packets:
> $make menuconfig
> $make uclibc-menuconfig
> $make source
>
> Then got my first try:
>
> $make UCLIBC_CONFIG_FILE=uclibc.config
> ....
> many stuff here
> ...
> ? ? ? ? ? ? ? ? \
> ? ? ? ? ? ? ? ?/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gmp-4.2.4/configure
> ?\
> ? ? ? ? ? ? ? ?--prefix="/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gmp"
> \
> ? ? ? ? ? ? ? ?--build=x86_64-unknown-linux-gnu \
> ? ? ? ? ? ? ? ?--host=x86_64-unknown-linux-gnu \
> ? ? ? ? ? ? ? ?--disable-shared \
> ? ? ? ? ? ? ? ?--enable-static \
> ? ? ? ? ? ? ? ?--disable-nls \
> ? ? ? ?)
> ...
> more stuff
> ...
> configure: error: Oops, mp_limb_t is 32 bits, but the assembler code
> in this configuration expects 64 bits.
> You appear to have set $CFLAGS, perhaps you also need to tell GMP the
> intended ABI, see "ABI and ISA" in the manual.
> make: *** [/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gmp-4.2.4-host/.configured]
> Error 1
>
>
> After reading some forums about gmp I decided to add ABI=32
>
> $make UCLIBC_CONFIG_FILE=uclibc.config ABI=32
> ...
> Seem to work and got going...
> ...
>
> ... beggining of the problem ...
>
> make[5]: Entering directory
> `/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/include'
> mkdir -p ./powerpc-unknown-linux-uclibc32/bits/extc++.h.gch
> /home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/./gcc/xgcc
> -shared-libgcc -B/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/./gcc
> -nostdinc++ -L/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/src
> -L/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/src/.libs
> -B/home/nrx/buildroot/buildroot-2010.08/output/staging/usr/powerpc-unknown-linux-uclibc32/bin/
> -B/home/nrx/buildroot/buildroot-2010.08/output/staging/usr/powerpc-unknown-linux-uclibc32/lib/
> -isystem /home/nrx/buildroot/buildroot-2010.08/output/staging/usr/powerpc-unknown-linux-uclibc32/include
> -isystem /home/nrx/buildroot/buildroot-2010.08/output/staging/usr/powerpc-unknown-linux-uclibc32/sys-include
> -Winvalid-pch -x c++-header -g -Os
> -I/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/include/powerpc-unknown-linux-uclibc32
> -I/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/include
> -I/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5/libstdc++-v3/libsupc++
> -O2 -g /home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5/libstdc++-v3/include/precompiled/extc++.h
> -o powerpc-unknown-linux-uclibc32/bits/extc++.h.gch/O2g.gch
> In file included from
> /home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5/libstdc++-v3/include/precompiled/extc++.h:52:
> /home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/include/ext/rope:1109:13:
> error: macro "index" requires 2
> arguments, but only 1 given
>
> ...same on many lines on different files...
>
> /home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/include/ext/ropeimpl.h:1675:63:
> error: macro "index" requires 2 arguments, but only 1 given
> In file included from
> /home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5/libstdc++-v3/include/precompiled/extc++.h:52:
> /home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/include/ext/rope:1109:
> error: expected ';' before 'const'
> /home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/include/ext/rope:1112:
> error: expected `;' before '_Rope_iterator_base'
> make[5]: *** [powerpc-unknown-linux-uclibc32/bits/extc++.h.gch/O2g.gch] Error 1
> make[5]: Leaving directory
> `/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3/include'
> make[4]: *** [all-recursive] Error 1
> make[4]: Leaving directory
> `/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3'
> make[3]: *** [all] Error 2
> make[3]: Leaving directory
> `/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/powerpc-unknown-linux-uclibc32/libstdc++-v3'
> make[2]: *** [all-target-libstdc++-v3] Error 2
> make[2]: Leaving directory
> `/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final'
> make: *** [/home/nrx/buildroot/buildroot-2010.08/output/toolchain/gcc-4.3.5-final/.compiled]
> Error 2
>
> ----Ended ---
>
> With faliled so badly I didnt know how to solve with environment
> variables. So it failed to build libc++ an now i'm confused... Why is
> this happening??
>
> Is it an error on my config files? or it happens because the
> environment variable "ABI=32"?
>
> When ABI is set to 32, buildroot also appends an annoying suffix to
> the toolchain which becames ''powerpc-unknown-linux-uclibc32'' instead
> of ?''powerpc-unknown-linux-uclibc'', is this normal? will it cause
> errors on the long road?
>
> I will try to compile without g++ and other c++ stuff to see if it
> works, any explaination would be welcome since I dont know why this is
> happening. If some additional info is needed I would gladly show my
> config files.
>
>
>
> --
> Marcelo Rodrigues Pinheiro , Universidade de Brasilia, Brasil
> Tel: +55 (61) 9117-5729
>



-- 
Marcelo Rodrigues Pinheiro
Tel: (61) 9117-5729
