From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 12:37:51 +0100
Subject: [Buildroot] [PATCH] package/liquid-dsp: add missing dependency
 on fftw
In-Reply-To: <20181212090458.15747-1-thomas.petazzoni@bootlin.com>
References: <20181212090458.15747-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181212123751.354c8716@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Dec 2018 10:04:58 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> When one of BR2_PACKAGE_FFTW_PRECISION_* is enabled, liquid-dsp links
> against fftw3f, fftw3 or fftw3l, but forgets to add the fftw package
> in its dependencies. It works fine in practice because "fftw" is
> before "liquid-dsp" in the alphabetic ordering, but building with
> "make liquid-dsp" or with per-package directory causes a build
> failure.
> 
> Fix that by adding the missing dependencies.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/liquid-dsp/liquid-dsp.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/liquid-dsp/liquid-dsp.mk
> b/package/liquid-dsp/liquid-dsp.mk index e3114a2d15..db67893844 100644
> --- a/package/liquid-dsp/liquid-dsp.mk
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -32,6 +32,7 @@ endif
>  # use FFTW instead of built-in FFT
>  ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
>  LIQUID_DSP_LDFLAGS += -lfftw3f
> +LIQUID_DSP_DEPENDENCIES += fftw
>  endif
>  
>  # disable altivec, it has build issues
> @@ -41,10 +42,12 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
>  LIQUID_DSP_LDFLAGS += -lfftw3
> +LIQUID_DSP_DEPENDENCIES += fftw
>  endif
>  
>  ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
>  LIQUID_DSP_LDFLAGS += -lfftw3l
> +LIQUID_DSP_DEPENDENCIES += fftw
>  endif
>  
>  LIQUID_DSP_CONF_OPTS += \
> -- 
> 2.19.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
