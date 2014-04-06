From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 12:02:21 +0200
Subject: [Buildroot] [PATCH v2] Compile Poppler over Qt
In-Reply-To: <1396345399-28487-1-git-send-email-jeremie.scheer@armadeus.com>
References: <1396345399-28487-1-git-send-email-jeremie.scheer@armadeus.com>
Message-ID: <20140406120221.5a5fd253@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The title of your commit should be:

	poppler: allow building Qt support

i.e we always want to have the commit titles to look like:

	<name of the package>: <what is going on>

On Tue,  1 Apr 2014 11:43:19 +0200, jeremie.scheer at armadeus.com wrote:

> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index 040327f..386e7b8 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -7,10 +7,18 @@
>  POPPLER_VERSION = 0.24.4
>  POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
>  POPPLER_SITE = http://poppler.freedesktop.org
> -POPPLER_DEPENDENCIES = fontconfig
>  POPPLER_LICENSE = GPLv2+
>  POPPLER_LICENSE_FILES = COPYING
>  POPPLER_CONF_OPT = --with-font-configuration=fontconfig
> +POPPLER_INSTALL_STAGING = YES

The commit log should indicate why this is added.

> +
> +POPPLER_DEPENDENCIES = fontconfig
> +
> +ifeq ($(BR2_PACKAGE_QT),y)
> +	POPPLER_DEPENDENCIES += qt
> +else
> +	POPPLER_CONF_OPT += --disable-poppler-qt4
> +endif

This doesn't really work: BR2_PACKAGE_QT is not sufficient, it also
needs QtGui and QtXml. From the Poppler configure.ac:

  PKG_CHECK_MODULES(POPPLER_QT4, 
                    QtCore >= 4.4.0 QtGui >= 4.4.0 QtXml >= 4.4.0)

So maybe I would suggest to instead add a Config.in option that looks
like this:

config BR2_PACKAGE_POPPLER_QT
	bool "qt support"
	depends on BR2_PACKAGE_QT
	select BR2_PACKAGE_QT_GUI
	select BR2_PACKAGE_QT_XML
	help
	  Some help text

and then in poppler.mk, do:

ifeq ($(BR2_PACKAGE_POPPLER_QT),y)
POPPLER_DEPENDENCIES += qt
POPPLER_CONF_OPT += --enable-poppler-qt4
else
POPPLER_CONF_OPT += --disable-poppler-qt4
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
