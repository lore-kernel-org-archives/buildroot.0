From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 14:57:59 +0200
Subject: [Buildroot] [PATCH v8 4/7] package/opencv: add qt5 support
In-Reply-To: <1436089229-21103-5-git-send-email-s.martin49@gmail.com>
References: <1436089229-21103-1-git-send-email-s.martin49@gmail.com>
 <1436089229-21103-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20150705145759.50e1409f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  5 Jul 2015 11:40:26 +0200, Samuel Martin wrote:
> Starting with the 2.4.6 release, OpenCV supports both Qt4 and Qt5 as GUI
> toolkit, but only one can be enabled at the same time.
> 
> Since Buildroot does not support Qt4/Qt5 co-existence, we make the Qt4
> knob depend on BR2_PACKAGE_QT5.
> 
> Note that we usually use 'select ...' to express the dependencies
> between packages, but in this case, we cannot since the Qt4/Qt5
> co-existence exclusion is not handled by a simple choice, but by some
> extra dependencies in the choice entries. This makes impossible using
> 'select ...' for the Qt support knob without triggering a circular
> dependency at the kconfig level.

Sorry, but parse error here. Since there's a choice between Qt4 and Qt5
in OpenCV, what is the problem?

> Besides, we already use 'depends on ...' to express the dependencies
> with some "big" packages (like xorg or libgtk2). qt or qt5* packages
> are fairly big. So, I don't think it will hurt that much to use a
> 'depends on ...' statement in this case.

Fair enough with using 'depends on', however if you do it for Qt4 and
Qt5, please also do it for libgtk2: instead of doing a select
BR2_PACKAGE_LIBGTK2, do a 'depends on'.


> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index d317603..15f68a2 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -60,6 +60,7 @@ choice
>  
>  	  The best toolkit to work with OpenCV are, in decreasing order of
>  	  preference by the OpenCV build system):
> +	  - Qt5
>  	  - Qt4
>  	  - gtk2
>  
> @@ -90,18 +91,36 @@ comment "gtk2 needs X.org and a toolchain w/ wchar, threads, C++"
>  
>  config BR2_PACKAGE_OPENCV_WITH_QT
>  	bool "qt4"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_USE_MMU # qt
> -	select BR2_PACKAGE_QT
> +	depends on BR2_PACKAGE_QT
>  	select BR2_PACKAGE_QT_STL
>  	select BR2_PACKAGE_QT_GUI_MODULE
>  	select BR2_PACKAGE_QT_TEST
>  	help
> -	  Use Qt with QtTest module and STL support
> +	  Use Qt4 with QtTest and QtGui modules and STL support, as GUI toolkit.
> +
> +# no need for a comment about qt availability WRT the toolchain dependencies
> +# because they are included in the opencv's ones, so already met.

Why do we have this comment here? We have a "depends on" Qt and not a
"select", so we anyway don't need to replicate the toolchain
dependencies.

>  
> -comment "qt4 needs a toolchain w/ C++"
> +comment "qt4 support needs qt"
>  	depends on BR2_USE_MMU # qt
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5

Why !qt && !qt5 ?

Just do depends on !qt. Remember, you are inside a choice, so anyway the
user can only select *either* qt4 *or* qt5.

> +config BR2_PACKAGE_OPENCV_WITH_QT5
> +	bool "qt5"
> +	depends on BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5BASE_CONCURRENT
> +	select BR2_PACKAGE_QT5BASE_GUI
> +	select BR2_PACKAGE_QT5BASE_WIDGETS
> +	help
> +	  Use Qt5 with base, concurrent, test, gui and widgets components, as GUI
> +	  toolkit.
> +
> +# no need for a comment about qt5 availability WRT the toolchain dependencies
> +# because they are included in the opencv's ones, so already met.
> +
> +comment "qt5 support needs qt5"
> +	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5

Same comment as above.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
