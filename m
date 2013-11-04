From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 4 Nov 2013 17:06:27 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: new package
In-Reply-To: <1383569989-31858-1-git-send-email-marcin@bis.org.pl>
References: <1383569989-31858-1-git-send-email-marcin@bis.org.pl>
Message-ID: <CAAXf6LXLSDeRgXT9T+v77i=Wh3Ti-5G02U-7J7F4DAPJYUg2rA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcin,

Thanks for your contribution!
Some comments below...

On Mon, Nov 4, 2013 at 1:59 PM, Marcin Bis <marcin@bis.org.pl> wrote:
> This patch adds support for BlueZ 5.x.
>
> API is not backwards compatible with BlueZ 4. It uses kernel interface
> introduces in 3.4 (3.5 for Low Energy).
>
> BlueZ utils will use systemd and/or udev if enabled.
>
> Signed-off-by: Marcin Bis <marcin@bis.org.pl>
> ---
>  package/Config.in                    |    1 +
>  package/bluez5_utils/Config.in       |   36 +++++++++++++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.mk |   42 ++++++++++++++++++++++++++++++++++
>  3 files changed, 79 insertions(+), 0 deletions(-)
>  create mode 100644 package/bluez5_utils/Config.in
>  create mode 100644 package/bluez5_utils/bluez5_utils.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 4c4da51..0e0fca9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -768,6 +768,7 @@ source "package/axel/Config.in"
>  source "package/bcusdk/Config.in"
>  source "package/bind/Config.in"
>  source "package/bluez_utils/Config.in"
> +source "package/bluez5_utils/Config.in"
>  source "package/bmon/Config.in"
>  source "package/boa/Config.in"
>  source "package/bridge-utils/Config.in"
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> new file mode 100644
> index 0000000..d2b4910
> --- /dev/null
> +++ b/package/bluez5_utils/Config.in
> @@ -0,0 +1,36 @@
> +config BR2_PACKAGE_BLUEZ5_UTILS
> +       bool "bluez-utils 5.x"
> +       depends on !BR2_avr32
> +       depends on BR2_USE_WCHAR # libglib2
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
> +       depends on BR2_USE_MMU # dbus
> +       depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
> +       select BR2_PACKAGE_DBUS
> +       select BR2_PACKAGE_LIBGLIB2
> +       select BR2_PACKAGE_LIBICAL
> +       select BR2_PACKAGE_READLINE
> +       help
> +         bluez utils version 5.x
> +
> +         With this release BlueZ only supports the new Bluetooth Management kernel
> +         interface (introduced in Linux 3.4).
> +         For Low Energy support at least kernel version 3.5 is needed.
> +
> +         The API is not backwards compatible with BlueZ 4.
> +
> +         Bluez utils will use systemd and/or udev if enabled.
> +
> +         http://www.bluez.org
> +         http://www.kernel.org/pub/linux/bluetooth
> +
> +if BR2_PACKAGE_BLUEZ5_UTILS
> +
> +config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
> +       bool "build experimental plugins"
> +       help
> +         Build BlueZ 5.x experimental plugins.
> +
> +endif
> +
> +comment "bluez5-utils needs a toolchain w/ wchar, threads"
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

This comment should repeat the other dependencies of bluez5-utils, so
that the comment is only visible when relevant, so it should become:

comment "bluez5-utils needs a toolchain w/ wchar, threads"
       depends on !BR2_avr32 && BR2_USE_MMU && !BR2_PACKAGE_BLUEZ_UTILS
       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

This is not properly documented yet, but I have submitted a patch
today to fix all packages and will submit another patch to clarify the
documentation.

Also, I prefer to keep the comment together with the actual config
option, instead of having the 'experimental' part in between.


> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> new file mode 100644
> index 0000000..a557868
> --- /dev/null
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# bluez5_utils
> +#
> +################################################################################
> +
> +BLUEZ5_UTILS_VERSION = 5.10
> +BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
> +BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
> +BLUEZ5_UTILS_INSTALL_STAGING = YES
> +BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2 libical readline
> +BLUEZ5_UTILS_CONF_OPT = --enable-test --enable-tools --enable-library
> +BLUEZ5_UTILS_AUTORECONF = YES
> +BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
> +BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
> +
> +# experimental plugins
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL),y)
> +BLUEZ5_UTILS_CONF_OPT +=       \
> +       --enable-experimental
> +else
> +BLUEZ5_UTILS_CONF_OPT +=       \
> +       --disable-experimental

In the above cases I don't think it's necessary to wrap the lines (yet).

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

Best regards,
Thomas
