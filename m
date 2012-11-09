From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Nov 2012 10:19:59 +0100
Subject: [Buildroot] [PATCH 1/2 v2] xtensa: add support for the Xtensa
 architecture
In-Reply-To: <509ca3b9.e9c5440a.24b8.24a1@mx.google.com>
References: <509ca3b9.e9c5440a.24b8.24a1@mx.google.com>
Message-ID: <20121109101959.70d640d5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Thu, 08 Nov 2012 22:33:28 -0800, Chris Zankel wrote:
> The Xtensa architecture had been removed because it required special
> handling and depended on additional directories and files that became
> obsolete over time. This change is more aligned to other architectures.
> 
> Signed-off-by: Chris Zankel <chris@zankel.net>

Unfortunately, the default toolchain configuration for Xtensa doesn't.
I.e, I tried to build the minimal configuration:

BR2_xtensa=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_LUA_INTERPRETER=y
BR2_PACKAGE_AVAHI=y

And the build of gcc intermediate fails horribly with pthread errors:

xtensa-buildroot-linux-uclibc/bin/ -B/home/test/outputs/xtensa/host/usr/xtensa-buildroot-linux-uclibc/lib/ -isystem /home/test/outputs/xtensa/host/usr/xtensa-buildroot-linux-u
clibc/include -isystem /home/test/outputs/xtensa/host/usr/xtensa-buildroot-linux-uclibc/sys-include    -g -Os -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrit
e-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fPIC -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -
fno-stack-protector   -I. -I. -I../.././gcc -I/home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc -I/home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc/. -I/home/test/output
s/xtensa/toolchain/gcc-4.6.3/libgcc/../gcc -I/home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc/../include  -DHAVE_CC_TLS  -o _negdi2.o -MT _negdi2.o -MD -MP -MF _negdi2.dep
 -DL_negdi2 -c /home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc/../gcc/libgcc2.c \
          -fvisibility=hidden -DHIDE_EXPORTS
In file included from /home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/stdio.h:72:0,
                 from /home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc/../gcc/tsystem.h:87,
                 from /home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc/../gcc/libgcc2.c:29:
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/bits/uClibc_stdio.h:274:2: error: unknown type name 'pthread_mutex_t'
In file included from /home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/bits/uClibc_mutex.h:15:0,
                 from /home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/bits/uClibc_stdio.h:107,
                 from /home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/stdio.h:72,
                 from /home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc/../gcc/tsystem.h:87,
                 from /home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc/../gcc/libgcc2.c:29:
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:227:28: error: unknown type name 'pthread_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:228:7: error: unknown type name 'pthread_attr_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:244:26: error: unknown type name 'pthread_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:249:32: error: unknown type name 'pthread_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:257:34: error: unknown type name 'pthread_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:265:28: error: unknown type name 'pthread_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:269:1: error: unknown type name 'pthread_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:272:27: error: unknown type name 'pthread_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:272:48: error: unknown type name 'pthread_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:280:31: error: unknown type name 'pthread_attr_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:283:34: error: unknown type name 'pthread_attr_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:287:1: error: unknown type name 'pthread_attr_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:292:41: error: unknown type name 'pthread_attr_t'
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/pthread.h:298:1: error: unknown type name 'pthread_attr_t'
[... many more ...]
In file included from /home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/stdio.h:72:0,
                 from /home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc/../gcc/tsystem.h:87,
                 from /home/test/outputs/xtensa/toolchain/gcc-4.6.3/libgcc/../gcc/libgcc2.c:29:
/home/test/outputs/xtensa/toolchain/uClibc_dev//usr/include/bits/uClibc_stdio.h:274:2: error: unknown type name 'pthread_mutex_t'
make[3]: *** [_muldi3.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [_negdi2.o] Error 1
make[2]: *** [all-target-libgcc] Error 2
make[1]: *** [/home/test/outputs/xtensa/toolchain/gcc-4.6.3-intermediate/.compiled] Error 2
make: *** [all] Error 2

Is it that the pthread support for Xtensa is not available in uClibc?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
