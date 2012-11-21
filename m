From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Nov 2012 18:33:12 +0100
Subject: [Buildroot] crosstools in buildroot build fails when hard fpu
	is selected
In-Reply-To: <50ACEDD1.4010707@wanadoo.fr>
References: <50ACAB98.90607@wanadoo.fr> <50ACEDD1.4010707@wanadoo.fr>
Message-ID: <201211211833.13010.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thierry, All,

On Wednesday 21 November 2012 Thierry Bultel wrote:
> Using Buildroot-2012-08, I am building for arm-cortexa9-eabi,
> crosstools+glibc, kernel base 2.6.38.8

'crosstool-NG', not 'crosstools' ;-)

> I want to activate hardware floating point support, thus I have
> unchecked the  "Use software floating point by default"
> 
> My final aim is to use Neon, but the defaut Hardware FPU is fine at this
> time.
> 
> The build (from scratch) fails when at glibc:
[--SNIP--]
> The config.log shows:
> 
> configure:2477: arm-unknown-linux-gnueabi-gcc     -c  -U_FORTIFY_SOURCE
>  -mlittle-endian -march=armv7-a   -mtune=cortex-a9 -mfpu=neon
> -mhard-float  -O2   conftest.c >&5
> conftest.c:1: sorry, unimplemented: -mfloat-abi=hard and VFP
> 
> GCC has not been generated with the harware FPU support.

No, gcc has indeed be configured with hard-float. It's just that gcc does
*not* support emitting VFP instructions for the hard-float ABI. See:
  gcc-X.Y.Z/gcc/config/arm/arm.c
  1850        if (arm_float_abi == ARM_FLOAT_ABI_HARD && TARGET_VFP)
  1851          sorry ("-mfloat-abi=hard and VFP");

So, no matter what, it is not possible, with stock gcc, to use the VFP.

However, it is possible to use neon. There is a sample in crosstool-NG
that builds a NEON-enabled toolchain. You can look at how it is configured
and replicate that in your setup:
  ct-ng list-samples
  ct-ng arm-cortex_a15-linux-gnueabi    <- this sample enables neon
  ct-ng menuconfig

Then, to reproduce those options with buildroot:
    make ctng-menuconfig

Also, you could use 'softfp' instead of 'hard'. The name is (IMHO) a
msi-nomer, as this ABI does emit hardware floating point instructions,
but uses the software ABI (the way floats are represented). Look at
the help entries for 'soft', 'hard' and 'softfp' for more info.

Note: Unfortunately, the ct-ng integration in buildroot does not allow
building a 'softfp' toolchain; it's either 'soft' or 'hard', because BR
does not differentiate between 'hard' and 'softfp'.

> I have attempted several hacks into
> toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
> ... with no better success

The problem is *not* in glibc, so you can't fix anything by hacking the
glibc build script.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
