From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 29 May 2016 15:01:59 +0200
Subject: [Buildroot] [PATCH] fftw: Disable combined threads when
 building with OpenMP support
In-Reply-To: <1464366101-637-1-git-send-email-nerv@dawncrow.de>
References: <1464366101-637-1-git-send-email-nerv@dawncrow.de>
Message-ID: <574AE847.9020705@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Some notes on my patch:
Without it fftw fails to configure when the toolchain has threads and openmp
checking for OpenMP flag of C compiler... -fopenmp
configure: error: --with-combined-threads incompatible with --enable-openmp

I'm not sure if my approach is what you would have in mind...
should I rather use ifeq,else,endif as in the block above
or do you have a good suggestion to make --with-combined-threads mutual exclusive between threads and openmp?


Am 27.05.2016 um 18:21 schrieb Andr? Hentschel:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/fftw/fftw.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index 5045ab6..f4b1794 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -35,7 +35,7 @@ FFTW_CONF_OPTS += --enable-threads --with-combined-threads
>  else
>  FFTW_CONF_OPTS += --disable-threads
>  endif
> -FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
> +FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without-combined-threads --enable,--disable)-openmp
>  
>  FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
>  
> 
