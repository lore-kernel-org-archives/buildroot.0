From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 15:00:54 +0200
Subject: [Buildroot] [PATCH v5 11/13] package/opencv: add gtk3 support
In-Reply-To: <1433672799-21387-12-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-12-git-send-email-s.martin49@gmail.com>
Message-ID: <20150607130054.GL3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-07 12:26 +0200, Samuel Martin spake thusly:
> Fully rework the GTK support in OpenCV because it now supports gtk-2 and
> gtk-3 (but only one at the time).
> Note that, in the build-system, the gtk support is only available when
> Qt support is disabled; so make sure the menuconfig reflects this.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[--SNIP--]
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index f4072ef..ff834b9 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -200,17 +200,41 @@ comment "gstreamer backend needs either Gstreamer-0.10 or Gstreamer-1"
>  	depends on !BR2_PACKAGE_GSTREAMER && !BR2_PACKAGE_GSTREAMER1
>  	depends on BR2_USE_MMU # gstreamer -> libglib2
>  
> +
> +choice
> +	prompt "gtk support"
> +	# common dependencies to libgtk2 and libgtk3
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_MMU
> +	depends on BR2_ARCH_HAS_ATOMICS
> +	# GTK check is disabled when Qt support is on in the OpenCV's cmake code
> +	depends on !BR2_PACKAGE_OPENCV_WITH_QT

No need for a default here, because 'none' is the first entry, so it is
expressly the default.

Otherwise looks good:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see a comment below...

> +	default BR2_PACKAGE_OPENCV_WITHOUT_GTK
> +	help
> +	  GTK support is disabled if Qt support is enabled.
> +
> +config BR2_PACKAGE_OPENCV_WITHOUT_GTK
> +	bool "none"
> +
>  config BR2_PACKAGE_OPENCV_WITH_GTK
> -	bool "gtk support"
> +	bool "libgtk2"
>  	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_USE_MMU # libgtk2 -> glib2
> -	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
> -	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	select BR2_PACKAGE_LIBGTK2
>  
> +config BR2_PACKAGE_OPENCV_WITH_GTK3
> +	bool "libgtk3"
> +	select BR2_PACKAGE_LIBGTK3
> +
> +endchoice
> +
> +comment "gtk support needs wchar, threads, C++"
> +	depends on !(BR2_USE_WCHAR || BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_INSTALL_LIBSTDCPP)
> +	depends on BR2_USE_MMU
> +	depends on BR2_ARCH_HAS_ATOMICS

I like that you've made it a choice. But it is inconsistent with how we
present the Qt/Qt5 options.

What about making it a single choice (with proper dependencies, of
course), like so:


    choice
        prompt "GUI toolkit"

    config BR2_PKG_OPENCV_GUI_NONE
        bool "none"

    config BR2_PKG_OPENCV_GUI_QT
        bool "Qt4"
        depends on BR2_PKG_QT
        ...
        select ...

    comment "Qt needs ..."

    config BR2_PKG_OPENCV_GUI_QT5
        bool "Qt5"
        depends on BR2_PKG_QT5
        ...
        select ...

    comment "Qt5 needs ..."

    config BR2_PKG_OPENCV_GUI_GTK
        bool "gtk2"
        depends on ...
        select BR2_PKG_GTK
        select ...

    comment "gtk2 needs ..."

    config BR2_PKG_OPENCV_GUI_GTK3
        bool "gtk3"
        depends on ...
        select BR2_PKG_GTK3
        select ...

    comment "gtk3 needs ..."

    endchoice

What's your opinion on that?

If you agree, then the series should look like:

    package/opencv: add a choice for selecting the GUI toolkit
        => moves the existing Qt4 and gtk2 options in that choice
    package/opencv: add qt5 support
        => adds Qt5 option to the GUI choice
    package/opencv: add gtk3 to the GUI toolkit choice
        => adds gtk3 option to thw GUI choice

Of course, that's not a show-stopper, as my Reviewed-by tag implies.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
