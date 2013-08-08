From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Thu, 8 Aug 2013 18:35:07 +0300
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAXf6LXpML0_kexS1=sdSc8iEZzk4-DaHbx=jXkrBa8miujM1g@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <CAAXf6LXpML0_kexS1=sdSc8iEZzk4-DaHbx=jXkrBa8miujM1g@mail.gmail.com>
Message-ID: <CAAHaz6FLFA1JXWe1g6nwM-bh-eEdO+3gZDc4t7Y6zipbmF4SaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

  Sorry, I was wrong earlier saying that I had the same error as you. It
was what the log mentioned here describes.

  It is strange but your config, almost unchanged except for download
directory and the number of jobs 8 vs 5, produces a different error while
building the final toolchain on my machine: it breaks on trying to make a
libstdc++_pic.a library. This could be solved with the attached patch. Here
is what happens on my machine:

Making install in src
make[4]: Entering directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src'
make[5]: Entering directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src'
test -z
"/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/lib"
|| mkdir -p --
"/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/lib"
/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/bin/ar
cru libstdc++_pic.a *.o ../libsupc++/*.o
make[5]: Nothing to be done for `install-data-am'.
/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/bin/ar:
*.o: No such file or directory
make[5]: *** [install-exec-local] Error 1
make[5]: *** Waiting for unfinished jobs....
 /bin/sh ../libtool --mode=install /usr/bin/install -c  'libstdc++.la'
'/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/lib/libstdc++.la'
/usr/bin/install -c .libs/libstdc++.so.6.0.9
/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/lib/libstdc++.so.6.0.9
(cd
/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/lib
&& rm -f libstdc++.so.6 && ln -s libstdc++.so.6.0.9 libstdc++.so.6)
(cd
/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/lib
&& rm -f libstdc++.so && ln -s libstdc++.so.6.0.9 libstdc++.so)
/usr/bin/install -c .libs/libstdc++.lai
/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/lib/libstdc++.la
PATH="$PATH:/sbin" ldconfig -n
/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/lib
----------------------------------------------------------------------
Libraries have been installed in:

/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,--rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
make[5]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src'
make[4]: *** [install-am] Error 2
make[4]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src'
make[3]: *** [install-recursive] Error 1
make[3]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3'
make[2]: *** [install-target-libstdc++-v3] Error 2
make[2]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build'
make[1]: *** [install] Error 2
make[1]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build'
make: ***
[/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/.stamp_host_installed]
Error 2


  With the patch applied, it makes a successful build. Am I doing something
wrong here? Maybe something in my environment? My HEAD is at
79309d94423738e6832f08cafab0cd71f65af355 .



--
Best regards,
  Alexander Lukichev


2013/8/5 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>

> On Mon, Aug 5, 2013 at 2:01 PM, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
> > Hi,
> >
> > I was looking at an autobuild failure on AVR32 and tried reproducing
> > it locally. Unfortunately, the AVR32 toolchain that was configured was
> > pre-built on a 64-bit machine, which I don't have. Hence, the
> > configured toolchain was not usable.
> >
> > Then I tried building my own AVR32 toolchain with the internal
> > backend, see config attached. Unfortunately, this failed as well:
> >
> >
>  /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/xgcc
> > -shared-libgcc
> -B/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc
> > -nostdinc++
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src/.libs
> >
> -B/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/bin/
> >
> -B/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/lib/
> > -isystem
> /home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/include
> > -isystem
> /home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/sys-include
> > -shared -nostdlib
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/crti.o
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/crtbeginS.o
> >  .libs/bitmap_allocator.o .libs/pool_allocator.o .libs/mt_allocator.o
> > .libs/codecvt.o .libs/compatibility.o .libs/complex_io.o .libs/ctype.o
> > .libs/debug.o .libs/debug_list.o .libs/functexcept.o
> > .libs/globals_io.o .libs/ios.o .libs/ios_failure.o .libs/ios_init.o
> > .libs/ios_locale.o .libs/limits.o .libs/list.o .libs/locale.o
> > .libs/locale_init.o .libs/locale_facets.o .libs/localename.o
> > .libs/stdexcept.o .libs/strstream.o .libs/tree.o
> > .libs/allocator-inst.o .libs/concept-inst.o .libs/fstream-inst.o
> > .libs/ext-inst.o .libs/ios-inst.o .libs/iostream-inst.o
> > .libs/istream-inst.o .libs/istream.o .libs/locale-inst.o
> > .libs/misc-inst.o .libs/ostream-inst.o .libs/sstream-inst.o
> > .libs/streambuf-inst.o .libs/streambuf.o .libs/string-inst.o
> > .libs/valarray-inst.o .libs/wlocale-inst.o .libs/wstring-inst.o
> > .libs/atomicity.o .libs/codecvt_members.o .libs/collate_members.o
> > .libs/ctype_members.o .libs/messages_members.o
> > .libs/monetary_members.o .libs/numeric_members.o .libs/time_members.o
> > .libs/basic_file.o .libs/c++locale.o -Wl,--whole-archive
> > ../libmath/.libs/libmath.a ../libsupc++/.libs/libsupc++convenience.a
> > -Wl,--no-whole-archive
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src/.libs
> > -lm ../libmath/.libs/libmath.a -lm
> > ../libsupc++/.libs/libsupc++convenience.a -lm
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/bin
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/lib
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/lib/gcc/avr32-buildroot-linux-uclibc/4.2.2
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/lib/gcc/avr32-buildroot-linux-uclibc/4.2.2/../../../../avr32-buildroot-linux-uclibc/lib
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/lib
> >
> -L/home/tdescham/repo/contrib/buildroot-avr32/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib
> > -lgcc -lc -lgcc -lm -lgcc -lc -lgcc
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/crtendS.o
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/./gcc/crtn.o
> >  -Wl,-O1 -Wl,--gc-sections -Wl,-soname -Wl,libstdc++.so.6 -o
> > .libs/libstdc++.so.6.0.9
> > .libs/bitmap_allocator.o: In function `.LLSDA217':
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
> > relocation truncated to fit: R_AVR32_32_PCREL against symbol
> > `DW.ref._ZTISt9bad_alloc' defined in
> > .data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
> > .libs/bitmap_allocator.o
> > .libs/bitmap_allocator.o: In function `.LLSDA294':
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
> > relocation truncated to fit: R_AVR32_32_PCREL against symbol
> > `DW.ref._ZTISt9bad_alloc' defined in
> > .data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
> > .libs/bitmap_allocator.o
> > .libs/bitmap_allocator.o: In function `.LLSDA295':
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
> > relocation truncated to fit: R_AVR32_32_PCREL against symbol
> > `DW.ref._ZTISt9bad_alloc' defined in
> > .data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
> > .libs/bitmap_allocator.o
> > .libs/bitmap_allocator.o: In function `.LLSDA268':
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
> > relocation truncated to fit: R_AVR32_32_PCREL against symbol
> > `DW.ref._ZTISt9bad_alloc' defined in
> > .data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
> > .libs/bitmap_allocator.o
> > .libs/bitmap_allocator.o: In function `.LLSDA269':
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/include/ext/bitmap_allocator.h:400:
> > relocation truncated to fit: R_AVR32_32_PCREL against symbol
> > `DW.ref._ZTISt9bad_alloc' defined in
> > .data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
> > .libs/bitmap_allocator.o
> > ../libsupc++/.libs/libsupc++convenience.a(new_op.o): In function
> `.LLSDA20':
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/libsupc++/../../../../libstdc++-v3/libsupc++/new_op.cc:50:
> > relocation truncated to fit: R_AVR32_32_PCREL against symbol
> > `DW.ref._ZTISt9bad_alloc' defined in
> > .data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
> > .libs/bitmap_allocator.o
> > ../libsupc++/.libs/libsupc++convenience.a(new_opnt.o): In function
> `.LLSDA15':
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/libsupc++/../../../../libstdc++-v3/libsupc++/new_opnt.cc:41:
> > relocation truncated to fit: R_AVR32_32_PCREL against symbol
> > `DW.ref._ZTISt9bad_alloc' defined in
> > .data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
> > .libs/bitmap_allocator.o
> > ../libsupc++/.libs/libsupc++convenience.a(new_opv.o): In function
> `.LLSDA15':
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/libsupc++/../../../../libstdc++-v3/libsupc++/new_opv.cc:35:
> > relocation truncated to fit: R_AVR32_32_PCREL against symbol
> > `DW.ref._ZTISt9bad_alloc' defined in
> > .data.DW.ref._ZTISt9bad_alloc[DW.ref._ZTISt9bad_alloc] section in
> > .libs/bitmap_allocator.o
> > ../libsupc++/.libs/libsupc++convenience.a(vterminate.o): In function
> `.LLSDA59':
> >
> /home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/libsupc++/../../../../libstdc++-v3/libsupc++/vterminate.cc:65:
> > relocation truncated to fit: R_AVR32_32_PCREL against symbol
> > `DW.ref._ZTISt9exception' defined in
> > .data.DW.ref._ZTISt9exception[DW.ref._ZTISt9exception] section in
> > ../libsupc++/.libs/libsupc++convenience.a(vterminate.o)
> > collect2: ld returned 1 exit status
> > make[5]: *** [libstdc++.la] Error 1
> > make[5]: Leaving directory
> >
> `/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src'
> > make[4]: *** [all-recursive] Error 1
> > make[4]: Leaving directory
> >
> `/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3'
> > make[3]: *** [all] Error 2
> > make[3]: Leaving directory
> >
> `/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3'
> > make[2]: *** [all-target-libstdc++-v3] Error 2
> > make[2]: Leaving directory
> >
> `/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build'
> > make[1]: *** [all] Error 2
> > make[1]: Leaving directory
> >
> `/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build'
> > make: ***
> [/home/tdescham/repo/contrib/buildroot-avr32/output/build/host-gcc-final-4.2.2-avr32-2.1.5/.stamp_built]
> > Error 2
> >
> >
> >
> > Anyone seen this before?
> >
> >
> > Thomas Petazzoni: could you send the toolchain configuration you used
> > to create the AVR32 toolchain used for the autobuilders, like this
> > one:
> http://autobuild.buildroot.net/results/645b357d470b75baa9a93eb5be4f1dc5c8c337fa/
>
>
> Obviously, I forgot the attachments. Shame on me...
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130808/d6434fd5/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 990-fix-300-libstdc++-pic.patch
Type: application/octet-stream
Size: 1011 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130808/d6434fd5/attachment-0001.obj>
