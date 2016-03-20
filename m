From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:13:24 +0100
Subject: [Buildroot] [PATCH 1/2] package/qwt : prepared package for
 other versions of Qt.
In-Reply-To: <1458149825-23401-1-git-send-email-davepiq@yahoo.fr>
References: <1458149825-23401-1-git-send-email-davepiq@yahoo.fr>
Message-ID: <20160320231324.25e83a99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Mar 2016 18:37:04 +0100, David Picard wrote:
> Reformatted the package configuration to make it more generic. It will thus be
> easier to handle more than one version of Qt. Indeed, multiple versions of Qt
> are compatible with the current Qwt.

Thanks for this new version! Unfortunately, there are still some issues.

> diff --git a/package/qwt/Config.in b/package/qwt/Config.in
> index 8c7bc56..e72db31 100644
> --- a/package/qwt/Config.in
> +++ b/package/qwt/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_QWT
>  	bool "qwt"
>  	depends on BR2_PACKAGE_QT
> -	depends on BR2_PACKAGE_QT_GUI_MODULE
> +	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT

This is OK.

>  	help
>  	  Qwt is a graphics extension to the Qt GUI application
>  	  framework. It provides a 2D plotting widget and more.
> @@ -12,16 +12,15 @@ if BR2_PACKAGE_QWT
>  
>  config BR2_PACKAGE_QWT_SVG
>  	bool "SVG support"
> -	select BR2_PACKAGE_QT_SVG
> +	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT

OK.

>  
>  config BR2_PACKAGE_QWT_MATHML
>  	bool "MathML support"
>  
>  config BR2_PACKAGE_QWT_OPENGL
>  	bool "OpenGL support"
> -	depends on BR2_PACKAGE_HAS_LIBGLES
> -	depends on BR2_PACKAGE_HAS_LIBEGL
> -	select BR2_PACKAGE_QT_OPENGL_ES
> +	select BR2_PACKAGE_QT_OPENGL_ES if \
> +	    BR2_PACKAGE_QT && BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL

This is not good. Because what you have written means:

	enable the Qt OpenGL support if Qt is enabled, and OpenGLES/EGL
	is available

This means that it is now possible to enable BR2_PACKAGE_QWT_OPENGL
without OpenGL support!

What you want to do here is:

	depends on BR2_PACKAGE_HAS_LIBGLES
	depends on BR2_PACKAGE_HAS_LIBGL
	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT

> +ifeq ($(BR2_PACKAGE_QT),y)
> +QWT_DEPENDENCIES = qt libgles libegl
> +endif

This is not good: you are adding unconditionally libgles and libegl as
dependencies of qwt. This should probably be:

ifeq ($(BR2_PACKAGE_QT),y)
QWT_DEPENDENCIES += qt
QWT_QMAKE = $(QT_QMAKE)
endif

ifeq ($(BR2_PACKAGE_QWT_OPENGL),y)
QWT_DEPENDENCIES += libgles libegl
endif

>  
>  QWT_LICENSE = LGPLv2.1 with exceptions
>  QWT_LICENSE_FILES = COPYING
> @@ -35,9 +37,13 @@ else
>  QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT),y)
> +    QWT_QMAKE = $(QT_QMAKE)

I've refactored this with the condition above. Also note that we do not
intend the assignment of variables.

Care to rework this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
