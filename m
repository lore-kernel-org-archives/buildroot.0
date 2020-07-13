From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 22:29:00 +0200
Subject: [Buildroot] [PATCH] package/python-matplotlib: add QT5 support
In-Reply-To: <20200713115855.2921059-1-gwenj@trabucayre.com>
References: <20200713115855.2921059-1-gwenj@trabucayre.com>
Message-ID: <20200713222900.48078b6f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Jul 2020 13:58:55 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

>  comment "python-matplotlib needs glibc or musl"
>  	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +
> +if BR2_PACKAGE_PYTHON_MATPLOTLIB
> +
> +config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
> +	bool "qt display"
> +	depends on BR2_PACKAGE_QT5 # python-pyqt5
> +	select BR2_PACKAGE_PYTHON_PYQT5
> +	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
> +	select BR2_PACKAGE_QT5BASE_GUI # runtime
> +	select BR2_PACKAGE_QT5BASE_WIDGETS # runtime
> +
> +endif

You need to put this before the "comment" above, otherwise your option
is not going to be indented properly.

Also, PYTHON_PYQT5 already implies QT5BASE, QT5BASE_GUI. I'm not sure
of the meaning of the "runtime" comments here, since they are on
sub-options of QT5BASE, which is not labeled as a runtime dependency.

> diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
> index 7082637d09..19c68e7e27 100644
> --- a/package/python-matplotlib/python-matplotlib.mk
> +++ b/package/python-matplotlib/python-matplotlib.mk
> @@ -13,4 +13,8 @@ PYTHON_MATPLOTLIB_DEPENDENCIES = host-pkgconf freetype host-python-numpy \
>  	libpng python-cycler
>  PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
>  
> +ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
> +PYTHON_MATPLOTLIB_DEPENDENCIES += qt5base python-pyqt5

Why are these build-time dependencies ? Isn't python-pyqt5 sufficient ?
Is there an explicit way to enable/disable qt5 support ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
