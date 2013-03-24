From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 14:46:58 +0100
Subject: [Buildroot] [PATCH v4 10/21] qt5/qt5svg: new package
In-Reply-To: <1363721394-14973-11-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 19 Mar 2013 20:29:43 +0100")
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363721394-14973-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjxsj4fh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/qt5/Config.in        |    1 +
 Thomas>  package/qt5/qt5svg/Config.in |   11 ++++++++++
 Thomas>  package/qt5/qt5svg/qt5svg.mk |   47 ++++++++++++++++++++++++++++++++++++++++++
 Thomas>  3 files changed, 59 insertions(+)
 Thomas>  create mode 100644 package/qt5/qt5svg/Config.in
 Thomas>  create mode 100644 package/qt5/qt5svg/qt5svg.mk

 Thomas> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
 Thomas> index 1c9f8a6..f4d2b45 100644
 Thomas> --- a/package/qt5/Config.in
 Thomas> +++ b/package/qt5/Config.in
 Thomas> @@ -15,4 +15,5 @@ menuconfig BR2_PACKAGE_QT5
 
 Thomas>  if BR2_PACKAGE_QT5
 Thomas>  source "package/qt5/qt5base/Config.in"
 Thomas> +source "package/qt5/qt5svg/Config.in"
 Thomas>  endif
 Thomas> diff --git a/package/qt5/qt5svg/Config.in b/package/qt5/qt5svg/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..27e6b05
 Thomas> --- /dev/null
 Thomas> +++ b/package/qt5/qt5svg/Config.in
 Thomas> @@ -0,0 +1,11 @@
 Thomas> +config BR2_PACKAGE_QT5SVG
 Thomas> +	bool "qt5svg"
 Thomas> +	select BR2_PACKAGE_QT5BASE
 Thomas> +	select BR2_PACKAGE_QT5BASE_GUI
 Thomas> +	help
 Thomas> +	  Qt is a cross-platform application and UI framework for
 Thomas> +	  developers using C++.
 Thomas> +
 Thomas> +	  This package corresponds to the qt5svg module.
 Thomas> +
 Thomas> +	  http://qt-project.org
 Thomas> diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
 Thomas> new file mode 100644
 Thomas> index 0000000..8db28ba
 Thomas> --- /dev/null
 Thomas> +++ b/package/qt5/qt5svg/qt5svg.mk
 Thomas> @@ -0,0 +1,47 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# qt5svg
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +
 Thomas> +QT5SVG_VERSION = $(QT5_VERSION)
 Thomas> +QT5SVG_SITE = http://releases.qt-project.org/qt5/$(QT5SVG_VERSION)/submodules_tar/
 Thomas> +QT5SVG_SOURCE = qtsvg-opensource-src-$(QT5SVG_VERSION).tar.xz
 Thomas> +QT5SVG_DEPENDENCIES = qt5base
 Thomas> +QT5SVG_INSTALL_STAGING = YES
 Thomas> +
 Thomas> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 Thomas> +QT5SVG_CONFIGURE_OPTS += -opensource -confirm-license
 Thomas> +QT5SVG_LICENSE = LGPLv2.1 or GPLv3.0
 Thomas> +# Here we would like to get license files from qt5base, but qt5base
 Thomas> +# may not be extracted at the time we get the legal-info for qt5svg.
 Thomas> +else
 Thomas> +QT5SVG_LICENSE = Commercial license
 Thomas> +QT5SVG_REDISTRIBUTE = NO
 Thomas> +endif
 Thomas> +
 Thomas> +define QT5SVG_CONFIGURE_CMDS
 Thomas> +	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
 Thomas> +endef
 Thomas> +
 Thomas> +define QT5SVG_BUILD_CMDS
 Thomas> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 Thomas> +endef
 Thomas> +
 Thomas> +define QT5SVG_INSTALL_STAGING_CMDS
 Thomas> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 Thomas> +	$(QT5_LA_PRL_FILES_FIXUP)
 Thomas> +endef
 Thomas> +
 Thomas> +ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
 Thomas> +define QT5SVG_INSTALL_ICONENGINES
 Thomas> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/iconengines $(TARGET_DIR)/usr/lib/qt/plugins
 Thomas> +endef
 Thomas> +endif
 Thomas> +define QT5SVG_INSTALL_TARGET_CMDS
 Thomas> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Svg*.so.* $(TARGET_DIR)/usr/lib

How about BR2_PREFER_STATIC_LIB builds, or don't we support that for
qt5?

-- 
Bye, Peter Korsgaard
