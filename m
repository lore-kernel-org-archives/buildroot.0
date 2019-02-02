From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Feb 2019 17:40:45 +0100
Subject: [Buildroot] [PATCH v4 09/17] package/gqrx: remove unneeded fftw
 dependency
In-Reply-To: <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-2-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-3-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-5-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-6-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
Message-ID: <20190202164045.GB6663@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2019-01-21 14:51 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Thanks to the new fftw package organization, gnuradio already selects
> the appropriate fftw precision, and there is no need to propagate the
> "depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE" that used to be present
> in the gnuradio package.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes v3 -> v4:
>  * use select instead of depends on for GNURadio and propagates
>    dependencies.(yann)
[--SNIP--]
>  config BR2_PACKAGE_GQRX
>  	bool "gqrx"
> -	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio
> -	depends on BR2_PACKAGE_GNURADIO
>  	depends on BR2_PACKAGE_QT5
> +	depends on !BR2_PACKAGE_PYTHON3
>  	depends on BR2_INSTALL_LIBSTDCPP # boost
> +	depends on !BR2_STATIC_LIBS # gnuradio
> +	depends on BR2_USE_MMU # gnuradio

We're now trying to list dependencies in a consistent order, with
architecture dependencies first, then toolchain depes, then package
deps. So, dependencies on MMU should go before first, then !static libs,
then libstdcpp, then packages:

    https://buildroot.org/downloads/manual/manual.html#_config_files

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
>  	depends on BR2_USE_WCHAR # boost
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>  	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_GNURADIO
>  	select BR2_PACKAGE_GNURADIO_ANALOG
>  	select BR2_PACKAGE_GNURADIO_AUDIO
>  	select BR2_PACKAGE_GNURADIO_BLOCKS
> -- 
> 2.19.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
