From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:22:35 +0100
Subject: [Buildroot] [PATCH] package: add qt5virtualkeyboard
In-Reply-To: <20170317164628.5029-1-gael.portay@savoirfairelinux.com>
References: <20170317164628.5029-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170318152235.0be2d895@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Peter, could you help by reviewing this patch touching qt5 stuff?

Thanks a lot!

Thomas

On Fri, 17 Mar 2017 12:46:28 -0400, Ga?l PORTAY wrote:
> This patch adds the Qt virtualkeyboard package.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/Config.in                              |  1 +
>  package/qt5/qt5virtualkeyboard/Config.in           |  9 +++++++
>  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 31 ++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
>  create mode 100644 package/qt5/qt5virtualkeyboard/Config.in
>  create mode 100644 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 4bcbc6e..a810503 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -76,6 +76,7 @@ source "package/qt5/qt5serialbus/Config.in"
>  source "package/qt5/qt5serialport/Config.in"
>  source "package/qt5/qt5svg/Config.in"
>  source "package/qt5/qt5tools/Config.in"
> +source "package/qt5/qt5virtualkeyboard/Config.in"
>  source "package/qt5/qt5webchannel/Config.in"
>  source "package/qt5/qt5webkit/Config.in"
>  source "package/qt5/qt5websockets/Config.in"
> diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
> new file mode 100644
> index 0000000..df9e9d6
> --- /dev/null
> +++ b/package/qt5/qt5virtualkeyboard/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_QT5VIRTUALKEYBOARD
> +	bool "qt5virtualkeyboard"
> +	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
> +	select BR2_PACKAGE_QT5SVG
> +	help
> +	  Qt Virtual Keyboard is a virtual keyboard framework that consists of a
> +	  C++ backend supporting custom input methods as well as a UI frontend
> +	  implemented in QML.
> +
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> new file mode 100644
> index 0000000..e73a154
> --- /dev/null
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# qt5virtualkeyboard
> +#
> +################################################################################
> +
> +QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
> +QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
> +QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-opensource-src-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
> +QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
> +QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
> +
> +QT5VIRTUALKEYBOARD_LICENSE = GPLv3
> +QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
> +define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
> +endef
> +
> +define QT5VIRTUALKEYBOARD_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> +endef
> +
> +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> +endef
> +
> +$(eval $(generic-package))



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
