From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 16 Oct 2007 10:16:08 +1000
Subject: [Buildroot] buildroot for armeb, gcc-4.2.1 fails to build
In-Reply-To: <d83696340710150806x33bc3b44ofe8d5cd349220e4@mail.gmail.com>
References: <20071015054821.GA5245@cloud.net.au>
	<d83696340710150806x33bc3b44ofe8d5cd349220e4@mail.gmail.com>
Message-ID: <20071016001608.GA17751@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 15, 2007 at 10:06:13AM -0500, Jonathan Nalley wrote:
> I have seen the exact same problem.  It doesn't matter if you select EABI or
> not (the build doesn't complete either way).  I have been unable to build
> when selecting "armeb" regardless of what other options I choose.  Little
> Endian "arm" builds fine.  I have been trying to look into what might be
> going wrong with little success.  I added "--disable-libmudflap" to the GCC
> options, and that got me a little further in the build but it still failed
> building gcc-final.

I concur; I can't get armeb to build in any configuration.

1. EABI: libgcc_s.so fails to link with incorrect file format error.
(With or without soft-float.)

2. OABI + linux 2.6.22 headers + soft-float: uClibc fails to build with
missing __NR_syscall:

libc/sysdeps/linux/arm/syscall.c: In function 'syscall':
libc/sysdeps/linux/arm/syscall.c:28: error: '__NR_syscall' undeclared (first use in this function)
libc/sysdeps/linux/arm/syscall.c:28: error: (Each undeclared identifier is reported only once
libc/sysdeps/linux/arm/syscall.c:28: error: for each function it appears in.)

3. OABI + linux 2.6.21.5 headers + soft-float: uClibc fails to build
with some missing floating-point symbols, possibly due to a mixup with
soft float options.

libc/libc_so.a(difftime.os): In function `difftime':
difftime.c:(.text+0x8): undefined reference to `__floatsidf'
difftime.c:(.text+0x2c): undefined reference to `__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
_fpmaxtostr.c:(.text+0xe0): undefined reference to `__nedf2'
_fpmaxtostr.c:(.text+0x104): undefined reference to `__eqdf2'
_fpmaxtostr.c:(.text+0x120): undefined reference to `__divdf3'
_fpmaxtostr.c:(.text+0x12c): undefined reference to `__ltdf2'
_fpmaxtostr.c:(.text+0x1e0): undefined reference to `__muldf3'
_fpmaxtostr.c:(.text+0x39c): undefined reference to `__gedf2'
_fpmaxtostr.c:(.text+0x42c): undefined reference to `__floatunsidf'
libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x54c): undefined reference to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
libc/libc_so.a(__strtofpmax.os): In function `__strtofpmax':
__strtofpmax.c:(.text+0x154): undefined reference to `__adddf3'
/home/hamish/tmp/br/buildroot/build_armeb/staging_dir/usr/lib/gcc/armeb-linux-uclibc/4.2.1/libgcc.a(_fixunsdfsi.o): In function `__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2

I didn't try OABI without soft-float yet, because I don't want to use
that configuration.

> As I said, I have built the little endian toolchain with no issues at all.
> I have used the little endian toolchain to build a kernel and u-boot
> 1.2.0which are both big endian.

What about user-space applications and uClibc? 

It should work. My last project used gcc-3.4.x with a default of
little-endian + -mbig-endian everywhere (kernel, uClibc) without issues.

> One idea I had to simplify things is to modify the buildroot so that it
> ALWAYS builds the little endian toolchain, but passes -mbig-endian when the
> user selects "armeb".  This should greatly reduce the effort required to
> test both "arm" and "armeb" since the same method/patches would be used for
> both.  Thoughts?

Sounds reasonable. In the meantime I wonder where the differences
between arm and armeb are...


thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
