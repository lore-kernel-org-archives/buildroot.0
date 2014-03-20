From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 20 Mar 2014 20:28:24 +0100
Subject: [Buildroot] [PATCH v3] bluez5_utils: new package.
In-Reply-To: <1395323298-15098-1-git-send-email-marcin@bis.org.pl>
References: <20140304213845.GG11474@free.fr>
 <1395323298-15098-1-git-send-email-marcin@bis.org.pl>
Message-ID: <532B4158.6070602@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Marcin,

[...]

> I have not seen any 'lescan' and 'lecc' in hciconfig are always enabled.
>
> The patch follows:
>
> bluez5_utils: new package.
>
> API is not backwards compatible with BlueZ 4.
>
> BlueZ utils will use systemd and/or udev if enabled.
> Contains a hook for installing GATT support tool, wchich is always
> build but not installed by default.
> ---
>   package/Config.in                    |    1 +
>   package/bluez5_utils/Config.in       |   51 +++++++++++++++++++++++++++++++
>   package/bluez5_utils/bluez5_utils.mk |   55 ++++++++++++++++++++++++++++++++++
>   3 files changed, 107 insertions(+)
>   create mode 100644 package/bluez5_utils/Config.in
>   create mode 100644 package/bluez5_utils/bluez5_utils.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 688ed4d..653ab6c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -864,6 +864,7 @@ source "package/axel/Config.in"
>   source "package/bcusdk/Config.in"
>   source "package/bind/Config.in"
>   source "package/bluez_utils/Config.in"
> +source "package/bluez5_utils/Config.in"
>   source "package/bmon/Config.in"
>   source "package/boa/Config.in"
>   source "package/bridge-utils/Config.in"
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> new file mode 100644
> index 0000000..c721fff
> --- /dev/null
> +++ b/package/bluez5_utils/Config.in
> @@ -0,0 +1,51 @@
> +config BR2_PACKAGE_BLUEZ5_UTILS
> +	bool "bluez-utils 5.x"
> +	depends on !BR2_avr32
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
> +	depends on BR2_USE_MMU # dbus
> +	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBICAL
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  bluez utils version 5.x
> +
> +	  With this release BlueZ only supports the new Bluetooth Management
> +	  kernel interface (introduced in Linux 3.4).
> +	  For Low Energy support at least kernel version 3.5 is needed.
> +
> +	  The API is not backwards compatible with BlueZ 4.
> +
> +	  Bluez utils will use systemd and/or udev if enabled.
> +
> +	  http://www.bluez.org
> +	  http://www.kernel.org/pub/linux/bluetooth
> +
> +if BR2_PACKAGE_BLUEZ5_UTILS
> +
> +config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
> +	bool "build experimental plugins"
> +	help
> +	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
> +
> +config BR2_PACKAGE_BLUEZ5_UTILS_TEST
> +	bool "enable test"
> +	help
> +	  Enable test.
> +
> +config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
> +	bool "install GATT tool"
> +	help
> +	  Generic Attribute Profile (GATT) support. This provides profile
> +	  discovery and description services for Bluetooth Low Energy.
> +	  This will install the gatttool utility.
> +
> +	  It is always build with BlueZ 5.x, but upstream choose not to install
> +	  it by default.
> +
> +endif
> +
> +comment "bluez5-utils needs a toolchain w/ wchar, threads"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> new file mode 100644
> index 0000000..d0d69df
> --- /dev/null
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -0,0 +1,55 @@
> +################################################################################
> +#
> +# bluez5_utils
> +#
> +################################################################################
> +
> +BLUEZ5_UTILS_VERSION = 5.16
> +BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
> +BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
> +BLUEZ5_UTILS_INSTALL_STAGING = YES
> +BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2 libical readline
> +BLUEZ5_UTILS_CONF_OPT = --enable-tools --enable-library
> +BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
> +BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
> +
> +# experimental plugins
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL),y)
> +	BLUEZ5_UTILS_CONF_OPT += --enable-experimental
> +else
> +	BLUEZ5_UTILS_CONF_OPT += --disable-experimental
> +endif
> +
> +# install gatttool (For some reason upstream choose not to do it by default)
> +define BLUEZ5_UTILS_INSTALL_GATTTOOL
> +	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin
> +endef
> +
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
> +	BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
> +endif

Documentation says:
"...keep hook definition and assignment together in one if block",
so it should rather look like:

ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
define BLUEZ5_UTILS_INSTALL_GATTTOOL
	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin
endef

BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
endif


See:
http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-mk

Regards,
Jerzy

> +
> +# enable test
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_TEST),y)
> +	BLUEZ5_UTILS_CONF_OPT += --enable-test
> +else
> +	BLUEZ5_UTILS_CONF_OPT += --disable-test
> +endif
> +
> +# use udev if available
> +ifeq ($(BR2_PACKAGE_UDEV),y)
> +        BLUEZ5_UTILS_CONF_OPT += --enable-udev
> +        BLUEZ5_UTILS_DEPENDENCIES += udev
> +else
> +        BLUEZ5_UTILS_CONF_OPT += --disable-udev
> +endif
> +
> +# integrate with systemd if available
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +        BLUEZ5_UTILS_CONF_OPT += --enable-systemd
> +        BLUEZ5_UTILS_DEPENDENCIES += systemd
> +else
> +        BLUEZ5_UTILS_CONF_OPT += --disable-systemd
> +endif
> +
> +$(eval $(autotools-package))
