From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 Jul 2016 18:09:32 +0200
Subject: [Buildroot] host-gcc-final-6.1.0 broken with musl
Message-ID: <si5l4dx0de.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

compiling this defconfig

BR2_x86_pentium_mmx=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_GCC_VERSION_6_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

fails:

Making all in mpxrt
make[5]: Entering directory '/home/bernd/buildroot/br4/output/build/host-
gcc-final-6.1.0/build/i586-buildroot-linux-musl/libmpx/mpxrt'
/bin/bash ../libtool  --tag=CC   --mode=compile /home/bernd/buildroot/br4/
output/build/host-gcc-final-6.1.0/build/./gcc/xgcc -B/home/bernd/
buildroot/br4/output/build/host-gcc-final-6.1.0/build/./gcc/ -B/home/
bernd/buildroot/br4/output/host/usr/i586-buildroot-linux-musl/bin/ -B/
home/bernd/buildroot/br4/output/host/usr/i586-buildroot-linux-musl/lib/ -
isystem /home/bernd/buildroot/br4/output/host/usr/i586-buildroot-linux-
musl/include -isystem /home/bernd/buildroot/br4/output/host/usr/i586-
buildroot-linux-musl/sys-include    -DHAVE_CONFIG_H -I. -I../../../../
libmpx/mpxrt -I..  -I../../../../libmpx/..  -fPIC -D_LARGEFILE_SOURCE -
D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -c -o libmpx_la-
mpxrt.lo `test -f 'mpxrt.c' || echo '../../../../libmpx/mpxrt/'`mpxrt.c
libtool: compile:  /home/bernd/buildroot/br4/output/build/host-gcc-
final-6.1.0/build/./gcc/xgcc -B/home/bernd/buildroot/br4/output/build/
host-gcc-final-6.1.0/build/./gcc/ -B/home/bernd/buildroot/br4/output/host/
usr/i586-buildroot-linux-musl/bin/ -B/home/bernd/buildroot/br4/output/
host/usr/i586-buildroot-linux-musl/lib/ -isystem /home/bernd/buildroot/
br4/output/host/usr/i586-buildroot-linux-musl/include -isystem /home/
bernd/buildroot/br4/output/host/usr/i586-buildroot-linux-musl/sys-include 
-DHAVE_CONFIG_H -I. -I../../../../libmpx/mpxrt -I.. -I../../../../
libmpx/.. -fPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
D_FILE_OFFSET_BITS=64 -Os -c ../../../../libmpx/mpxrt/mpxrt.c  -fPIC -
DPIC -o .libs/libmpx_la-mpxrt.o
In file included from ../../../../libmpx/mpxrt/mpxrt.c:54:0:
../../../../libmpx/mpxrt/mpxrt.c: In function 'read_mpx_status_sig':
../../../../libmpx/mpxrt/mpxrt.h:52:42: error: invalid application of 
'sizeof' to incomplete type 'struct _libc_fpstate'
 #define XSAVE_OFFSET_IN_FPMEM    sizeof (struct _libc_fpstate)
                                          ^
../../../../libmpx/mpxrt/mpxrt.c:132:58: note: in expansion of macro 
'XSAVE_OFFSET_IN_FPMEM'
   uint8_t *regs = (uint8_t *)uctxt->uc_mcontext.fpregs + 
XSAVE_OFFSET_IN_FPMEM;
                                                          
^~~~~~~~~~~~~~~~~~~~~
Makefile:387: recipe for target 'libmpx_la-mpxrt.lo' failed
make[5]: *** [libmpx_la-mpxrt.lo] Error 1

The bug does not occur with gcc5.

Regards, Bernd
