From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:53:48 +0100
Subject: [Buildroot] [PATCH v5] gqrx: new package
In-Reply-To: <20170210140112.26552-1-gwenj@trabucayre.com>
References: <20170210140112.26552-1-gwenj@trabucayre.com>
Message-ID: <20170212155348.0f14e2a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 15:01:12 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Gqrx is an open source software defined radio (SDR) receiver implemented
> using GNU Radio and the Qt GUI toolkit. Currently it works on Linux
> and Mac with hardware supported by gr-osmosdr, including Funcube Dongle,
> RTL-SDR, Airspy, HackRF, BladeRF, RFSpace, USRP and SoapySDR.
> 
> Gqrx can operate as an AM/FM/SSB receiver with audio output or as an
> FFT-only instrument. There are also various hooks for interacting
> with external application using network sockets.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>

I've applied to the next branch, after fixing a few issues, see below.

>  package/Config.in                                |  1 +
>  package/gqrx/0001-fix_compilation_in_gcc-6.patch | 34 +++++++++++++++++++
>  package/gqrx/Config.in                           | 43 ++++++++++++++++++++++++
>  package/gqrx/gqrx.hash                           |  2 ++
>  package/gqrx/gqrx.mk                             | 15 +++++++++

You forgot to add an entry to the DEVELOPERS file, so I've added that.
This way you'll receive notifications when there are build failures! :-)

> diff --git a/package/gqrx/0001-fix_compilation_in_gcc-6.patch b/package/gqrx/0001-fix_compilation_in_gcc-6.patch
> new file mode 100644
> index 0000000..e1824c3
> --- /dev/null
> +++ b/package/gqrx/0001-fix_compilation_in_gcc-6.patch
> @@ -0,0 +1,34 @@
> +From e6baaee4968345a53e977f593362267a91041cff Mon Sep 17 00:00:00 2001
> +From: Valentin Ochs <a@0au.de>
> +Date: Fri, 21 Oct 2016 20:12:50 +0200
> +Subject: [PATCH 05/34] Cosmetic & readability changes

This 05/34 doesn't make sense in the context of Buildroot, so I've
dropped that.

> diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
> new file mode 100644
> index 0000000..c6bef76
> --- /dev/null
> +++ b/package/gqrx/Config.in
> @@ -0,0 +1,43 @@
> +comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_USE_WCHAR || BR2_STATIC_LIBS
> +
> +comment "gqrx needs qt5, gnuradio, fftw's single precision, alsa-lib or portaudio"
> +	depends on !BR2_PACKAGE_GNURADIO || !BR2_PACKAGE_FFTW_PRECISION_SINGLE || \
> +		!(BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO) || !BR2_PACKAGE_QT5
> +
> +config BR2_PACKAGE_GQRX
> +	bool "gqrx"
> +	depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO # gr-audio

Not the default of this package, but this is really annoying. What do
you think of changing the BR2_PACKAGE_GNURADIO_AUDIO option to do this:

	select BR2_PACKAGE_ALSA_LIB if !BR2_PACKAGE_PORTAUDIO

This way, we're sure at least one of the two is selected, and we can
then directly "select BR2_PACKAGE_GNURADIO_AUDIO" within having to
worry about this anymore.

> +	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio

This one is also annoying. Did you see the work that was posted on the
mailing list a while ago to allow building all variants of fftw? This
would allow to select the fftw package like any other. It would be
really really better. If you have some time to pick up this work and
finalize it, it would be nice.

> +	depends on BR2_PACKAGE_GNURADIO
> +	depends on BR2_PACKAGE_QT5
> +	depends on BR2_INSTALL_LIBSTDCPP # boost, qt5
> +	depends on !BR2_STATIC_LIBS # qt5
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, qt5
> +	depends on BR2_USE_WCHAR # boost, qt5

Since you're using "depends on BR2_PACKAGE_QT5", there is no need to
replicate the Qt5 dependencies here. So I've dropped the ", qt5"
comments and the BR2_STATIC_LIBS dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
