From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 23:31:54 +0200
Subject: [Buildroot] [PATCH v6 12/16] package/opencv: add a choice for
 selecting the gui toolkit
In-Reply-To: <1435262397-888-13-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-13-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626213154.GF12470@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> This patch moves the existing Qt4 and gtk2 options in that choice
> because, in OpenCV, only one toolkik will be actually used at the time,
> given priority to Qt4.

Incomplete commit log (minor!):

    Also add comments when the toolkit are not available because
    of missing dependencies.

> Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v5->v6:
> - new patch
> ---
>  package/opencv/Config.in | 53 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 39 insertions(+), 14 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index f89e62d..040ee55 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -206,17 +206,54 @@ config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
>  
>  endchoice
>  
> +choice
> +	prompt "gui toolkit"
> +	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI

If that depends on highgui, then maybe it would be better to put the
choice right below the option for highgui, no?

> +	help
> +	  GUI toolkit for opencv_highgui module.
> +
> +	  OpenCV GUI toolkit preference (from the most to the least):
> +	  - Qt4
> +	  - gtk-2

Do we really need this "preference" comment in the help text?
If thue user selects gtk2 as a toolkit for OpenCV, but also has Qt4
enabled, surely we'd build an OpenCV with gtk2 support and no Qt4
support, right?

So, there's no reason to have this comment, I think. Or it should maybe
rewritten, sometyhing like:

    The best toolkit to work with OpenCV are, in decreasing order of
    preference by the OpenCV build system):
        - Qt4
        - gtk2

    Note that, whatever you choose here will be used by OpenCV, even
    if you also enabled a more preferred toolkit in your Buildroot
    configuration.

(Not that this is perfect either, but still...)

Otherwise:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(I think I again forgot something, but can't figure out what it was...)

Regards,
Yann E. MORIN.

> +config BR2_PACKAGE_OPENCV_GUI_NONE
> +	bool "none"
> +
>  config BR2_PACKAGE_OPENCV_WITH_GTK
> -	bool "gtk support"
> +	bool "gtk2"
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_MMU # libgtk2 -> glib2
>  	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
> -	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	select BR2_PACKAGE_LIBGTK2
>  
> +comment "gtk2 depends on X.org and needs a toolchain w/ wchar, threads, C++"
> +	depends on BR2_USE_MMU # libgtk2 -> glib2
> +	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
> +	depends on !BR2_PACKAGE_XORG7 || \
> +		!BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_INSTALL_LIBSTDCPP
> +
> +config BR2_PACKAGE_OPENCV_WITH_QT
> +	bool "qt4"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_MMU # qt
> +	select BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT_STL
> +	select BR2_PACKAGE_QT_GUI_MODULE
> +	select BR2_PACKAGE_QT_TEST
> +	help
> +	  Use Qt with QtTest module and STL support
> +
> +comment "qt4 needs a toolchain w/ C++"
> +	depends on BR2_USE_MMU # qt
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
> +endchoice
> +
>  config BR2_PACKAGE_OPENCV_WITH_JASPER
>  	bool "jpeg2000 support"
>  	select BR2_PACKAGE_JASPER
> @@ -239,18 +276,6 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
>  	help
>  	  Use shared libpng from the target system.
>  
> -config BR2_PACKAGE_OPENCV_WITH_QT
> -	bool "qt backend support"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_USE_MMU # qt
> -	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> -	select BR2_PACKAGE_QT
> -	select BR2_PACKAGE_QT_STL
> -	select BR2_PACKAGE_QT_GUI_MODULE
> -	select BR2_PACKAGE_QT_TEST
> -	help
> -	  Use Qt with QtTest module and STL support
> -
>  config BR2_PACKAGE_OPENCV_WITH_TIFF
>  	bool "tiff support"
>  	select BR2_PACKAGE_TIFF
> -- 
> 2.4.4
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
