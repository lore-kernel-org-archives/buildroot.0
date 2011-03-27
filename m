From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Sun, 27 Mar 2011 14:29:11 -0600
Subject: [Buildroot] makeconv: hidden symbol `__sync_val_compare_and_swap_4'
Message-ID: <1301257751.2716.55.camel@galileo.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not sure if this an issue with the icu build in Buildroot or with the
Crosstool-NG build I've done separately.  

The error is from Buildroot 2011.02:
/home/mjhammel/src/ximba/bb/src/../bld/crosstool-ng-1.8.2.bld/install/bin/arm-unknown-linux-uclibcgnueabi-g++ --sysroot=/home/mjhammel/src/ximba/bb/src/../bld/buildroot-2011.02.bld/staging//usr/arm-unknown-linux-uclibcgnueabi/sysroot -Os -pipe -Os  -mtune=cortex-a8 -march=armv7-a -mabi=aapcs-linux -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -W -Wall -ansi -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long  -L/home/mjhammel/src/ximba/bb/src/../bld/buildroot-2011.02.bld/staging//usr/arm-unknown-linux-uclibcgnueabi/sysroot/lib -L/home/mjhammel/src/ximba/bb/src/../bld/buildroot-2011.02.bld/staging//usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib  -o ../../bin/makeconv makeconv.o ucnvstat.o genmbcs.o gencnvex.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../lib -L../../stubdata -licudata -lpthread -ldl -lm  
/home/mjhammel/src/ximba/bb/bld/crosstool-ng-1.8.2.bld/install/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.4.1/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: ../../bin/makeconv: hidden symbol `__sync_val_compare_and_swap_4' in /home/mjhammel/src/ximba/bb/bld/crosstool-ng-1.8.2.bld/install/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.4.1/libgcc.a(linux-atomic.o) is referenced by DSO
/home/mjhammel/src/ximba/bb/bld/crosstool-ng-1.8.2.bld/install/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.4.1/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: final link failed: Nonrepresentable section on output

A google search brought up this very similar problem:
http://old.nabble.com/Compilation-error-while-cross-compiling-LLVM-for-ARM-td26264469.html
(search for DSO to find the meat of the issue)

There is also this report:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=40134

According to these, GCC 4.4.x supports the atomic intrinsics.  I've
built Crosstool-NG with GCC4.4.1.  I see nothing in the Crosstool-NG
about this support so I'm assuming:

1. It is in gcc 4.4.1 but Buildroot's 2011.02 makeconv build is not
compatible with this - 2010.10 seems to work okay.
2. It isn't in gcc 4.4.1 and I need some additional option to enable it
or switch to an appropriate version of the compiler that does
3. It is in gcc 4.4.1 and it works with makeconv but I'm just not using
the two together correctly somehow.

Any thoughts?
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
