From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Tue, 24 Jun 2008 13:14:34 +0200
Subject: [Buildroot] uClibc missing limits.h
In-Reply-To: <20080623131648.GE8920@mx.loc>
References: <485F9581.2040204@cetrtapot.si> <20080623131648.GE8920@mx.loc>
Message-ID: <4860D71A.4060104@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Mon, Jun 23, 2008 at 02:22:25PM +0200, Hinko Kocevar wrote:
>> Hi,
>>
>> I've found a way for uClibc to find headers that are not in the $(shell $CC -print-file-name=include), but in $(shell $CC -print-file-name=include)-fixed.
>> According to http://sourceware.org/ml/libc-alpha/2007-03/msg00017.html LIBC should also look in other gcc provided header directories (eg. include-fixed) instead only relying on 'include' to contain all correct headers.
>>
>> Below is uClibc patch for this (tested on cris).
> 
> Well, that's not really correct since the default search path already
> should to be
> $target_triple/$ver/include \
> $target_triple/$ver/include-fixed \
> 
> And apart from that you would not get away with just doing this for uClibc..
> 
> Please paste the failing "cross-gcc -v" invocation that fails to find
> the include-fixed.

$ cris-linux-uclibc-gcc -v       
Using built-in specs.
Target: cris-linux-uclibc
Configured with: /work/stage/git.br/toolchain_build_cris/gcc-4.3.1/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=cris-linux-uclibc --enable-languages=c --with-sysroot=/work/stage/git.br/build_cris/staging_dir --with-build-time-tools=/work/stage/git.br/build_cris/staging_dir/usr/cris-linux-uclibc/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --enable-shared --with-gmp=/work/stage/git.br/toolchain_build_cris/gmp --with-mpfr=/work/stage/git.br/toolchain_build_cris/mpfr --disable-nls --enable-threads --disable-multilib --disable-largefile --disable-libssp --disable-libssp --disable-libmudflap --disable-libgomp
Thread model: posix
gcc version 4.3.1 (GCC) 

Gcc include directories should are located in .../lib/include, right:
$ cris-linux-uclibc-gcc -print-search-dirs
install: /work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/
programs: =/work/stage/git.br/build_cris/staging_dir/usr/bin/../libexec/gcc/cris-linux-uclibc/4.3.1/:/work/stage/git.br/build_cris/staging_dir/usr/bin/../libexec/gcc/:/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/cris-linux-uclibc/4.3.1/:/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/
libraries: =/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/:/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/:/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/lib/cris-linux-uclibc/4.3.1/:/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/lib/:/work/stage/git.br/build_cris/staging_dir/lib/cris-linux-uclibc/4.3.1/:/work/stage/git.br/build_cris/staging_dir/lib/:/work/stage/git.br/build_cris/staging_dir/usr/lib/cris-linux-uclibc/4.3.1/:/work/stage/git.br/build_cris/staging_dir/usr/lib/


I can't see no include-fixed, only include is found in the output of gcc -print-search-dirs...
$ cat /tmp/dirs
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/lib/cris-linux-uclibc/4.3.1/
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/lib/
/work/stage/git.br/build_cris/staging_dir/lib/cris-linux-uclibc/4.3.1/
/work/stage/git.br/build_cris/staging_dir/lib/
/work/stage/git.br/build_cris/staging_dir/usr/lib/cris-linux-uclibc/4.3.1/
/work/stage/git.br/build_cris/staging_dir/usr/lib/

$ for i in `cat /tmp/dirs `; do find $i -name "*include*"; done
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/include
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/install-tools/include
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/include-fixed
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/include
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/install-tools/include
/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/include-fixed
find: `/work/stage/git.br/build_cris/staging_dir/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/lib/cris-linux-uclibc/4.3.1/': No such file or directory
find: `/work/stage/git.br/build_cris/staging_dir/lib/cris-linux-uclibc/4.3.1/': No such file or directory
find: `/work/stage/git.br/build_cris/staging_dir/usr/lib/cris-linux-uclibc/4.3.1/': No such file or directory
/work/stage/git.br/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include
/work/stage/git.br/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/install-tools/include
/work/stage/git.br/build_cris/staging_dir/usr/lib/gcc/cris-linux-uclibc/4.3.1/include-fixed

HTH,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
