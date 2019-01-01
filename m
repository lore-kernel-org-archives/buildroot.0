From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 13:16:57 +0100
Subject: [Buildroot] [PATCH v3 08/17] package/gnuradio: use the new
 fftw-single package
In-Reply-To: <20181231133030.25991-9-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-9-thomas.petazzoni@bootlin.com>
Message-ID: <20190101121657.GN26917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Thanks to the new fftw package organization, we can use a "select"
> instead of "depends on".
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, minor nit, below...

> ---
>  package/gnuradio/Config.in   | 8 ++------
>  package/gnuradio/gnuradio.mk | 2 +-
>  2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 56957d59e4..533a49c81e 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -78,11 +78,6 @@ config BR2_PACKAGE_GNURADIO_ZEROMQ
>  	help
>  	  zeromq communication support
>  
> -comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager, -qtgui depends fftw's single precision"
> -	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
> -
> -if BR2_PACKAGE_FFTW_PRECISION_SINGLE
> -
>  config BR2_PACKAGE_GNURADIO_ANALOG
>  	bool "gr-analog support"
>  	select BR2_PACKAGE_GNURADIO_FILTER
> @@ -103,6 +98,8 @@ config BR2_PACKAGE_GNURADIO_DIGITAL
>  
>  config BR2_PACKAGE_GNURADIO_FFT
>  	bool "gr-fft support"
> +	select BR2_PACKAGE_FFTW
> +	select BR2_PACKAGE_FFTW_SINGLE

So, here we're selecting both fftw and fftw-single, yet...

>  	select BR2_PACKAGE_GNURADIO_BLOCKS
>  	help
>  	  FFT signal processing blocks
> @@ -136,4 +133,3 @@ config BR2_PACKAGE_GNURADIO_TRELLIS
>  	  Trellis coded modulation blocks
>  
>  endif
> -endif
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index ed537e3934..564ad8b2a4 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -101,7 +101,7 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GNURADIO_FFT),y)
> -GNURADIO_DEPENDENCIES += fftw
> +GNURADIO_DEPENDENCIES += fftw-single

... here we only have fftw-single as a dependency. That's a bit weird.

But heck...

Regards,
Yann E. MORIN.

>  GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=ON
>  else
>  GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=OFF
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
