From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 00:41:35 +0100
Subject: [Buildroot] FFTW optimized for ARM and NEON FPU
In-Reply-To: <54EBF694.6090705@gmail.com>
References: <54EBF694.6090705@gmail.com>
Message-ID: <20150315234135.GF4104@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume, All,

Sorry for the delay in the response...

On 2015-02-23 20:57 -0700, guillaume william brs spake thusly:
> I am working on a cortex-a9 (zynq SoC, mainly zc706)
> I faced fairly slow computations of FFT using this library with the default
> configuration (20MFlops).
> 
> I modified package/fftw.mk to optimize the library compilation as long as an
> FPU is available,
> NEON in this case: this increased the number of MFlops to 500-600.

There's recently been another attempt at making fftw more efficient:
    http://patchwork.ozlabs.org/patch/450317/

So, I've decided to have a look if we had other patches for fftw. And it
turned out there's yours! ;-)

So, I've hada look and have some comments, see below...

> -- 
> guillaume william bres-saix
> software engineer
> NIST - Time & Frequency div.
> 325 Broadway, Boulder, CO 80305.
> 

> --- fftw.mk	2015-02-23 19:20:04.849545269 -0700
> +++ fftw_fpu.mk	2015-02-23 19:26:47.598136607 -0700
> @@ -10,4 +10,17 @@
>  FFTW_LICENSE = GPLv2+
>  FFTW_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_ARM_ENABLE_NEON),y)
> +FFTW_CONF_OPTS+= --enable-threads 

This should be conditional on BR2_TOOLCHAIN_HAS_THREADS; it has nothing
to do with NEON.

> +FFTW_CONF_OPTS+= --with-cpu=cortex-a9 
> +FFTW_CONF_OPTS+= --with-mode=arm 
> +FFTW_CONF_OPTS+= --enable-languages=c,c++ 

fftw does not seem to have such options...

> +FFTW_CONF_OPTS+= ARM_CPU_TYPE=cortex-a9 
> +FFTW_CONF_OPTS+= ARM_FLOAT_ABI=softfp

Those two variables are nowhere to be used in fftw either...

> +FFTW_CONF_OPTS+= --disable-fortran 

OK.

> +FFTW_CONF_OPTS+= --enable-single

This one is handled in the patch I pointed to earlier.

> +FFTW_CONF_OPTS+= --enable-neon
> +FFTW_CONF_OPTS+= CFLAGS="$(TARGET_CFLAGS)-Ofast -mfpu=neon -mfloat-abi=softfp"

Hmm... -mfpu and -mfloat-abi should not be needed, since they are
already taken care of:
  - for internal toolchains, they are set as the defaults for gcc;
  - for external toolchains, they are automatically added by our wrapper.

Also, specifying them could be conflicting with the defaults.

I'll see to get this in order and will resubmit...

Regards,
Yann E. MORIN.

> +endif
> +
>  $(eval $(autotools-package))

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
