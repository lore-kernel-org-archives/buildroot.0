From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2015 00:50:09 +0200
Subject: [Buildroot] [PATCH 1/1] GNURadio: add processing blocks
In-Reply-To: <1428584688-10074-1-git-send-email-gwenj@trabucayre.com>
References: <1428584688-10074-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150409225009.GE4192@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2015-04-09 15:04 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> GNURadio provides a set of processing blocks like analog or digital
> communication, filters, ...
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Still, I have a few minor comments, see below...

> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index a33deeb..e6c8dc5 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
[--SNIP--]
> @@ -44,4 +50,61 @@ config BR2_PACKAGE_GNURADIO_PYTHON
>  	help
>  	  Enable python component
>  
> +config BR2_PACKAGE_GNURADIO_UTILS
> +	bool "misc python utilities support"
> +	select BR2_PACKAGE_GNURADIO_PYTHON
> +	help
> +	  GNU Radio misc python utilities
> +
> +comment "gr-fft depends on fftw and fftw's single precision"
> +	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +
> +comment "gr-filter, -analog, -channels, -digital, -trellis, -pager depends on gr-fft"

This comment is about 'gr-something', but the options below are just
about 'something'. This is a bit inconsistent...

> +	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +
> +if BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +
> +config BR2_PACKAGE_GNURADIO_ANALOG
> +	bool "analog communications support"

... so I would set this prompt to "gr-analog" (and so on for the other
prompts, below). We usally only list the 'technical' name of the option,
not the human name, which is waht the help entry is for.

> +	select BR2_PACKAGE_GNURADIO_FILTER
> +	help
> +	  GNU Radio blocks for analog communications

Probably no needed to repeast "GNU Radio" since this *is* the GNURAdio
package (ditto for the other help entries, below)...

If you can fix this, you can respin with my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    [build-tested only]

Thanks! :-)

Regards,
Yann E. MORIN.

> +config BR2_PACKAGE_GNURADIO_CHANNELS
> +	bool "channels model blocks support"
> +	select BR2_PACKAGE_GNURADIO_ANALOG
> +	help
> +	  GNU Radio's channel model blocks
> +
> +config BR2_PACKAGE_GNURADIO_DIGITAL
> +	bool "digital communications support"
> +	select BR2_PACKAGE_GNURADIO_ANALOG
> +	help
> +	  GNU Radio blocks for digital communications
> +
> +config BR2_PACKAGE_GNURADIO_FFT
> +	bool "fft blocks support"
> +	select BR2_PACKAGE_GNURADIO_BLOCKS
> +	help
> +	  GNU Radio's FFT signal processing blocks
> +
> +config BR2_PACKAGE_GNURADIO_FILTER
> +	bool "signal processing filter blocks support"
> +	select BR2_PACKAGE_GNURADIO_FFT
> +	help
> +	  GNU Radio's filter signal processing blocks
> +
> +config BR2_PACKAGE_GNURADIO_PAGER
> +	bool "FLEX pager decoder support"
> +	select BR2_PACKAGE_GNURADIO_ANALOG
> +	help
> +	 GNU Radio blocks implementing a FLEX pager decoder
> +
> +config BR2_PACKAGE_GNURADIO_TRELLIS
> +	bool "trellis coded modulation support"
> +	select BR2_PACKAGE_GNURADIO_DIGITAL
> +	help
> +	  GNU Radio blocks for trellis coded modulation
> +
> +endif
>  endif
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index e58c7dc..fc5cd1f 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -42,12 +42,49 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),)
>  GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GNURADIO_ANALOG),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GNURADIO_BLOCKS),y)
>  GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=ON
>  else
>  GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GNURADIO_CHANNELS),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_CHANNELS=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_CHANNELS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GNURADIO_DIGITAL),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_DIGITAL=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_DIGITAL=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GNURADIO_FEC),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GNURADIO_FFT),y)
> +GNURADIO_DEPENDENCIES += fftw
> +GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GNURADIO_FILTER),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
>  GNURADIO_DEPENDENCIES += python
>  GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
> @@ -55,4 +92,22 @@ else
>  GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GNURADIO_PAGER),y)
> +GNURADIO_CONF_OPTS += -DENABLE_PAGER=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_PAGER=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GNURADIO_TRELLIS),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_TRELLIS=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_TRELLIS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GNURADIO_UTILS),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_UTILS=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_UTILS=OFF
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.0.5
> 
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
