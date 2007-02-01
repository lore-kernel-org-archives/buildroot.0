From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 1 Feb 2007 20:15:54 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
References: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
Message-ID: <200702012015.55089.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all!
Michel, Carl.

On Thursday 01 February 2007 010, Michel Benoit wrote:
> I'm trying to build a toolchain with soft floating point enabled for
> ARM arm26t target platform.  I'm doing this in order to build u-boot
> for my target.
[--SNIP--]
> The build stops due to missing symbols while linking uclibc:
> 
> make[1]: Entering directory
> `/home/michel/Projects/sepab/exyplus/sw/bsp/build/buildroot/toolchain_build_arm_nofpu/uClibc'
>   LD libuClibc-0.9.29.so
> libc/libc_so.a(difftime.os): In function `difftime':
> difftime.c:(.text+0x8): undefined reference to `__floatsidf'
> difftime.c:(.text+0x2c): undefined reference to `__subdf3'
> libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
> _fpmaxtostr.c:(.text+0xd4): undefined reference to `__nedf2'
> _fpmaxtostr.c:(.text+0xf8): undefined reference to `__eqdf2'
> _fpmaxtostr.c:(.text+0x114): undefined reference to `__divdf3'
> _fpmaxtostr.c:(.text+0x120): undefined reference to `__ltdf2'
> _fpmaxtostr.c:(.text+0x1c4): undefined reference to `__muldf3'
> _fpmaxtostr.c:(.text+0x388): undefined reference to `__gedf2'
> _fpmaxtostr.c:(.text+0x430): undefined reference to `__adddf3'
> libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
> __psfs_do_numeric.c:(.text+0x520): undefined reference to `__truncdfsf2'
> libc/libc_so.a(strtof.os): In function `strtof':
> strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
> /home/michel/Projects/sepab/exyplus/sw/bsp/build/buildroot/build_arm_nofpu/staging_dir/lib/gcc/arm-linux-uclibc/4.1.1/libgcc.a(_fixunsdfsi.o):
> In function `__fixunsdfsi':
> libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
> make[2]: *** [lib/libc.so] Error 1
> make[1]: *** [lib/libc.so.0] Error 2
> make[1]: Leaving directory
> `/home/michel/Projects/sepab/exyplus/sw/bsp/build/buildroot/toolchain_build_arm_nofpu/uClibc'
> make: *** [/home/michel/Projects/sepab/exyplus/sw/bsp/build/buildroot/toolchain_build_arm_nofpu/uClibc/lib/libc.a]
> Error 2

I'm tracking this down right now, and I've found that those functions are not
included in libgcc.a because gcc-4.1.1/gcc/config.gcc does not validate
arm/t-arm-elf for arm*-linux* targets, but arm/t-arm, which does not describe
those functions as to be included in libgcc.a.

I've tried a quick fix (replacing t-arm with t-arm-elf), but it still does
not work. I haven't had time right to investigate more. Later tongiht.

> Are there any other config options that need to be selected/unselected
> in order to get this to work?

You could try with a known working gcc (gcc-3.4.4 is working real fine here),
unless you really can't for very good reasons, but compiling u-boot should
Just Work (TM).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
