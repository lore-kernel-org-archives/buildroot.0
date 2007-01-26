From: Eric Schwartz <eric.schwartz@hp.com>
Date: Fri, 26 Jan 2007 14:35:48 -0700
Subject: [Buildroot] can't compile ccache with static uClibc
Message-ID: <45BA7434.3010404@hp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm actually working on xm-test, a xen testing tool, but it uses 
buildroot to create a disk
image for things like creating guests, running small programs in them, 
that sort of thing.  The platform I'm working on is a bit unusual for 
buildroot-- ia64-- and uClibc does not, to the best of my current 
knowledge, compile a shared library for ia64, only static.

I added ia64 to the toplevel Config.in file like so:

--- Config.in.orig      2007-01-26 14:34:19.000000000 -0700
+++ Config.in   2007-01-24 18:53:32.000000000 -0700
@@ -40,6 +40,8 @@
        bool "sparc"
 config BR2_x86_64
        bool "x86_64"
+config BR2_ia64
+       bool "ia64"
 endchoice
 
 #
@@ -163,12 +165,13 @@
        default "sh64"          if BR2_sh64
        default "sparc"         if BR2_sparc
        default "x86_64"        if BR2_x86_64
+       default "ia64"          if BR2_ia64
 
 config BR2_ENDIAN
        string
        default "LITTLE" if BR2_arm || BR2_cris || BR2_i386 || 
BR2_mipsel || \
                            BR2_sh3 || BR2_sh4 || BR2_x86_64 || 
BR2_nios2 || \
-                           BR2_sh64
+                           BR2_sh64 || BR2_ia64
        default "BIG"    if BR2_alpha || BR2_armeb || BR2_m68k || 
BR2_mips || \
                            BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb 
|| \
                            BR2_sh3eb || BR2_sh4eb || BR2_sparc

A quick 'make menuconfig', and I was off and running-- the only other 
thing I had to tweak was the ./toolchain/uClibc/uclibc.mk to not always 
try to install ldd, as since uClibc only compiles a static library, 
there is no ldd.

Well, that out of the way, I managed to get uClibc to compile static, 
and then the build process goes on to try to compile ccache:

make -C 
/root/working.hg/tools/xm-test/ramdisk/buildroot/toolchain_build_ia64/uClibc 
\
                
PREFIX=/root/working.hg/tools/xm-test/ramdisk/buildroot/build_ia64/root \
                DEVEL_PREFIX=/usr/ \
                RUNTIME_PREFIX=/ \
                install_runtime
make[1]: Entering directory 
`/root/working.hg/tools/xm-test/ramdisk/buildroot/toolchain_build_ia64/uClibc'
make[1]: Nothing to be done for `install_runtime'.
make[1]: Leaving directory 
`/root/working.hg/tools/xm-test/ramdisk/buildroot/toolchain_build_ia64/uClibc'
touch -c 
/root/working.hg/tools/xm-test/ramdisk/buildroot/build_ia64/root/lib/libc.so.0
mkdir -p 
/root/working.hg/tools/xm-test/ramdisk/buildroot/toolchain_build_ia64/ccache-2.4
(cd 
/root/working.hg/tools/xm-test/ramdisk/buildroot/toolchain_build_ia64/ccache-2.4; 
rm -rf config.cache; \
                CC="gcc" \
                
/root/working.hg/tools/xm-test/ramdisk/buildroot/toolchain_build_ia64/ccache-2.4/configure 
\
                --target=ia64-pc-linux-gnu \
                --host=ia64-pc-linux-gnu \
                --build=ia64-pc-linux-gnu \
                --prefix=/usr \
        );
configure: Configuring ccache
checking for ia64-pc-linux-gnu-gcc... gcc
checking for C compiler default output file name... configure: error: C 
compiler cannot create executables
See `config.log' for more details.
make: *** 
[/root/working.hg/tools/xm-test/ramdisk/buildroot/toolchain_build_ia64/ccache-2.4/.configured] 
Error 77

Examining the relevant config.log shows:

configure:1652: gcc    conftest.c  >&5
/usr/lib/gcc/ia64-linux-gnu/4.1.2/../../../crt1.o: In function `_start':
libc/sysdeps/linux/ia64/crt1.S:(.text+0x72): undefined reference to 
`__uClibc_main'
collect2: ld returned 1 exit status
configure:1655: $? = 1
configure: failed program was:
| /* confdefs.h.  */
|
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| /* end confdefs.h.  */
|
| int
| main ()
| {
|
|   ;
|   return 0;
| }

I nm'd the crt1.o file, and sure enough, it's there:

# nm /usr/lib/gcc/ia64-linux-gnu/4.1.2/../../../crt1.o    
0000000000000000 D __data_start
0000000000000008 C __libc_ia64_register_backing_store_base
                 U __uClibc_main
                 U _fini
                 U _init
0000000000000000 T _start
0000000000000000 W data_start
                 U main

So clearly there's some sort of path error here, but I'm not sure who's 
fault it is, or how to go about fixing it.  If there are FAQs about this 
sort of thing feel free to tell me to RTFM-- just please, point me at 
the FM to R while you're at it. :)


Thanks,

-=Eric Schwartz
-- 
Eric Schwartz  <eric.schwartz@hp.com>
Hewlett-Packard Open Source & Linux Organization
