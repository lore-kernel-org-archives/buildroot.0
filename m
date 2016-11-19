From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 20:23:23 +0100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
Message-ID: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 Here's an analysis of autobuild failures. It looks a bit different from what
Thomas usually sends because I based it on the website rather than the mail. I
eliminated the ones that are already fixed in git, and also the powerpc64le
failures that are due to libtool.m4.

 I'm not putting the people from get-developers in Cc, because they already get
these mails.


http://autobuild.buildroot.net/results/9e4c12001d54d4a62fb43546c4263ef09aff91e4
sh4	assimp-v3.2	uclibc	static

> /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/assimp-v3.2/code/AssxmlExporter.cpp: In function 'void Assimp::AssxmlExport::WriteDump(const aiScene*, Assimp::IOStream*, bool)':
> /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/assimp-v3.2/code/AssxmlExporter.cpp:623:1: error: unable to find a register to spill in class 'GENERAL_REGS'
>  }
>  ^
> /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/assimp-v3.2/code/AssxmlExporter.cpp:623:1: error: this is the insn:
> (insn 7142 1226 1227 125 (set (mem/c:SI (plus:SI (reg/f:SI 153 sfp)
>                 (const_int -1116 [0xfffffffffffffba4])) [39  S4 A32])
>         (reg:SI 1 r1)) /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/assimp-v3.2/code/AssxmlExporter.cpp:484 255 {movsi_ie}
>      (nil))

 sh-specific compiler error. Anyone?


http://autobuild.buildroot.net/results/58209c053c5d4b8f959ccf3645b03d7c959c737c
arm / arm926ej-s	guile-2.0.13	glibc	
http://autobuild.buildroot.net/results/b94b3ebc9e7bcc60b83e9dffc8cb276c6ee5bec5
arm / arm926ej-s	guile-2.0.13	glibc	
http://autobuild.buildroot.net/results/1c1bf79024d6d7aab1fc4c1e932768d975933af4
arm / arm926ej-s	guile-2.0.13	glibc	

> foreign.c:801:***Mismatching FUNC_NAME.  Should be: `#define FUNC_NAME s_scm_i_pointer_to_procedure'
> memoize.c:515:***Mismatching FUNC_NAME.  Should be: `#define FUNC_NAME s_"@prompt"'
> net_db.c:468:***Missing or erroneous `#define FUNC_NAME s_AI_ADDRCONFIG);'
> net_db.c:488:***Missing or erroneous #undef for AI_ADDRCONFIG);: 
> /tmp/ccNL6XFZ.s: Assembler messages:
> /tmp/ccNL6XFZ.s:9561: Error: bad immediate value for offset (4100)
> Makefile:3210: recipe for target 'libguile_2.0_la-vm.lo' failed
> make[4]: *** [libguile_2.0_la-vm.lo] Error 1

 Needs investigation.



http://autobuild.buildroot.net/results/f2a001031af381388cff71b4de1103fc11e08239
xtensa	jack2-v1.9.10	uclibc	

> ../dbus/sigsegv.c: In function 'signal_segv':
> ../dbus/sigsegv.c:110:20: error: 'NGREG' undeclared (first use in this function)
>      for(i = 0; i < NGREG; i++)
>                     ^
> ../dbus/sigsegv.c:110:20: note: each undeclared identifier is reported only once for each function it appears in
> ../dbus/sigsegv.c:119:38: error: 'mcontext_t {aka struct sigcontext}' has no member named 'gregs'
>                  ucontext->uc_mcontext.gregs[i]

 Lots of similar failures exist with uClibc, but only on xtensa and arc.
Incomplete / incompatible struct sigcontext definition maybe? Waldemar?


http://autobuild.buildroot.net/results/a82dae5abc2713f5320ea3a80b6a95d4c8507359
arm / arm926ej-s	qemu-2.7.0	uclibc	static
http://autobuild.buildroot.net/results/6998c88094794ae2b709e7bd424b11925c13050a
arm / arm926ej-s	qemu-2.7.0	uclibc	static

> /home/peko/autobuild/instance-2/output/build/qemu-2.7.0/user-exec.c: In function 'cpu_alpha_signal_handler':
> /home/peko/autobuild/instance-2/output/build/qemu-2.7.0/user-exec.c:410:25: error: 'mcontext_t {aka struct sigcontext}' has no member named 'gregs'
>      pc = uc->uc_mcontext.gregs[R15];

 Looks very similar to the above, but now on arm... This is also with a
buildroot toolchain, so recent uClibc-ng. Waldemar?


http://autobuild.buildroot.net/results/be3131fe5edc6b1462e49ec33ea0e6f74d4c3cd6
x86_64 / core2	kvm-unit-tests-5731572b2ac2...	uclibc	

> x86/hyperv_clock.c: Assembler messages:
> x86/hyperv_clock.c:21: Error: no instruction mnemonic suffix given and no register operands; can't size instruction

 Inline assembly problem? Too old compiler (gcc 4.6)?



http://autobuild.buildroot.net/results/dc91fec4ae4eac5544365d8a0fec06663f3416d3
arm / cortex-m4	kvm-unit-tests-5731572b2ac2...	uclibc	static
http://autobuild.buildroot.net/results/53d109fd9055fd20387bb857aced5f89cf3086fd
arm / cortex-m4	kvm-unit-tests-5731572b2ac2...	uclibc	static

> /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/usr/bin/arm-linux-gcc  -marm -mcpu=cortex-a15 -std=gnu99 -ffreestanding -Wextra -O2 -I lib -I lib/libfdt -g -MMD -MF arm/.spinlock-test.d -Wall -Wno-frame-address  -fno-omit-frame-pointer   -nostdlib -o arm/spinlock-test.elf \
> 		-Wl,-T,arm/flat.lds,--build-id=none,-Ttext=40010000 \
> 		arm/spinlock-test.o arm/cstart.o lib/libcflat.a lib/libfdt/libfdt.a /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/5.4.0/libgcc.a lib/arm/libeabi.a \
> 		lib/auxinfo.c -DPROGNAME=\"arm/spinlock-test.flat\"
> /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: cannot open linker script file text=40010000: No such file or directory

 This binutils version doesn't seem to understand -Ttext=.... It's binutils
2.25.1, so I'm surprised... A workaround could be to use --start-section
instead, but better to investigate what happens in binutils.


http://autobuild.buildroot.net/results/070ce21befbf3f0cd015ba0017b0a113ce985768
arm / cortex-a9	kvmtool-bed2bd9e1fbef581909...	glibc	

>   LINK     guest/init
> make[1]: *** [guest/init] Segmentation fault (core dumped)

 Just two build failures like this, on two different machines. Parallel build
issue maybe?


http://autobuild.buildroot.net/results/d47fa41aa860d82471b83ac90967d3a3dacd8611
m68k / 5208	lcdapi-v0.10	uclibc	static

> /tmp/cc6S5lwR.s: Assembler messages:
> /tmp/cc6S5lwR.s: Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
> Please report this bug.
> Makefile:784: recipe for target 'lcdapi/api/liblcdapi_la-LCDHorizontalBar.lo' failed

 ICE... Waldemar?


http://autobuild.buildroot.net/results/4fb4353bce614b64b30b05d06831e0d0f38a48dd
bfin / bf532	libarchive-3.2.1	uclibc	static

> ./.libs/libarchive.a(archive_random.o): In function `_archive_random':
> libarchive/archive_random.c:(.text+0x158): undefined reference to `_pthread_mutex_lock'
> libarchive/archive_random.c:(.text+0x20a): undefined reference to `_pthread_mutex_unlock'

 pthread static linking problem with the ADI toolchain. Probably solved with
current uClibc-ng.


http://autobuild.buildroot.net/results/a21de4747f40a5ce93108c8979fbc0277d040e79
m68k / 5208	libasplib-f7219142e790a329b...	uclibc	static

> /tmp/ccyKzjCg.s: Assembler messages:
> /tmp/ccyKzjCg.s: Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
> Please report this bug.
> make[3]: *** [CMakeFiles/asplib.dir/Biquads/apslib_BiquadFactory.cpp.o] Error 1

 Yet another m68k ICE. Waldemar?


http://autobuild.buildroot.net/results/05236d725710a9564489432c71021eecf150e0de
x86_64 / bdver3	libcurl-7.51.0	glibc	

>   CC       libcurl_la-cookie.lo
> In file included from urldata.h:98:0,
>                  from cookie.c:91:
> /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/mbedtls/ssl.h:545:5: error: unknown type name 'mbedtls_time_t'
>      mbedtls_time_t start;       /*!< starting time      */
>      ^

 Something is going wrong here with the configuration or installation of
mbedtls. Ah, from the release notes of mbedtls-2.4.0:

(2.4) Fixes platform time abstraction to avoid dependency issues where a build
may need time but not the standard C library abstraction, and added
configuration consistency checks to check_config.h.

Note that that is a security release (2 security fixes) but it also has several
new features. So either we accept the late version bump, or we have to backport
3 patches. I prefer the version bump.

 Gustavo?


http://autobuild.buildroot.net/results/a40682602d5bbeab38d2563f9dfdb04394a5fb01
arm / cortex-m4	libffi-3.2.1	uclibc	static

> /bin/sh ./libtool    --mode=compile /home/buildroot/build/instance-0/output/host/usr/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -I..  -I. -I../include -Iinclude -I../src -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -I../include -Iinclude -I../src -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wl,-elf2flt -static -c -o src/arm/sysv.lo ../src/arm/sysv.S
> libtool: compile:  /home/buildroot/build/instance-0/output/host/usr/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -I.. -I. -I../include -Iinclude -I../src -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -I../include -Iinclude -I../src -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -Wl,-elf2flt -c ../src/arm/sysv.S -o src/arm/sysv.o
> ../src/arm/sysv.S: Assembler messages:
> ../src/arm/sysv.S:159: Error: selected processor does not support ARM opcodes
> ../src/arm/sysv.S:161: Error: attempt to use an ARM instruction on a Thumb-only processor -- `stmfd sp!,{r0-r3,fp,lr}'
> ../src/arm/sysv.S:163: Error: attempt to use an ARM instruction on a Thumb-only processor -- `mov fp,sp'
> .....

 ARM assembly should be disabled on a thumb-only processor. We just did
something similar for tremor as well. Thomas?


http://autobuild.buildroot.net/results/0be5e6b6194df5261b5ee569100f9eb2c899b695
powerpc / e500mc	lite-0.8.10	uclibc	static

> /bin/sh ../libtool --tag=CC   --mode=link /home/buildroot/build/instance-0/output/host/usr/bin/powerpc-linux-gcc  -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -static -Werror-implicit-function-declaration  -static -o lite_bench bench.o ../leck/libleck.la ../lite/liblite.la -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirectfb -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib   -lz -lfusion -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirect -lpthread -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib   ../leck/libleck.la ../lite/liblite.la -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirectfb -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib   -lz -lfusion -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirect -lpthread -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib  
> /home/buildroot/build/instance-0/output/host/usr/bin/powerpc-linux-gcc -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -Werror-implicit-function-declaration -static -o lite_bench bench.o  -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib ../leck/.libs/libleck.a /home/buildroot/build/instance-0/output/build/lite-0.8.10/lite/.libs/liblite.a ../lite/.libs/liblite.a /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libdirectfb.a /home/buildroot/build/instance-0/output/build/directfb-1.7.7/lib/fusion/.libs/libfusion.a /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libfusion.a /home/buildroot/build/instance-0/output/build/directfb-1.7.7/lib/direct/.libs/libdirect.a /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libdirect.a -lz -lrt /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.so -lpthread   -Wl,--rpath -Wl,/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib -Wl,--rpath -Wl,/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib
> libtool: link: warning: library `/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.la' was moved.
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.so'
> collect2: error: ld returned 1 exit status
> Makefile:378: recipe for target 'lite_bench' failed

 The linking with libstdc++.so is added by libtool and is caused by directfb.
Not sure what is happening here. This isn't the same thing as for ppc64le, is it?



http://autobuild.buildroot.net/results/1a506eee41dd9e3a14244f4add90d89d7b818352
arc / arc700	mpfr-3.1.5	uclibc	


> /bin/bash ../libtool  --tag=CC   --mode=compile /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc -DTIME_WITH_SYS_TIME=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_LOCALE_H=1 -DHAVE_WCHAR_H=1 -DHAVE_STDARG=1 -DHAVE_SYS_TIME_H=1 -DHAVE_STRUCT_LCONV_DECIMAL_POINT=1 -DHAVE_STRUCT_LCONV_THOUSANDS_SEP=1 -DHAVE_ALLOCA_H=1 -DHAVE_STDINT_H=1 -DHAVE_VA_COPY=1 -DHAVE_SETLOCALE=1 -DHAVE_GETTIMEOFDAY=1 -DHAVE_LONG_LONG=1 -DHAVE_INTMAX_T=1 -DMPFR_HAVE_INTMAX_MAX=1 -DHAVE_ROUND=1 -DHAVE_TRUNC=1 -DHAVE_FLOOR=1 -DHAVE_CEIL=1 -DHAVE_NEARBYINT=1 -DHAVE_CLOCK_GETTIME=1 -DLT_OBJDIR=\".libs/\" -DHAVE_ATTRIBUTE_MODE=1 -DHAVE___GMPN_ROOTREM=1 -DHAVE___GMPN_SBPI1_DIVAPPR_Q=1 -I.   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -Os  -ffloat-store -c -o mul.lo mul.c
> libtool: compile:  /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc -DTIME_WITH_SYS_TIME=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_LOCALE_H=1 -DHAVE_WCHAR_H=1 -DHAVE_STDARG=1 -DHAVE_SYS_TIME_H=1 -DHAVE_STRUCT_LCONV_DECIMAL_POINT=1 -DHAVE_STRUCT_LCONV_THOUSANDS_SEP=1 -DHAVE_ALLOCA_H=1 -DHAVE_STDINT_H=1 -DHAVE_VA_COPY=1 -DHAVE_SETLOCALE=1 -DHAVE_GETTIMEOFDAY=1 -DHAVE_LONG_LONG=1 -DHAVE_INTMAX_T=1 -DMPFR_HAVE_INTMAX_MAX=1 -DHAVE_ROUND=1 -DHAVE_TRUNC=1 -DHAVE_FLOOR=1 -DHAVE_CEIL=1 -DHAVE_NEARBYINT=1 -DHAVE_CLOCK_GETTIME=1 -DLT_OBJDIR=\".libs/\" -DHAVE_ATTRIBUTE_MODE=1 -DHAVE___GMPN_ROOTREM=1 -DHAVE___GMPN_SBPI1_DIVAPPR_Q=1 -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -Os -ffloat-store -c mul.c  -fPIC -DPIC -o .libs/mul.o
> In file included from mpfr-impl.h:98:0,
>                  from mul.c:24:
> mul.c: In function 'mpfr_mul':
> mpfr-longlong.h:403:3: error: impossible constraint in 'asm'
>    __asm__ ("add.f\t%1, %4, %5\n\tadc\t%0, %2, %3"   \
>    ^
> mul.c:333:11: note: in expansion of macro 'add_ssaaaa'
>            add_ssaaaa (tmp[2], tmp[1], tmp[2], tmp[1], 0, t);
>            ^~~~~~~~~~
> mpfr-longlong.h:403:3: error: impossible constraint in 'asm'
>    __asm__ ("add.f\t%1, %4, %5\n\tadc\t%0, %2, %3"   \
>    ^
> mul.c:343:11: note: in expansion of macro 'add_ssaaaa'
>            add_ssaaaa (tmp[2], tmp[1], tmp[2], tmp[1], 0, t1);
>            ^~~~~~~~~~
> mpfr-longlong.h:403:3: error: impossible constraint in 'asm'
>    __asm__ ("add.f\t%1, %4, %5\n\tadc\t%0, %2, %3"   \
>    ^
> mul.c:347:11: note: in expansion of macro 'add_ssaaaa'
>            add_ssaaaa (tmp[3], t1, tmp[3], t1, 0, t3);
>            ^~~~~~~~~~
> mpfr-longlong.h:403:3: error: impossible constraint in 'asm'
>    __asm__ ("add.f\t%1, %4, %5\n\tadc\t%0, %2, %3"   \
>    ^
> mul.c:349:11: note: in expansion of macro 'add_ssaaaa'
>            add_ssaaaa (tmp[2], tmp[1], tmp[2], tmp[1], t1, t2);
>            ^~~~~~~~~~

 Compiler bug. I guess the Synopsys people will look at this, right?


http://autobuild.buildroot.net/results/58cf28a3acd518633a1d8ea719bc70aefbdfb311
arm / cortex-m4	mplayer-1.3.0	uclibc	static

> Error: Cannot find header either inttypes.h or bitypes.h. There is no chance for compilation to succeed.
> 
> Check "config.log" if you do not understand why it failed.

And from config.log:

> gcc: error: unrecognized command line option '-marm'

 This homegrown configure script passes -marm except when the option
--enable-thumb is given...


http://autobuild.buildroot.net/results/ab240f93c6b2701c3df08b25d12a4b27b7a24451
i686 / i686	mplayer-1.3.0	glibc	

> libavcodec/h264_cabac.c: In function 'decode_cabac_residual_nondc_internal.isra.5':
> libavcodec/x86/h264_i386.h:144:5: error: 'asm' operand has impossible constraints
>      __asm__ volatile(
>      ^

 I'm not really familiar with i386 assembly, but I suppose it's something that
doesn't work on i686.


http://autobuild.buildroot.net/results/8c20f719f784af1312294600e39004c1d382368a
sh4a	mpv-0.20.0	glibc	
http://autobuild.buildroot.net/results/1db64b4830f499621e44523e0ef68191505e2ce9
arm / arm926ej-s	mpv-0.20.0	uclibc	

> Checking for compiler support for usable thread synchronization built-ins : not found any of sync-builtins, stdatomic, atomic-builtins 

 I guess it needs to depend on some atomic stuff? Needs investigation to find
out what exactly is needed.


http://autobuild.buildroot.net/results/35b43039ee050a62966c6f104ad4b5816ebfc310
powerpc64 / power7	mpv-0.20.0	glibc	

> ../audio/out/ao_sdl.c: In function 'init':
> ../audio/out/ao_sdl.c:178:18: error: incompatible types when assigning to type '__vector __bool int' from type 'int'
>      priv->paused = 1;
>                   ^
> ../audio/out/ao_sdl.c: In function 'reset':
> ../audio/out/ao_sdl.c:186:9: error: wrong type argument to unary exclamation mark
>      if (!priv->paused)
>          ^
> ../audio/out/ao_sdl.c:188:18: error: incompatible types when assigning to type '__vector __bool int' from type 'int'
>      priv->paused = 1;
>                   ^
> ../audio/out/ao_sdl.c: In function 'resume':
> ../audio/out/ao_sdl.c:194:9: error: used vector type where scalar is required
>      if (priv->paused)
>          ^
> ../audio/out/ao_sdl.c:196:18: error: incompatible types when assigning to type '__vector __bool int' from type 'int'
>      priv->paused = 0;
>                   ^

 This was supposed to be fixed by 64904f0 which is already included in this
build. Sam?



http://autobuild.buildroot.net/results/9e019c9878f91fcee985250d77e23da17aa8306e
arm / cortex-a9	net-tools-3f170bff115303e92...	musl	

> In file included from iptunnel.c:30:0:
> /home/buildroot/autobuild/run/instance-3/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/if.h:79:2: error: expected identifier before numeric constant
>   IFF_UP    = 1<<0,  /* sysfs */
>   ^

 musl issue. Who knows, it may even be fixed by 196932cd, but that one is only
on next.


http://autobuild.buildroot.net/results/50018be18ca547b5e1a5c2d90aaf44d8dcdea2f2
x86_64 / atom	xl2tp-v1.3.6	musl	static

> In file included from l2tp.h:245:0,
>                  from avp.c:19:
> /home/peko/autobuild/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/if.h:79:2: error: expected identifier before numeric constant
>   IFF_UP    = 1<<0,  /* sysfs */
>   ^

 Same as above.



http://autobuild.buildroot.net/results/423b5e79cd4342d6c160ed478054b294b0826c6a
powerpc64le / power8	openblas-f04af36ad0e85b64f1...	glibc	
http://autobuild.buildroot.net/results/c9e554c8f880b49b3c9203725ac5e6565b7e5c6f
powerpc64 / power7	openblas-f04af36ad0e85b64f1...	glibc	

> In file included from ../common.h:752:0,
>                  from asum.c:40:
> ../common_thread.h:43:17: fatal error: omp.h: No such file or directory

 Makefile.power assumes that if threads are available, OpenMP is available as
well. This is not the case for the toolchains we build. Since we don't have any
detection of OpenMP in the external toolchain, we will have to pass USE_OPENMP=0
in the make opts.


http://autobuild.buildroot.net/results/500ee8b828699a488697eaac90bd912fe8eb2ca0
arm / arm926ej-s	php-7.0.12	uclibc	static

> checking for cURL support... yes
> checking for cURL 7.10.5 or greater... libcurl 7.51.0
> checking for SSL support in libcurl... yes
> checking how to run the C preprocessor... /home/peko/autobuild/instance-0/output/host/usr/bin/arm-linux-cpp
> checking for openssl support in libcurl... no
> checking for gnutls support in libcurl... no
> checking for curl_easy_perform in -lcurl... no
> configure: error: There is something wrong. Please check config.log for more information.

And config.log:

> configure:23993: /home/peko/autobuild/instance-0/output/host/usr/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -static -fvisibility=hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -L/home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib  -static -L/home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lcurl -lssh2 -lgpg-error -lgcrypt -lgcrypt -lgpg-error -lgcrypt -lz -lssl -lcrypto -lssl -lz -lz -lcrypto -lz -lz conftest.c -lcurl  -lcurl -lpcre -lm -lpthread -lxml2 -lz -lm -lcurl -lssh2 -lgpg-error -lgcrypt -lgcrypt -lgpg-error -lgcrypt -lz -lssl -lcrypto -lssl -lz -lz -lcrypto -lz -lz >&5
> /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgpg-error.a(libgpg_error_la-init.o): In function `_gpg_err_init':
> init.c:(.text+0xc): undefined reference to `libintl_bindtextdomain'
> /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgpg-error.a(libgpg_error_la-strsource.o): In function `_gpg_strsource':
> strsource.c:(.text+0x40): undefined reference to `libintl_dgettext'
> /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgpg-error.a(libgpg_error_la-strerror.o): In function `_gpg_strerror':
> strerror.c:(.text+0x18c): undefined reference to `libintl_dgettext'
> /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgpg-error.a(libgpg_error_la-strerror.o): In function `_gpg_strerror_r':
> strerror.c:(.text+0x260): undefined reference to `libintl_dgettext'

 Static linking issue, missing libintl in libgpg-error's pc file, or the pc file
is not used at some stage in the libcurl->libssh2->libgcrypt->libgpg-error
dependency chain. This one is a fun one to investigate.


http://autobuild.buildroot.net/results/a90e6c44c54d7860007d32cd897d180515f8e8df
arm / arm926ej-s	php-7.0.12	uclibc	static

> /bin/sh /home/buildroot/build/instance-0/output/build/php-7.0.12/libtool --silent --preserve-dup-deps --mode=link /home/buildroot/build/instance-0/output/host/usr/bin/arm-linux-gcc -export-dynamic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -fvisibility=hidden   -L/home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib   ext/date/php_date.lo ext/date/lib/astro.lo ext/date/lib/dow.lo ext/date/lib/parse_date.lo ext/date/lib/parse_tz.lo ext/date/lib/timelib.lo ext/date/lib/tm2unixtime.lo ext/date/lib/unixtime2tm.lo ext/date/lib/parse_iso_intervals.lo ext/date/lib/interval.lo ext/libxml/libxml.lo ext/pcre/php_pcre.lo ext/sqlite3/sqlite3.lo ext/bcmath/bcmath.lo ext/bcmath/libbcmath/src/add.lo ext/bcmath/libbcmath/src/div.lo ext/bcmath/libbcmath/src/init.lo ext/bcmath/libbcmath/src/neg.lo ext/bcmath/libbcmath/src/outofmem.lo ext/bcmath/libbcmath/src/raisemod.lo ext/bcmath/libbcmath/src/rt.lo ext/bcmath/libbcmath/src/sub.lo ext/bcmath/libbcmath/src/compare.lo ext/bcmath/libbcmath/src/divmod.lo ext/bcmath/libbcmath/src/int2num.lo ext/bcmath/libbcmath/src/num2long.lo ext/bcmath/libbcmath/src/output.lo ext/bcmath/libbcmath/src/recmul.lo ext/bcmath/libbcmath/src/sqrt.lo ext/bcmath/libbcmath/src/zero.lo ext/bcmath/libbcmath/src/debug.lo ext/bcmath/libbcmath/src/doaddsub.lo ext/bcmath/libbcmath/src/nearzero.lo ext/bcmath/libbcmath/src/num2str.lo ext/bcmath/libbcmath/src/raise.lo ext/bcmath/libbcmath/src/rmzero.lo ext/bcmath/libbcmath/src/str2num.lo ext/curl/interface.lo ext/curl/multi.lo ext/curl/share.lo ext/curl/curl_file.lo ext/dba/dba.lo ext/dba/dba_cdb.lo ext/dba/dba_dbm.lo ext/dba/dba_gdbm.lo ext/dba/dba_ndbm.lo ext/dba/dba_db1.lo ext/dba/dba_db2.lo ext/dba/dba_db3.lo ext/dba/dba_db4.lo ext/dba/dba_flatfile.lo ext/dba/dba_inifile.lo ext/dba/dba_qdbm.lo ext/dba/dba_tcadb.lo ext/dba/libflatfile/flatfile.lo ext/dba/libinifile/inifile.lo ext/dom/php_dom.lo ext/dom/attr.lo ext/dom/document.lo ext/dom/domerrorhandler.lo ext/dom/domstringlist.lo ext/dom/domexception.lo ext/dom/namelist.lo ext/dom/processinginstruction.lo ext/dom/cdatasection.lo ext/dom/documentfragment.lo ext/dom/domimplementation.lo ext/dom/element.lo ext/dom/node.lo ext/dom/string_extend.lo ext/dom/characterdata.lo ext/dom/documenttype.lo ext/dom/domimplementationlist.lo ext/dom/entity.lo ext/dom/nodelist.lo ext/dom/text.lo ext/dom/comment.lo ext/dom/domconfiguration.lo ext/dom/domimplementationsource.lo ext/dom/entityreference.lo ext/dom/notation.lo ext/dom/xpath.lo ext/dom/dom_iterators.lo ext/dom/typeinfo.lo ext/dom/domerror.lo ext/dom/domlocator.lo ext/dom/namednodemap.lo ext/dom/userdatahandler.lo ext/json/json.lo ext/json/json_encoder.lo ext/json/json_parser.lo ext/json/json_scanner.lo ext/mbstring/oniguruma/regcomp.lo ext/mbstring/oniguruma/regerror.lo ext/mbstring/oniguruma/regexec.lo ext/mbstring/oniguruma/reggnu.lo ext/mbstring/oniguruma/regparse.lo ext/mbstring/oniguruma/regenc.lo ext/mbstring/oniguruma/regext.lo ext/mbstring/oniguruma/regsyntax.lo ext/mbstring/oniguruma/regtrav.lo ext/mbstring/oniguruma/regversion.lo ext/mbstring/oniguruma/st.lo ext/mbstring/oniguruma/enc/unicode.lo ext/mbstring/oniguruma/enc/ascii.lo ext/mbstring/oniguruma/enc/utf8.lo ext/mbstring/oniguruma/enc/euc_jp.lo ext/mbstring/oniguruma/enc/euc_tw.lo ext/mbstring/oniguruma/enc/euc_kr.lo ext/mbstring/oniguruma/enc/sjis.lo ext/mbstring/oniguruma/enc/iso8859_1.lo ext/mbstring/oniguruma/enc/iso8859_2.lo ext/mbstring/oniguruma/enc/iso8859_3.lo ext/mbstring/oniguruma/enc/iso8859_4.lo ext/mbstring/oniguruma/enc/iso8859_5.lo ext/mbstring/oniguruma/enc/iso8859_6.lo ext/mbstring/oniguruma/enc/iso8859_7.lo ext/mbstring/oniguruma/enc/iso8859_8.lo ext/mbstring/oniguruma/enc/iso8859_9.lo ext/mbstring/oniguruma/enc/iso8859_10.lo ext/mbstring/oniguruma/enc/iso8859_11.lo ext/mbstring/oniguruma/enc/iso8859_13.lo ext/mbstring/oniguruma/enc/iso8859_14.lo ext/mbstring/oniguruma/enc/iso8859_15.lo ext/mbstring/oniguruma/enc/iso8859_16.lo ext/mbstring/oniguruma/enc/koi8.lo ext/mbstring/oniguruma/enc/koi8_r.lo ext/mbstring/oniguruma/enc/big5.lo ext/mbstring/oniguruma/enc/utf16_be.lo ext/mbstring/oniguruma/enc/utf16_le.lo ext/mbstring/oniguruma/enc/utf32_be.lo ext/mbstring/oniguruma/enc/utf32_le.lo ext/mbstring/libmbfl/filters/html_entities.lo ext/mbstring/libmbfl/filters/mbfilter_7bit.lo ext/mbstring/libmbfl/filters/mbfilter_ascii.lo ext/mbstring/libmbfl/filters/mbfilter_base64.lo ext/mbstring/libmbfl/filters/mbfilter_big5.lo ext/mbstring/libmbfl/filters/mbfilter_byte2.lo ext/mbstring/libmbfl/filters/mbfilter_byte4.lo ext/mbstring/libmbfl/filters/mbfilter_cp1251.lo ext/mbstring/libmbfl/filters/mbfilter_cp1252.lo ext/mbstring/libmbfl/filters/mbfilter_cp1254.lo ext/mbstring/libmbfl/filters/mbfilter_cp5022x.lo ext/mbstring/libmbfl/filters/mbfilter_cp51932.lo ext/mbstring/libmbfl/filters/mbfilter_cp850.lo ext/mbstring/libmbfl/filters/mbfilter_cp866.lo ext/mbstring/libmbfl/filters/mbfilter_cp932.lo ext/mbstring/libmbfl/filters/mbfilter_cp936.lo ext/mbstring/libmbfl/filters/mbfilter_gb18030.lo ext/mbstring/libmbfl/filters/mbfilter_euc_cn.lo ext/mbstring/libmbfl/filters/mbfilter_euc_jp.lo ext/mbstring/libmbfl/filters/mbfilter_euc_jp_2004.lo ext/mbstring/libmbfl/filters/mbfilter_euc_jp_win.lo ext/mbstring/libmbfl/filters/mbfilter_euc_kr.lo ext/mbstring/libmbfl/filters/mbfilter_euc_tw.lo ext/mbstring/libmbfl/filters/mbfilter_htmlent.lo ext/mbstring/libmbfl/filters/mbfilter_hz.lo ext/mbstring/libmbfl/filters/mbfilter_iso2022_jp_ms.lo ext/mbstring/libmbfl/filters/mbfilter_iso2022jp_2004.lo ext/mbstring/libmbfl/filters/mbfilter_iso2022jp_mobile.lo ext/mbstring/libmbfl/filters/mbfilter_iso2022_kr.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_1.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_10.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_13.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_14.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_15.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_16.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_2.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_3.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_4.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_5.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_6.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_7.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_8.lo ext/mbstring/libmbfl/filters/mbfilter_iso8859_9.lo ext/mbstring/libmbfl/filters/mbfilter_jis.lo ext/mbstring/libmbfl/filters/mbfilter_koi8r.lo ext/mbstring/libmbfl/filters/mbfilter_armscii8.lo ext/mbstring/libmbfl/filters/mbfilter_qprint.lo ext/mbstring/libmbfl/filters/mbfilter_sjis.lo ext/mbstring/libmbfl/filters/mbfilter_sjis_open.lo ext/mbstring/libmbfl/filters/mbfilter_sjis_mobile.lo ext/mbstring/libmbfl/filters/mbfilter_sjis_mac.lo ext/mbstring/libmbfl/filters/mbfilter_sjis_2004.lo ext/mbstring/libmbfl/filters/mbfilter_tl_jisx0201_jisx0208.lo ext/mbstring/libmbfl/filters/mbfilter_ucs2.lo ext/mbstring/libmbfl/filters/mbfilter_ucs4.lo ext/mbstring/libmbfl/filters/mbfilter_uhc.lo ext/mbstring/libmbfl/filters/mbfilter_utf16.lo ext/mbstring/libmbfl/filters/mbfilter_utf32.lo ext/mbstring/libmbfl/filters/mbfilter_utf7.lo ext/mbstring/libmbfl/filters/mbfilter_utf7imap.lo ext/mbstring/libmbfl/filters/mbfilter_utf8.lo ext/mbstring/libmbfl/filters/mbfilter_utf8_mobile.lo ext/mbstring/libmbfl/filters/mbfilter_uuencode.lo ext/mbstring/libmbfl/filters/mbfilter_koi8u.lo ext/mbstring/libmbfl/mbfl/mbfilter.lo ext/mbstring/libmbfl/mbfl/mbfilter_8bit.lo ext/mbstring/libmbfl/mbfl/mbfilter_pass.lo ext/mbstring/libmbfl/mbfl/mbfilter_wchar.lo ext/mbstring/libmbfl/mbfl/mbfl_convert.lo ext/mbstring/libmbfl/mbfl/mbfl_encoding.lo ext/mbstring/libmbfl/mbfl/mbfl_filter_output.lo ext/mbstring/libmbfl/mbfl/mbfl_ident.lo ext/mbstring/libmbfl/mbfl/mbfl_language.lo ext/mbstring/libmbfl/mbfl/mbfl_memory_device.lo ext/mbstring/libmbfl/mbfl/mbfl_string.lo ext/mbstring/libmbfl/mbfl/mbfl_allocators.lo ext/mbstring/libmbfl/nls/nls_de.lo ext/mbstring/libmbfl/nls/nls_en.lo ext/mbstring/libmbfl/nls/nls_ja.lo ext/mbstring/libmbfl/nls/nls_kr.lo ext/mbstring/libmbfl/nls/nls_neutral.lo ext/mbstring/libmbfl/nls/nls_ru.lo ext/mbstring/libmbfl/nls/nls_uni.lo ext/mbstring/libmbfl/nls/nls_zh.lo ext/mbstring/libmbfl/nls/nls_hy.lo ext/mbstring/libmbfl/nls/nls_tr.lo ext/mbstring/libmbfl/nls/nls_ua.lo ext/mbstring/mbstring.lo ext/mbstring/php_unicode.lo ext/mbstring/mb_gpc.lo ext/mbstring/php_mbregex.lo ext/posix/posix.lo ext/reflection/php_reflection.lo ext/simplexml/simplexml.lo ext/simplexml/sxe.lo ext/snmp/snmp.lo ext/spl/php_spl.lo ext/spl/spl_functions.lo ext/spl/spl_engine.lo ext/spl/spl_iterators.lo ext/spl/spl_array.lo ext/spl/spl_directory.lo ext/spl/spl_exceptions.lo ext/spl/spl_observer.lo ext/spl/spl_dllist.lo ext/spl/spl_heap.lo ext/spl/spl_fixedarray.lo ext/standard/crypt_freesec.lo ext/standard/crypt_blowfish.lo ext/standard/crypt_sha512.lo ext/standard/crypt_sha256.lo ext/standard/php_crypt_r.lo ext/standard/array.lo ext/standard/base64.lo ext/standard/basic_functions.lo ext/standard/browscap.lo ext/standard/crc32.lo ext/standard/crypt.lo ext/standard/cyr_convert.lo ext/standard/datetime.lo ext/standard/dir.lo ext/standard/dl.lo ext/standard/dns.lo ext/standard/exec.lo ext/standard/file.lo ext/standard/filestat.lo ext/standard/flock_compat.lo ext/standard/formatted_print.lo ext/standard/fsock.lo ext/standard/head.lo ext/standard/html.lo ext/standard/image.lo ext/standard/info.lo ext/standard/iptc.lo ext/standard/lcg.lo ext/standard/link.lo ext/standard/mail.lo ext/standard/math.lo ext/standard/md5.lo ext/standard/metaphone.lo ext/standard/microtime.lo ext/standard/pack.lo ext/standard/pageinfo.lo ext/standard/quot_print.lo ext/standard/rand.lo ext/standard/soundex.lo ext/standard/string.lo ext/standard/scanf.lo ext/standard/syslog.lo ext/standard/type.lo ext/standard/uniqid.lo ext/standard/url.lo ext/standard/var.lo ext/standard/versioning.lo ext/standard/assert.lo ext/standard/strnatcmp.lo ext/standard/levenshtein.lo ext/standard/incomplete_class.lo ext/standard/url_scanner_ex.lo ext/standard/ftp_fopen_wrapper.lo ext/standard/http_fopen_wrapper.lo ext/standard/php_fopen_wrapper.lo ext/standard/credits.lo ext/standard/css.lo ext/standard/var_unserializer.lo ext/standard/ftok.lo ext/standard/sha1.lo ext/standard/user_filters.lo ext/standard/uuencode.lo ext/standard/filters.lo ext/standard/proc_open.lo ext/standard/streamsfuncs.lo ext/standard/http.lo ext/standard/password.lo ext/standard/random.lo ext/xml/xml.lo ext/xml/compat.lo ext/xmlrpc/xmlrpc-epi-php.lo ext/xmlrpc/libxmlrpc/base64.lo ext/xmlrpc/libxmlrpc/simplestring.lo ext/xmlrpc/libxmlrpc/xml_to_dandarpc.lo ext/xmlrpc/libxmlrpc/xmlrpc_introspection.lo ext/xmlrpc/libxmlrpc/encodings.lo ext/xmlrpc/libxmlrpc/system_methods.lo ext/xmlrpc/libxmlrpc/xml_to_xmlrpc.lo ext/xmlrpc/libxmlrpc/queue.lo ext/xmlrpc/libxmlrpc/xml_element.lo ext/xmlrpc/libxmlrpc/xmlrpc.lo ext/xmlrpc/libxmlrpc/xml_to_soap.lo TSRM/TSRM.lo TSRM/tsrm_strtok_r.lo main/main.lo main/snprintf.lo main/spprintf.lo main/php_sprintf.lo main/fopen_wrappers.lo main/alloca.lo main/php_scandir.lo main/php_ini.lo main/SAPI.lo main/rfc1867.lo main/php_content_types.lo main/strlcpy.lo main/strlcat.lo main/mergesort.lo main/reentrancy.lo main/php_variables.lo main/php_ticks.lo main/network.lo main/php_open_temporary_file.lo main/output.lo main/getopt.lo main/streams/streams.lo main/streams/cast.lo main/streams/memory.lo main/streams/filter.lo main/streams/plain_wrapper.lo main/streams/userspace.lo main/streams/transports.lo main/streams/xp_socket.lo main/streams/mmap.lo main/streams/glob_wrapper.lo Zend/zend_language_parser.lo Zend/zend_language_scanner.lo Zend/zend_ini_parser.lo Zend/zend_ini_scanner.lo Zend/zend_alloc.lo Zend/zend_compile.lo Zend/zend_constants.lo Zend/zend_dtrace.lo Zend/zend_execute_API.lo Zend/zend_highlight.lo Zend/zend_llist.lo Zend/zend_vm_opcodes.lo Zend/zend_opcode.lo Zend/zend_operators.lo Zend/zend_ptr_stack.lo Zend/zend_stack.lo Zend/zend_variables.lo Zend/zend.lo Zend/zend_API.lo Zend/zend_extensions.lo Zend/zend_hash.lo Zend/zend_list.lo Zend/zend_builtin_functions.lo Zend/zend_sprintf.lo Zend/zend_ini.lo Zend/zend_sort.lo Zend/zend_multibyte.lo Zend/zend_ts_hash.lo Zend/zend_stream.lo Zend/zend_iterators.lo Zend/zend_interfaces.lo Zend/zend_exceptions.lo Zend/zend_strtod.lo Zend/zend_gc.lo Zend/zend_closures.lo Zend/zend_float.lo Zend/zend_string.lo Zend/zend_signal.lo Zend/zend_generators.lo Zend/zend_virtual_cwd.lo Zend/zend_ast.lo Zend/zend_objects.lo Zend/zend_object_handlers.lo Zend/zend_objects_API.lo Zend/zend_default_classes.lo Zend/zend_inheritance.lo Zend/zend_smart_str.lo Zend/zend_execute.lo main/internal_functions_cli.lo main/fastcgi.lo sapi/cgi/cgi_main.lo -ldb-5.3 -lcurl -lsqlite3 -lpcre -lm -lpthread -L/home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lsqlite3 -lxml2 -lz -lm -lcurl -lssl -lcrypto -lssl -lz -lz -lcrypto -lz -lz -lxml2 -lz -lm -lxml2 -lz -lm -lnetsnmp -lssl -lssl -lcrypto -lz -lxml2 -lz -lm -lxml2 -lz -lm  -o sapi/cgi/php-cgi
> /home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(regex.os): In function `re_compile_pattern':
> regex.c:(.text+0xa638): multiple definition of `re_compile_pattern'
> ext/mbstring/oniguruma/reggnu.o:reggnu.c:(.text+0xc4): first defined here

 Hm, I would expect that that module isn't used if regex is available in libc...
Needs investigation.


http://autobuild.buildroot.net/results/0ad82cc30cebe0ce9ea08b354c1dd939c356cbd9
mips64el / mips64	polarssl-1.2.19	uclibc	static

> /home/peko/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libcrypto.a(c_zlib.o): In function `zlib_stateful_expand_block':
> c_zlib.c:(.text+0x78): undefined reference to `inflate'
> c_zlib.c:(.text+0x80): undefined reference to `inflate'

 The usual.


http://autobuild.buildroot.net/results/cb967c8af006caa9272e800968f794ca018a7a27
bfin / bf512	ptpd2-ptpd-2.3.1	uclibc	
http://autobuild.buildroot.net/results/9a046dc5ef390e562b89338f0afeaef14b945458
bfin / bf512	ptpd2-ptpd-2.3.1	uclibc	

> ptpd.c: In function 'main':
> ptpd.c:140:1: internal compiler error: in gen_add2_insn, at optabs.c:4454
>  }
>  ^

 This is with the internal toolchain, so needs investigation. It vaguely rings a
bell, however. Did we discuss this one before?



http://autobuild.buildroot.net/results/845a1e990eae3cc8a148f846db4ac597ebaedb4a
x86_64 / atom	python-libconfig-b271c3d9da...	musl	

> In file included from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/instance_holder.hpp:11:0,
>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/object/pointer_holder.hpp:14,
>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/to_python_indirect.hpp:10,
>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/arg_to_python.hpp:10,
>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/call.hpp:15,
>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/object_core.hpp:14,
>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/args.hpp:25,
>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python.hpp:11,
>                  from src/pylibconfig.cc:1:
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/type_id.hpp: In instantiation of 'boost::python::type_info boost::python::type_id() [with T = const volatile _IO_FILE&]':
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/registered.hpp:91:42:   required from 'const boost::python::converter::registration& boost::python::converter::detail::registry_lookup2(T& (*)()) [with T = const volatile _IO_FILE]'
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/registered.hpp:98:30:   required from 'const boost::python::converter::registration& boost::python::converter::detail::registry_lookup1(boost::type<Target>) [with T = const volatile _IO_FILE&]'
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/registered.hpp:109:80:   required from 'const boost::python::converter::registration& boost::python::converter::detail::registered_base<const volatile _IO_FILE&>::converters'
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/arg_from_python.hpp:269:61:   required from 'boost::python::converter::pointer_arg_from_python<T>::pointer_arg_from_python(PyObject*) [with T = _IO_FILE*; PyObject = _object]'
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/arg_from_python.hpp:70:18:   required from 'boost::python::arg_from_python<T>::arg_from_python(PyObject*) [with T = _IO_FILE*; PyObject = _object]'
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/preprocessor/iteration/detail/local.hpp:37:9:   required from 'PyObject* boost::python::detail::caller_arity<2u>::impl<F, Policies, Sig>::operator()(PyObject*, PyObject*) [with F = void (pyConfig::*)(_IO_FILE*); Policies = boost::python::default_call_policies; Sig = boost::mpl::vector3<void, pyConfig&, _IO_FILE*>; PyObject = _object]'
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/object/py_function.hpp:38:33:   required from 'PyObject* boost::python::objects::caller_py_function_impl<Caller>::operator()(PyObject*, PyObject*) [with Caller = boost::python::detail::caller<void (pyConfig::*)(_IO_FILE*), boost::python::default_call_policies, boost::mpl::vector3<void, pyConfig&, _IO_FILE*> >; PyObject = _object]'
> src/pylibconfig.cc:233:1:   required from here
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/type_id.hpp:84:9: error: invalid use of incomplete type 'struct _IO_FILE'
>          );
>          ^

 Missing #include in a boost header? Yegor?



http://autobuild.buildroot.net/results/c9233ad71fd60d0e6a85731a8bd4e598bd84947a
arm / arm926ej-s	qextserialport-ada321a9ee46...	uclibc	static

> /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -static -Wl,-O1 -shared -Wl,-soname,libqextserialport.so.1 -o libqextserialport.so.1.2.0 qextserialport.o qextserialenumerator.o qextserialport_unix.o qextserialenumerator_linux.o   -L/home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lQtCore -L/home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot//usr/lib -lm -L/home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lgthread-2.0 -lglib-2.0 -pthread -lintl -lpcre -lrt -lpthread  
> /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libstdc++.a(eh_globals.o)(.text.__cxa_get_globals_fast+0x14): R_ARM_TLS_LE32 relocation not permitted in shared object
> /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libstdc++.a(eh_globals.o): In function `__cxa_get_globals_fast':
> eh_globals.cc:(.text.__cxa_get_globals_fast+0x14): dangerous relocation: unsupported relocation
> /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libstdc++.a(eh_globals.o)(.text.__cxa_get_globals+0x14): R_ARM_TLS_LE32 relocation not permitted in shared object
> /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libstdc++.a(eh_globals.o): In function `__cxa_get_globals':
> eh_globals.cc:(.text.__cxa_get_globals+0x14): dangerous relocation: unsupported relocation
> /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_fini':
> __uClibc_main.c:(.text+0x138): undefined reference to `__fini_array_end'
> __uClibc_main.c:(.text+0x13c): undefined reference to `__fini_array_start'
> __uClibc_main.c:(.text+0x140): undefined reference to `__fini_array_start'
> /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_main':
> __uClibc_main.c:(.text+0x568): undefined reference to `__preinit_array_start'
> __uClibc_main.c:(.text+0x56c): undefined reference to `__preinit_array_end'
> __uClibc_main.c:(.text+0x570): undefined reference to `__preinit_array_start'
> __uClibc_main.c:(.text+0x574): undefined reference to `__init_array_start'
> __uClibc_main.c:(.text+0x578): undefined reference to `__init_array_end'
> __uClibc_main.c:(.text+0x57c): undefined reference to `__init_array_start'
> /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: libqextserialport.so.1.2.0: hidden symbol `__fini_array_end' isn't defined
> /home/rclinux/rc-buildroot-test/scripts/instance-2/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: final link failed: Bad value

 Tries to build a shared library in a static build. Probably a configure issue.



http://autobuild.buildroot.net/results/e0f6c2549ed79a8f099eb87e5812749ccc3a85be
i586 / pentium-mmx	ruby-2.3.1	musl	

> linking miniruby
> array.o: In function `rb_ary_repeated_combination':
> array.c:(.text+0x2c08): undefined reference to `__stack_chk_fail_local'
> array.o: In function `rb_ary_repeated_permutation':
> array.c:(.text+0x2de0): undefined reference to `__stack_chk_fail_local'
> array.o: In function `rb_ary_combination':
> array.c:(.text+0x2fc7): undefined reference to `__stack_chk_fail_local'
> array.o: In function `rb_ary_permutation':
> array.c:(.text+0x3254): undefined reference to `__stack_chk_fail_local'
> array.o: In function `rb_ary_zip':
> array.c:(.text+0x6421): undefined reference to `__stack_chk_fail_local'
> bignum.o:bignum.c:(.text+0x1279): more undefined references to `__stack_chk_fail_local' follow
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/5.4.0/../../../../i586-buildroot-linux-musl/bin/ld: miniruby: hidden symbol `__stack_chk_fail_local' isn't defined
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/5.4.0/../../../../i586-buildroot-linux-musl/bin/ld: final link failed: Bad value

 It is configured with --disable-libssp, not sure what's going on here...


http://autobuild.buildroot.net/results/b2fe90ab02c3e0d9588f79499065635723824320
i586 / pentium-mmx	stunnel-5.36	musl	

> stunnel-client.o: In function `connect_local':
> client.c:(.text+0x536): undefined reference to `__stack_chk_fail_local'

 Hm, looks awfully familiar :-)


http://autobuild.buildroot.net/results/3cb074ea467042348d443f8b7f9408701432d888
arm / cortex-a9	sysklogd-1.5.1	musl	

> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/usr/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -DSYSV -DFSSTND   -c klogd.c
> In file included from klogd.c:263:0:
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/sys/fcntl.h:1:2: warning: #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Wcpp]
>  #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>
>   ^
> In file included from klogd.c:266:0:
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/time.h:9:8: error: redefinition of 'struct timespec'
>  struct timespec {
>         ^
> In file included from /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/signal.h:28:0,
>                  from klogd.c:261:
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/bits/alltypes.h:257:8: note: originally defined here
>  struct timespec { time_t tv_sec; long tv_nsec; };

 Musl header conflict. May be fixed by 196932cd.



http://autobuild.buildroot.net/results/d01e947fa807336ffcfd0fad27397af8e7442833
arm / arm926ej-s	taskd-1.1.0	uclibc	static

> x509_ext.c:(.text+0xf78): undefined reference to `asn1_write_value'
... and hundreds like that

 It already uses pkgconfig to find gnutls, so not sure what is happening here.


http://autobuild.buildroot.net/results/9b53443bbb0ee88f7bddb72b3c4423f928c810d1
arm / cortex-a9	tcpreplay-4.1.1	musl	
http://autobuild.buildroot.net/results/7f4ba458d28d0b1eb6a4052276ae31aa1318f106
x86_64 / atom	tcpreplay-4.1.1	musl	

> In file included from ../../src/common/fakepoll.h:44:0,
>                  from ../../src/common.h:38,
>                  from sendpacket.c:59:
> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
>  #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
>   ^
> sendpacket.c:152:13: error: conflicting types for 'socklen_t'
>  typedef int socklen_t;

 Yet another musl messed up headers issue. May be fixed by 196932cd.


http://autobuild.buildroot.net/results/8c5d39e90fedac98cf9a9d5ac35c683efc3892b9
microblazeel	vlc-2.2.4	uclibc	
http://autobuild.buildroot.net/results/432d0fb0bd872aa334069af17a0f41f9a4eb9633
microblazeel	vlc-2.2.4	uclibc	

> video_output/video_output.c: In function 'ThreadDisplayPicture':
> video_output/video_output.c:1154:1: internal compiler error: in merge_overlapping_regs, at regrename.c:304
>  }
>  ^

 ICE. Perhaps just disable vlc on microblaze?


http://autobuild.buildroot.net/results/986fdb636bfa0bcb6c5ec224a1eaaf86521119a5
i586 / pentium-mmx	xapp_xload-1.1.2	musl	

> get_rload.c:27:29: fatal error: protocols/rwhod.h: No such file or directory
> compilation terminated.

 rwhod.h is not available on musl. Workaround: pass -DRLOADSTUB like on Cygwin.


http://autobuild.buildroot.net/results/01574937006c9da190e2e3cffd5432460e374984
arm / cortex-a9	xfsprogs-4.7.0	musl	
http://autobuild.buildroot.net/results/f68037b8b64d9ec663c5070ae7858a5e61cace43
i586 / pentium-mmx	xfsprogs-4.7.0	musl	

> In file included from ../include/xfs.h:37:0,
>                  from radix-tree.c:22:
> ../include/xfs/linux.h: In function 'platform_discard_blocks':
> ../include/xfs/linux.h:129:2: error: unknown type name '__uint64_t'
>   __uint64_t range[2] = { start, len };
>   ^

 Needs the usual musl int types fixes.




 I'll try to do some of the low hanging fruit tomorrow.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
