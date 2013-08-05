From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 5 Aug 2013 14:01:51 +0200
Subject: [Buildroot] AVR32 toolchain build failure
Message-ID: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I was looking at an autobuild failure on AVR32 and tried reproducing
it locally. Unfortunately, the AVR32 toolchain that was configured was
pre-built on a 64-bit machine, which I don't have. Hence, the
configured toolchain was not usable.

Then I tried building my own AVR32 toolchain with the internal
backend, see config attached. Unfortunately, this failed as well:

 /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/xgcc
-shared-libgcc -B/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc
-nostdinc++ -L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src
-L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src/.libs
-B/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/bin/
-B/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/lib/
-isystem /home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/include
-isystem /home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/sys-include
-shared -nostdlib
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/crti.o
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/crtbeginS.o
 .libs/bitmap_allocator.o .libs/pool_allocator.o .libs/mt_allocator.o
.libs/codecvt.o .libs/compatibility.o .libs/complex_io.o .libs/ctype.o
.libs/debug.o .libs/debug_list.o .libs/functexcept.o
.libs/globals_io.o .libs/ios.o .libs/ios_failure.o .libs/ios_init.o
.libs/ios_locale.o .libs/limits.o .libs/list.o .libs/locale.o
.libs/locale_init.o .libs/locale_facets.o .libs/localename.o
.libs/stdexcept.o .libs/strstream.o .libs/tree.o
.libs/allocator-inst.o .libs/concept-inst.o .libs/fstream-inst.o
.libs/ext-inst.o .libs/ios-inst.o .libs/iostream-inst.o
.libs/istream-inst.o .libs/istream.o .libs/locale-inst.o
.libs/misc-inst.o .libs/ostream-inst.o .libs/sstream-inst.o
.libs/streambuf-inst.o .libs/streambuf.o .libs/string-inst.o
.libs/valarray-inst.o .libs/wlocale-inst.o .libs/wstring-inst.o
.libs/atomicity.o .libs/codecvt_members.o .libs/collate_members.o
.libs/ctype_members.o .libs/messages_members.o
.libs/monetary_members.o .libs/numeric_members.o .libs/time_members.o
.libs/basic_file.o .libs/c++locale.o -Wl,--whole-archive
../libmath/.libs/libmath.a ../libsupc++/.libs/libsupc++convenience.a
-Wl,--no-whole-archive
-L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src
-L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src/.libs
-lm ../libmath/.libs/libmath.a -lm
../libsupc++/.libs/libsupc++convenience.a -lm
-L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc
-L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/bin
-L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/lib
-L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/lib/gcc/avr32-buildroot-linux-uclibc/4.2.2
-L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/lib/gcc/avr32-buildroot-linux-uclibc/4.2.2/../../../../avr32-buildroot-linux-uclibc/lib
-L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/lib
-L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib
-lgcc -lc -lgcc -lm -lgcc -lc -lgcc
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/crtendS.o
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/crtn.o
 -Wl,-O1 -Wl,--gc-sections -Wl,-soname -Wl,libstdc++.so.6 -o
.libs/libstdc++.so.6.0.9
.libs/bitmap_allocator.o: In function `.LLSDA217':
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
relocation truncated to fit: R_AVR32_32_PCREL against symbol
`DW.ref._ZTISt9bad_alloc' defined in
.data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
.libs/bitmap_allocator.o
.libs/bitmap_allocator.o: In function `.LLSDA294':
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
relocation truncated to fit: R_AVR32_32_PCREL against symbol
`DW.ref._ZTISt9bad_alloc' defined in
.data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
.libs/bitmap_allocator.o
.libs/bitmap_allocator.o: In function `.LLSDA295':
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
relocation truncated to fit: R_AVR32_32_PCREL against symbol
`DW.ref._ZTISt9bad_alloc' defined in
.data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
.libs/bitmap_allocator.o
.libs/bitmap_allocator.o: In function `.LLSDA268':
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
relocation truncated to fit: R_AVR32_32_PCREL against symbol
`DW.ref._ZTISt9bad_alloc' defined in
.data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
.libs/bitmap_allocator.o
.libs/bitmap_allocator.o: In function `.LLSDA269':
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
relocation truncated to fit: R_AVR32_32_PCREL against symbol
`DW.ref._ZTISt9bad_alloc' defined in
.data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
.libs/bitmap_allocator.o
../libsupc++/.libs/libsupc++convenience.a(new_op.o): In function `.LLSDA20':
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/libsupc++/../../../../libstdc++-v3/libsupc++/new_op.cc:50:
relocation truncated to fit: R_AVR32_32_PCREL against symbol
`DW.ref._ZTISt9bad_alloc' defined in
.data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
.libs/bitmap_allocator.o
../libsupc++/.libs/libsupc++convenience.a(new_opnt.o): In function `.LLSDA15':
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/libsupc++/../../../../libstdc++-v3/libsupc++/new_opnt.cc:41:
relocation truncated to fit: R_AVR32_32_PCREL against symbol
`DW.ref._ZTISt9bad_alloc' defined in
.data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
.libs/bitmap_allocator.o
../libsupc++/.libs/libsupc++convenience.a(new_opv.o): In function `.LLSDA15':
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/libsupc++/../../../../libstdc++-v3/libsupc++/new_opv.cc:35:
relocation truncated to fit: R_AVR32_32_PCREL against symbol
`DW.ref._ZTISt9bad_alloc' defined in
.data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
.libs/bitmap_allocator.o
../libsupc++/.libs/libsupc++convenience.a(vterminate.o): In function `.LLSDA59':
/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/libsupc++/../../../../libstdc++-v3/libsupc++/vterminate.cc:65:
relocation truncated to fit: R_AVR32_32_PCREL against symbol
`DW.ref._ZTISt9exception' defined in
.data.DW.ref._ZTISt9exception[DW.ref._ZTISt9exception] section in
../libsupc++/.libs/libsupc++convenience.a(vterminate.o)
collect2: ld returned 1 exit status
make[5]: *** [libstdc++.la] Error 1
make[5]: Leaving directory
`/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3'
make[2]: *** [all-target-libstdc++-v3] Error 2
make[2]: Leaving directory
`/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build'
make: *** [/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/.stamp_built]
Error 2



Anyone seen this before?


Thomas Petazzoni: could you send the toolchain configuration you used
to create the AVR32 toolchain used for the autobuilders, like this
one: http://autobuild.buildroot.net/results/645b357d470b75baa9a93eb5be4f1dc5c8c337fa/

Thanks,
Thomas
