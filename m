From: Julien CORJON <corjon.j@ecagroup.com>
Date: Tue, 29 Mar 2016 12:30:43 +0000
Subject: [Buildroot] [PATCH] qt5serialbus: new package
In-Reply-To: <1459245706-17098-1-git-send-email-yegorslists@googlemail.com>
References: <1459245706-17098-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <56FA7571.8040908@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor,

Le 29/03/2016 12:01, yegorslists at googlemail.com a ?crit :
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>   package/qt5/Config.in                      |  1 +
>   package/qt5/qt5serialbus/Config.in         | 10 +++++++
>   package/qt5/qt5serialbus/qt5serialbus.hash |  2 ++
>   package/qt5/qt5serialbus/qt5serialbus.mk   | 42 ++++++++++++++++++++++++++++++
>   4 files changed, 55 insertions(+)
>   create mode 100644 package/qt5/qt5serialbus/Config.in
>   create mode 100644 package/qt5/qt5serialbus/qt5serialbus.hash
>   create mode 100644 package/qt5/qt5serialbus/qt5serialbus.mk
>
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index f673daa..4febee6 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -40,6 +40,7 @@ source "package/qt5/qt5imageformats/Config.in"
>   source "package/qt5/qt5multimedia/Config.in"
>   source "package/qt5/qt5quickcontrols/Config.in"
>   source "package/qt5/qt5sensors/Config.in"
> +source "package/qt5/qt5serialbus/Config.in"
>   source "package/qt5/qt5serialport/Config.in"
>   source "package/qt5/qt5svg/Config.in"
>   source "package/qt5/qt5tools/Config.in"
> diff --git a/package/qt5/qt5serialbus/Config.in b/package/qt5/qt5serialbus/Config.in
> new file mode 100644
> index 0000000..cce02ef
> --- /dev/null
> +++ b/package/qt5/qt5serialbus/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_QT5SERIALBUS
> +	bool "qt5serialbus"
> +	select BR2_PACKAGE_QT5BASE

QtSerialBus depend on QtSerialPort. See 
http://code.qt.io/cgit/qt/qtserialbus.git/tree/src/serialbus/serialbus.pro?h=v5.6.0

> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  This package corresponds to the qt5serialbus module.
> +
> +	  http://qt.io
> diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
> new file mode 100644
> index 0000000..da46e76
> --- /dev/null
> +++ b/package/qt5/qt5serialbus/qt5serialbus.hash
> @@ -0,0 +1,2 @@
> +# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtserialbus-opensource-src-5.6.0.tar.xz.mirrorlist
> +sha256 8cca530ee53f19672f57ffee6f2f28866d5c84b8cb3dbbd67c05d27893ac0b8e qtserialbus-opensource-src-5.6.0.tar.xz
> diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
> new file mode 100644
> index 0000000..f81bb83
> --- /dev/null
> +++ b/package/qt5/qt5serialbus/qt5serialbus.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# qt5serialbus
> +#
> +################################################################################
> +
> +QT5SERIALBUS_VERSION = $(QT5_VERSION)
> +QT5SERIALBUS_SITE = $(QT5_SITE)
> +QT5SERIALBUS_SOURCE = qtserialbus-opensource-src-$(QT5SERIALBUS_VERSION).tar.xz
> +QT5SERIALBUS_DEPENDENCIES = qt5base

You need to add qt5serialport here too.

> +QT5SERIALBUS_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +QT5SERIALBUS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
> +QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL

QtSerialBus-5.6.0 does not have "LGPLv2.1 with exception". Please do 
make legal-info to test licences.

> +else
> +QT5SERIALBUS_LICENSE = Commercial license
> +QT5SERIALBUS_REDISTRIBUTE = NO
> +endif
> +
> +define QT5SERIALBUS_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
> +endef
> +
> +define QT5SERIALBUS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define QT5SERIALBUS_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> +	$(QT5_LA_PRL_FILES_FIXUP)
> +endef
> +
> +ifeq ($(BR2_STATIC_LIBS),)
> +define QT5SERIALBUS_INSTALL_TARGET_CMDS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5SerialBus.so.* $(TARGET_DIR)/usr/lib
> +	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/canbus/
> +	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/canbus/*.so $(TARGET_DIR)/usr/lib/qt/plugins/canbus/
> +endef
> +endif

QtSerialBus also have a canbusutil binary in $(STAGING_DIR)/usr/bin

> +
> +$(eval $(generic-package))
>

I'm already working on huge bump off all missing Qt5 modules (+obsolete 
ones for legacy reason) in case you're doing the same job.
Please send a v2 of your patch and let me know in case you want/can 
test/review my (not submitted yet) series.

Regards,

Julien Corjon
