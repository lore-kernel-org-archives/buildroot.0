From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 13 Jun 2014 15:47:31 +0300
Subject: [Buildroot] [PATCH 1/1] New package: qt5webkitexamples
In-Reply-To: <1402481120-13154-1-git-send-email-massimocallegari@yahoo.it>
References: <1402481120-13154-1-git-send-email-massimocallegari@yahoo.it>
Message-ID: <201406131547.31164.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wednesday 11 June 2014 13:05:20 Massimo Callegari wrote:
> Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
> ---
>  package/qt5/Config.in                              |  1 +
>  package/qt5/qt5webkitexamples/Config.in            | 12 +++++++
>  package/qt5/qt5webkitexamples/qt5webkitexamples.mk | 40
> ++++++++++++++++++++++ 3 files changed, 53 insertions(+)
>  create mode 100644 package/qt5/qt5webkitexamples/Config.in
>  create mode 100644 package/qt5/qt5webkitexamples/qt5webkitexamples.mk

I think the name should be qt5webkit-examples. Better to keep it closer to the 
original name.

> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index efdd9d4..024fa94 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -40,6 +40,7 @@ source "package/qt5/qt5sensors/Config.in"
>  source "package/qt5/qt5serialport/Config.in"
>  source "package/qt5/qt5svg/Config.in"
>  source "package/qt5/qt5webkit/Config.in"
> +source "package/qt5/qt5webkitexamples/Config.in"
>  source "package/qt5/qt5websockets/Config.in"
>  source "package/qt5/qt5x11extras/Config.in"
>  source "package/qt5/qt5xmlpatterns/Config.in"
> diff --git a/package/qt5/qt5webkitexamples/Config.in
> b/package/qt5/qt5webkitexamples/Config.in new file mode 100644
> index 0000000..18cb476
> --- /dev/null
> +++ b/package/qt5/qt5webkitexamples/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_QT5WEBKITEXAMPLES
> +	bool "qt5webkit examples"

What about hiding this menu entry and making this package default if 
BR2_PACKAGE_QT5BASE_EXAMPLES?

> +	depends on BR2_PACKAGE_QT5WEBKIT
> +	depends on BR2_PACKAGE_QT5XMLPATTERNS
> +	select BR2_PACKAGE_QT5BASE_EXAMPLES
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  This package corresponds to the qt5webkit examples module.
> +
> +	  http://qt-project.org
> diff --git a/package/qt5/qt5webkitexamples/qt5webkitexamples.mk
> b/package/qt5/qt5webkitexamples/qt5webkitexamples.mk new file mode 100644
> index 0000000..435f114
> --- /dev/null
> +++ b/package/qt5/qt5webkitexamples/qt5webkitexamples.mk
> @@ -0,0 +1,40 @@
> +##########################################################################
> ###### +#
> +# qt5webkitexamples
> +#
> +##########################################################################
> ###### +
> +QT5WEBKITEXAMPLES_VERSION = $(QT5_VERSION)
> +QT5WEBKITEXAMPLES_SITE = $(QT5_SITE)
> +QT5WEBKITEXAMPLES_SOURCE =
> qtwebkit-examples-opensource-src-$(QT5WEBKITEXAMPLES_VERSION).tar.xz
> +QT5WEBKITEXAMPLES_DEPENDENCIES = qt5webkit

Add qt5xmlpatterns here.

> +QT5WEBKITEXAMPLES_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +QT5WEBKITEXAMPLES_LICENSE = LGPLv2.1 or GPLv3.0
> +# Here we would like to get license files from qt5base, but qt5base
> +# may not be extracted at the time we get the legal-info for
> +# qt5script.

Copy/paste error: qt5script -> qt5webkit-examples

> +else
> +QT5WEBKITEXAMPLES_LICENSE = Commercial license
> +QT5WEBKITEXAMPLES_REDISTRIBUTE = NO
> +endif
> +
> +define QT5WEBKITEXAMPLES_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
> +endef
> +
> +define QT5WEBKITEXAMPLES_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define QT5WEBKITEXAMPLES_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> +endef
> +
> +define QT5WEBKITEXAMPLES_INSTALL_TARGET_CMDS
> +	cp -af $(@D)/examples/webkitqml $(TARGET_DIR)/usr/lib/qt/examples
> +    cp -af $(@D)/examples/webkitwidgets $(TARGET_DIR)/usr/lib/qt/examples

This line uses spaces instead of tab.

> +endef
> +
> +$(eval $(generic-package))
