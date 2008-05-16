From: Olivier Singla <olivier.singla@gmail.com>
Date: Fri, 16 May 2008 13:25:05 -0400
Subject: [Buildroot] pthreads debugging issue (arm9)
In-Reply-To: <506410170805010711l7b10d198j1f450235cf4d4f77@mail.gmail.com>
References: <506410170805010711l7b10d198j1f450235cf4d4f77@mail.gmail.com>
Message-ID: <506410170805161025n16879b0v4f6b311c11e4c8fb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I still have the issue.
I noticed that when pthread_create is created, gdbserver is dying:
 Sending sigstop to process 784
 Illegal instruction
(784 is the pid of the thread).

It's happening in kill_lwp(), while trying to use tkill.
I tried to replace it by kill, but that does not seem to work,
gdb/gdbserver stays busy.

Any clue anyone ?

Am I the only to have issue trying to use gdb/gdbserver for
multi-threaded programs ?

On Thu, May 1, 2008 at 10:11 AM, Olivier Singla
<olivier.singla@gmail.com> wrote:
> Hi,
>
> I am having some issue while trying to debug a multi-threaded application.
> I am building for the AT91SAM9260-EK reference board (ARM9 based SOC).
>
> Here a simple test.c program:
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <pthread.h>
>
> void *my_thread( void *arg ) {
>    for ( int n = 0; n < 90; n++ ) {
>        printf( "%d\n", n );
>        sleep( 1 );
>    }
>    return NULL;
> }
>
> main() {
>    pthread_t tid;
>    pthread_attr_t attr;
>    pthread_attr_init( &attr );
>    pthread_attr_setdetachstate( &attr, PTHREAD_CREATE_DETACHED );
>    pthread_create( &tid, &attr, my_thread, NULL );
>    printf( "Thread created\n");
>    sleep( 120 );
> }
>
> Here is how I cross compile it:
> ~/buildroot-9260/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
> -o test -O0 -g -std=gnu99 -lpthread test.c
>
> Here is how the cross-compiler is built:
> ~$ ~/buildroot-9260/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
> -v
> Using built-in specs.
> Target: arm-linux-uclibc
> Configured with:
> /home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gcc-4.2.1/configure
> --prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu
> --target=arm-linux-uclibc --enable-languages=c,c++
> --with-sysroot=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir
> --with-build-time-tools=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin
> --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld
> --enable-shared
> --with-gmp=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gmp
> --with-mpfr=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/mpfr
> --enable-threads --disable-multilib --with-tune=arm920t :
> (reconfigured) /home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gcc-4.2.1/configure
> --prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu
> --target=arm-linux-uclibc --enable-languages=c,c++
> --with-sysroot=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir
> --with-build-time-tools=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin
> --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld
> --enable-shared
> --with-gmp=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gmp
> --with-mpfr=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/mpfr
> --enable-threads --disable-multilib --with-tune=arm920t :
> (reconfigured) /home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gcc-4.2.1/configure
> --prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu
> --target=arm-linux-uclibc --enable-languages=c,c++
> --with-sysroot=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir
> --with-build-time-tools=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin
> --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld
> --enable-shared
> --with-gmp=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gmp
> --with-mpfr=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/mpfr
> --enable-threads --disable-multilib --with-tune=arm920t
> Thread model: posix
> gcc version 4.2.1
>
> Here is my .gdbinit:
> set auto-solib-add 1
> set solib-absolute-prefix /fake
> set solib-search-path
> /home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/:\
> /home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib
> set confirm off
> file ./test -readnow
> target remote 192.168.1.10:9000
> dir $cdir:$cwd
> handle SIG32 nostop
> b main
> cont
>
> Here is a debugging session:
> TARGET:
> # gdbserver :9000 /tmp/test
> Process /tmp/test created; pid = 1947
> Listening on port 9000
>
> HOST:
> ~$ ~/buildroot-9260/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gdb
> GNU gdb 6.6
> Copyright (C) 2006 Free Software Foundation, Inc.
> GDB is free software, covered by the GNU General Public License, and you are
> welcome to change it and/or distribute copies of it under certain conditions.
> Type "show copying" to see the conditions.
> There is absolutely no warranty for GDB.  Type "show warranty" for details.
> This GDB was configured as "--host=x86_64-pc-linux-gnu
> --target=arm-linux-uclibc".
>
> warning: Remote failure reply: E01
> 0x40000930 in _start () from
> /home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib/ld-uClibc.so.0
> Breakpoint 1 at 0x85fc: file test.c, line 17.
>
> Breakpoint 1, main () at test.c:17
> 17          pthread_attr_init( &attr );
> (gdb) n
> 18          pthread_attr_setdetachstate( &attr, PTHREAD_CREATE_DETACHED );
> (gdb)
> 19          pthread_create( &tid, &attr, my_thread, NULL );
> (gdb)
>
> Program received signal SIG32, Real-time event 32.
> 20          printf( "Thread created\n");
> (gdb) info threads
>  1 Thread 1947  main () at test.c:20
> (gdb) info sharedlibrary
> From        To          Syms Read   Shared Object Library
> 0x40000930  0x40003f50  Yes
> /home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib/ld-uClibc.so.0
> 0x40011dd0  0x40018380  Yes
> /home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib/libpthread.so.0
> 0x40033800  0x40071e60  Yes
> /home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib/libc.so.0
> (gdb) q
> ~$
>
> When the thread has been created, it is not visible from the debugger.
> It runs, but I can't put a breakpoint.
> A few notes:
>
> - I do not like the message "warning: Remote failure reply: E01", it
> might mean that gdb host and gdbserver are not in sync for whatever
> reason.
>
> - If I put a breakpoint on the thread function, before 'cont', the
> program terminates as soon the thread is created.
>
> - the shared library 'thread_db' is not loaded (I think it should):
> # cat /proc/2298/maps
> 00008000-00009000 r-xp 00000000 00:0c 4339       /tmp/test
> 00010000-00011000 rw-p 00000000 00:0c 4339       /tmp/test
> 00011000-00012000 rwxp 00011000 00:00 0          [heap]
> 40000000-40005000 r-xp 00000000 00:01 398        /lib/ld-uClibc-0.9.29.so
> 40005000-40006000 rw-p 40005000 00:00 0
> 4000c000-4000d000 r--p 00004000 00:01 398        /lib/ld-uClibc-0.9.29.so
> 4000d000-4000e000 rw-p 00005000 00:01 398        /lib/ld-uClibc-0.9.29.so
> 4000e000-40019000 r-xp 00000000 00:01 406        /lib/libpthread-0.9.29.so
> 40019000-40020000 ---p 40019000 00:00 0
> 40020000-40021000 r--p 0000a000 00:01 406        /lib/libpthread-0.9.29.so
> 40021000-40026000 rw-p 0000b000 00:01 406        /lib/libpthread-0.9.29.so
> 40026000-40028000 rw-p 40026000 00:00 0
> 40028000-400b5000 r-xp 00000000 00:01 414        /lib/libuClibc-0.9.29.so
> 400b5000-400bc000 ---p 400b5000 00:00 0
> 400bc000-400bd000 r--p 0008c000 00:01 414        /lib/libuClibc-0.9.29.so
> 400bd000-400be000 rw-p 0008d000 00:01 414        /lib/libuClibc-0.9.29.so
> 400be000-400c3000 rw-p 400be000 00:00 0
> bebde000-bebf3000 rwxp befeb000 00:00 0          [stack]
>
> I used linuxthreads (stable/old), and I checked 'pthreads debugging
> support ' within uclibc menuconfig.
>
> Any idea what I am missing?
>
> TIA,
> ~Olivier
>
