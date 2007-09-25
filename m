From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 25 Sep 2007 14:02:30 +0200
Subject: [Buildroot] ARM softfloat - revisited
Message-ID: <1190721750.19731.23.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I try to build an ARM toolchain
(gcc-4.2.1/binutils-2.18/uClibc-0-.9.29)
with software floating point, I get the following
error message when building uClibc-0.9.29:

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
libc/libc_so.a(difftime.os): In function `difftime':
difftime.c:(.text+0x8): undefined reference to `__floatsidf'
difftime.c:(.text+0x2c): undefined reference to `__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
_fpmaxtostr.c:(.text+0xd0): undefined reference to `__nedf2'
_fpmaxtostr.c:(.text+0xf4): undefined reference to `__eqdf2'
_fpmaxtostr.c:(.text+0x110): undefined reference to `__divdf3'
_fpmaxtostr.c:(.text+0x11c): undefined reference to `__ltdf2'
_fpmaxtostr.c:(.text+0x1d0): undefined reference to `__muldf3'
_fpmaxtostr.c:(.text+0x384): undefined reference to `__gedf2'
_fpmaxtostr.c:(.text+0x40c): undefined reference to `__floatunsidf'
libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x534): undefined reference to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
libc/libc_so.a(__strtofpmax_l.os): In function `__strtofpmax_l':
__strtofpmax_l.c:(.text+0x15c): undefined reference to `__adddf3'

/home/ulf/projects/Buildroot/20070925-soft/buildroot/build_arm_wchar/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/libgcc.a(_fixunsdfsi.o): In function `__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make: ***
[/home/ulf/projects/Buildroot/20070925-soft/buildroot/toolchain_build_arm_nofpu_wchar/uClibc-0.9.29/lib/libc.a] Error 2

---------------------------------------------------------------------------
If I check the STAGING_DIR, I see that 

<buildroot>/build_arm_wchar/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/libgcc.a
seems to contain the neccessary files, but the linking of libc/libc_so.a
does not seem to take into account this files.
I tried adding LDFLAGS+=-lgcc but this does not help.
The I added the gcc/config/soft-fp source files from gcc-4.2.1
and this allows the compile to continue, but it seems to be strange
that this should be required.

Any ideas?

Best Regards
Ulf Samuelsson
