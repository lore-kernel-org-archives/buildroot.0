From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 7 May 2013 17:55:33 -0500
Subject: [Buildroot] [PATCH v3 2/2] libcec: add libcec for HDMI device
	Control
In-Reply-To: <1367964142-23036-2-git-send-email-spenser@gillilanding.com>
References: <1367959620-17176-1-git-send-email-spenser@gillilanding.com>
 <1367964142-23036-1-git-send-email-spenser@gillilanding.com>
 <1367964142-23036-2-git-send-email-spenser@gillilanding.com>
Message-ID: <CAEBucnCYnwAjAtnfbQR_zfz9Yg0EauaWBBxV1WV10xDy5cEM9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

here's a snippet which shows both a RPI and USB-CEC adapter operating
concurrently.

# modprobe cdc-acm
# cec-client -l
Found devices: 2

device:              1
com port:            /dev/ttyACM0
vendor id:           2548
product id:          1001
firmware version:    2
firmware build date: Fri Jul 20 23:58:27 2012 +0000
type:                Pulse-Eight USB-CEC Adapter

device:              2
com port:            RPI
vendor id:           2708
product id:          1001
firmware version:    1
type:                Raspberry Pi

Spenser

On Tue, May 7, 2013 at 5:02 PM, Spenser Gilliland
<spenser@gillilanding.com> wrote:
> This patch adds libcec for HDMI device control.  It enables Raspberry Pi
> support if the rpi-userland package is installed.
>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/Config.in        |    1 +
>  package/libcec/Config.in |    8 ++++++++
>  package/libcec/libcec.mk |   32 ++++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
>  create mode 100644 package/libcec/Config.in
>  create mode 100644 package/libcec/libcec.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 05e2d45..df1e88e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -464,6 +464,7 @@ source "package/imx-lib/Config.in"
>  source "package/lcdapi/Config.in"
>  source "package/libaio/Config.in"
>  source "package/libatasmart/Config.in"
> +source "package/libcec/Config.in"
>  source "package/libraw1394/Config.in"
>  source "package/tslib/Config.in"
>  source "package/libfreefare/Config.in"
> diff --git a/package/libcec/Config.in b/package/libcec/Config.in
> new file mode 100644
> index 0000000..1cacd4a
> --- /dev/null
> +++ b/package/libcec/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBCEC
> +       bool "libcec"
> +       help
> +         libcec allows you in combination with the right hardware to control your
> +         home theater devices with your TV remote control utilizing existing HDMI
> +         cabling.
> +
> +         http://libcec.pulse-eight.com
> diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
> new file mode 100644
> index 0000000..3ca1338
> --- /dev/null
> +++ b/package/libcec/libcec.mk
> @@ -0,0 +1,32 @@
> +#############################################################
> +#
> +# libcec
> +#
> +#############################################################
> +
> +LIBCEC_VERSION = libcec-2.1.1
> +LIBCEC_SITE = http://github.com/Pulse-Eight/libcec/tarball/$(LIBCEC_VERSION)
> +LIBCEC_LICENSE = GPLv2+
> +LIBCEC_LICENSE_FILE = COPYING
> +
> +LIBCEC_AUTORECONF = YES
> +LIBCEC_INSTALL_STAGING = YES
> +LIBCEC_DEPENDENCIES = host-pkgconf
> +
> +ifeq ($(BR2_PACKAGE_LOCKDEV),y)
> +LIBCEC_DEPENDENCIES += lockdev
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UDEV),y)
> +LIBCEC_DEPENDENCIES += udev
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +LIBCEC_CONF_OPT = --enable-rpi \
> +   --with-rpi-include-path=$(STAGING_DIR)/usr/include
> +LIBCEC_DEPENDENCIES += rpi-userland
> +else
> +LIBCEC_CONF_OPT = --disable-rpi
> +endif
> +
> +$(eval $(autotools-package))
> --
> 1.7.9.5
>



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
