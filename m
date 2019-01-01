From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 22:50:58 +0100
Subject: [Buildroot] [PATCH v3 15/17] package/liquid-dsp: use the new
 fftw-{single, double, long-double} packages
In-Reply-To: <20181231133030.25991-16-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-16-thomas.petazzoni@bootlin.com>
Message-ID: <20190101215058.GE23435@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/liquid-dsp/liquid-dsp.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
> index db67893844..6aa27a5248 100644
> --- a/package/liquid-dsp/liquid-dsp.mk
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -30,9 +30,9 @@ LIQUID_DSP_CFLAGS += -ffast-math
>  endif
>  
>  # use FFTW instead of built-in FFT
> -ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
> +ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
>  LIQUID_DSP_LDFLAGS += -lfftw3f
> -LIQUID_DSP_DEPENDENCIES += fftw
> +LIQUID_DSP_DEPENDENCIES += fftw-single
>  endif
>  
>  # disable altivec, it has build issues
> @@ -40,14 +40,14 @@ ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
>  LIQUID_DSP_CONF_OPTS += --enable-simdoverride
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
> +ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
>  LIQUID_DSP_LDFLAGS += -lfftw3
> -LIQUID_DSP_DEPENDENCIES += fftw
> +LIQUID_DSP_DEPENDENCIES += fftw-double
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
> +ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
>  LIQUID_DSP_LDFLAGS += -lfftw3l
> -LIQUID_DSP_DEPENDENCIES += fftw
> +LIQUID_DSP_DEPENDENCIES += fftw-long-double
>  endif

Since those three fftw variants can now be enabled at the same time,
we'd end up with:
    LIQUID_DSP_DEPENDENCIES = fftw-single fftw-double fftw-long-double
    LIQUID_DSP_LDFLAGS = -lfftw3f -lfftw3 -lfftw3l

Is that really what we want?

If not, then the theree conditions must be mutually exclusive, and a
priority must be given (I'll assume the most precise is to be favoured):

ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
LIQUID_DSP_LDFLAGS += -lfftw3l
LIQUID_DSP_DEPENDENCIES += fftw-long-double
else ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
LIQUID_DSP_LDFLAGS += -lfftw3
LIQUID_DSP_DEPENDENCIES += fftw-double
else ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
LIQUID_DSP_LDFLAGS += -lfftw3f
LIQUID_DSP_DEPENDENCIES += fftw-single
endif

Regards,
Yann E. MORIN.

>  LIQUID_DSP_CONF_OPTS += \
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
