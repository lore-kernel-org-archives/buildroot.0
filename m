From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Mar 2014 00:22:16 +0100
Subject: [Buildroot] [PATCH 04/11] opencv: add Qt5 support
In-Reply-To: <1392588004-13317-5-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20140305232216.GE9644@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-02-16 22:59 +0100, Samuel Martin spake thusly:
> Starting with the 2.4.6 release, OpenCV supports both Qt4 and Qt5,
> but only one can be enable at the same time.
[--SNIP--]
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 73f03e1..b6192dc 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -177,15 +177,38 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
>  	  Use shared libpng from the target system.
>  
>  config BR2_PACKAGE_OPENCV_WITH_QT
> -	bool "qt4 backend support"
> -	depends on !BR2_avr32 # qt
> -	select BR2_PACKAGE_QT
> -	select BR2_PACKAGE_QT_STL
> -	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> -	select BR2_PACKAGE_QT_TEST       if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> -	default y
> -	help
> -	  Use Qt with QtTest module and STL support
> +	bool "qt support"
> +	depends on (BR2_PACKAGE_QT && !BR2_avr32) || \
> +		(BR2_PACKAGE_QT5 && BR2_USE_MMU && BR2_INET_IPV6 && \
> +		BR2_TOOLCHAIN_HAS_THREADS)

Why do you repeat Qt4's and Qt5's dependencies? Since it 'depends on'
Qt4 or Qt5, you will also inherit forn their dependencies, so there is
no reason to bring them here...

But if those deps are needed for sub-modules (below), then add them as
separate line, like (eg.):
    depends on BR2_TOOLCHAIN_HAS_THREADS # qt-stl
    select BR2_PACKAGE_QT_TEST if BR2_PACKAGE_QT && HIGHGUI
    depends on BR2_INET_IPV6 # qt5-base
    select BR2_PACKAGE_QT5BASE if BR2_PACKAGE_QT5

> +	select BR2_PACKAGE_QT_STL             if BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT_GUI_MODULE      if BR2_PACKAGE_QT && \
> +	                                          BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> +	select BR2_PACKAGE_QT_TEST            if BR2_PACKAGE_QT && \
> +	                                          BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> +	select BR2_PACKAGE_QT5BASE            if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_TEST       if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_GUI        if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_WIDGETS    if BR2_PACKAGE_QT5
> +	help
> +	  Enable Qt support for OpenCV.
> +
> +	  If Qt4 is already enabled, then use Qt4 with QtTest module and STL
> +	  support.

    For Qt4, this uses module QtSTL. Highgui supports also uses QtTest
    and QtGui.

> +	  If Qt5 is already enabled, then use Qt5 with the following components:
> +	  base, concurrent, test, gui and widgets.

    For Qt5, this uses modules Qt5Base, Qt5Concurrent, Qt5Test, Qt5Gui
    and Qt5Widgets.

> +if !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
> +comment "qt support with Qt4 needs qt"

Here, you need to duplicate Qt4's deps. Also, you don;t want to show the
comment for Qt4 if Qt5 is enabled:

    comment "qt4 support needs a toolchain w/ C++, threads"
        depends on !avr32 && MMU
        depends on !LIBSTCPP || !THREADS
        depends on !QT5

    comment "qt5 support needs a toolchain w/ wchar, IPv6, threads"
        depends on !avr32 && _MMU
        depends on !WCHAR || !IPV6 || !THREADS
        depends on !QT4

[--SNIP--]
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index ff11f1c..51255aa 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -202,8 +202,8 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
> -OPENCV_CONF_OPT += -DWITH_QT=4
> -OPENCV_DEPENDENCIES += qt
> +OPENCV_CONF_OPT += -DWITH_QT=$(if $(BR2_PACKAGE_QT),4,5)
> +OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_QT),qt,qt5base)

qt and qt5base are enough to build? Don;t you also need the Qt4/5
modules to be built first?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
