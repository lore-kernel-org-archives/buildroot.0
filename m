From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2015 11:11:56 +0200
Subject: [Buildroot] [PATCH v7 4/7] package/opencv: add qt5 support
In-Reply-To: <1436036821-10073-5-git-send-email-s.martin49@gmail.com>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
 <1436036821-10073-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20150705091156.GD3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-07-04 21:06 +0200, Samuel Martin spake thusly:
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
> 
> Besides, we already use 'depends on ...' to express the dependencies
> with some "big" packages (like xorg or libgtk2). qt or qt5* packages
> are fairly big. So, I don't think it will hurt that much to use a
> 'depends on ...' statement in this case.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v6->v7:
> - fix depends on statements and comments (Yann)
> 
> changes v5->v6:
> - bury BR2_avr32 remains (Yann)
> - move knob in a choice (Yann)
> - reword commit log
> 
> changes v4->v5:
> - rebase
> 
> changes v3->v4:
> - rebase
> - rename _OPT -> _OPTS options
> - rework qt backend selection (Yann)
> 
> changes v2->v3:
> - rebase
> - remove duplicate qt/qt5 dependencies (Yann)
> - add missing 'depends on' to the comment about qt4
> 
> changes v1->v2:
> - rebase
> - update threads support dependency for qt5
> ---
>  package/opencv/Config.in | 31 +++++++++++++++++++++++++------
>  package/opencv/opencv.mk | 11 +++++++++--
>  2 files changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 9479b35..7bd11cf 100644
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
>  
> -comment "qt4 needs a toolchain w/ C++"
> +comment "qt4 support needs qt"
>  	depends on BR2_USE_MMU # qt
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
> +
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
>  
>  endchoice
>  
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 6b1a139..79cf110 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -266,11 +266,18 @@ else
>  OPENCV_CONF_OPTS += -DWITH_PNG=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT)$(BR2_PACKAGE_OPENCV_WITH_QT5),)
> +OPENCV_CONF_OPTS += -DWITH_QT=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
>  OPENCV_CONF_OPTS += -DWITH_QT=4
>  OPENCV_DEPENDENCIES += qt
> -else
> -OPENCV_CONF_OPTS += -DWITH_QT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT5),y)
> +OPENCV_CONF_OPTS += -DWITH_QT=5
> +OPENCV_DEPENDENCIES += qt5base
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
> -- 
> 2.4.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
