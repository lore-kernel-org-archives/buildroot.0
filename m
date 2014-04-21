From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 10:34:07 +0200
Subject: [Buildroot] [PATCH 1/1] librtlsdr: new package
In-Reply-To: <1398036119-7335-1-git-send-email-jrspruitt@gmail.com>
References: <1398036119-7335-1-git-send-email-jrspruitt@gmail.com>
Message-ID: <20140421103407.49ed9fc7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jason Pruitt,

On Sun, 20 Apr 2014 16:21:58 -0700, Jason Pruitt wrote:
> From: Jason <jrspruitt@gmail.com>

We would need this...

> 
> librtlsdr is a library and software for using a Realtek RTL2832U based
> DVB-T dongle as a cheap SDR.
> 
> Signed-off-by: Jason <jrspruitt@gmail.com>

.. and this to use your complete name, Jason Pruitt.


> diff --git a/package/librtlsdr/Config.in b/package/librtlsdr/Config.in
> new file mode 100644
> index 0000000..9df632d
> --- /dev/null
> +++ b/package/librtlsdr/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_LIBRTLSDR
> +	bool "librtlsdr"
> +	select BR2_PACKAGE_LIBUSB
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Library and command line programs for accessing
> +	  RTL2832U SDR dongles.
> +
> +	  http://sdr.osmocom.org/trac/wiki/rtl-sdr/
> +
> +if BR2_PACKAGE_LIBRTLSDR
> +
> +config BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER
> +	bool "Detach driver if loaded"
> +	default y
> +
> +if BR2_PACKAGE_HAS_UDEV
> +config BR2_PACKAGE_LIBRTLSDR_UDEV_RULES
> +	bool "Install udev rules"
> +	default y

I believe this option is not really needed. Just automatically enable
the installation of udev rules in the .mk file if BR2_PACKAGE_HAS_UDEV
is enabled.

> +endif
> +endif
> +
> +comment "librtlsdr needs a toolchain w/ threads"
> +depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
> new file mode 100644
> index 0000000..595b3ba
> --- /dev/null
> +++ b/package/librtlsdr/librtlsdr.mk
> @@ -0,0 +1,21 @@
> +##########################################################################
> +#
> +# librtlsdr
> +#
> +##########################################################################
> +
> +LIBRTLSDR_VERSION = v0.5.3
> +LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
> +LIBRTLSDR_LICENSE = GPLv2
> +LIBRTLSDR_INSTALL_STAGING = YES
> +LIBRTLSDR_DEPENDENCIES = libusb
> +
> +ifeq ($(BR2_PACKAGE_LIBRTLSDR_UDEV_RULES),y)
> +LIBRTLSDR_CONF_OPT += -DINSTALL_UDEV_RULES=ON
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
> +LIBRTLSDR_CONF_OPT += -DDETACH_KERNEL_DRIVER=1
> +endif
> +
> +$(eval $(cmake-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
