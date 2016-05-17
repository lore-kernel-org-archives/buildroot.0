From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 13:45:15 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: select Qt5OpenGL module
 in case OpenGL support is enabled
In-Reply-To: <1463483348-8157-1-git-send-email-ps.report@gmx.net>
References: <1463483348-8157-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160517134515.0b826f02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 13:09:08 +0200, Peter Seiderer wrote:

> diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
> index 59c3984..7549b35 100644
> --- a/package/qt5/qt5multimedia/Config.in
> +++ b/package/qt5/qt5multimedia/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_QT5MULTIMEDIA
>  	select BR2_PACKAGE_QT5BASE
>  	select BR2_PACKAGE_QT5BASE_GUI
>  	select BR2_PACKAGE_QT5BASE_NETWORK
> +	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE_OPENGL

Do you know why we have this BR2_PACKAGE_QT5BASE_OPENGL_LIB option,
rather than just installing Qt5OpenGL as soon as
BR2_PACKAGE_QT5BASE_OPENGL is true?

Whenever BR2_PACKAGE_QT5BASE_OPENGL is enabled, either
BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP or BR2_PACKAGE_QT5BASE_OPENGL_ES2
are selected, since they are part of a choice. And both of them enable
OpenGL support in Qt:

ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),y)
QT5BASE_CONFIGURE_OPTS += -opengl desktop
QT5BASE_DEPENDENCIES   += libgl
else ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL_ES2),y)
QT5BASE_CONFIGURE_OPTS += -opengl es2
QT5BASE_DEPENDENCIES   += libgles
else
QT5BASE_CONFIGURE_OPTS += -no-opengl
endif

So it seems weird to enable OpenGL support in Qt but to not install the
corresponding library. Or are there use cases where OpenGL support is
used, but the Qt5OpenGL library is not needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
