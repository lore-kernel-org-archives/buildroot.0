From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 2 Jul 2008 20:22:33 +0200
Subject: [Buildroot] uClibc missing limits.h
References: <485F9581.2040204@cetrtapot.si>
	<20080623131648.GE8920@mx.loc><4860D71A.4060104@cetrtapot.si>
	<486B4357.8060908@cetrtapot.si>
Message-ID: <3E421C7434714D94B87F0D1F52CDEA8D@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Hinko Kocevar wrote:
>> Bernhard Fischer wrote:
>>> On Mon, Jun 23, 2008 at 02:22:25PM +0200, Hinko Kocevar wrote:
>>>> Hi,
>>>>
>>>> I've found a way for uClibc to find headers that are not in the $(shell 
>>>> $CC -print-file-name=include), but in $(shell 
>>>> $CC -print-file-name=include)-fixed.
>>>> According to http://sourceware.org/ml/libc-alpha/2007-03/msg00017.html 
>>>> LIBC should also look in other gcc provided header directories (eg. 
>>>> include-fixed) instead only relying on 'include' to contain all correct 
>>>> headers.
>>>>
>>>> Below is uClibc patch for this (tested on cris).
>>> Well, that's not really correct since the default search path already
>>> should to be
>>> $target_triple/$ver/include \
>>> $target_triple/$ver/include-fixed \
>>>

Removing "-nostdinc" from CFLAGS in "uClibc-0.9.29/Rules.mak"
allows the ARM compilation to continue,
but it again bombs since the function "testandset" has multiple definitions.
Detected in libc_pthread_init.c and rpc_thread.c.
It is "first defined" in "forward.c"

Best Regards
Ulf Samuelsson


>
> It is not if -nostdinc is in the compiler command line (see below).
>
>>> And apart from that you would not get away with just doing this for 
>>> uClibc..
>>>
>>> Please paste the failing "cross-gcc -v" invocation that fails to find
>>> the include-fixed.
>>
>
> Here the compiler line that fails to find include-fixed:
>
> hinkok at alala /work/stage/buildroot/toolchain_build_cris/uClibc-0.9.29 $ 
> /work/stage/buildroot/build_cris/staging_dir/usr/bin/cris-linux-uclibc-gcc 
>  -c libc/sysdeps/linux/common/chdir.c -o 
> libc/sysdeps/linux/common/chdir.os -include 
> ./include/libc-symbols.h -Wall -Wstrict-prototypes -fno-strict-aliasing -fno-stack-protector 
>  -fno-builtin -nostdinc -I./include -I. --sysroot=/work/stage/buildroot/build_cris/staging_dir/ 
>  -isysroot 
> /work/stage/buildroot/build_cris/staging_dir -I=/usr/include -Os -pipe -I/work/stage/buildroot/build_cris/staging_dir/usr/include 
>  -mtune=v10 -march=v10 -std=gnu99 -Os -funit-at-a-time -fno-tree-loop-optimize 
>  -fno-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/cris 
>  -I./libpthread/linuxthreads.old/sysdeps/cris -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux 
>  -I./libpthread/linuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old 
>  -I./libpthread -I/work/stage/buildroot/toolchain_build_cris/linux
> /include/ -isystem 
> /work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include 
>  -DNDEBUG -fpic -v
> Using built-in specs.
> Target: cris-linux-uclibc
> Configured with: 
> /work/stage/buildroot/toolchain_build_cris/gcc-4.3.1/configure --prefix=/work/stage/buildroot/build_cris/staging_dir/usr 
>  --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=cris-linux-uclibc 
>  --enable-languages=c --with-sysroot=/work/stage/buildroot/toolchain_build_cris/uClibc_dev/ 
>  --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-shared 
>  --with-gmp=/work/stage/buildroot/toolchain_build_cris/gmp --with-mpfr=/work/stage/buildroot/toolchain_build_cris/mpfr 
>  --enable-threads --disable-multilib --disable-libssp --disable-libssp --disable-libmudflap 
>  --disable-libgomp
> Thread model: posix
> gcc version 4.3.1 (GCC)
> COLLECT_GCC_OPTIONS='-c' '-o' 'libc/sysdeps/linux/common/chdir.os' 
> '-include' './include/libc-symbols.h' '-Wall' '-Wstrict-prototypes' 
> '-fno-strict-aliasing' '-fno-stack-protector' '-fno-builtin' '-nostdinc' 
> '-I./include' '-I.' '-isysroot' 
> '/work/stage/buildroot/build_cris/staging_dir' '-I=/usr/include' '-Os' 
> '-pipe' '-I/work/stage/buildroot/build_cris/staging_dir/usr/include' 
> '-mtune=v10' '-march=v10' '-std=gnu99' '-Os' '-funit-at-a-time' 
> '-fno-tree-loop-optimize' '-fno-tree-dominator-opts' 
> '-fno-strength-reduce' 
> '-I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/cris' 
> '-I./libpthread/linuxthreads.old/sysdeps/cris' 
> '-I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux' 
> '-I./libpthread/linuxthreads.old/sysdeps/pthread' 
> '-I./libpthread/linuxthreads.old' '-I./libpthread' 
> '-I/work/stage/buildroot/toolchain_build_cris/linux/include/' '-isystem' 
> '/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include' 
> '-DNDEBUG' '-fpic' '-v'
> /work/stage/buildroot/build_cris/staging_dir/usr/libexec/gcc/cris-linux-uclibc/4.3.1/cc1 
>  -quiet -nostdinc -v -I./include -I. -I=/usr/include -I/work/stage/buildroot/build_cris/staging_dir/usr/include 
>  -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/cris -I./libpthread/linuxthreads.old/sysdeps/cris 
>  -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthreads.old/sysdeps/pthread 
>  -I./libpthread/linuxthreads.old -I./libpthread -I/work/stage/buildroot/toolchain_build_cris/linux/include/ 
>  -isysroot 
> /work/stage/buildroot/build_cris/staging_dir/ -D__tune_v10 -D__CRIS_arch_tune=10 
>  -D__arch_v10 -D__CRIS_arch_version=10 -DNDEBUG -include 
> ./include/libc-symbols.h -isysroot 
> /work/stage/buildroot/build_cris/staging_dir -isystem 
> /work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include 
> libc/sysdeps/linux/common/chdir.c -quiet -dumpbase 
> chdir.c -mtune=v10 -march=v10 -auxbase-strip 
> libc/sysdeps/linux/common/chdir.os -Os -Os -Wall -W
> strict-prototypes -std=gnu99 -version -fno-strict-aliasing -fno-stack-protector 
>  -fno-builtin -funit-at-a-time -fno-tree-loop-optimize -fno-tree-dominator-opts 
>  -fno-strength-reduce -fpic -o - |
> /work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/as 
>  -v --em=criself --no-underscore --pic -o 
> libc/sysdeps/linux/common/chdir.os -
> GNU assembler version 2.18 (cris-linux-uclibc) using BFD version (GNU 
> Binutils) 2.18
> ignoring duplicate directory 
> "/work/stage/buildroot/build_cris/staging_dir/usr/include"
> ignoring nonexistent directory 
> "./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/cris"
> ignoring nonexistent directory 
> "./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux"
> #include "..." search starts here:
> #include <...> search starts here:
> ./include
> .
> /work/stage/buildroot/build_cris/staging_dir/usr/include
> ./libpthread/linuxthreads.old/sysdeps/cris
> ./libpthread/linuxthreads.old/sysdeps/pthread
> ./libpthread/linuxthreads.old
> ./libpthread
> /work/stage/buildroot/toolchain_build_cris/linux/include/
> /work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include
> End of search list.
> GNU C (GCC) version 4.3.1 (cris-linux-uclibc)
> compiled by GNU C version 4.1.2 (Gentoo 4.1.2 p1.1), GMP version 4.2.2, 
> MPFR version 2.3.1.
> GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
> Compiler executable checksum: 8d9cd5fbd7efd311d4ba9389bc2ae5b7
> In file included from ./include/sys/param.h:22,
>                 from libc/sysdeps/linux/common/chdir.c:13:
> ./include/limits.h:124:26: error: limits.h: No such file or directory
>
>
> Quick fix was to remove the '-nostdinc' flag, the include-fixed is also 
> seen in the includes list:
>
> hinkok at alala /work/stage/buildroot/toolchain_build_cris/uClibc-0.9.29 $ 
> /work/stage/buildroot/build_cris/staging_dir/usr/bin/cris-linux-uclibc-gcc 
>  -c libc/sysdeps/linux/common/chdir.c -o 
> libc/sysdeps/linux/common/chdir.os -include 
> ./include/libc-symbols.h -Wall -Wstrict-prototypes -fno-strict-aliasing -fno-stack-protector 
>  -fno-builtin -I./include -I. --sysroot=/work/stage/buildroot/build_cris/staging_dir/ 
>  -isysroot 
> /work/stage/buildroot/build_cris/staging_dir -I=/usr/include -Os -pipe -I/work/stage/buildroot/build_cris/staging_dir/usr/include 
>  -mtune=v10 -march=v10 -std=gnu99 -Os -funit-at-a-time -fno-tree-loop-optimize 
>  -fno-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/cris 
>  -I./libpthread/linuxthreads.old/sysdeps/cris -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux 
>  -I./libpthread/linuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old 
>  -I./libpthread -I/work/stage/buildroot/toolchain_build_cris/linux/include/
> -isystem 
> /work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include 
>  -DNDEBUG -fpic -v
> Using built-in specs.
> Target: cris-linux-uclibc
> Configured with: 
> /work/stage/buildroot/toolchain_build_cris/gcc-4.3.1/configure --prefix=/work/stage/buildroot/build_cris/staging_dir/usr 
>  --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=cris-linux-uclibc 
>  --enable-languages=c --with-sysroot=/work/stage/buildroot/toolchain_build_cris/uClibc_dev/ 
>  --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-shared 
>  --with-gmp=/work/stage/buildroot/toolchain_build_cris/gmp --with-mpfr=/work/stage/buildroot/toolchain_build_cris/mpfr 
>  --enable-threads --disable-multilib --disable-libssp --disable-libssp --disable-libmudflap 
>  --disable-libgomp
> Thread model: posix
> gcc version 4.3.1 (GCC)
> COLLECT_GCC_OPTIONS='-c' '-o' 'libc/sysdeps/linux/common/chdir.os' 
> '-include' './include/libc-symbols.h' '-Wall' '-Wstrict-prototypes' 
> '-fno-strict-aliasing' '-fno-stack-protector' '-fno-builtin' '-I./include' 
> '-I.' '-isysroot' '/work/stage/buildroot/build_cris/staging_dir' 
> '-I=/usr/include' '-Os' '-pipe' 
> '-I/work/stage/buildroot/build_cris/staging_dir/usr/include' '-mtune=v10' 
> '-march=v10' '-std=gnu99' '-Os' '-funit-at-a-time' 
> '-fno-tree-loop-optimize' '-fno-tree-dominator-opts' 
> '-fno-strength-reduce' 
> '-I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/cris' 
> '-I./libpthread/linuxthreads.old/sysdeps/cris' 
> '-I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux' 
> '-I./libpthread/linuxthreads.old/sysdeps/pthread' 
> '-I./libpthread/linuxthreads.old' '-I./libpthread' 
> '-I/work/stage/buildroot/toolchain_build_cris/linux/include/' '-isystem' 
> '/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include' 
> '-DNDEBUG' '-fpic' '-v'
> /work/stage/buildroot/build_cris/staging_dir/usr/libexec/gcc/cris-linux-uclibc/4.3.1/cc1 
>  -quiet -v -I./include -I. -I=/usr/include -I/work/stage/buildroot/build_cris/staging_dir/usr/include 
>  -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/cris -I./libpthread/linuxthreads.old/sysdeps/cris 
>  -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthreads.old/sysdeps/pthread 
>  -I./libpthread/linuxthreads.old -I./libpthread -I/work/stage/buildroot/toolchain_build_cris/linux/include/ 
>  -isysroot 
> /work/stage/buildroot/build_cris/staging_dir/ -D__tune_v10 -D__CRIS_arch_tune=10 
>  -D__arch_v10 -D__CRIS_arch_version=10 -DNDEBUG -include 
> ./include/libc-symbols.h -isysroot 
> /work/stage/buildroot/build_cris/staging_dir -isystem 
> /work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include 
> libc/sysdeps/linux/common/chdir.c -quiet -dumpbase 
> chdir.c -mtune=v10 -march=v10 -auxbase-strip 
> libc/sysdeps/linux/common/chdir.os -Os -Os -Wall -Wstrict-pro
> totypes -std=gnu99 -version -fno-strict-aliasing -fno-stack-protector -fno-builtin 
>  -funit-at-a-time -fno-tree-loop-optimize -fno-tree-dominator-opts -fno-strength-reduce 
>  -fpic -o - |
> /work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/as 
>  -v --em=criself --no-underscore --pic -o 
> libc/sysdeps/linux/common/chdir.os -
> GNU assembler version 2.18 (cris-linux-uclibc) using BFD version (GNU 
> Binutils) 2.18
> ignoring nonexistent directory 
> "/work/stage/buildroot/build_cris/staging_dir/usr/local/include"
> ignoring duplicate directory 
> "/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include"
> ignoring nonexistent directory 
> "/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/include"
> ignoring duplicate directory 
> "/work/stage/buildroot/build_cris/staging_dir/usr/include"
>  as it is a non-system directory that duplicates a system directory
> ignoring duplicate directory 
> "/work/stage/buildroot/build_cris/staging_dir/usr/include"
>  as it is a non-system directory that duplicates a system directory
> ignoring nonexistent directory 
> "./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/cris"
> ignoring nonexistent directory 
> "./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux"
> #include "..." search starts here:
> #include <...> search starts here:
> ./include
> .
> ./libpthread/linuxthreads.old/sysdeps/cris
> ./libpthread/linuxthreads.old/sysdeps/pthread
> ./libpthread/linuxthreads.old
> ./libpthread
> /work/stage/buildroot/toolchain_build_cris/linux/include/
> /work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include
> /work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include-fixed
> /work/stage/buildroot/build_cris/staging_dir/usr/include
> End of search list.
> GNU C (GCC) version 4.3.1 (cris-linux-uclibc)
> compiled by GNU C version 4.1.2 (Gentoo 4.1.2 p1.1), GMP version 4.2.2, 
> MPFR version 2.3.1.
> GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
> Compiler executable checksum: 8d9cd5fbd7efd311d4ba9389bc2ae5b7
> COMPILER_PATH=/work/stage/buildroot/build_cris/staging_dir/usr/libexec/gcc/cris-linux-uclibc/4.3.1/:/work/stage/buildroot/build_cris/staging_dir/usr/libexec/gcc/cris-linux-uclibc/4.3.1/:/work/stage/buildroot/build_cris/staging_dir/usr/libexec/gcc/cris-linux-uclibc/:/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/:/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/:/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/
> LIBRARY_PATH=/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/:/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/lib/:/work/stage/buildroot/build_cris/staging_dir//lib/:/work/stage/buildroot/build_cris/staging_dir//usr/lib/
> COLLECT_GCC_OPTIONS='-c' '-o' 'libc/sysdeps/linux/common/chdir.os' 
> '-include' './include/libc-symbols.h' '-Wall' '-Wstrict-prototypes' 
> '-fno-strict-aliasing' '-fno-stack-protector' '-fno-builtin' '-I./include' 
> '-I.' '-isysroot' '/work/stage/buildroot/build_cris/staging_dir' 
> '-I=/usr/include' '-Os' '-pipe' 
> '-I/work/stage/buildroot/build_cris/staging_dir/usr/include' '-mtune=v10' 
> '-march=v10' '-std=gnu99' '-Os' '-funit-at-a-time' 
> '-fno-tree-loop-optimize' '-fno-tree-dominator-opts' 
> '-fno-strength-reduce' 
> '-I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/cris' 
> '-I./libpthread/linuxthreads.old/sysdeps/cris' 
> '-I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux' 
> '-I./libpthread/linuxthreads.old/sysdeps/pthread' 
> '-I./libpthread/linuxthreads.old' '-I./libpthread' 
> '-I/work/stage/buildroot/toolchain_build_cris/linux/include/' '-isystem' 
> '/work/stage/buildroot/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include' 
> '-DNDEBUG' '-fpic' '-v'
>
> Again, according to the 
> http://sourceware.org/ml/libc-alpha/2007-03/msg00017.html this can be 
> fixed by adding include-fixed to the compiler flags via -isystem. If it is 
> enough only for uClibc build I can't tell..
>
> Regards,
> Hinko
>
> -- 
> ?ETRTA POT, d.o.o., Kranj
> Planina 3
> 4000 Kranj
> Slovenia, Europe
> Tel. +386 (0) 4 280 66 03
> E-mail: hinko.kocevar at cetrtapot.si
> Http: www.cetrtapot.si
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot 
