From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 22:46:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/qwt : fixed dependencies to qt5
In-Reply-To: <1453799061-7131-2-git-send-email-davepiq@yahoo.fr>
References: <1453799061-7131-1-git-send-email-davepiq@yahoo.fr>
 <1453799061-7131-2-git-send-email-davepiq@yahoo.fr>
Message-ID: <20160306224623.16677f45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Picard,

On Tue, 26 Jan 2016 10:04:21 +0100, David Picard wrote:

> diff --git a/package/qwt/Config.in b/package/qwt/Config.in
> index 40b382b..31a79fe 100644
> --- a/package/qwt/Config.in
> +++ b/package/qwt/Config.in
> @@ -1,8 +1,9 @@
>  config BR2_PACKAGE_QWT
>  	bool "qwt"
> -	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5BASE
> -	depends on BR2_PACKAGE_QT_GUI_MODULE || BR2_PACKAGE_QT5BASE_GUI
> -	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5BASE
> +	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5

As suggested in my review of patch 1, switching from depends on to
select should be done in a preparation patch, before adding qt5 support.

>  config BR2_PACKAGE_QWT_SVG
>  	bool "SVG support"
> -	depends on BR2_PACKAGE_QT_SVG || BR2_PACKAGE_QT5SVG
> +	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5

See my review of patch 1.

>  
>  
>  config BR2_PACKAGE_QWT_MATHML
> @@ -23,14 +25,8 @@ config BR2_PACKAGE_QWT_OPENGL
>  	bool "OpenGL support"
>  	depends on BR2_PACKAGE_HAS_LIBGLES
>  	depends on BR2_PACKAGE_HAS_LIBEGL
> -	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
> -	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE

Why ? You don't need OpenGL support in Qt ?

> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index cdb3008..6c99c50 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -9,10 +9,10 @@ QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
>  QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
>  QWT_INSTALL_STAGING = YES
>  ifeq ($(BR2_PACKAGE_QT),y)
> -QWT_DEPENDENCIES += qt
> +QWT_DEPENDENCIES += qt libgles libegl
>  endif
>  ifeq ($(BR2_PACKAGE_QT5BASE),y)
> -QWT_DEPENDENCIES += qt5base
> +QWT_DEPENDENCIES += qt5base libgles

Both of these changes look wrong. Are you sure you no longer need
OpenGL support in Qt ?

Your commit log says "Moved the dependency to OpenGL libraries from
Config.in to qwt.mk for both qt and qt5, to make things less
cumbersome.", as if your change had no effect. But it does have the
effect or removing OpenGL support from Qt, since you no longer select
BR2_PACKAGE_QT_OPENGL_ES or BR2_PACKAGE_QT5BASE_OPENGL_LIB.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
