From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 16:57:52 +0200
Subject: [Buildroot] [PATCH v2] package/python-matplotlib: add QT5
 support
In-Reply-To: <20200727130022.180977-1-gwenj@trabucayre.com>
References: <20200727130022.180977-1-gwenj@trabucayre.com>
Message-ID: <20200727145752.GC19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2020-07-27 15:00 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> python-matplotlib may be used in qt5 application. This patch add option to
> enable qt5. Since this backend is automatically enabled when pyqt5 is detected,
> list dependencies is simply an updated (no enable/disable options).
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2
> - move options before comment (Thomas)
> - remove select BR2_PACKAGE_QT5BASE_GUI (already done by python-pyqt5) (Thomas)

I find it very annoying that we rely on another package to guarantee the
dependencies. Maybe it is redundant now, but what if pytqt5 drops the
GUI dependency in a future version?

Anyway, applied to master, thanks.

Regards,
Yann E. MORIN.

> - suppress qt5base to PYTHON_MATPLOTLIB_DEPENDENCIES (Thomas)
> ---
>  package/python-matplotlib/Config.in            | 12 ++++++++++++
>  package/python-matplotlib/python-matplotlib.mk |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
> index e6ed8cda2f..cfa0bc30c3 100644
> --- a/package/python-matplotlib/Config.in
> +++ b/package/python-matplotlib/Config.in
> @@ -23,6 +23,18 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
>  
>  	  https://matplotlib.org/
>  
> +if BR2_PACKAGE_PYTHON_MATPLOTLIB
> +
> +config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
> +	bool "qt display"
> +	depends on BR2_PACKAGE_QT5 # python-pyqt5
> +	select BR2_PACKAGE_PYTHON_PYQT5
> +	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5BASE_FONTCONFIG
> +	select BR2_PACKAGE_QT5BASE_WIDGETS
> +
> +endif
> +
>  comment "python-matplotlib needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
>  
> diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
> index 7082637d09..8d00ac8a07 100644
> --- a/package/python-matplotlib/python-matplotlib.mk
> +++ b/package/python-matplotlib/python-matplotlib.mk
> @@ -13,4 +13,8 @@ PYTHON_MATPLOTLIB_DEPENDENCIES = host-pkgconf freetype host-python-numpy \
>  	libpng python-cycler
>  PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
>  
> +ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
> +PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
> +endif
> +
>  $(eval $(python-package))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
