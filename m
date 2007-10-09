From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 9 Oct 2007 14:27:00 +0200
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <470B5043.5010606@ruby.dti.ne.jp>
References: <470ADDA8.3080105@ruby.dti.ne.jp> <20071009070816.GP20951@aon.at>
	<470B5043.5010606@ruby.dti.ne.jp>
Message-ID: <20071009122700.GB15786@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 09, 2007 at 06:56:19PM +0900, Shinya Kuribayashi wrote:
> Bernhard Fischer wrote:
>> You probably mean OABI and not O32.
>
> Yes :-)
>
>> Look at target/Config.in.arch
>> I was under the impression that OABI was 32 for mipsel and o64 for mips,
>> no?
>
> I'm not confident about that...
>
>> I'm not too familiar with the mips matrix.. I will take a look how
>> mips32r2 should be configured (mips vs. mips64 vs. mipsel vs. ??; i.e.
>> both the endianess and the bit-depth have to be settable, AFAICS).
>
> IMHO it's target ABI config problem about OABI and mips, not mips32r2
> specific problem as you know.
>
> I have three successful builds. I hope these help.
>
> [1] mips: Before recently toolchain config rework (2007-09-19 build)
>
> skuribay at debian:~/devel/buildroot$ 
> ./build_mips.orig/staging_dir/usr/bin/mips-linux-gcc -v
> Using built-in specs.
> Target: mips-linux-uclibc
> Configured with: 
> /home/skuribay/devel/buildroot/toolchain_build_mips/gcc-4.2.1/configure 
> --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu 
> --target=mips-linux-uclibc --enable-languages=c,c++ 
> --with-sysroot=/home/skuribay/devel/buildroot/build_mips/staging_dir 
> --with-build-time-tools=/home/skuribay/devel/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/bin 
> --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld 
> --enable-shared 
> --with-gmp=/home/skuribay/devel/buildroot/toolchain_build_mips/gmp 
> --with-mpfr=/home/skuribay/devel/buildroot/toolchain_build_mips/mpfr 
> --disable-nls --enable-threads --disable-multilib
> Thread model: posix
> gcc version 4.2.1

I don't know offhand what abi that defaults to. Can you check this,
perhaps?
>
> [2] mipsel: Current trunk build
[snip mipsel OABI is fine]
>
> [3] mips: Current trunk build with a change (for testing)
>
> skuribay at debian:~/devel/buildroot$ svn diff
> Index: target/Config.in.arch
> ===================================================================
> --- target/Config.in.arch       (revision 20207)
> +++ target/Config.in.arch       (working copy)
> @@ -689,7 +689,7 @@
>        default iwmmxt          if BR2_iwmmxt
>        default 32              if BR2_mipsel && BR2_MIPS_OABI
>        default n32             if BR2_mipsel && BR2_MIPS_EABI
> -       default o64             if BR2_mips && BR2_MIPS_OABI
> +       default 32              if BR2_mips && BR2_MIPS_OABI

I'm pretty sure that this is not really correct either.
I will extend these (for mips) to include "ABI32" which boils down to
32.
But think about your change for a second. For mips EB you want to allow
for 32bit (1,2,32*) and 64bit where 32bit OABI should use =32 but 64bit
OABI should use =o64 as opposed to 64bit ABI32 (=32), 64bit EABI
(=eabi), 64bit ABI64 (=64), at least AFAICT.

Does this sound appropriate to you?
