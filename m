From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:17:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/qwt : added support for Qt5.
In-Reply-To: <1458149825-23401-2-git-send-email-davepiq@yahoo.fr>
References: <1458149825-23401-1-git-send-email-davepiq@yahoo.fr>
 <1458149825-23401-2-git-send-email-davepiq@yahoo.fr>
Message-ID: <20160320231719.0d7b2af2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Mar 2016 18:37:05 +0100, David Picard wrote:

> diff --git a/package/qwt/Config.in b/package/qwt/Config.in
> index e72db31..9dca8ed 100644
> --- a/package/qwt/Config.in
> +++ b/package/qwt/Config.in
> @@ -1,7 +1,9 @@
>  config BR2_PACKAGE_QWT
>  	bool "qwt"
> -	depends on BR2_PACKAGE_QT
> +	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
>  	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5

OK.

>  	help
>  	  Qwt is a graphics extension to the Qt GUI application
>  	  framework. It provides a 2D plotting widget and more.
> @@ -13,6 +15,7 @@ if BR2_PACKAGE_QWT
>  config BR2_PACKAGE_QWT_SVG
>  	bool "SVG support"
>  	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5

OK.

>  
>  config BR2_PACKAGE_QWT_MATHML
>  	bool "MathML support"
> @@ -20,10 +23,11 @@ config BR2_PACKAGE_QWT_MATHML
>  config BR2_PACKAGE_QWT_OPENGL
>  	bool "OpenGL support"
>  	select BR2_PACKAGE_QT_OPENGL_ES if \
> -	    BR2_PACKAGE_QT && BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL
> +		BR2_PACKAGE_QT && BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if \
> +		BR2_PACKAGE_QT5BASE && BR2_PACKAGE_QT5_GL_AVAILABLE

As said for the previous commit, this is also not good. At the end, you
should have:

	depends on (BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL) || \
		BR2_PACKAGE_QT5_GL_AVAILABLE
	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5

> -comment "qwt depends on QT gui module"
> -	depends on BR2_PACKAGE_QT
> -	depends on !BR2_PACKAGE_QT_GUI_MODULE

This comment should have been removed as part of the previous commit,
since in the previous commit, you changed the "depends on
BR2_PACKAGE_QT_GUI_MODULE" into a "select".

> +comment "qwt needs Qt or Qt5"
> +	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5

To be honest, I am not sure such a comment is needed. I believe it is
completely obvious for the user that a library like Qwt needs Qt.

> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index afd0ffb..8fbde32 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -11,6 +11,9 @@ QWT_INSTALL_STAGING = YES
>  ifeq ($(BR2_PACKAGE_QT),y)
>  QWT_DEPENDENCIES = qt libgles libegl
>  endif
> +ifeq ($(BR2_PACKAGE_QT5BASE),y)
> +QWT_DEPENDENCIES += qt5base libgles
> +endif

In fact, now that I think of it, my suggestion in the previous patch to
add a dependency on libgles and libegl is wrong. This is not needed,
since qt/qt5 will already depend on them.

So, you should just have:

ifeq ($(BR2_PACKAGE_QT),y)
QWT_DEPENDENCIES += qt
QWT_QMAKE = $(QT_MAKE)
else ifeq ($(BR2_PACKAGE_QT5),y)
QWT_DEPENDENCIES += qt5
QWT_QMAKE = $(QT5_QMAKE)
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
