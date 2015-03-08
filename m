From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Sun, 8 Mar 2015 17:57:38 +0100
Subject: [Buildroot] [PATCH 1/1] fftw: add compile precision option
In-Reply-To: <1425236772-13124-1-git-send-email-gwenj@trabucayre.com>
References: <1425236772-13124-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150308175738.31288a51@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

up
Gwen

On Sun,  1 Mar 2015 20:06:12 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fftw has options to select compile precision between single, long-double and
> quad. These options are exclusives. This patch adds choice to select precision
> option.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/fftw/Config.in | 32 ++++++++++++++++++++++++++++++++
>  package/fftw/fftw.mk   | 10 ++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/package/fftw/Config.in b/package/fftw/Config.in
> index 36f849f..f35179b 100644
> --- a/package/fftw/Config.in
> +++ b/package/fftw/Config.in
> @@ -9,3 +9,35 @@ config BR2_PACKAGE_FFTW
>  	  double precision.
>  
>  	  http://www.fftw.org
> +
> +if BR2_PACKAGE_FFTW
> +
> +choice
> +	prompt "fftw precision"
> +	default BR2_PACKAGE_FFTW_PRECISION_NONE
> +	help
> +	  Selects fftw precision
> +
> +config BR2_PACKAGE_FFTW_PRECISION_NONE
> +	bool "none"
> +	help
> +	  no compile precision selected
> +
> +config BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +	bool "single precision"
> +	help
> +	  compile fftw in single precision
> +
> +config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
> +	bool "long double precision"
> +	help
> +	  compile fftw in long-double precision
> +
> +config BR2_PACKAGE_FFTW_PRECISION_QUAD
> +	bool "quad precision"
> +	help
> +	  compile fftw in quadruple precision if available
> +
> +endchoice
> +
> +endif
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index 3b302df..68ddc35 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -10,4 +10,14 @@ FFTW_INSTALL_STAGING = YES
>  FFTW_LICENSE = GPLv2+
>  FFTW_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
> +FFTW_CONFIGURE_OPTS += --enable-single
> +endif
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
> +FFTW_CONFIGURE_OPTS += --enable-long-double
> +endif
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_QUAD),y)
> +FFTW_CONFIGURE_OPTS += --enable-quad-precision
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.0.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
