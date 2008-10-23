From: mike sander <msander@ripnet.com>
Date: Thu, 23 Oct 2008 10:07:43 -0400
Subject: [Buildroot] portmap build error
Message-ID: <4900852F.4010809@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,  

I am getting link error trying to build portmap with yesterdays (Oct 22) 
snapshot.  I have successfully built this on an earlier buildroot (28 
April 2008).   See below for buildlog.

I have enabled RPC in top level buildrott menuconfig as well as checking 
uclib & busybox.  I think the settings look correct.  The  RPC related 
settings are consistent with my earlier buildroot.

Taking svc_sendreply for example.  This is defined in 
toolchain_build_arm/uClibc-0.9.29/libc/rpc/svc.c.   This function (and 
others I suspect are "guarded" by 
"libc_hidden_proto(svc_sendreply)".     I have tried to investigate the 
processing for libc_hidden_proto... but not making much progress.    In 
build_arm/staging_dir/usr/include/libc-symbols.h, the macro 
libc_hidden_proto is declared.  It does the following:

#if (defined __GNUC__ && \
  (defined __GNUC_MINOR__ && ( __GNUC__ >= 3 && __GNUC_MINOR__ >= 3 ) \
   || __GNUC__ >= 4)) || defined __ICC
# define attribute_hidden __attribute__ ((visibility ("hidden")))
# define __hidden_proto_hiddenattr(attrs...) __attribute__ ((visibility 
("hidden"), ##attrs))
#else
# define attribute_hidden
# define __hidden_proto_hiddenattr(attrs...)
#endif

Given the GNUC checks  I thought there might be something with gcc 
configurations,


The new snapshot is using gcc 4.2.4, whereas the older buildroot was 
using 4.2.3.  I have checked the gcc config options between these two 
buildroots and I cannot see any differences.  I have appended the output 
from "gcc -v" in case there is something important.

My target is arm at91sam9260ek in case this is pertinent.

Anyone have any suggestions?   Has anything changes with regard to 
libc_hidden_proto in recent months?   Maybe I have missed a config 
option somewhere?    I suspect it is something basic as RPC is needed 
for nfs.

I can provide other info if needed.

Thanks in advance.

Regards.

Mike


Output of gcc -v

br22oct at himalia:~/buildroot$ 
/home/br22oct/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc 
-v
Using built-in specs.
Target: arm-linux-uclibc
Configured with: 
/home/br22oct/buildroot/toolchain_build_arm/gcc-4.2.4/configure 
--prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu 
--target=arm-linux-uclibc --enable-languages=c 
--with-sysroot=/home/br22oct/buildroot/build_arm/staging_dir 
--with-build-time-tools=/home/br22oct/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin 
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld 
--enable-shared 
--with-gmp=/home/br22oct/buildroot/toolchain_build_arm/gmp 
--with-mpfr=/home/br22oct/buildroot/toolchain_build_arm/mpfr 
--disable-nls --enable-threads --disable-multilib --with-tune=arm9tdmi 
--disable-largefile : (reconfigured) 
/home/br22oct/buildroot/toolchain_build_arm/gcc-4.2.4/configure 
--prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu 
--target=arm-linux-uclibc --enable-languages=c 
--with-sysroot=/home/br22oct/buildroot/build_arm/staging_dir 
--with-build-time-tools=/home/br22oct/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin 
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld 
--enable-shared 
--with-gmp=/home/br22oct/buildroot/toolchain_build_arm/gmp 
--with-mpfr=/home/br22oct/buildroot/toolchain_build_arm/mpfr 
--disable-nls --enable-threads --disable-multilib --with-tune=arm9tdmi 
--disable-largefile : (reconfigured) 
/home/br22oct/buildroot/toolchain_build_arm/gcc-4.2.4/configure 
--prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu 
--target=arm-linux-uclibc --enable-languages=c 
--with-sysroot=/home/br22oct/buildroot/build_arm/staging_dir 
--with-build-time-tools=/home/br22oct/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin 
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld 
--enable-shared 
--with-gmp=/home/br22oct/buildroot/toolchain_build_arm/gmp 
--with-mpfr=/home/br22oct/buildroot/toolchain_build_arm/mpfr 
--disable-nls --enable-threads --disable-multilib --with-tune=arm9tdmi 
--disable-largefile : (reconfigured) 
/home/br22oct/buildroot/toolchain_build_arm/gcc-4.2.4/configure 
--prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu 
--target=arm-linux-uclibc --enable-languages=c 
--with-sysroot=/home/br22oct/buildroot/build_arm/staging_dir 
--with-build-time-tools=/home/br22oct/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin 
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld 
--enable-shared 
--with-gmp=/home/br22oct/buildroot/toolchain_build_arm/gmp 
--with-mpfr=/home/br22oct/buildroot/toolchain_build_arm/mpfr 
--disable-nls --enable-threads --disable-multilib --with-tune=arm9tdmi 
--disable-largefile : (reconfigured) 
/home/br22oct/buildroot/toolchain_build_arm/gcc-4.2.4/configure 
--prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu 
--target=arm-linux-uclibc --enable-languages=c 
--with-sysroot=/home/br22oct/buildroot/build_arm/staging_dir 
--with-build-time-tools=/home/br22oct/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin 
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld 
--enable-shared 
--with-gmp=/home/br22oct/buildroot/toolchain_build_arm/gmp 
--with-mpfr=/home/br22oct/buildroot/toolchain_build_arm/mpfr 
--disable-nls --enable-threads --disable-multilib --with-tune=arm9tdmi 
--disable-largefile
Thread model: posix
gcc version 4.2.4



Build log:

<cut earlier output>

staging_dir//usr/lib/crtn.o
portmap.o: In function `reg_service':
portmap.c:(.text+0x120): undefined reference to `svc_sendreply'
portmap.c:(.text+0x23c): undefined reference to `svc_sendreply'
portmap.c:(.text+0x404): undefined reference to `svcerr_decode'
portmap.c:(.text+0x550): undefined reference to `clntudp_create'
portmap.c:(.text+0x578): undefined reference to `authunix_create'
portmap.c:(.text+0x5e0): undefined reference to `svc_sendreply'
portmap.c:(.text+0x62c): undefined reference to `svcerr_noproc'
portmap.c:(.text+0x650): undefined reference to `xdr_void'
portmap.c:(.text+0x654): undefined reference to `xdr_pmap'
portmap.c:(.text+0x65c): undefined reference to `xdr_int'
portmap.c:(.text+0x664): undefined reference to `xdr_pmaplist'
portmap.o: In function `xdr_encap_parms':
portmap.c:(.text+0x688): undefined reference to `xdr_bytes'
portmap.o: In function `xdr_rmtcall_result':
portmap.c:(.text+0x6a0): undefined reference to `xdr_u_long'
portmap.o: In function `xdr_rmtcall_args':
portmap.c:(.text+0x6c8): undefined reference to `xdr_u_long'
portmap.c:(.text+0x6dc): undefined reference to `xdr_u_long'
portmap.c:(.text+0x6f0): undefined reference to `xdr_u_long'
portmap.o: In function `xdr_opaque_parms':
portmap.c:(.text+0x71c): undefined reference to `xdr_opaque'
portmap.o: In function `main':
portmap.c:(.text+0x914): undefined reference to `svcudp_create'
portmap.c:(.text+0x9a0): undefined reference to `svctcp_create'
portmap.c:(.text+0x9fc): undefined reference to `svc_register'
portmap.c:(.text+0xa1c): undefined reference to `svc_run'
pmap_check.o: In function `logit':
pmap_check.c:(.text+0x34): undefined reference to `getrpcbynumber'
collect2: ld returned 1 exit status
make[1]: *** [portmap] Error 1
make[1]: Leaving directory `/home/br22oct/buildroot/build_arm/portmap_5beta'
make: *** [/home/br22oct/buildroot/build_arm/portmap_5beta/portmap] Error 2
