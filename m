From: Olivier Singla <olivier.singla@gmail.com>
Date: Thu, 1 May 2008 10:11:02 -0400
Subject: [Buildroot] pthreads debugging issue (arm9)
Message-ID: <506410170805010711l7b10d198j1f450235cf4d4f77@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am having some issue while trying to debug a multi-threaded application.
I am building for the AT91SAM9260-EK reference board (ARM9 based SOC).

Here a simple test.c program:
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

void *my_thread( void *arg ) {
    for ( int n = 0; n < 90; n++ ) {
        printf( "%d\n", n );
        sleep( 1 );
    }
    return NULL;
}

main() {
    pthread_t tid;
    pthread_attr_t attr;
    pthread_attr_init( &attr );
    pthread_attr_setdetachstate( &attr, PTHREAD_CREATE_DETACHED );
    pthread_create( &tid, &attr, my_thread, NULL );
    printf( "Thread created\n");
    sleep( 120 );
}

Here is how I cross compile it:
~/buildroot-9260/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-o test -O0 -g -std=gnu99 -lpthread test.c

Here is how the cross-compiler is built:
~$ ~/buildroot-9260/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-v
Using built-in specs.
Target: arm-linux-uclibc
Configured with:
/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gcc-4.2.1/configure
--prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu
--target=arm-linux-uclibc --enable-languages=c,c++
--with-sysroot=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir
--with-build-time-tools=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld
--enable-shared
--with-gmp=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gmp
--with-mpfr=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/mpfr
--enable-threads --disable-multilib --with-tune=arm920t :
(reconfigured) /home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gcc-4.2.1/configure
--prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu
--target=arm-linux-uclibc --enable-languages=c,c++
--with-sysroot=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir
--with-build-time-tools=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld
--enable-shared
--with-gmp=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gmp
--with-mpfr=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/mpfr
--enable-threads --disable-multilib --with-tune=arm920t :
(reconfigured) /home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gcc-4.2.1/configure
--prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu
--target=arm-linux-uclibc --enable-languages=c,c++
--with-sysroot=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir
--with-build-time-tools=/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld
--enable-shared
--with-gmp=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/gmp
--with-mpfr=/home/osingla/buildroot-9260/buildroot/toolchain_build_arm/mpfr
--enable-threads --disable-multilib --with-tune=arm920t
Thread model: posix
gcc version 4.2.1

Here is my .gdbinit:
set auto-solib-add 1
set solib-absolute-prefix /fake
set solib-search-path
/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/:\
/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib
set confirm off
file ./test -readnow
target remote 192.168.1.10:9000
dir $cdir:$cwd
handle SIG32 nostop
b main
cont

Here is a debugging session:
TARGET:
# gdbserver :9000 /tmp/test
Process /tmp/test created; pid = 1947
Listening on port 9000

HOST:
~$ ~/buildroot-9260/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gdb
GNU gdb 6.6
Copyright (C) 2006 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "--host=x86_64-pc-linux-gnu
--target=arm-linux-uclibc".

warning: Remote failure reply: E01
0x40000930 in _start () from
/home/osingla/buildroot-9260/buildroot/build_arm/staging_dir/lib/ld-uClibc.so.0
Breakpoint 1 at 0x85fc: file test.c, line 17.

Breakpoint 1, main () at test.c:17
17          pthread_attr_init( &attr );
(gdb) n
18          pthread_attr_setdetachstate( &attr, PTHREAD_CREATE_DETACHED );
(gdb)
19          pthread_create( &tid, &attr, my_thread, NULL );
(gdb)

Program received signal SIG32, Real-time event 32.
20          printf( "Thread created\n");
(gdb) info threads
  1 Thread 1947  main ()@test.c:20
(gdb) info sharedlibrary
