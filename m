From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Sep 2014 00:40:45 +0200
Subject: [Buildroot] [PATCH v3 2/8] opencv: add Qt5 support
In-Reply-To: <1409515750-10289-3-git-send-email-s.martin49@gmail.com>
References: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
 <1409515750-10289-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140914224045.GH21222@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-08-31 22:09 +0200, Samuel Martin spake thusly:
> Starting with the 2.4.6 release, OpenCV supports both Qt4 and Qt5,
> but only one can be enable at the same time.
[--SNIP--]
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 24f540e..571309f 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -185,17 +185,37 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
>  	  Use shared libpng from the target system.
>  
>  config BR2_PACKAGE_OPENCV_WITH_QT
> -	bool "qt backend support"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_avr32 # qt
> -	depends on BR2_USE_MMU # qt
> -	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> -	select BR2_PACKAGE_QT
> -	select BR2_PACKAGE_QT_STL
> -	select BR2_PACKAGE_QT_GUI_MODULE
> -	select BR2_PACKAGE_QT_TEST
> -	help
> -	  Use Qt with QtTest module and STL support
> +	bool "qt support"
> +	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT_STL             if BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT_GUI_MODULE      if BR2_PACKAGE_QT && \
> +						BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> +	select BR2_PACKAGE_QT_TEST            if BR2_PACKAGE_QT && \
> +						BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> +	select BR2_PACKAGE_QT5BASE            if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_TEST       if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_GUI        if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_WIDGETS    if BR2_PACKAGE_QT5

I think all those select are ugly. Did you give a thought at my proposal
in my previous review:
    http://lists.busybox.net/pipermail/buildroot/2014-May/095737.html

where I suggested something like:

---8<---

    config BR2_PACKAGE_OPENCV_WITH_QT
        bool "Qt backend"
        depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
        select BR2_PACKAGE_OPENCV_QT4_BACKEND if BR2_PACKAGE_QT
        select BR2_PACKAGE_OPENCV_QT5_BACKEND if BR2_PACKAGE_QT5
        help
          Enable Qt support for OpenCV.

          This uses whatever Qt version you enabled: Qt4 or Qt5.

    config BR2_PACKAGE_OPENCV_QT4_BACKEND
        bool
        select BR2_PACKAGE_QT_STL
        select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
        select BR2_PACKAGE_QT_TEST       if BR2_PACKAGE_OPENCV_LIB_HIGHGUI

    config BR2_PACKAGE_OPENCV_QT5_BACKEND
        bool
        select BR2_PACKAGE_QT5BASE
        select BR2_PACKAGE_QT5BASE_CONCURRENT
        select BR2_PACKAGE_QT5BASE_TEST
        select BR2_PACKAGE_QT5BASE_GUI
        select BR2_PACKAGE_QT5BASE_WIDGETS

    comment "Qt backend needs either Qt4 or Qt5"
        depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5

Then, as soon as one or the other is selected, the comment disapears,
and the option becomes visible.

---8<---

> +	help
> +	  Enable Qt support for OpenCV.
> +
> +	  If Qt4 is already enabled, then use Qt4 with QtTest and QtGui modules
> +	  and STL support.
> +
> +	  If Qt5 is already enabled, then use Qt5 with the following components:
> +	  base, concurrent, test, gui and widgets.
> +
> +if !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
> +comment "qt support with Qt4 needs qt"
> +	depends on !BR2_avr32
> +
> +comment "qt support with Qt5 needs qt5"
> +	depends on BR2_USE_MMU && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "qt support with Qt5 needs a toolchain w/ wchar, IPv6, theads"
> +	depends on !BR2_USE_MMU || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +endif

Something lokks fichy with those comments. What about not trying to be
smart, and just say that Qt support requires eithe Qt or Qt5 to be
enabled:

    comment "Qt support needs either Qt or Qt5 to be enabled"
        depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5

and let the user do his work by enabling either.

Of course, it requires extra depends to be applied, so as to hide the
comment when neither Qt nor Qt5 are available (MMU, arch...)

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_OPENCV_WITH_TIFF
>  	bool "tiff support"
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 2b649ff..00a9e22 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -206,8 +206,8 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
> -OPENCV_CONF_OPT += -DWITH_QT=4
> -OPENCV_DEPENDENCIES += qt
> +OPENCV_CONF_OPT += -DWITH_QT=$(if $(BR2_PACKAGE_QT),4,5)
> +OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_QT),qt,qt5base)
>  else
>  OPENCV_CONF_OPT += -DWITH_QT=OFF
>  endif
> -- 
> 2.1.0
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
