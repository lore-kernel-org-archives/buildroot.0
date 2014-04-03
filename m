From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 22:00:29 +0200
Subject: [Buildroot] [PATCH v5] bluez5_utils: new package
In-Reply-To: <1396256280-23284-1-git-send-email-marcin@bis.org.pl>
References: <532F69C8.5060202@trzebnica.net>
 <1396256280-23284-1-git-send-email-marcin@bis.org.pl>
Message-ID: <20140403220029.450f9b51@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcin Bis,

On Mon, 31 Mar 2014 10:58:00 +0200, Marcin Bis wrote:
> This patch adds Bluez 5.x.
> API is not backwards compatible with BlueZ 4.x

... so it is packaged as a separate package.

> BlueZ utils will use systemd and/or udev if enabled.
> Contains a hook for installing GATT support tool, wchich is always

which

> build but not installed by default.

build -> built


> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> new file mode 100644
> index 0000000..809dd8a
> --- /dev/null
> +++ b/package/bluez5_utils/Config.in
> @@ -0,0 +1,54 @@
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

Does it need kernel headers >= 3.4 ?


> +# install gatttool (For some reason upstream choose not to do it by default)
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
> +define BLUEZ5_UTILS_INSTALL_GATTTOOL
> +	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin

The destination path should be a full path, i.e:

	$(TARGET_DIR)/usr/bin/gatttool

> +# use udev if available
> +ifeq ($(BR2_PACKAGE_UDEV),y)

You should instead rely on BR2_PACKAGE_HAS_UDEV, so that it works with
both eudev, or the udev built into systemd.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
