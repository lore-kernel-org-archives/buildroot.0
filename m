From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 16 Oct 2007 13:42:33 +1000
Subject: [Buildroot] buildroot for armeb, gcc-4.2.1 fails to build
In-Reply-To: <20071016001608.GA17751@cloud.net.au>
References: <20071015054821.GA5245@cloud.net.au>
	<d83696340710150806x33bc3b44ofe8d5cd349220e4@mail.gmail.com>
	<20071016001608.GA17751@cloud.net.au>
Message-ID: <20071016034233.GA21412@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 16, 2007 at 10:16:08AM +1000, Hamish Moffatt wrote:
> 2. OABI + linux 2.6.22 headers + soft-float: uClibc fails to build with
> missing __NR_syscall:
> 
> libc/sysdeps/linux/arm/syscall.c: In function 'syscall':
> libc/sysdeps/linux/arm/syscall.c:28: error: '__NR_syscall' undeclared (first use in this function)
> libc/sysdeps/linux/arm/syscall.c:28: error: (Each undeclared identifier is reported only once
> libc/sysdeps/linux/arm/syscall.c:28: error: for each function it appears in.)

Found the problem. The compiler was built for EABI even though I
selected OABI. This is because the compiler is choosing the ABI based on
the toolchain suffix.

If you change your configuration from EABI back to OABI, the toolchain suffix
is still set to the old default of uclibcgnueabi, so gcc is built
incorrectly.

So now it just fails like this:

> libc/libc_so.a(difftime.os): In function `difftime':
> difftime.c:(.text+0x8): undefined reference to `__floatsidf'
> difftime.c:(.text+0x2c): undefined reference to `__subdf3'
> libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
> _fpmaxtostr.c:(.text+0xe0): undefined reference to `__nedf2'
> _fpmaxtostr.c:(.text+0x104): undefined reference to `__eqdf2'
> _fpmaxtostr.c:(.text+0x120): undefined reference to `__divdf3'
> _fpmaxtostr.c:(.text+0x12c): undefined reference to `__ltdf2'
> _fpmaxtostr.c:(.text+0x1e0): undefined reference to `__muldf3'
> _fpmaxtostr.c:(.text+0x39c): undefined reference to `__gedf2'
> _fpmaxtostr.c:(.text+0x42c): undefined reference to `__floatunsidf'
> libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
> __psfs_do_numeric.c:(.text+0x54c): undefined reference to `__truncdfsf2'
> libc/libc_so.a(strtof.os): In function `strtof':
> strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
> libc/libc_so.a(__strtofpmax.os): In function `__strtofpmax':
> __strtofpmax.c:(.text+0x154): undefined reference to `__adddf3'
> /home/hamish/tmp/br/buildroot/build_armeb/staging_dir/usr/lib/gcc/armeb-linux-uclibc/4.2.1/libgcc.a(_fixunsdfsi.o): In function `__fixunsdfsi':
> libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
> make[2]: *** [lib/libc.so] Error 1
> make[1]: *** [lib/libc.so.0] Error 2

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
