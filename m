From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jul 2013 00:39:53 +0200
Subject: [Buildroot] [PATCH] toolchain: check ARM EABI vs. EABIhf for
 external toolchains
In-Reply-To: <1374012366-27612-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1374012366-27612-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130716223952.GB7947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-17 00:06 +0200, Thomas Petazzoni spake thusly:
> Following the introduction of the support of EABIhf as a second ARM
> ABI, it is important to check whether the external toolchain provided
> by the user actually uses the ABI that has been selected in the
> Buildroot configuration. This commit introduces such a check, using a
> similar solution to the one that was used to check OABI vs. EABI in
> the past.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/helpers.mk | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 95217e7..dc21f8a 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -280,8 +280,20 @@ check_uclibc = \
>  check_arm_abi = \
>  	__CROSS_CC=$(strip $1) ; \
>  	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
> -	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
> -		echo "External toolchain uses the unsuported OABI" ; \
> +	if echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi$$' ; then \
> +		EXT_TOOLCHAIN_ABI="eabi" ; \
> +	elif echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabihf$$' ; then \
> +		EXT_TOOLCHAIN_ABI="eabihf" ; \

That's not always the case. You can well have a toolchain which tuple
ends in eabi, but the toolchain uses the hard-float ABI.

That's the case by default for crosstool-NG toolchains, for example.
Since the *eabihf is recent, not all gcc or binutils versions recognise
it, while they are absolutely capable of emitting EABI using the
hard-float ABI. Hence, ct-ng allows adding the 'hf' suffix as an option.
(see attachment for an example of 'gcc -v' dump).

Checking for EABI, it is better and more reliable to run the
preprocessor, and check some defines are available or not (I always
need a bit of googling to get this):
    ARM_TUPLE-gcc -E -dM -xc - </dev/null |grep __ARM_EABI__

However, I could not find a #define about the float ABI... :-(

> +	else \
> +		echo "Unsupported ABI of the external toolchain" ; \
> +		exit 1 ; \
> +	fi ; \
> +	if [ x$(BR2_ARM_EABI) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "eabihf" ] ; then \

Using this 'x$(VAR) = xy' construct is ugly. Just quote the variables,
it is easier to read:
    if [ "$(BR2_ARM_EABI)" = "y" ... ]

The x$VAR construct was from a time when some shells where failing to
test against an empty string. That time is long gone. Virtaully all
shells can compare to empty strings, nowadays.

> +		echo "Incorrect ABI setting: EABI selected, but toolchain uses EABIhf" ; \
> +		exit 1 ; \
> +	fi ; \
> +	if [ x$(BR2_ARM_EABIHF) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "eabi" ] ; then \

Ditto.

> +		echo "Incorrect ABI setting: EABIhf selected, but toolchain uses EABI" ; \
>  		exit 1 ; \
>  	fi

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
Using built-in specs.
COLLECT_GCC=./x-tools/armv6-rpi36-linux-gnueabi/bin/armv6-rpi36-linux-gnueabi-gcc
COLLECT_LTO_WRAPPER=/home/ymorin/x-tools/armv6-rpi36-linux-gnueabi/libexec/gcc/armv6-rpi36-linux-gnueabi/4.8.1/lto-wrapper
Target: armv6-rpi36-linux-gnueabi
Configured with:
/home/ymorin/dev/crosstool-NG/ct-ng.current/.build/src/gcc-linaro-4.8-2013.04/configure
    --build=x86_64-build_unknown-linux-gnu
    --host=x86_64-build_unknown-linux-gnu --target=armv6-rpi36-linux-gnueabi
    --prefix=/home/ymorin/x-tools/armv6-rpi36-linux-gnueabi
    --with-sysroot=/home/ymorin/x-tools/armv6-rpi36-linux-gnueabi/armv6-rpi36-linux-gnueabi/sysroot
    --enable-languages=c,c++ --with-arch=armv6zk --with-cpu=arm1176jzf-s
    --with-tune=arm1176jzf-s --with-fpu=vfp --with-float=hard
    --with-pkgversion='crosstool-NG hg+default-2685dfa9de14'
    --enable-__cxa_atexit --disable-libmudflap --disable-libgomp
    --disable-libssp --disable-libquadmath --disable-libquadmath-support
    --with-gmp=/home/ymorin/dev/crosstool-NG/ct-ng.current/.build/armv6-rpi36-linux-gnueabi/buildtools
    --with-mpfr=/home/ymorin/dev/crosstool-NG/ct-ng.current/.build/armv6-rpi36-linux-gnueabi/buildtools
    --with-mpc=/home/ymorin/dev/crosstool-NG/ct-ng.current/.build/armv6-rpi36-linux-gnueabi/buildtools
    --with-isl=/home/ymorin/dev/crosstool-NG/ct-ng.current/.build/armv6-rpi36-linux-gnueabi/buildtools
    --with-cloog=/home/ymorin/dev/crosstool-NG/ct-ng.current/.build/armv6-rpi36-linux-gnueabi/buildtools
    --with-libelf=/home/ymorin/dev/crosstool-NG/ct-ng.current/.build/armv6-rpi36-linux-gnueabi/buildtools
    --enable-threads=posix --enable-target-optspace --disable-libstdcxx-pch
    --enable-linker-build-id --with-linker-hash-style=both
    --enable-plugin --enable-gold --disable-nls --disable-multilib
    --with-local-prefix=/home/ymorin/x-tools/armv6-rpi36-linux-gnueabi/armv6-rpi36-linux-gnueabi/sysroot
    --enable-c99 --enable-long-long
Thread model: posix
gcc version 4.8.1 20130401 (prerelease) (crosstool-NG
hg+default-2685dfa9de14)
