From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 18:30:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: new package
In-Reply-To: <20200413222930.99472-1-james.hilliard1@gmail.com>
References: <20200413222930.99472-1-james.hilliard1@gmail.com>
Message-ID: <20200418183040.386d3ab3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

Thanks for this new package. I have a number of comments, see below.

On Mon, 13 Apr 2020 16:29:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/apcupsd/Config.in b/package/apcupsd/Config.in
> new file mode 100644
> index 0000000000..d8bf07e1fa
> --- /dev/null
> +++ b/package/apcupsd/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_APCUPSD
> +	bool "apcupsd"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_LIBUSB_COMPAT

I think we don't want to make libusb a mandatory dependency, see below.

> +APCUPSD_VERSION = 3.14.14
> +APCUPSD_SITE = http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/$(APCUPSD_VERSION)
> +APCUPSD_LICENSE = GPL-2.0
> +APCUPSD_LICENSE_FILES = COPYING
> +APCUPSD_DEPENDENCIES = libusb libusb-compat
> +APCUPSD_CONF_OPTS = \
> +	  --enable-apcsmart \
> +	  --enable-dumb \
> +	  --enable-usb \
> +	  --enable-net \
> +	  --enable-snmp \
> +	  --disable-test \
> +	  --enable-pcnet \
> +	  --enable-modbus-usb \
> +	  --enable-modbus

I think we need to be more flexible, and keep the libusb dependency
optional, because it really is optional. Could you add a bunch of
sub-options to BR2_PACKAGE_APCUPSD to enable/disable the most relevant
features? apcsmart, usb, net, snmp, pcnet, modbus, modbus-usb seem
quite logical to have. Only select libusb/libusb-compat when needed.

Also, you will need to feed in the autoconf variable cache the path to
libusb-config, otherwise it might end up using the libusb-config from
the host machine if it exists.

Could you have a look at improving the package in these directions?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
